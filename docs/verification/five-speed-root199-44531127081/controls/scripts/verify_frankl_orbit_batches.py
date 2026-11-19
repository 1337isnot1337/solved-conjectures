#!/usr/bin/env python3
"""Fresh isolated gates for bounded groups of short-period orbit arithmetic.

Each selected group checks at most four proof blocks. The full block manifest
is reproduced before selection, but unselected arithmetic is neither imported
nor replayed. No accepted registry or all-block aggregate is changed here.
"""

from __future__ import annotations

import argparse
from concurrent.futures import FIRST_COMPLETED, ThreadPoolExecutor, wait
from graphlib import TopologicalSorter
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import signal
import subprocess
import time

from plan_lean_candidates import changed_sources
from replay_lean import imports_of, local_closure


ROOT = Path(__file__).resolve().parents[1]
LEAN = ROOT / 'lean'
RESULTS = ROOT / 'results/frankl-generator-families'
PRODUCER = RESULTS / 'generate_small_cyclic_weight_orbit_batches.py'
MANIFEST = RESULTS / 'small_cyclic_weight_orbit_batches.json'
CHECKER_SHA256 = '12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6'
GATE_INPUTS = (
    'scripts/verify_frankl_orbit_batches.py',
    'scripts/test_frankl_orbit_batches.py',
    'scripts/replay_lean.py',
    'scripts/plan_lean_candidates.py',
    'scripts/verify_lean_candidate.py',
    '.github/workflows/lean-frankl-orbit-batches.yml',
    'results/frankl-generator-families/generate_small_cyclic_weight_orbit_batches.py',
    'results/frankl-generator-families/small_cyclic_weight_orbit_batches.json',
    'results/frankl-generator-families/small_cyclic_weight_orbits.json.gz',
    'results/frankl-generator-families/width_four_weight_candidates.json',
    'lean/lean-toolchain', 'lean/lakefile.toml', 'lean/lake-manifest.json',
)
SHARED_ENDPOINTS = [
    'FranklSmallCyclic.OrbitArithmetic.' + name for name in (
        'cachedWindowCheck_eq', 'cachedEntryCheck_eq', 'cachedBatchCheck_eq',
        'cachedEntryCheck_sound', 'cachedBatchCheck_sound', 'cachedBatchCheck_append')
] + [
    'FranklSmallCyclic.Weights.' + name for name in (
        'batchCheck_wellFormed', 'batchCheck_entry', 'batchCheck_certificate', 'batchCheck_global')
] + [
    'FranklLocal.Mask.cachedCheck_eq',
    'FranklSmallCyclic.MaskWindows.checked_window_certificate',
    'FranklSmallCyclic.MaskWindows.windowCheck_global',
]


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def source(module, base=LEAN):
    return base / (module.replace('.', '/') + '.lean')


def load_producer():
    spec = importlib.util.spec_from_file_location('frankl_orbit_batch_producer', PRODUCER)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def validate_layout():
    producer = load_producer()
    files, expected = producer.produce(producer.load_packet())
    producer.check_written(files, expected, LEAN / 'Conjectures', MANIFEST)
    return expected


def dependency_order(roots):
    closure = local_closure(LEAN, set(roots))
    if any(not module.startswith('Conjectures.') for module in closure):
        raise ValueError('Orbit closure crossed the Conjectures namespace')
    graph = {module: sorted(set(imports_of(source(module))) & closure)
             for module in sorted(closure)}
    return list(TopologicalSorter(graph).static_order())


def group_spec(manifest, name):
    groups = {group['id']: group for group in manifest['groups']}
    if name not in groups:
        raise ValueError('Unknown orbit group: ' + name)
    group = groups[name]
    blocks = [manifest['blocks'][i] for i in group['block_ids']]
    if not 1 <= len(blocks) <= 4:
        raise ValueError('An isolated group must contain one to four blocks')
    modules = dependency_order(group['roots'])
    if any('Vaughan' in name or 'Matching' in name for name in modules):
        raise ValueError('Arithmetic groups must not import Vaughan/Matching data')
    required = sorted(set(SHARED_ENDPOINTS + [n for b in blocks for n in b['required_endpoints']]))
    private = [n for b in blocks for n in b['private_endpoints']]
    if len(private) != group['private_chunks'] or len(private) != len(set(private)):
        raise ValueError('Private arithmetic proof count mismatch')
    for block in blocks:
        text = source(block['module']).read_text()
        actual = re.findall(r'^private theorem (checked\d+)\b', text, re.M)
        expected = ['checked' + str(i) for i in range(block['private_chunks'])]
        if actual != expected:
            raise ValueError('Private arithmetic source layout changed: ' + block['module'])
    return group, modules, required, private


