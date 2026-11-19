#!/usr/bin/env node
// Deterministic untrusted producer. All acceptance uses the generated Lean checks.
import fs from "node:fs";
import path from "node:path";
import {createHash} from "node:crypto";
import {fileURLToPath} from "node:url";

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
const frozenInputs = [
  [
    "results/hadamard-2396/PROOF.md",
    "7cf5a79031d9ef91d3acf723a146160026a318d5"
  ],
  [
    "results/hadamard-2396/quotient133.cpp",
    "81451adfedf1f154a9f61ff4f646d1f0bc9b0b09"
  ],
  [
    "results/hadamard-2396/quotient133.pairs",
    "0175e39d3fed5bd1c654fd09061b2a2736ef9f28"
  ],
  [
    "results/hadamard-2396/audit.py",
    "cbaa5995a3fd8d65ed975044a3e724c70a0c3efd"
  ]
];
for (const [relative, expected] of frozenInputs) {
  const bytes = fs.readFileSync(path.join(root, relative));
  const actual = createHash("sha1").update("blob " + bytes.length + "\0").update(bytes).digest("hex");
  if (actual !== expected) throw new Error("Frozen input changed: " + relative);
}

function buildQuotientPacket(pairText) {
  const ensure=(b,m)=>{if(!b)throw Error(m)};
  const digits=Array.from({length:10},(_,i)=>2*i-9),small=[-3,-1,1,3],even=[-6,-4,-2,0,2,4,6];
  const cls=(x,p)=>x===0?0:Array.from({length:p-1},(_,i)=>(i+1)*(i+1)%p).includes(x)?1:2;
  const shifts133=[[0,0],[1,0],[0,1],[1,1],[1,2]],shifts21=[[0,0],[1,0],[0,1],[1,1],[1,3]];
  function quadratic(n,m,shifts,index) {
    const matrices=shifts.map(()=>Array.from({length:9},()=>Array(9).fill(0)));
    for(let a=0;a<n;a++)for(let b=0;b<m;b++){
      const i=index(a,b);
      shifts.forEach(([u,v],k)=>matrices[k][i][index((a+u)%n,(b+v)%m)]++);
    }
    return matrices.map(mat=>{
      const terms=[];
      for(let i=0;i<9;i++)for(let j=i;j<9;j++){
        const c=i===j?mat[i][j]:mat[i][j]+mat[j][i];
        if(c)terms.push([i,j,c]);
      }return terms;
    });
  }
  const q133=quadratic(7,19,shifts133,(a,b)=>3*cls(a,7)+cls(b,19));
  const q21=quadratic(3,7,shifts21,(a,b)=>3*cls(b,7)+a);
  const sig=(row,q)=>q.map(ts=>ts.reduce((s,[i,j,c])=>s+c*row[i]*row[j],0));
  const fp=s=>s[0]+31*(s[1]+31*(s[2]+31*(s[3]+31*s[4])));
  const key133=row=>fp(sig(row,q133)),key21=row=>fp(sig(row,q21));
  const sum=t=>t[0]+9*(t[1]+t[2]),energy=t=>t[0]**2+9*(t[1]**2+t[2]**2);
  const squareSum=t=>t.reduce((s,x)=>s+x*x,0);
  const en133=r=>energy(r.slice(0,3))+3*(energy(r.slice(3,6))+energy(r.slice(6,9)));
  const en21=r=>squareSum(r.slice(0,3))+3*squareSum(r.slice(3,6))+3*squareSum(r.slice(6,9));
  const norm7=(u,v)=>(2-7*(sum(u)+sum(v)))**2+7*(sum(u)-sum(v))**2;
  const norm19=r=>{const a=r[1]+3*(r[4]+r[7]),b=r[2]+3*(r[5]+r[8]);return(2-19*(a+b))**2+19*(a-b)**2;};
  const triples=[];
  for(const a of digits)for(const b of digits)for(const c of digits)triples.push([a,b,c]);
  const outer=triples.filter(t=>-19<=sum(t)&&sum(t)<=19&&energy(t)<=723);
  ensure(outer.length===140,"outer count");
  const chunks=(list,n=16)=>Array.from({length:Math.ceil(list.length/n)},(_,i)=>list.slice(n*i,n*(i+1)));
  const outerChunks=chunks(outer);
  const zeroTriples=s=>{
    const out=[];for(const a of digits)if((s-a)%9===0)for(const b of digits){
      const c=(s-a)/9-b;if(digits.includes(c))out.push([a,b,c]);
    }return out;
  };
  const rowBlock=(u,v)=>{
    if(3*(energy(u)+energy(v))>2226||norm7(u,v)>9584)return[];
    return zeroTriples(1-3*(sum(u)+sum(v))).map(w=>[...w,...u,...v])
      .filter(r=>en133(r)<=2245&&norm19(r)<=9584);
  };
  const quotientLeaves=[],allRows=[];
  for(let ui=0;ui<outer.length;ui++)for(let bj=0;bj<outerChunks.length;bj++){
    const rows=outerChunks[bj].flatMap(v=>rowBlock(outer[ui],v));
    quotientLeaves.push({ui,bj,rows});allRows.push(...rows);
  }
  ensure(allRows.length===24132,"row count");
  ensure(new Set(allRows.map(r=>r.join(","))).size===allRows.length,"duplicate row");
  const qtarget=fp([2378,-18,-18,-18,-18]);
  const qkeys=[...new Set(allRows.map(key133))].sort((a,b)=>a-b);
  ensure(qkeys.length===10260,"key count");
  const qindices=new Map(qkeys.map((k,i)=>[k,i]));
  const qset=new Set(qkeys),qgood=qkeys.map(k=>qset.has(qtarget-k));
  const profiles=new Map();
  for(const r of allRows){const k=key133(r);if(!profiles.has(k))profiles.set(k,[]);profiles.get(k).push(r);}
  const computed=[];
  for(const r of allRows)for(const s of profiles.get(qtarget-key133(r))??[])computed.push([...r,...s]);
  const recorded=pairText.trim().split(/\r?\n/).map(l=>l.trim().split(/\s+/).map(Number));
  ensure(recorded.length===32&&recorded.every(p=>p.length===18&&p.every(Number.isSafeInteger)),"recorded shape");
  const recordedSet=new Set(recorded.map(r=>r.join(",")));
  ensure(computed.length===32&&recordedSet.size===32&&computed.every(r=>recordedSet.has(r.join(","))),"survivor equality");
  const rowCompare=(a,b)=>{for(let i=0;i<a.length;i++)if(a[i]!==b[i])return a[i]-b[i];return 0;};
  const endpoints=[...new Map(recorded.flatMap(p=>[p.slice(0,9),p.slice(9)]).map(r=>[r.join(","),r])).values()].sort(rowCompare);
  ensure(endpoints.length===16,"endpoint count");
  const endpointIndex=new Map(endpoints.map((r,i)=>[r.join(","),i]));
  for(const r of allRows)if(qgood[qindices.get(key133(r))])ensure(endpointIndex.has(r.join(",")),"unexpected endpoint");
  const expand133=r=>Array.from({length:133},(_,k)=>r[3*cls(Math.floor(k/19),7)+cls(k%19,19)]);
  for(const p of recorded){
    const a=expand133(p.slice(0,9)),b=expand133(p.slice(9));
    ensure(a.reduce((x,y)=>x+y,0)===1&&b.reduce((x,y)=>x+y,0)===1,"normalization");
    for(let u=0;u<7;u++)for(let v=0;v<19;v++){
      let corr=0;
      for(let x=0;x<7;x++)for(let y=0;y<19;y++){
        const i=19*x+y,j=19*((x+u)%7)+(y+v)%19;corr+=a[i]*a[j]+b[i]*b[j];
      }ensure(corr===(u===0&&v===0?2378:-18),"actual survivor correlation");
    }
  }
  const split=(values,s)=>{
    const out=[];for(const a of values)for(const b of values){const c=s-a-b;if(values.includes(c))out.push([a,b,c]);}return out;
  };
  const marginGroups=endpoints.map(r=>Array.from({length:3},(_,i)=>{
    const out=[];for(const a of split(small,r[3*i]))for(const z of split(even,r[3*i+1]+r[3*i+2])){
      const m=a.map((x,k)=>x+9*z[k]);if((i===0?1:3)*squareSum(m)<=2261)out.push(m);
    }ensure(new Set(out.map(x=>x.join(","))).size===out.length,"duplicate relaxed triple");return out;
  }));
  const marginLeaves=[],marginAs=[],marginSources=[],allMargins=[];
  for(let ri=0;ri<endpoints.length;ri++){
    const groups=marginGroups[ri],blocks=chunks(groups[1]),as=[];
    for(let ai=0;ai<groups[0].length;ai++){
      const leafIds=[];
      for(let bj=0;bj<blocks.length;bj++){
        const rows=[];
        for(const b of blocks[bj])for(const c of groups[2]){
          const r=[...groups[0][ai],...b,...c];if(en21(r)<=2261)rows.push(r);
        }
        const li=marginLeaves.length;leafIds.push(li);
        marginLeaves.push({ri,ai,bj,rows});allMargins.push(...rows.map(row=>({ri,row})));
      }
      const idx=marginAs.length;marginAs.push({ri,ai,leafIds});as.push(idx);
    }marginSources.push({ri,blocks,as});
  }
  ensure(allMargins.length===33552,"relaxed margin count");
  const joint=(ri,r)=>BigInt(key133(endpoints[ri]))+10000000000n*BigInt(key21(r));
  const jtarget=BigInt(qtarget)+10000000000n*BigInt(fp([2282,-114,-114,-114,-114]));
  const mkeys=[...new Set(allMargins.map(({ri,row})=>joint(ri,row).toString()))].map(BigInt).sort((a,b)=>a<b?-1:a>b?1:0);
  ensure(mkeys.length===5330,"margin key count");
  const mindex=new Map(mkeys.map((k,i)=>[k.toString(),i])),mset=new Set(mkeys.map(String));
  ensure(mkeys.every(k=>!mset.has((jtarget-k).toString())),"joint complementary keys");
  const lb=(keys,k)=>{let a=0,b=keys.length;while(a<b){let m=(a+b)>>1;if(keys[m]<k)a=m+1;else b=m;}return a;};
  const qgaps=qkeys.map(k=>lb(qkeys,qtarget-k)),mgaps=mkeys.map(k=>lb(mkeys,jtarget-k));
  for(let i=0;i<qkeys.length;i++)if(!qgood[i]){
    const g=qgaps[i];ensure((g===0||qkeys[g-1]<qtarget-qkeys[i])&&(g===qkeys.length||qtarget-qkeys[i]<qkeys[g]),"quotient gap");
  }
  for(let i=0;i<mkeys.length;i++){const g=mgaps[i];ensure((g===0||mkeys[g-1]<jtarget-mkeys[i])&&(g===mkeys.length||jtarget-mkeys[i]<mkeys[g]),"margin gap");}
  quotientLeaves.forEach(l=>l.indices=l.rows.map(r=>qindices.get(key133(r))));
  marginLeaves.forEach(l=>l.indices=l.rows.map(r=>mindex.get(joint(l.ri,r).toString())));
  const files={},namespace="HadamardQuotient133.Finite",pad=(n,k=3)=>String(n).padStart(k,"0");
  const triple=t=>"!["+t.join(", ")+"]";
  const row=r=>"!["+[0,3,6].map(i=>triple(r.slice(i,i+3))).join(", ")+"]";
  const list=x=>"["+x.join(", ")+"]";
  const int=x=>BigInt(x)<0n?"("+x.toString()+")":x.toString();
  function header(imports,generated=true){
    return imports.map(x=>"import "+x).join("\n")+"\n\n"+
      (generated?"/-! Generated by scripts/generate_hadamard_quotient133.mjs. -/\n\n":"")+
      "namespace "+namespace+"\n\nattribute [local instance 2000] Fintype.decidableForallFintype\n"+
      "attribute [local instance 2000] Fintype.decidableExistsFintype\n\n";
  }
  const finish=s=>s+"\nend "+namespace+"\n";
  const put=(name,text)=>files["lean/Conjectures/"+name+".lean"]=text;
  function tree(items,start,render){
    if(items.length===1)return".leaf "+render(items[0],start);
    const n=Math.floor(items.length/2);
    return".branch "+(start+n)+" ("+tree(items.slice(0,n),start,render)+") ("+tree(items.slice(n),start+n,render)+")";
  }
  function catalogData(label,keys,gaps,allowed){
    let s="";const blocks=chunks(keys,32),names=[];
    blocks.forEach((ks,bi)=>{
      const start=bi*32,name=label+"EntryBlock"+pad(bi);names.push({name,start});
      s+="def "+name+" : LookupTree (ℤ × ℕ × Bool) :=\n  "+tree(ks,start,(key,i)=>
        "("+int(key)+", "+gaps[i]+", "+(allowed[i]?"true":"false")+")")+"\n\n";
    });
    function top(ns){
      if(ns.length===1)return".leaf "+ns[0].name;
      const n=Math.floor(ns.length/2);return".branch "+ns[n].start+" ("+top(ns.slice(0,n))+") ("+top(ns.slice(n))+")";
    }
    s+="def "+label+"EntryBlocks : LookupTree (LookupTree (ℤ × ℕ × Bool)) :=\n  "+top(names)+"\n\n";
    s+="def "+label+"Entry (i : ℕ) : ℤ × ℕ × Bool :=\n  ("+label+"EntryBlocks.get i).get i\n\n";
    s+="def "+label+"Catalog : Catalog where\n  size := "+keys.length+"\n"+
      "  value := fun i => ("+label+"Entry i).1\n  gap := fun i => ("+label+"Entry i).2.1\n"+
      "  allowed := "+(label==="margin"?"fun _ => false":"fun i => ("+label+"Entry i).2.2")+"\n\n";
    return s;
  }
  let cat=header(["Conjectures.HadamardQuotient133Packet"]);
  cat+=catalogData("quotient",qkeys,qgaps,qgood)+catalogData("margin",mkeys,mgaps,mkeys.map(()=>false));
  put("HadamardQuotient133CatalogData",finish(cat));
  let rd=header(["Conjectures.HadamardQuotient133CatalogData"]);
  outer.forEach((t,i)=>rd+="def outer"+pad(i)+" : Triple := "+triple(t)+"\n");
  rd+="\ndef outerTriples : List Triple :=\n  "+list(outer.map((_,i)=>"outer"+pad(i)))+"\n\n";
  outerChunks.forEach((vs,bi)=>rd+="def quotientChunk"+bi+" : List Triple :=\n  "+list(vs.map((_,j)=>"outer"+pad(16*bi+j)))+"\n\n");
  rd+="def quotientChunks : List (List Triple) := "+list(outerChunks.map((_,i)=>"quotientChunk"+i))+"\n\n";
  endpoints.forEach((r,i)=>rd+="def endpoint"+pad(i,2)+" : Row := "+row(r)+"\n");
  rd+="\ndef endpoints : List Row := "+list(endpoints.map((_,i)=>"endpoint"+pad(i,2)))+"\n\n";
  recorded.forEach((p,i)=>rd+="def survivor"+pad(i,2)+" : Row × Row := (endpoint"+pad(endpointIndex.get(p.slice(0,9).join(",")),2)+", endpoint"+pad(endpointIndex.get(p.slice(9).join(",")),2)+")\n");
  rd+="\ndef survivors : List (Row × Row) := "+list(recorded.map((_,i)=>"survivor"+pad(i,2)))+"\n\n";
  rd+="def SurvivorValid (p : Row × Row) : Prop :=\n  BoundedOdd p.1 ∧ BoundedOdd p.2 ∧ weightedSum p.1 = 1 ∧ weightedSum p.2 = 1 ∧\n    ∀ k, signature133 p.1 k + signature133 p.2 k = target133 k\n\n";
  rd+="attribute [local instance 2000] Fintype.decidableForallFintype\nattribute [local instance 2000] Fintype.decidableExistsFintype\n\ninstance survivorValidDecidable (p : Row × Row) : Decidable (SurvivorValid p) := by\n  unfold SurvivorValid BoundedOdd\n  infer_instance\n\n";
  rd+="def survivorCheck (p : Row × Row) : Bool := decide (SurvivorValid p)\n\n";
  quotientLeaves.forEach((l,i)=>rd+="def quotientIndices"+pad(i,4)+" : List ℕ := "+list(l.indices)+"\n");
  rd+="\n";
  outer.forEach((_,ui)=>rd+="def quotientUCert"+pad(ui)+" : List (List ℕ) := "+list(outerChunks.map((_,bj)=>"quotientIndices"+pad(ui*outerChunks.length+bj,4)))+"\n");
  rd+="\ndef quotientCerts : List (List (List ℕ)) :=\n  "+list(outer.map((_,ui)=>"quotientUCert"+pad(ui)))+"\n";
  put("HadamardQuotient133RowData",finish(rd));
  let md=header(["Conjectures.HadamardQuotient133RowData"]);
  marginGroups.forEach((groups,ri)=>{
    groups[0].forEach((a,ai)=>md+="def marginA"+pad(ri,2)+"_"+pad(ai)+" : Triple := "+triple(a)+"\n");
    md+="\n";
    groups.forEach((group,i)=>md+="def marginGroup"+pad(ri,2)+"_"+i+" : List Triple :=\n  "+
      list(group.map((a,ai)=>i===0?"marginA"+pad(ri,2)+"_"+pad(ai):triple(a)))+"\n\n");
    md+="def marginGroups"+pad(ri,2)+" : Fin 3 → List Triple := ![marginGroup"+pad(ri,2)+"_0, marginGroup"+pad(ri,2)+"_1, marginGroup"+pad(ri,2)+"_2]\n\n";
    marginSources[ri].blocks.forEach((bs,bj)=>md+="def marginChunk"+pad(ri,2)+"_"+bj+" : List Triple := "+list(bs.map(triple))+"\n\n");
    md+="def marginChunks"+pad(ri,2)+" : List (List Triple) := "+list(marginSources[ri].blocks.map((_,bj)=>"marginChunk"+pad(ri,2)+"_"+bj))+"\n\n";
  });
  marginLeaves.forEach((l,i)=>md+="def marginIndices"+pad(i,4)+" : List ℕ := "+list(l.indices)+"\n");
  md+="\n";
  marginAs.forEach((a,i)=>md+="def marginACert"+pad(i,4)+" : List (List ℕ) := "+list(a.leafIds.map(li=>"marginIndices"+pad(li,4)))+"\n");
  md+="\n";
  marginSources.forEach(({ri,as})=>{
    md+="def marginCert"+pad(ri,2)+" : List (List (List ℕ)) := "+list(as.map(i=>"marginACert"+pad(i,4)))+"\n\n";
    md+="def marginPacket"+pad(ri,2)+" : MarginPacket := ⟨marginGroups"+pad(ri,2)+", marginCert"+pad(ri,2)+"⟩\n\n";
  });
  md+="def marginPackets : List MarginPacket := "+list(marginSources.map(({ri})=>"marginPacket"+pad(ri,2)))+"\n";
  put("HadamardQuotient133MarginData",finish(md));
  const theoremModule=new Map();
  function checkModules(kind,imports,specs){
    const names=[];
    chunks(specs,32).forEach((spec,bi)=>{
      const name="HadamardQuotient133"+kind+"Checks"+pad(bi);names.push(name);
      let s=header(imports);
      for(const t of spec){s+="theorem "+t.name+" :\n    "+t.type+" := by\n  decide +kernel\n\n";theoremModule.set(t.name,name);}
      put(name,finish(s));
    });return names;
  }
  const catSpecs=[];
  for(let b=0;b<Math.ceil(qkeys.length/32);b++)catSpecs.push({name:"quotient_batch_"+pad(b),type:"catalogBatch quotientCatalog targetKey133 "+b+" = true"});
  for(let b=0;b<Math.ceil(mkeys.length/32);b++)catSpecs.push({name:"margin_batch_"+pad(b),type:"catalogBatch marginCatalog targetJointKey "+b+" = true"});
  const catModules=checkModules("Catalog",["Conjectures.HadamardQuotient133CatalogData"],catSpecs);
  const rowSpecs=quotientLeaves.map((l,i)=>({name:"quotient_leaf_"+pad(i,4),type:"quotientLeafCheck quotientCatalog endpoints outer"+pad(l.ui)+" quotientChunk"+l.bj+" quotientIndices"+pad(i,4)+" = true"}));
  const rowModules=checkModules("Row",["Conjectures.HadamardQuotient133RowData"],rowSpecs);
  const marginSpecs=marginLeaves.map((l,i)=>({name:"margin_leaf_"+pad(i,4),type:"marginLeafCheck marginCatalog endpoint"+pad(l.ri,2)+" marginGroups"+pad(l.ri,2)+" marginA"+pad(l.ri,2)+"_"+pad(l.ai)+" marginChunk"+pad(l.ri,2)+"_"+l.bj+" marginIndices"+pad(i,4)+" = true"}));
  const marginModules=checkModules("Margin",["Conjectures.HadamardQuotient133MarginData"],marginSpecs);
  const factSpecs=[
    {name:"outer_checked",type:"eligibleTriples = outerTriples"},
    {name:"quotient_chunks_checked",type:"chunks16 outerTriples = quotientChunks"},
    {name:"endpoints_nodup",type:"endpoints.Nodup"},
    {name:"survivors_nodup",type:"survivors.Nodup"},
    {name:"survivors_length",type:"survivors.length = 32"},
    ...endpoints.map((_,i)=>({name:"endpoint_row_"+pad(i,2)+"_checked",type:"endpointRowCheck endpoints survivors endpoint"+pad(i,2)+" = true"})),
    ...recorded.map((_,i)=>({name:"survivor_"+pad(i,2)+"_checked",type:"survivorCheck survivor"+pad(i,2)+" = true"}))
  ];
  const factModules=checkModules("Facts",["Conjectures.HadamardQuotient133RowData"],factSpecs);
  const marginFactSpecs=[];
  marginSources.forEach(({ri})=>{
    marginFactSpecs.push({name:"margin_groups_"+pad(ri,2)+"_checked",type:"∀ i : Fin 3, marginTriples (endpoint"+pad(ri,2)+" i) (if i = 0 then 1 else 3) = marginGroups"+pad(ri,2)+" i"});
    marginFactSpecs.push({name:"margin_chunks_"+pad(ri,2)+"_checked",type:"chunks16 (marginGroups"+pad(ri,2)+" 1) = marginChunks"+pad(ri,2)});
  });
  const marginFactModules=checkModules("MarginFacts",["Conjectures.HadamardQuotient133MarginData"],marginFactSpecs);
  const emitAssembly=(name,imports,body)=>put(name,finish(header([...new Set(imports.map(x=>"Conjectures."+x))])+body));
  const boolChain=calls=>calls.reduceRight((rest,x)=>"("+x+" && "+rest+")","true");
  let catBody="";
  for(const[label,target,count]of[["quotient","targetKey133",Math.ceil(qkeys.length/32)],["margin","targetJointKey",Math.ceil(mkeys.length/32)]]){
    const groups=Math.ceil(count/32);
    for(let group=0;group<groups;group++){
      catBody+="private theorem "+label+"_catalog_block_"+pad(group)+" :\n"+
        "    (List.range 32).all (fun offset => if "+group+" * 32 + offset < "+count+" then\n"+
        "      catalogBatch "+label+"Catalog "+target+" ("+group+" * 32 + offset) else true) = true := by\n"+
        "  apply List.all_eq_true.mpr\n  intro offset ho\n"+
        "  have ho' : offset < 32 := List.mem_range.mp ho\n  interval_cases offset\n";
      for(let offset=0;offset<32;offset++){
        const index=group*32+offset;
        catBody+=index<count?"  · exact "+label+"_batch_"+pad(index)+"\n":"  · rfl\n";
      }
      catBody+="\n";
    }
    catBody+="theorem "+label+"_catalog_checked : catalogAllCheck "+label+"Catalog "+target+" = true := by\n"+
      "  change (List.range "+count+").all (catalogBatch "+label+"Catalog "+target+") = true\n"+
      "  apply all_range_of_blocks\n  intro block hb\n"+
      "  have hb' : block < "+groups+" := by omega\n  interval_cases block\n";
    for(let group=0;group<groups;group++)
      catBody+="  · exact "+label+"_catalog_block_"+pad(group)+"\n";
    catBody+="\n";
  }
  emitAssembly("HadamardQuotient133CatalogVerified",["HadamardQuotient133Assembly",...catModules],catBody);
  const uModules=[];
  chunks(outer,32).forEach((us,bi)=>{
    let body="",imports=[theoremModule.get("quotient_chunks_checked")];
    us.forEach((_,j)=>{
      const ui=32*bi+j,leaves=outerChunks.map((_,bj)=>ui*outerChunks.length+bj);
      imports.push(...leaves.map(li=>theoremModule.get("quotient_leaf_"+pad(li,4))));
      body+="theorem quotient_u_"+pad(ui)+"_checked :\n    quotientUCheck quotientCatalog endpoints outerTriples outer"+pad(ui)+" quotientUCert"+pad(ui)+" = true := by\n"+
        "  simp only [quotientUCheck, quotient_chunks_checked, quotientChunks, quotientUCert"+pad(ui)+", pairedCheck, "+
        leaves.map(li=>"quotient_leaf_"+pad(li,4)).join(", ")+", Bool.true_and]\n\n";
    });const name="HadamardQuotient133UVerified"+pad(bi);uModules.push(name);emitAssembly(name,imports,body);
  });
  let rowsBody="theorem quotient_rows_checked :\n    quotientRowsCheck quotientCatalog endpoints outerTriples quotientCerts = true := by\n"+
    "  change pairedCheck (quotientUCheck quotientCatalog endpoints outerTriples)\n    ["+
    outer.map((_,i)=>"outer"+pad(i)).join(", ")+"] quotientCerts = true\n"+
    "  simp only [quotientCerts, pairedCheck, "+
    outer.map((_,i)=>"quotient_u_"+pad(i)+"_checked").join(", ")+", Bool.true_and]\n\n";
  rowsBody+="theorem endpoints_checked : endpointPairsCheck endpoints survivors = true := by\n"+
    "  change (["+endpoints.map((_,i)=>"endpoint"+pad(i,2)).join(", ")+
    "] : List Row).all (endpointRowCheck endpoints survivors) = true\n"+
    "  simp only [List.all_cons, List.all_nil, "+
    endpoints.map((_,i)=>"endpoint_row_"+pad(i,2)+"_checked").join(", ")+", Bool.true_and]\n\n";
  rowsBody+="theorem survivors_checked : survivors.all survivorCheck = true := by\n  simp only [survivors, List.all_cons, List.all_nil, "+
    recorded.map((_,i)=>"survivor_"+pad(i,2)+"_checked").join(", ")+", Bool.true_and]\n\n";
  emitAssembly("HadamardQuotient133RowsVerified",[...uModules,...factModules],rowsBody);
  const aModules=[];
  chunks(marginAs,32).forEach((as,bi)=>{
    let body="",imports=[...marginFactModules];
    as.forEach((a,j)=>{
      const ai=32*bi+j,r=pad(a.ri,2);
      imports.push(...a.leafIds.map(li=>theoremModule.get("margin_leaf_"+pad(li,4))));
      body+="theorem margin_a_"+pad(ai,4)+"_checked :\n    marginACheck marginCatalog endpoint"+r+" marginGroups"+r+" marginA"+r+"_"+pad(a.ai)+" marginACert"+pad(ai,4)+" = true := by\n"+
        "  simp only [marginACheck, margin_chunks_"+r+"_checked, marginChunks"+r+", marginACert"+pad(ai,4)+", pairedCheck, "+
        a.leafIds.map(li=>"margin_leaf_"+pad(li,4)).join(", ")+", Bool.true_and]\n\n";
    });const name="HadamardQuotient133AVerified"+pad(bi);aModules.push(name);emitAssembly(name,imports,body);
  });
  let marginBody="";
  marginSources.forEach(({ri,as})=>{
    const r=pad(ri,2);
    marginBody+="theorem margin_source_"+r+"_checked :\n    marginSourceCheck marginCatalog endpoint"+r+" marginGroups"+r+" marginCert"+r+" = true := by\n"+
      "  change pairedCheck (marginACheck marginCatalog endpoint"+r+" marginGroups"+r+")\n    ["+
      as.map(ai=>"marginA"+r+"_"+pad(marginAs[ai].ai)).join(", ")+"] marginCert"+r+" = true\n"+
      "  simp only [marginCert"+r+", pairedCheck, "+
      as.map(ai=>"margin_a_"+pad(ai,4)+"_checked").join(", ")+", Bool.true_and]\n\n";
    marginBody+="theorem margin_packet_"+r+"_checked : marginPacketCheck marginCatalog endpoint"+r+" marginPacket"+r+" = true := by\n"+
      "  apply Bool.and_eq_true.mpr\n  constructor\n  · simpa only [decide_eq_true_eq] using margin_groups_"+r+"_checked\n  · exact margin_source_"+r+"_checked\n\n";
  });
  marginBody+="theorem margins_checked : marginAllCheck marginCatalog endpoints marginPackets = true := by\n"+
    "  simp only [marginAllCheck, endpoints, marginPackets, pairedCheck, "+
    marginSources.map(({ri})=>"margin_packet_"+pad(ri,2)+"_checked").join(", ")+", Bool.true_and]\n";
  emitAssembly("HadamardQuotient133MarginsVerified",[...aModules,...marginFactModules],marginBody);
  const hardestQ=quotientLeaves.reduce((a,l,i)=>l.rows.length>quotientLeaves[a].rows.length?i:a,0);
  const hardestM=marginLeaves.reduce((a,l,i)=>l.rows.length>marginLeaves[a].rows.length?i:a,0);
  let sample=header(["Conjectures.HadamardQuotient133MarginData"]);
  const sampleSpecs=[
    {name:"sample_outer_checked",type:"eligibleTriples = outerTriples"},
    {...rowSpecs[hardestQ],name:"sample_quotient_leaf_checked"},
    {...marginSpecs[hardestM],name:"sample_margin_leaf_checked"},
    {name:"sample_quotient_catalog_checked",type:"catalogBatch quotientCatalog targetKey133 0 = true"},
    {name:"sample_margin_catalog_checked",type:"catalogBatch marginCatalog targetJointKey 0 = true"}
  ];
  for(const t of sampleSpecs)sample+="theorem "+t.name+" :\n    "+t.type+" := by\n  decide +kernel\n\n";
  put("HadamardQuotient133LeafSample",finish(sample));
  const stats={outerTriples:outer.length,rows:allRows.length,quotientKeys:qkeys.length,survivors:recorded.length,endpoints:endpoints.length,
    marginRows:allMargins.length,marginKeys:mkeys.length,quotientLeaves:quotientLeaves.length,marginLeaves:marginLeaves.length,
    maxQuotientLeaf:Math.max(...quotientLeaves.map(x=>x.rows.length)),maxMarginLeaf:Math.max(...marginLeaves.map(x=>x.rows.length)),
    generatedFiles:Object.keys(files).length,numericalObligations:catSpecs.length+rowSpecs.length+marginSpecs.length+factSpecs.length+marginFactSpecs.length};
  return{files,stats,hardestQuotient:rowSpecs[quotientLeaves.reduce((a,l,i)=>l.rows.length>quotientLeaves[a].rows.length?i:a,0)],
    hardestMargin:marginSpecs[marginLeaves.reduce((a,l,i)=>l.rows.length>marginLeaves[a].rows.length?i:a,0)],
    metadata:{qtarget,jtarget:jtarget.toString(),qkeys:qkeys.length,mkeys:mkeys.length}};
}

const packet = buildQuotientPacket(fs.readFileSync(path.join(root, "results/hadamard-2396/quotient133.pairs"), "utf8"));
const args = new Set(process.argv.slice(2));
for (const arg of args) if (!["--check", "--sample"].includes(arg)) throw new Error("Unknown option: " + arg);
const samplePaths = new Set([
  "lean/Conjectures/HadamardQuotient133CatalogData.lean",
  "lean/Conjectures/HadamardQuotient133RowData.lean",
  "lean/Conjectures/HadamardQuotient133MarginData.lean",
  "lean/Conjectures/HadamardQuotient133LeafSample.lean",
]);
for (const [relative, content] of Object.entries(packet.files)) {
  if (args.has("--sample") && !samplePaths.has(relative)) continue;
  const filename = path.join(root, relative);
  if (args.has("--check")) {
    if (!fs.existsSync(filename) || fs.readFileSync(filename, "utf8") !== content)
      throw new Error("Generated file differs: " + relative);
  } else {
    fs.mkdirSync(path.dirname(filename), {recursive: true});
    if (!fs.existsSync(filename) || fs.readFileSync(filename, "utf8") !== content)
      fs.writeFileSync(filename, content);
  }
}
console.log(JSON.stringify(packet.stats));
