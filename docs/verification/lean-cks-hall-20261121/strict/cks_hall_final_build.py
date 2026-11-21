from pathlib import Path
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import time

root = Path('/workspace/scratch/17b12d3ee06e/solved-conjectures/lean')
logs = Path('/workspace/scratch/17b12d3ee06e/cks-hall-final-logs')
logs.mkdir(exist_ok=True)
manifest = logs / 'manifest.json'
ordered = ['Data', 'Transition', 'Gram', 'Dual', 'Family', 'Core', 'Orbits', 'Power', 'Evaluation', 'Polynomial', 'Main']
suffixes = sys.argv[1:] or ordered[:-1]
memory = os.environ.get('CKS_HALL_LEAN_MEMORY_MB', '2200')
lean = shutil.which('lean')
if lean is None:
    raise SystemExit('Pinned Lean environment has not been sourced')

def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def object_records(module):
    base = root / '.lake/build/lib/lean' / Path(*module.split('.'))
    return [{'path': str(p.relative_to(root)), 'bytes': p.stat().st_size,
             'sha256': digest(p)} for p in sorted(base.parent.glob(base.name + '.olean*'))]

records = json.loads(manifest.read_text()) if manifest.exists() else []
for suffix in suffixes:
    name = 'ChenKhareSahiOrthogonality' + ('' if suffix == 'Main' else suffix)
    module = 'Conjectures.' + name
    source = root / 'Conjectures' / (name + '.lean')
    target = root / '.lake/build/lib/lean/Conjectures' / (name + '.olean')
    logfile = logs / (suffix + '.log')
    metricsfile = logs / (suffix + '.metrics')
    lean_args = [lean, '-j1', '-M' + memory, '-DwarningAsError=true', '-o', str(target.relative_to(root)), str(source.relative_to(root))]
    imports = re.findall(r'^(?:public )?import (Conjectures\.[A-Za-z0-9_.]+)$', source.read_text(), re.M)
    record = {'module': module, 'phase': 'after defining-equation ownership repair',
              'source': str(source.relative_to(root)), 'source_sha256': digest(source),
              'command': lean_args, 'direct_project_dependencies': {m: object_records(m) for m in imports},
              'log': str(logfile), 'metrics': str(metricsfile)}
    print('BEGIN FINAL ' + module, flush=True)
    start = time.monotonic()
    with logfile.open('w') as stream:
        child = subprocess.Popen(lean_args, cwd=root, stdout=stream, stderr=subprocess.STDOUT)
        _, status, usage = os.wait4(child.pid, 0)
        child.returncode = os.waitstatus_to_exitcode(status)
    elapsed = round(time.monotonic() - start, 3)
    metrics = {'elapsed_seconds': elapsed, 'max_rss_kib': usage.ru_maxrss,
               'user_seconds': usage.ru_utime, 'system_seconds': usage.ru_stime,
               'exit_status': child.returncode}
    metricsfile.write_text(json.dumps(metrics, indent=2) + '\n')
    record.update({'subprocess_exit': child.returncode, 'elapsed_seconds': elapsed,
                   'max_rss_kib': usage.ru_maxrss,
                   'diagnostic_bytes': logfile.stat().st_size, 'source_unchanged': digest(source) == record['source_sha256'],
                   'output_objects': object_records(module) if child.returncode == 0 else []})
    records = [r for r in records if r['module'] != module] + [record]
    records.sort(key=lambda r: ordered.index('Main' if r['module'].endswith('Orthogonality') else r['module'].removeprefix('Conjectures.ChenKhareSahiOrthogonality')))
    manifest.write_text(json.dumps(records, indent=2) + '\n')
    print('END FINAL ' + module + ' exit=' + str(child.returncode) + ' seconds=' + str(record['elapsed_seconds']), flush=True)
    if child.returncode != 0 or not record['source_unchanged']:
        print(logfile.read_text()[-20000:], flush=True)
        raise SystemExit(child.returncode if child.returncode != 0 else 1)