def ci_plan(changed, manifest, requested=None):
    names = [group['id'] for group in manifest['groups']]
    if requested:
        selected = set(filter(None, re.split(r'[,\s]+', requested)))
        if not selected <= set(names):
            raise ValueError('Unknown requested groups: ' + str(sorted(selected - set(names))))
        names = [name for name in names if name in selected]
    chosen = []
    for name in names:
        _, modules, _, _ = group_spec(manifest, name)
        paths = {'lean/' + module.replace('.', '/') + '.lean' for module in modules}
        if changed is None or changed & (set(GATE_INPUTS) | paths):
            chosen.append(name)
    return {'groups': chosen, 'total_groups': manifest['group_count'],
            'max_blocks_per_group': 4, 'max_parallel_groups': 4,
            'scope': 'Selected bounded arithmetic groups only; no all-block closure.'}


def resolve_runtime(runtime):
    if runtime is None:
        code = ("import json,os,subprocess; print(json.dumps({"
                "'prefix':subprocess.check_output(['lean','--print-prefix'],text=True).strip(),"
                "'lean_path':os.environ.get('LEAN_PATH','')}))")
        config = json.loads(subprocess.check_output(['lake', 'env', 'python3', '-c', code], cwd=LEAN, text=True))
        runtime = Path(config['prefix']).resolve()
        entries = config['lean_path'].split(os.pathsep)
        external = [(Path(entry) if Path(entry).is_absolute() else LEAN / entry).resolve()
                    for entry in entries if entry]
    else:
        runtime = runtime.resolve()
        external = [p / '.lake/build/lib/lean' for p in sorted((LEAN / '.lake/packages').iterdir())
                    if (p / '.lake/build/lib/lean').is_dir()]
    external = [p for p in external if p.resolve() != (LEAN / '.lake/build/lib/lean').resolve()]
    external.append(runtime / 'lib/lean')
    external = list(dict.fromkeys(str(p.resolve()) for p in external))
    if any((Path(p) / 'Conjectures').exists() for p in external):
        raise ValueError('External Lean search path contains unstaged project objects')
    lean = runtime / 'bin/lean'
    checker = runtime / 'bin/leanchecker'
    if digest(checker) != CHECKER_SHA256:
        raise ValueError('Lean checker differs from the reviewed stock pinned binary')
    return runtime, external, {'lean_path': str(lean), 'lean_sha256': digest(lean),
        'checker_path': str(checker), 'checker_sha256': digest(checker),
        'lean_version': subprocess.check_output([str(lean), '--version'], text=True).strip()}


def profile(command, cwd, environment, log, progress, timeout):
    start = time.monotonic()
    with log.open('w') as handle:
        process = subprocess.Popen(command, cwd=cwd, env=environment,
                                   stdout=handle, stderr=subprocess.STDOUT)
        timed_out = False
        while True:
            pid, status, usage = os.wait4(process.pid, os.WNOHANG)
            if pid:
                process.returncode = os.waitstatus_to_exitcode(status)
                break
            elapsed = time.monotonic() - start
            state = {'command': command, 'pid': process.pid, 'seconds': round(elapsed, 3)}
            proc = Path('/proc') / str(process.pid) / 'status'
            try:
                match = re.search(r'^VmRSS:\s+(\d+) kB', proc.read_text(), re.M)
                if match:
                    state['current_rss_kib'] = int(match[1])
            except FileNotFoundError:
                pass
            progress.write_text(json.dumps(state, sort_keys=True) + '\n')
            if elapsed > timeout:
                timed_out = True
                process.send_signal(signal.SIGTERM)
                _, status, usage = os.wait4(process.pid, 0)
                process.returncode = os.waitstatus_to_exitcode(status)
                break
            time.sleep(0.25)
    result = {'command': command, 'exit_code': process.returncode,
              'seconds': round(time.monotonic() - start, 3), 'peak_rss_kib': usage.ru_maxrss,
              'user_seconds': usage.ru_utime, 'system_seconds': usage.ru_stime,
              'timed_out': timed_out, 'log': str(log), 'log_sha256': digest(log)}
    progress.write_text(json.dumps(result, sort_keys=True) + '\n')
    print(json.dumps({'phase': log.stem, **{k: result[k] for k in ('exit_code', 'seconds', 'peak_rss_kib')}}), flush=True)
    return result


