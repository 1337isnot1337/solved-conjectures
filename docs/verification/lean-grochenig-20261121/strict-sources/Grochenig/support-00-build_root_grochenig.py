"""Strict, sequential source builds for the three root-owned Gaussian modules."""

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
sys.path.insert(0, str(REPO / 'scripts'))
from replay_lean import imports_of


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def record(path):
    return {'path': str(path.relative_to(REPO)), 'sha256': digest(path),
            'bytes': path.stat().st_size}


def parts(module, base=None):
    base = base or LEAN / '.lake/build/lib/lean'
    stem = base / module.replace('.', '/')
    return [Path(str(stem) + suffix) for suffix in
            ['.olean', '.olean.private', '.olean.server']]


def save(path, data):
    temporary = path.with_suffix(path.suffix + '.tmp')
    temporary.write_text(json.dumps(data, indent=2) + '\n')
    temporary.replace(path)


def main():
    suffixes = sys.argv[1:]
    if not suffixes or any(s not in ['SignPreservation', 'Witness', ''] for s in suffixes):
        raise SystemExit('Expected root suffixes SignPreservation, Witness, or empty string.')
    if Path(shutil.which('lean') or '/missing').resolve() != COMPILER.resolve():
        raise SystemExit('Source the pinned lean-env.sh first.')
    started = datetime.datetime.now(datetime.timezone.utc)
    directory = SCRATCH / 'grochenig-root-strict-logs' / started.strftime('%Y%m%dT%H%M%S.%fZ')
    directory.mkdir(parents=True, exist_ok=False)
    controls = {p: digest(REPO / p) for p in
                ['lean/lean-toolchain', 'lean/lakefile.toml', 'lean/lake-manifest.json',
                 'scripts/replay_lean.py']}
    manifest = {'status': 'running', 'started_utc': started.isoformat(),
                'cwd': str(LEAN), 'controls_sha256': controls,
                'compiler': str(COMPILER), 'compiler_sha256': digest(COMPILER),
                'builder_sha256': digest(Path(__file__)), 'modules': []}
    save(directory / 'manifest.json', manifest)
    print('RECEIPTS', directory, flush=True)
    for suffix in suffixes:
        module = 'Conjectures.Grochenig' + suffix
        source = LEAN / (module.replace('.', '/') + '.lean')
        dependencies = {dep: {'source': record(LEAN / (dep.replace('.', '/') + '.lean')),
                              'objects': [record(p) for p in parts(dep)]}
                        for dep in imports_of(source) if dep.startswith('Conjectures.')}
        staged = directory / 'objects'
        outputs = parts(module, staged)
        outputs[0].parent.mkdir(parents=True, exist_ok=True)
        command = [str(COMPILER), '-j1', '-M2200', '-DwarningAsError=true',
                   '-o', str(outputs[0]), str(source.relative_to(LEAN))]
        log = directory / ((suffix or 'Final') + '.log')
        entry = {'module': module, 'source': record(source), 'command': command,
                 'direct_project_dependencies': dependencies, 'log': str(log),
                 'status': 'running'}
        manifest['modules'].append(entry)
        save(directory / 'manifest.json', manifest)
        print('BEGIN', module, flush=True)
        begin = time.monotonic()
        with log.open('xb') as stream:
            process = subprocess.Popen(command, cwd=LEAN, stdout=stream,
                                       stderr=subprocess.STDOUT)
            _, status, usage = os.wait4(process.pid, 0)
            process.returncode = os.waitstatus_to_exitcode(status)
        unchanged = record(source) == entry['source']
        dependency_unchanged = all(
            record(LEAN / (dep.replace('.', '/') + '.lean')) == d['source']
            and [record(p) for p in parts(dep)] == d['objects']
            for dep, d in dependencies.items())
        controls_unchanged = all(digest(REPO / p) == h for p, h in controls.items())
        accepted = (process.returncode == 0 and unchanged and dependency_unchanged
                    and controls_unchanged and all(p.is_file() for p in outputs))
        entry.update({'status': 'passed' if accepted else 'failed',
                      'exit_status': process.returncode,
                      'elapsed_seconds': time.monotonic() - begin,
                      'max_rss_kib': usage.ru_maxrss,
                      'user_seconds': usage.ru_utime, 'system_seconds': usage.ru_stime,
                      'source_unchanged': unchanged,
                      'dependencies_unchanged': dependency_unchanged,
                      'controls_unchanged': controls_unchanged,
                      'log_bytes': log.stat().st_size, 'log_sha256': digest(log)})
        if accepted:
            for output, target in zip(outputs, parts(module)):
                temporary = target.with_name(target.name + '.root-strict.tmp')
                shutil.copyfile(output, temporary)
                temporary.replace(target)
            entry['output_objects'] = [record(p) for p in parts(module)]
        save(directory / ((suffix or 'Final') + '.metrics.json'), entry)
        save(directory / 'manifest.json', manifest)
        print('END', module, entry['status'], entry['elapsed_seconds'], flush=True)
        if not accepted:
            manifest['status'] = 'failed'
            save(directory / 'manifest.json', manifest)
            print(log.read_text()[-20000:], flush=True)
            raise SystemExit(1)
    manifest['status'] = 'passed'
    manifest['finished_utc'] = datetime.datetime.now(datetime.timezone.utc).isoformat()
    save(directory / 'manifest.json', manifest)
    print('STRICT PASS', directory / 'manifest.json', flush=True)


if __name__ == '__main__':
    main()
