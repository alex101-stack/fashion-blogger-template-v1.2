
'use strict';

const fs = require('node:fs');
const path = require('node:path');

const ROOT = process.cwd();

let failures = 0;

function pass(message) {
  console.log(`PASS  ${message}`);
}

function fail(message) {
  failures += 1;
  console.error(`FAIL  ${message}`);
}

function exists(relativePath) {
  return fs.existsSync(path.join(ROOT, relativePath));
}

function readJson(relativePath) {
  const filePath = path.join(ROOT, relativePath);

  try {
    return JSON.parse(fs.readFileSync(filePath, 'utf8'));
  } catch (error) {
    fail(`${relativePath} is invalid JSON: ${error.message}`);
    return null;
  }
}

console.log('');
console.log('BAF Repository Contract Validator v1.0');
console.log('======================================');
console.log('');

const requiredDirectories = [
  'architecture',
  'src',
  'content',
  'config',
  'tests',
  'scripts',
  'verification',
  'baselines',
  'dist',
  'docs',
  'decisions'
];

for (const directory of requiredDirectories) {
  if (exists(directory)) {
    pass(`directory exists: ${directory}`);
  } else {
    fail(`missing directory: ${directory}`);
  }
}

const requiredFiles = [
  'architecture/00-overview/BAF-Repository-Contract-v1.0.md',
  'architecture/00-overview/repository-boundaries.md',
  'architecture/00-overview/artifact-flow.md',
  'architecture/00-overview/repository-invariants.md',
  'config/repository-contract.json',
  'scripts/validation/validate-contract.js',
  'decisions/ADR-0001-repository-architecture.md'
];

for (const file of requiredFiles) {
  if (exists(file)) {
    pass(`file exists: ${file}`);
  } else {
    fail(`missing file: ${file}`);
  }
}

const manifest = readJson('config/repository-contract.json');

if (manifest) {
  if (manifest.contractId === 'BAF-REPOSITORY-CONTRACT') {
    pass('contractId = BAF-REPOSITORY-CONTRACT');
  } else {
    fail('contractId is incorrect');
  }

  if (manifest.version === '1.0.0') {
    pass('contract version = 1.0.0');
  } else {
    fail('contract version is incorrect');
  }

  if (manifest.repository?.name === 'fashion-blogger-template-v1.2') {
    pass('repository name is correct');
  } else {
    fail('repository name is incorrect');
  }

  if (manifest.baseline?.current === 'BL-000') {
    pass('current baseline = BL-000');
  } else {
    fail('current baseline must be BL-000');
  }

  if (manifest.baseline?.initialStatus === 'DRAFT') {
    pass('BL-000 initial status = DRAFT');
  } else {
    fail('BL-000 initial status must be DRAFT');
  }
}

const packageJson = readJson('package.json');

if (packageJson) {
  const requiredScripts = [
    'validate',
    'validate:xml',
    'validate:blogger',
    'test',
    'test:dom',
    'build',
    'release'
  ];

  for (const scriptName of requiredScripts) {
    if (typeof packageJson.scripts?.[scriptName] === 'string') {
      pass(`npm script exists: ${scriptName}`);
    } else {
      fail(`npm script missing: ${scriptName}`);
    }
  }
}

const productionPath = path.join(ROOT, 'dist', 'production');

if (fs.existsSync(productionPath)) {
  pass('production artifact boundary exists: dist/production/');
} else {
  fail('production artifact boundary missing: dist/production/');
}

console.log('');

if (failures > 0) {
  console.error(
    `BAF Repository Contract: FAILED (${failures} issue(s))`
  );

  process.exitCode = 1;
} else {
  console.log('BAF Repository Contract: PASSED');
}
