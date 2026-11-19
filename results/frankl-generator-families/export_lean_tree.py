"""Write kernel-checkable Lean literals from exact integer witness JSON."""
from pathlib import Path
import argparse,json


def rays(xs):
    return '[' + ', '.join('!['+', '.join(map(str,x))+']' for x in xs) + ']'


def witnesses(xs):
    return '[\n' + ',\n'.join('    ⟨'+', '.join(map(str,x))+'⟩' for x in xs) + '\n  ]'


def child(name, data):
    steps=[]
    for s in data['steps']:
        steps.append('  { rays := '+rays(s['rays'])+',\n    witnesses := '+witnesses(s['witnesses'])+' }')
    return ('def '+name+' : ChildrenCertificate where\n  steps := [\n'+',\n'.join(steps)+
            '\n  ]\n  outgoing := '+rays(data['outgoing'])+'\n  returnWitnesses := '+
            witnesses(data['return_witnesses'])+'\n\n')


def export(data, directory):
    k=data['k'];tag=f'{k:02d}';namespace='FranklTreeCone.Degree'+tag
    data_module='Conjectures.FranklTreeDataK'+tag
    text='module\n\npublic import Conjectures.FranklTreeCertificate\n\n@[expose] public section\n\n'
    text+='/-! Generated exact nonnegative-span witnesses. Regenerate with generate_lean_tree.py and export_lean_tree.py. -/\n\nnamespace '+namespace+'\n\n'
    for i,l in enumerate(data['levels']):
        text+=child('point'+str(i),l['point'])+child('generator'+str(i),l['generator'])
    text+='def levels : List AlternatingLevel := [\n'+',\n'.join('  ⟨point'+str(i)+', generator'+str(i)+'⟩' for i in range(6))+'\n]\n\nend '+namespace+'\n'
    directory.mkdir(parents=True,exist_ok=True)
    (directory/('FranklTreeDataK'+tag+'.lean')).write_text(text)
    check='module\n\npublic import '+data_module+'\n\n@[expose] public section\n\nset_option maxRecDepth 100000\nset_option maxHeartbeats 0\n\nnamespace '+namespace+'\n\n'
    names=[]
    for i in range(6):
        for side,other in [('point','generator'),('generator','point')]:
            name=side+str(i); incoming='boundaryRays' if i==0 else other+str(i-1)+'.outgoing'
            check+='theorem '+name+'_checked : childrenCheck '+incoming+' '+name+' = true := by\n  decide\n\n'
            names.append(name+'_checked')
    check+='theorem root_checked : rootCheck generator5.outgoing 481792 1000000 = true := by\n  decide\n\n'
    check+='theorem checked : highGirthTreeCheck '+str(k)+' levels = true := by\n  simp only [highGirthTreeCheck, levels, levelChecks, finalRayPair,\n    '+', '.join(names)+', root_checked]\n  decide\n\nend '+namespace+'\n'
    (directory/('FranklTreeBoundK'+tag+'.lean')).write_text(check)
    print(k,len(text),len(check),flush=True)


if __name__=='__main__':
    parser=argparse.ArgumentParser()
    parser.add_argument('json',type=Path)
    parser.add_argument('lean_directory',type=Path)
    args=parser.parse_args()
    export(json.loads(args.json.read_text()),args.lean_directory)
