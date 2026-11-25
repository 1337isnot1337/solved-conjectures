from pathlib import Path
import os,subprocess,sys
base=Path(__file__).resolve().parent
evidence=base/'verification'; evidence.mkdir(exist_ok=True)
lock=Path('/tmp/cinna-lean-162051/lean-gate.lock')
env=os.environ.copy();env['PYTHONDONTWRITEBYTECODE']='1'
cmd=['bwrap','--ro-bind','/','/','--dev-bind','/dev','/dev',
     '--bind',str(evidence),str(evidence),'--bind',str(lock),str(lock),
     '--die-with-parent','--',sys.executable,str(base/'verify.py')]
sys.exit(subprocess.call(cmd,cwd=base,env=env))
