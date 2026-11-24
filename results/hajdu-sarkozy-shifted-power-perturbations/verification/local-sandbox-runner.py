from pathlib import Path
import os
import subprocess
import sys

repo = Path('/tmp/cinna-lean-162051/hajdu-publication')
toolchain = Path('/workspace/scratch/e963d2f60a75/toolchain/lean-4.35.0-linux')
packages = Path('/workspace/scratch/e963d2f60a75/repo/lean/.lake/packages')
evidence = repo / '.candidate-artifacts/hajdu-sarkozy-shifted-power'
evidence.mkdir(parents=True, exist_ok=True)
lock = Path('/tmp/cinna-lean-162051/lean-gate.lock')
env = os.environ.copy()
env['PATH'] = str(toolchain / 'bin') + os.pathsep + env['PATH']
env['LEAN_SYSROOT'] = str(toolchain)
env['LEAN_PATH'] = os.pathsep.join(['/tmp/cinna-lean-162051/dependency-overlay'] +
    [str(p) for p in sorted(packages.glob('*/.lake/build/lib/lean'))])
env['LEAN_GATE_LOCK'] = str(lock)
env['PYTHONDONTWRITEBYTECODE'] = '1'
command = ['bwrap', '--ro-bind', '/', '/', '--dev-bind', '/dev', '/dev',
           '--bind', str(evidence), str(evidence),
           '--bind', str(lock), str(lock), '--die-with-parent', '--',
           sys.executable, str(repo / 'scripts/verify_hajdu_sarkozy.py')]
sys.exit(subprocess.call(command, cwd=repo / 'lean', env=env))