def artifact_hashes(stage, modules):
    result = {}
    for module in modules:
        stem = stage / 'lib/lean' / module.replace('.', '/')
        facets = {}
        for suffix in ('.olean', '.olean.private', '.olean.server', '.ir', '.ir.sig'):
            path = Path(str(stem) + suffix)
            if path.is_symlink():
                raise ValueError('Project artifacts must be materialized: ' + str(path))
            if not path.exists():
                if suffix.startswith('.olean'):
                    raise ValueError('Missing modern object facet: ' + str(path))
                continue
            facets[suffix] = digest(path)
        result[module] = facets
    present = {'.'.join(p.relative_to(stage / 'lib/lean').with_suffix('').parts)
               for p in (stage / 'lib/lean/Conjectures').rglob('*.olean')}
    if present != set(modules):
        raise ValueError('Staged object closure mismatch: ' + str(sorted(present ^ set(modules))))
    return result


def audit_source(modules, required, private):
    names = lambda values: ',\n    '.join('`' + value for value in values)
    return '''module
''' + ''.join('import all ' + module + '\n' for module in modules) + '''import Lean.Util.CollectAxioms
import Lean.PrivateName

open Lean Elab Command in
run_cmd do
  let modules : Array String := #[''' + ', '.join(json.dumps(m) for m in modules) + ''']
  let required : Array Name := #[''' + names(required) + ''']
  let expectedPrivate : Array Name := #[''' + names(private) + ''']
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let env ← getEnv
  let imported := env.header.modules.filter fun m => m.module.toString.startsWith "Conjectures."
  unless imported.size == modules.size do
    throwError "Project import closure count mismatch"
  for m in imported do
    unless modules.contains m.module.toString do
      throwError "Unexpected project import: {m.module}"
  for name in required do
    let info ← getConstInfo name
    unless info.isTheorem do
      throwError "Required endpoint is not a theorem: {name}"
  let mut declarations : Nat := 0
  let mut theorems : Nat := 0
  let mut seenPrivate : Array Name := #[]
  for (name, info) in env.constants.toList do
    let owned := match env.getModuleIdxFor? name |>.bind (env.header.modules[·]?) with
      | some m => modules.contains m.module.toString
      | none => false
    if owned then
      declarations := declarations + 1
      if info.isTheorem then
        theorems := theorems + 1
        if let some userName := privateToUserName? name then
          if expectedPrivate.contains userName then
            seenPrivate := seenPrivate.push userName
      if let .axiomInfo _ := info then
        throwError "Unapproved project axiom: {name}"
      for axiomName in ← collectAxioms name do
        unless allowed.contains axiomName do
          throwError "Unapproved axiom {axiomName} in {name}"
  for name in expectedPrivate do
    unless seenPrivate.contains name do
      throwError "Missing private arithmetic proof: {name}"
  unless seenPrivate.size == expectedPrivate.size do
    throwError "Private arithmetic proof count mismatch"
  logInfo m!"PASS: {modules.size} project modules; {declarations} owned declarations; {theorems} owned theorems; {required.size} required endpoints; all {seenPrivate.size} private arithmetic chunks visible"
'''


def write_receipt(stage, receipt):
    (stage / 'receipt.json').write_text(json.dumps(receipt, indent=2, sort_keys=True) + '\n')


