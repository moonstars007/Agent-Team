#!/usr/bin/env node
// Recompute skills-lock.json hashes from the skill folders on disk.
// The `skills` CLI hashes every file path and its bytes with SHA-256.

import { createHash } from "node:crypto";
import { existsSync, readFileSync, readdirSync, writeFileSync } from "node:fs";
import { join, relative } from "node:path";

const repoRoot = process.argv[2] ?? process.cwd();
const lockPath = join(repoRoot, "skills-lock.json");
const lock = JSON.parse(readFileSync(lockPath, "utf8"));

function collect(base, current, out) {
  for (const entry of readdirSync(current, { withFileTypes: true })) {
    if (entry.name === ".git" || entry.name === "node_modules") continue;
    const full = join(current, entry.name);
    if (entry.isDirectory()) {
      collect(base, full, out);
    } else if (entry.isFile()) {
      out.push({ path: relative(base, full).split("\\").join("/"), bytes: readFileSync(full) });
    }
  }
}

function folderHash(dir) {
  const files = [];
  collect(dir, dir, files);
  files.sort((a, b) => a.path.localeCompare(b.path));
  const hash = createHash("sha256");
  for (const file of files) {
    hash.update(file.path);
    hash.update(file.bytes);
  }
  return hash.digest("hex");
}

let changed = 0;
for (const [name, entry] of Object.entries(lock.skills)) {
  const dir = join(repoRoot, ".agents", "skills", name);
  if (!existsSync(dir)) continue;
  const computed = folderHash(dir);
  if (computed !== entry.computedHash) {
    entry.computedHash = computed;
    changed += 1;
  }
}

writeFileSync(lockPath, `${JSON.stringify(lock, null, 2)}\n`);
console.log(`skills-lock.json: ${changed} hash(es) updated`);
