"""Read the pinned ArtificialZeng archive for Johnson/Pfaffian prior leads.

The archive and PDF text conversion are produced by the separately committed
ArtificialZeng retrospective audit. This search never executes archive content.
"""
from pathlib import Path, PurePosixPath
import argparse
import json
import re
import tarfile

PATTERN = re.compile(r'(?i)pfaff|2610\.24371|wlpjohnson|kalmanson')


def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--archive',type=Path,required=True)
    parser.add_argument('--pdf-directory',type=Path,required=True,
                        help='supplement directory from audit_artificial_supplement.py')
    parser.add_argument('--output',type=Path,default=Path(__file__).with_name('artificial-prior'))
    args=parser.parse_args()
    out=args.output;out.mkdir(exist_ok=True)
    hits=[]; utf8=0; skipped=0; pdf_count=0
    with tarfile.open(args.archive,'r:gz') as arc:
        for member in arc:
            if not member.isfile(): continue
            path=str(PurePosixPath(*PurePosixPath(member.name).parts[1:]))
            try: text=arc.extractfile(member).read().decode('utf8')
            except UnicodeDecodeError: skipped+=1; continue
            utf8+=1
            matches=list(PATTERN.finditer(text))
            if matches:
                dest=out/'utf8'/path;dest.parent.mkdir(parents=True,exist_ok=True);dest.write_text(text)
                hits.append({'path':path,'kind':'utf8','count':len(matches),
                             'contexts':[text[max(0,m.start()-180):m.end()+300] for m in matches[:12]]})
    report=json.loads((args.pdf_directory/'report.json').read_text())
    for record in report['records']:
        if record['kind']!='pdf-text': continue
        pdf_count+=1; path=record['path'];text=(args.pdf_directory/(path+'.txt')).read_text()
        matches=list(PATTERN.finditer(text))
        if matches:
            dest=out/'pdf-text'/(path+'.txt');dest.parent.mkdir(parents=True,exist_ok=True);dest.write_text(text)
            hits.append({'path':path,'kind':'pdf-text','count':len(matches),
                         'contexts':[text[max(0,m.start()-180):m.end()+300] for m in matches[:12]]})
    result={'repository':'ArtificialZeng/AI-Has-Taste',
            'commit':'65eb1f5a92a3a8b80c9e92187825ac9231f86fb2',
            'utf8_files':utf8,'skipped_nonutf8':skipped,'pdf_text_files':pdf_count,
            'pattern':PATTERN.pattern,'hits':hits}
    (out/'matches.json').write_text(json.dumps(result,indent=2,ensure_ascii=False))
    print(json.dumps({k:v for k,v in result.items() if k!='hits'},indent=2))
    print(json.dumps([{'path':x['path'],'kind':x['kind'],'count':x['count']} for x in hits],indent=2))


if __name__=='__main__':main()
