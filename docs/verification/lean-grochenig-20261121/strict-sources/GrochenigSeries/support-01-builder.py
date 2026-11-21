"""Sequential strict Gaussian-series builds with immutable per-run receipts."""

from pathlib import Path
import datetime
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import time

SCRATCH = Path('/workspace/scratch/17b12d3ee06e')
ROOT = SCRATCH / 'solved-conjectures/lean'
PINNED_LEAN = SCRATCH / 'toolchains/lean-4.35.0-linux/bin/lean'
SERIES_ORDER = ['GrochenigSeriesAnalytic', 'GrochenigSeriesCoefficients', 'GrochenigSeries']
ALLOWED = set(SERIES_ORDER)


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def file_record(path):
    return {'path': str(path.relative_to(ROOT)), 'bytes': path.stat().st_size,
            'sha256': digest(path)}


def objects(module):
    base = ROOT / '.lake/build/lib/lean' / module.replace('.', '/')
    return [file_record(path) for path in sorted(base.parent.glob(base.name + '.olean*'))
            if path.is_file()]


def write_json(path, value):
    temporary = path.with_suffix(path.suffix + '.tmp')
    temporary.write_text(json.dumps(value, indent=2) + '\n')
    temporary.replace(path)


def main():
    names = sys.argv[1:] or SERIES_ORDER
    if any(name not in ALLOWED for name in names):
        raise SystemExit('Supply only owned Grochenig Series modules.')
    lean = shutil.which('lean')
    if lean is None or Path(lean).resolve() != PINNED_LEAN.resolve():
        raise SystemExit('Source the pinned lean-env.sh before running this builder.')
    memory = os.environ.get('PARTIAL_LEAN_MEMORY_MB', '2200')
    if not memory.isdecimal() or int(memory) <= 0:
        raise SystemExit('PARTIAL_LEAN_MEMORY_MB must be a positive integer.')
    started = datetime.datetime.now(datetime.timezone.utc)
    directory = SCRATCH / 'partial-strict-logs' / started.strftime('%Y%m%dT%H%M%S.%fZ')
    directory.mkdir(parents=True, exist_ok=False)
    shutil.copyfile(Path(__file__), directory / 'builder.py')
    manifest_path = directory / 'manifest.json'
    controls = {name: digest(ROOT / name) for name in
                ['lean-toolchain', 'lakefile.toml', 'lake-manifest.json']}
    manifest = {'status': 'running', 'started_utc': started.isoformat(), 'cwd': str(ROOT),
                'lean': lean, 'lean_executable_sha256': digest(Path(lean)),
                'lean_path': os.environ.get('LEAN_PATH', ''),
                'builder_sha256': digest(Path(__file__)), 'builder_snapshot': str(directory / 'builder.py'),
                'control_sha256': controls,
                'modules': []}
    write_json(manifest_path, manifest)
    print('STRICT RECEIPTS ' + str(directory), flush=True)
    for name in names:
        module = 'Conjectures.' + name
        source = ROOT / 'Conjectures' / (name + '.lean')
        target = ROOT / '.lake/build/lib/lean/Conjectures' / (name + '.olean')
        imported = re.findall(r'^(?:public )?import (Conjectures\.[A-Za-z0-9_.]+)$',
                              source.read_text(), re.M)
        dependencies = {dep: {'source': file_record(ROOT / (dep.replace('.', '/') + '.lean')),
                              'objects': objects(dep)} for dep in imported}
        if any(not value['objects'] for value in dependencies.values()):
            raise SystemExit('Missing project dependency object for ' + module)
        command = [lean, '-j1', '-M' + memory, '-DwarningAsError=true', '-o',
                   str(target.relative_to(ROOT)), str(source.relative_to(ROOT))]
        log = directory / (name + '.log')
        record = {'module': module, 'source': file_record(source), 'command': command,
                  'direct_project_dependencies': dependencies, 'log': str(log),
                  'status': 'running', 'output_objects': []}
        manifest['modules'].append(record)
        write_json(manifest_path, manifest)
        print('BEGIN STRICT ' + module, flush=True)
        begin = time.monotonic()
        with log.open('wb') as stream:
            child = subprocess.Popen(command, cwd=ROOT, stdout=stream, stderr=subprocess.STDOUT)
            _, status, usage = os.wait4(child.pid, 0)
            child.returncode = os.waitstatus_to_exitcode(status)
        source_unchanged = file_record(source) == record['source']
        dependencies_unchanged = all(
            file_record(ROOT / (dep.replace('.', '/') + '.lean')) == dependencies[dep]['source']
            and objects(dep) == dependencies[dep]['objects'] for dep in imported)
        accepted = (child.returncode == 0 and source_unchanged and
                    dependencies_unchanged and target.is_file())
        record.update({'status': 'passed' if accepted else 'failed',
                       'elapsed_seconds': round(time.monotonic() - begin, 3),
                       'exit_status': child.returncode, 'max_rss_kib': usage.ru_maxrss,
                       'user_seconds': usage.ru_utime, 'system_seconds': usage.ru_stime,
                       'source_unchanged': source_unchanged,
                       'dependencies_unchanged': dependencies_unchanged,
                       'diagnostic_bytes': log.stat().st_size,
                       'output_objects': objects(module) if accepted else []})
        write_json(directory / (name + '.metrics.json'), record)
        if not accepted:
            manifest['status'] = 'failed'
        write_json(manifest_path, manifest)
        print('END STRICT ' + module + ' exit=' + str(child.returncode) +
              ' seconds=' + str(record['elapsed_seconds']), flush=True)
        if not accepted:
            print(log.read_text()[-20000:], flush=True)
            raise SystemExit(1)
    manifest['controls_unchanged'] = all(digest(ROOT / name) == value
                                       for name, value in controls.items())
    manifest['sources_unchanged'] = all(
        file_record(ROOT / record['source']['path']) == record['source']
        for record in manifest['modules'])
    manifest['outputs_unchanged'] = all(objects(record['module']) == record['output_objects']
                                       for record in manifest['modules'])
    manifest['status'] = ('passed' if manifest['controls_unchanged'] and manifest['sources_unchanged'] and
                          manifest['outputs_unchanged'] else 'failed')
    manifest['finished_utc'] = datetime.datetime.now(datetime.timezone.utc).isoformat()
    write_json(manifest_path, manifest)
    print('STRICT ' + manifest['status'].upper() + ': ' + str(manifest_path), flush=True)
    if manifest['status'] != 'passed':
        raise SystemExit(1)


if __name__ == '__main__':
    main()
