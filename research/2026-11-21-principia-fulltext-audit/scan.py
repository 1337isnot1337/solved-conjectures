from pathlib import Path
import json,re,hashlib,zipfile
BASE=Path(__file__).parent
ROOT=BASE/'math-solutions-main'
PATTERNS={
'fang-zhang-zhao':r'2505\.05873|Fang.{0,25}Zhang|Hoggatt|368345',
'chen-kitaev-zhang':r'2404\.18517|2024\.05\.004|Kitaev|separable permutation|record.count',
'zhu-jacobi-stirling':r'2202\.03793|109695|Jacobi[\s\\{}\-–]*Stirling|Bao.Xuan|coefficientwise Hankel|production matr',
'vishnyakova':r'2607\.06207|2608\.03723|Vishnyakova|polynomial.{0,35}interpolat|root.radius|falling.factorial|totally positive sequence',
'grochenig':r'00264.3|Gr[oö].{0,12}chenig|Groechenig|shift.invariant|Beurling|zero.density',
'han-sabag':r'2406\.17196|Sabag|Kostina|Kalman|Lyapunov|encoder|Hassibi',
'sun-zhao':r'1602\.04359|Larcombe|332483|Sun.{0,12}Zhao|0952.1',
'lyon':r'0251626|0288601|2611\.14429|Richard.{0,12}Lyon|Lyon|gamma.median|median.{0,40}gamma|median of the gamma|transformed median',
'ferreira-simon':r'2108\.09244|tran/8748|Ferreira|beta.prime|beta prime|self.convolution|square.root.{0,25}mixture',
'chen-khare-sahi':r'2509\.19649|Khare|Sahi|Macdonald|Muirhead|Jack.semiring',
'dospolova-germanskov-zaporozhets':r'2507\.11626|Dospolova|Germanskov|Zaporozhets|Steiner entire|intrinsic.volume|Gaussian.bounded|Vitale|Wills.functional',
'roos-seiringer':r'02088.x|Roos|Seiringer|BCS|acoth|half.space|Dirichlet.kernel',
'kovalev-hardy':r'2607\.17373|Kovalev|Hardy.{0,25}norm|near.isometric|expected.value.norm',
'brown-mol':r'1810\.08655|2608\.07898|Brown.{0,12}Mol|subtree.polynomial|subtree.root|translated.annulus|shifted.annulus',
}
texts={}
for p in ROOT.rglob('*'):
 if p.is_file() and p.suffix not in ('.pdf','.zip'):
  try:texts[str(p.relative_to(ROOT))]=p.read_text()
  except UnicodeDecodeError:pass
for p in (BASE/'pdf-text').glob('*.txt'):
 texts['PDF_EXTRACTION/'+p.name]=p.read_text(errors='replace')
zip_entries=[]
for p in ROOT.rglob('*.zip'):
 with zipfile.ZipFile(p) as z:
  for info in z.infolist():
   if info.is_dir():continue
   try:txt=z.read(info).decode()
   except UnicodeDecodeError:continue
   key='ZIP/'+str(p.relative_to(ROOT))+'/'+info.filename
   texts[key]=txt;zip_entries.append(key)
result={}
for name,pat in PATTERNS.items():
 rx=re.compile(pat,re.I)
 matches=[]
 for path,txt in texts.items():
  for n,line in enumerate(txt.splitlines(),1):
   if rx.search(line):matches.append({'path':path,'line':n,'text':line[:500]})
 result[name]={'pattern':pat,'files':sorted({m['path'] for m in matches}),'matches':matches}
(BASE/'full-text-search.json').write_text(json.dumps(result,indent=2))
meta={'commit':'47371706c400c79d06e3fb62190fcf6f7a725c85','text_units':len(texts),'text_bytes':sum(len(t.encode()) for t in texts.values()),'pdf_extractions':len(list((BASE/'pdf-text').glob('*.txt'))),'zip_text_entries':zip_entries,'archive_sha256':hashlib.sha256((BASE/'principia-main.tar.gz').read_bytes()).hexdigest()}
(BASE/'scan-metadata.json').write_text(json.dumps(meta,indent=2))
print(json.dumps(meta))
for name,v in result.items():
 print(name,'files',len(v['files']),'matches',len(v['matches']))
 for p in v['files'][:15]:print(' ',p)