def run_group(args, manifest):
    group, modules, required, private = group_spec(manifest, args.group)
    stage = (args.artifact_dir or ROOT / '.candidate-artifacts' / ('frankl-orbit-' + args.group)).resolve()
    if stage.exists() and any(stage.iterdir()):
        raise ValueError('Preserve existing gate evidence; choose an empty artifact directory: ' + str(stage))
    for suffix in ('src', 'lib/lean', 'logs', 'progress'):
        (stage / suffix).mkdir(parents=True, exist_ok=True)
    initial_sources = {module: digest(source(module)) for module in modules}
    initial_gate = {path: digest(ROOT / path) for path in GATE_INPUTS}
    for module in modules:
        target = source(module, stage / 'src')
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source(module), target)
    runtime, external, toolchain = resolve_runtime(args.runtime)
    environment = {**os.environ, 'PATH': str(runtime / 'bin') + os.pathsep + os.environ.get('PATH', ''),
                   'LEAN_PATH': os.pathsep.join([str(stage / 'lib/lean'), *external]), 'LEAN_NUM_THREADS': '1'}
    receipt = {'status': 'running', 'group': group, 'project_modules': modules,
               'source_sha256': initial_sources, 'gate_sha256': initial_gate,
               'required_endpoints': required, 'required_private_endpoints': private,
               'toolchain': toolchain, 'source_workers': args.jobs, 'kernel_threads': args.jobs,
               'lean_path': environment['LEAN_PATH'], 'source_checks': {},
               'axiom_whitelist': ['propext', 'Classical.choice', 'Quot.sound'],
               'scope': 'Only this bounded arithmetic group; no full orbit transport or span-four conclusion.'}
    try:
        receipt['git_commit'] = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip()
        graph = {m: set(imports_of(source(m))) & set(modules) for m in modules}
        pending, done, running = set(modules), set(), {}

        def compile_module(module):
            output = stage / 'lib/lean' / (module.replace('.', '/') + '.olean')
            output.parent.mkdir(parents=True, exist_ok=True)
            command = [str(runtime / 'bin/lean'), '-j1', '-M4500', '-DwarningAsError=true',
                       '-o', str(output), module.replace('.', '/') + '.lean']
            return profile(command, stage / 'src', environment, stage / 'logs' / (module + '.source.log'),
                           stage / 'progress' / (module + '.json'), 1800)

        with ThreadPoolExecutor(max_workers=args.jobs) as pool:
            while pending or running:
                for module in modules:
                    if module in pending and graph[module] <= done and len(running) < args.jobs:
                        pending.remove(module)
                        running[pool.submit(compile_module, module)] = module
                if not running:
                    raise RuntimeError('Dependency scheduler stalled')
                finished, _ = wait(running, return_when=FIRST_COMPLETED)
                for future in finished:
                    module = running.pop(future)
                    result = future.result()
                    receipt['source_checks'][module] = result
                    write_receipt(stage, receipt)
                    if result['exit_code']:
                        raise RuntimeError('Strict source failed: ' + module + '\n' + Path(result['log']).read_text()[-12000:])
                    done.add(module)
        if done != set(modules):
            raise RuntimeError('Not every source was freshly checked')
        objects = artifact_hashes(stage, modules)
        receipt['artifact_sha256'] = objects
        audit = stage / 'src/OrbitGroupAudit.lean'
        audit.write_text(audit_source(modules, required, private))
        command = [str(runtime / 'bin/lean'), '-j1', '-M4500', '-DwarningAsError=true', audit.name]
        result = profile(command, stage / 'src', environment, stage / 'logs/axiom-audit.log',
                         stage / 'progress/axiom-audit.json', 600)
        receipt['axiom_audit'] = result
        if result['exit_code']:
            raise RuntimeError('Axiom audit failed: ' + Path(result['log']).read_text()[-12000:])
        pattern = r'PASS: (\d+) project modules; (\d+) owned declarations; (\d+) owned theorems; (\d+) required endpoints; all (\d+) private arithmetic chunks'
        match = re.search(pattern, Path(result['log']).read_text())
        if not match:
            raise RuntimeError('Missing explicit all-declaration audit result')
        counts = list(map(int, match.groups()))
        if counts[0] != len(modules) or counts[3:] != [len(required), len(private)]:
            raise RuntimeError('Audit endpoint or private-proof count mismatch')
        result.update({'project_module_count': counts[0], 'declaration_count': counts[1],
                       'theorem_count': counts[2], 'required_endpoint_count': counts[3],
                       'private_arithmetic_chunks_visible': counts[4], 'explicit_import_all': True,
                       'all_declarations_audited': True, 'audit_source_sha256': digest(audit)})
        command = [str(runtime / 'bin/leanchecker'), '-v', 'Conjectures']
        if buffer := shutil.which('stdbuf'):
            command = [buffer, '-oL', '-eL', *command]
        result = profile(command, stage / 'src', {**environment, 'LEAN_NUM_THREADS': str(args.jobs)},
                         stage / 'logs/kernel-replay.log', stage / 'progress/kernel-replay.json', 7200)
        receipt['kernel_replay'] = result
        if result['exit_code']:
            raise RuntimeError('Stock kernel replay failed: ' + Path(result['log']).read_text()[-12000:])
        replayed = re.findall(r'^replaying (Conjectures\.[A-Za-z0-9_.]+)$', Path(result['log']).read_text(), re.M)
        if sorted(replayed) != sorted(modules) or len(replayed) != len(set(replayed)):
            raise RuntimeError('Kernel replay set differs from exact group closure')
        result.update({'replayed_modules': replayed, 'exact_project_closure': True})
        if initial_sources != {m: digest(source(m)) for m in modules}:
            raise RuntimeError('Repository source changed during the gate')
        if initial_sources != {m: digest(source(m, stage / 'src')) for m in modules}:
            raise RuntimeError('Staged source changed during the gate')
        if initial_gate != {path: digest(ROOT / path) for path in GATE_INPUTS}:
            raise RuntimeError('Gate or candidate input changed during verification')
        if objects != artifact_hashes(stage, modules):
            raise RuntimeError('Proof objects changed after strict compilation')
        if digest(runtime / 'bin/leanchecker') != CHECKER_SHA256 or digest(runtime / 'bin/lean') != toolchain['lean_sha256']:
            raise RuntimeError('Compiler or checker changed during verification')
        receipt['status'] = 'passed'
        receipt['all_frozen_hashes_unchanged'] = True
    except BaseException as error:
        receipt['status'] = 'failed'
        receipt['error'] = str(error)
        raise
    finally:
        write_receipt(stage, receipt)
    print(json.dumps({'status': 'passed', 'group': args.group, 'rows': group['rows'],
                      'modules': len(modules), 'private_chunks': len(private),
                      'receipt': str(stage / 'receipt.json'), 'receipt_sha256': digest(stage / 'receipt.json')}, indent=2), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('group', nargs='?')
    parser.add_argument('--plan', action='store_true')
    parser.add_argument('--plan-ci', action='store_true')
    parser.add_argument('--files', nargs='*')
    parser.add_argument('--jobs', type=int, default=4, choices=range(1, 5))
    parser.add_argument('--runtime', type=Path, help='local pinned toolchain; hosted checks use lake env')
    parser.add_argument('--artifact-dir', type=Path)
    args = parser.parse_args()
    manifest = validate_layout()
    if args.plan_ci:
        changed = set(args.files) if args.files is not None else changed_sources()
        plan = ci_plan(changed, manifest, os.environ.get('REQUESTED_GROUPS'))
        print(json.dumps(plan, indent=2))
        if output := os.environ.get('GITHUB_OUTPUT'):
            with open(output, 'a') as handle:
                handle.write('groups=' + json.dumps(plan['groups'], separators=(',', ':')) + '\n')
        return
    if args.group is None:
        parser.error('a group or --plan-ci is required')
    if args.files is not None:
        parser.error('--files requires --plan-ci')
    if args.plan:
        group, modules, required, private = group_spec(manifest, args.group)
        print(json.dumps({'group': group, 'modules': modules, 'required': required,
                          'private_chunks': len(private)}, indent=2))
        return
    run_group(args, manifest)


if __name__ == '__main__':
    main()
