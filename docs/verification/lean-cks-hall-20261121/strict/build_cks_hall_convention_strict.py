"""Strictly rebuild the source Hall-convention diagnostic with immutable evidence."""

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
LEAN = REPO / 'lean'
COMPILER = SCRATCH / 'toolchains/lean-4.35.0-linux/bin/lean'
MODULE = 'Conjectures.ChenKhareSahiHallConvention'
EXPECTED_PRODUCTS = '13ad8a7e8297a425ab144a0e472c07bbc5b2c96566a2188ed9a0de4bf796b475'
sys.path.insert(0, str(REPO / 'scripts'))
from replay_lean import imports_of


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def record(path):
    return {'path': str(path.relative_to(REPO)), 'bytes': path.stat().st_size,
            'sha256': digest(path)}


def source(module):
    return LEAN / (module.replace('.', '/') + '.lean')


def objects(module, root=None):
    base = (root or LEAN / '.lake/build/lib/lean') / module.replace('.', '/')
    suffixes = ['.olean', '.olean.private', '.olean.server'] if (
        source(module).read_text().split()[0] == 'module') else ['.olean']
    return [Path(str(base) + suffix) for suffix in suffixes]


def save(path, value):
    temp = path.with_suffix('.json.tmp')
    temp.write_text(json.dumps(value, indent=2) + '\n')
    temp.replace(path)


def main():
    if Path(shutil.which('lean') or '/missing').resolve() != COMPILER.resolve():
        raise SystemExit('Source the pinned lean-env.sh first.')
    if digest(source('Conjectures.ChenKhareSahiProducts')) != EXPECTED_PRODUCTS:
        raise SystemExit('Published Products repair is absent or changed.')
    dependencies = {
        dep: {'source': record(source(dep)), 'objects': [record(p) for p in objects(dep)]}
        for dep in imports_of(source(MODULE)) if dep.startswith('Conjectures.')}
    if dependencies:
        raise SystemExit('Unexpected project dependency in HallConvention.')
    controls = {p: digest(REPO / p) for p in [
        'lean/lean-toolchain', 'lean/lakefile.toml', 'lean/lake-manifest.json',
        'scripts/replay_lean.py', 'scripts/audit_lean_owned_extension.py',
        'scripts/audit_lean_all_owned.py']}
    started = datetime.datetime.now(datetime.timezone.utc)
    directory = SCRATCH / 'cks-hall-convention-strict-runs' / started.strftime('%Y%m%dT%H%M%S.%fZ')
    directory.mkdir(parents=True, exist_ok=False)
    output = objects(MODULE, directory / 'objects')
    output[0].parent.mkdir(parents=True, exist_ok=True)
    command = [str(COMPILER), '-j1', '-M2200', '-DwarningAsError=true',
               '-o', str(output[0]), str(source(MODULE).relative_to(LEAN))]
    log = directory / 'strict.log'
    result = {'status': 'running', 'module': MODULE, 'started_utc': started.isoformat(),
              'source': record(source(MODULE)), 'direct_project_dependencies': dependencies,
              'controls_sha256': controls, 'compiler_sha256': digest(COMPILER),
              'builder_sha256': digest(Path(__file__)), 'cwd': str(LEAN), 'command': command,
              'log': str(log), 'expected_products_sha256': EXPECTED_PRODUCTS}
    save(directory / 'receipt.json', result)
    print('HALL RECEIPT', directory, flush=True)
    begin = time.monotonic()
    with log.open('xb') as stream:
        child = subprocess.Popen(command, cwd=LEAN, stdout=stream, stderr=subprocess.STDOUT)
        _, status, usage = os.wait4(child.pid, 0)
        child.returncode = os.waitstatus_to_exitcode(status)
    unchanged = record(source(MODULE)) == result['source']
    dep_unchanged = all(record(source(dep)) == d['source'] and
                        [record(p) for p in objects(dep)] == d['objects']
                        for dep, d in dependencies.items())
    controls_unchanged = all(digest(REPO / p) == h for p, h in controls.items())
    accepted = child.returncode == 0 and unchanged and dep_unchanged and controls_unchanged and all(
        p.is_file() for p in output)
    result.update({'status': 'passed' if accepted else 'failed', 'exit_status': child.returncode,
                   'elapsed_seconds': time.monotonic() - begin, 'max_rss_kib': usage.ru_maxrss,
                   'user_seconds': usage.ru_utime, 'system_seconds': usage.ru_stime,
                   'source_unchanged': unchanged, 'dependencies_unchanged': dep_unchanged,
                   'controls_unchanged': controls_unchanged, 'diagnostic_bytes': log.stat().st_size,
                   'log_sha256': digest(log)})
    if accepted:
        for src, dst in zip(output, objects(MODULE)):
            temp = dst.with_name(dst.name + '.final-strict.tmp')
            shutil.copyfile(src, temp)
            temp.replace(dst)
        result['output_objects'] = [record(p) for p in objects(MODULE)]
    save(directory / 'receipt.json', result)
    print('STRICT HALL', result['status'], result['elapsed_seconds'], flush=True)
    if not accepted:
        print(log.read_text()[-20000:], flush=True)
        raise SystemExit(1)


if __name__ == '__main__':
    main()
