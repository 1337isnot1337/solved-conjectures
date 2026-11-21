"""Rebuild the exact seven legacy CKS dependencies with immutable receipts.

This script is intentionally separate from the modern Hall helper builder.
It refuses the old Products source and never edits Lean source files.
"""

from pathlib import Path
import datetime
import hashlib
import json
import os
import shutil
import subprocess
import sys
import time


SCRATCH = Path('/workspace/scratch/17b12d3ee06e')
REPO = SCRATCH / 'solved-conjectures'
ROOT = REPO / 'lean'
PINNED_LEAN = SCRATCH / 'toolchains/lean-4.35.0-linux/bin/lean'
MODULES = ['Conjectures.ChenKhareSahi' + suffix for suffix in
           ['', 'Covers', 'Real', 'Cone', 'Products', 'Graded', 'Mixed']]
EXPECTED_PRODUCTS_SHA256 = (
    '13ad8a7e8297a425ab144a0e472c07bbc5b2c96566a2188ed9a0de4bf796b475')

sys.path.insert(0, str(REPO / 'scripts'))
from replay_lean import imports_of


def sha256(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def source_path(module):
    return ROOT / (module.replace('.', '/') + '.lean')


def file_record(path):
    return {'path': str(path.relative_to(ROOT)),
            'bytes': path.stat().st_size, 'sha256': sha256(path)}


def objects(module):
    base = ROOT / '.lake/build/lib/lean' / module.replace('.', '/')
    return [file_record(path) for path in sorted(base.parent.glob(base.name + '.olean*'))
            if path.is_file()]


def project_imports(module):
    return [name for name in imports_of(source_path(module))
            if (ROOT / (name.replace('.', '/') + '.lean')).is_file()]


def write_json(path, value):
    temporary = path.with_suffix(path.suffix + '.tmp')
    temporary.write_text(json.dumps(value, indent=2) + '\n')
    temporary.replace(path)


def main():
    lean = shutil.which('lean')
    if lean is None or Path(lean).resolve() != PINNED_LEAN.resolve():
        raise SystemExit('Source the pinned lean-env.sh before running this builder.')
    products = source_path('Conjectures.ChenKhareSahiProducts')
    if sha256(products) != EXPECTED_PRODUCTS_SHA256:
        raise SystemExit('The reviewed, published Products repair is not present. '
                         'Expected SHA256 ' + EXPECTED_PRODUCTS_SHA256)
    memory = os.environ.get('CKS_LEGACY_LEAN_MEMORY_MB', '2200')
    if not memory.isdecimal() or int(memory) <= 0:
        raise SystemExit('CKS_LEGACY_LEAN_MEMORY_MB must be a positive integer.')
    controls = {name: sha256(ROOT / name) for name in
                ['lean-toolchain', 'lakefile.toml', 'lake-manifest.json']}
    initial_sources = {module: file_record(source_path(module)) for module in MODULES}
    dependencies = {module: project_imports(module) for module in MODULES}
    earlier = set()
    for module in MODULES:
        if not set(dependencies[module]).issubset(earlier):
            raise SystemExit('Unexpected dependency or source order: ' + module + ' ' +
                             repr(dependencies[module]))
        earlier.add(module)

    started = datetime.datetime.now(datetime.timezone.utc)
    directory = SCRATCH / 'cks-legacy-strict-logs' / started.strftime('%Y%m%dT%H%M%S.%fZ')
    directory.mkdir(parents=True, exist_ok=False)
    manifest_path = directory / 'manifest.json'
    manifest = {
        'status': 'running', 'started_utc': started.isoformat(),
        'cwd': str(ROOT), 'lean': lean, 'lean_executable_sha256': sha256(Path(lean)),
        'lean_path': os.environ.get('LEAN_PATH', ''),
        'builder_sha256': sha256(Path(__file__)), 'control_sha256': controls,
        'module_order': MODULES, 'initial_sources': initial_sources,
        'expected_products_sha256': EXPECTED_PRODUCTS_SHA256, 'modules': []}
    write_json(manifest_path, manifest)
    print('LEGACY RECEIPTS ' + str(directory), flush=True)
    completed = {}
    for module in MODULES:
        source = source_path(module)
        target = ROOT / '.lake/build/lib/lean' / (module.replace('.', '/') + '.olean')
        target.parent.mkdir(parents=True, exist_ok=True)
        inputs = {dep: {'source': file_record(source_path(dep)), 'objects': objects(dep)}
                  for dep in dependencies[module]}
        for dep in inputs:
            if inputs[dep]['objects'] != completed[dep]['output_objects']:
                raise SystemExit('Previously rebuilt dependency objects changed: ' + dep)
        source_before = file_record(source)
        if source_before != initial_sources[module]:
            raise SystemExit('Source changed before its build: ' + module)
        command = [lean, '-j1', '-M' + memory, '-DwarningAsError=true', '-o',
                   str(target.relative_to(ROOT)), str(source.relative_to(ROOT))]
        log = directory / (module + '.log')
        metrics_path = directory / (module + '.metrics.json')
        record = {'module': module, 'source': source_before, 'command': command,
                  'direct_project_dependencies': inputs, 'log': str(log),
                  'metrics': str(metrics_path), 'status': 'running', 'output_objects': []}
        manifest['modules'].append(record)
        write_json(manifest_path, manifest)
        print('BEGIN STRICT LEGACY ' + module, flush=True)
        begin = time.monotonic()
        with log.open('wb') as stream:
            child = subprocess.Popen(command, cwd=ROOT, stdout=stream, stderr=subprocess.STDOUT)
            _, status, usage = os.wait4(child.pid, 0)
            child.returncode = os.waitstatus_to_exitcode(status)
        metrics = {'elapsed_seconds': round(time.monotonic() - begin, 3),
                   'exit_status': child.returncode, 'max_rss_kib': usage.ru_maxrss,
                   'user_seconds': usage.ru_utime, 'system_seconds': usage.ru_stime}
        write_json(metrics_path, metrics)
        source_unchanged = file_record(source) == source_before
        dependencies_unchanged = all(
            file_record(source_path(dep)) == inputs[dep]['source'] and
            objects(dep) == inputs[dep]['objects'] for dep in inputs)
        accepted = (child.returncode == 0 and source_unchanged and
                    dependencies_unchanged and target.is_file())
        record.update(metrics)
        record.update({'status': 'passed' if accepted else 'failed',
                       'source_unchanged': source_unchanged,
                       'dependencies_unchanged': dependencies_unchanged,
                       'diagnostic_bytes': log.stat().st_size,
                       'output_objects': objects(module) if accepted else []})
        if not accepted:
            manifest['status'] = 'failed'
        write_json(manifest_path, manifest)
        print('END STRICT LEGACY ' + module + ' exit=' + str(child.returncode) +
              ' seconds=' + str(metrics['elapsed_seconds']), flush=True)
        if not accepted:
            print(log.read_text()[-20000:], flush=True)
            raise SystemExit(1)
        completed[module] = record

    manifest['sources_unchanged'] = all(
        file_record(source_path(module)) == initial_sources[module] for module in MODULES)
    manifest['objects_unchanged'] = all(
        objects(module) == completed[module]['output_objects'] for module in MODULES)
    manifest['controls_unchanged'] = all(
        sha256(ROOT / name) == value for name, value in controls.items())
    manifest['status'] = ('passed' if manifest['sources_unchanged'] and
                          manifest['objects_unchanged'] and manifest['controls_unchanged']
                          else 'failed')
    manifest['finished_utc'] = datetime.datetime.now(datetime.timezone.utc).isoformat()
    write_json(manifest_path, manifest)
    print('STRICT LEGACY ' + manifest['status'].upper() + ': ' + str(manifest_path), flush=True)
    if manifest['status'] != 'passed':
        raise SystemExit(1)


if __name__ == '__main__':
    main()
