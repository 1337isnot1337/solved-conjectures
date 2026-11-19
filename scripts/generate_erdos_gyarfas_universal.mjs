#!/usr/bin/env node
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { createHash } from 'node:crypto';


function invariant(ok, message) { if (!ok) throw new Error(message); }
function gcd(a,b) { a=Math.abs(a); b=Math.abs(b); while(b) [a,b]=[b,a%b]; return a; }
function combinations(xs,k) {
  if(k===0) return [[]];
  const out=[];
  for(let i=0;i<=xs.length-k;i++)
    for(const tail of combinations(xs.slice(i+1),k-1)) out.push([xs[i],...tail]);
  return out;
}
function determinant(m) {
  let value;
  if(m.length===1) value=m[0][0];
  else if(m.length===2) value=m[0][0]*m[1][1]-m[0][1]*m[1][0];
  else {
    const [[a,b,c],[d,e,f],[g,h,i]]=m;
    value=a*(e*i-f*h)-b*(d*i-f*g)+c*(d*h-e*g);
  }
  invariant(Number.isSafeInteger(value),"Unsafe determinant arithmetic");
  return value;
}
function equal(a,b) { return JSON.stringify(a)===JSON.stringify(b); }
function add(a,b) { return a.map((x,i)=>x+b[i]); }
function subtract(a,b) { return a.map((x,i)=>x-b[i]); }
function linearCombination(rows,coeffs) {
  const result=rows.reduce((v,r,i)=>add(v,r.map(x=>x*(coeffs[i]??0))),[0,0,0]);
  invariant(result.every(Number.isSafeInteger),"Unsafe combination arithmetic");
  return result;
}
function boundedCombinations(rows,bound) {
  const values=[0];
  for(let i=1;i<=bound;i++) values.push(i,-i);
  let out=[{vector:[0,0,0],coeffs:[]}];
  for(const row of rows) {
    const next=[];
    for(const old of out) for(const c of values)
      next.push({vector:add(old.vector,row.map(x=>x*c)),coeffs:[...old.coeffs,c]});
    out=next;
  }
  return out;
}
function derive(raw) {
  const input=raw.trim().split(/\r?\n/).map(JSON.parse);
  invariant(input.length===64,"Expected exactly 64 public nodes");
  for(const [rows,walk] of input) {
    invariant(rows.length<=3,"Too many lattice basis rows");
    invariant(rows.every(r=>r.length===3&&r.every(x=>Number.isSafeInteger(x)&&Math.abs(x)<=10)),
      "Malformed or out-of-bound input vector");
    invariant([4,8,16,32].includes(walk.length),"Unexpected walk length");
    invariant(walk.every(v=>Number.isInteger(v)&&0<=v&&v<5),"Invalid base vertex");
  }
  invariant(new Set(input.map(([rows])=>JSON.stringify(rows))).size===64,"Duplicate row basis");
  const indexCache=new Map(), coefficientCache=new Map();
  function index(rows) {
    const key=JSON.stringify(rows);
    if(indexCache.has(key)) return indexCache.get(key);
    for(const rank of [3,2,1]) {
      let divisor=0;
      for(const rs of combinations(rows,rank))
        for(const cols of combinations([0,1,2],rank))
          divisor=gcd(divisor,determinant(rs.map(r=>cols.map(c=>r[c]))));
      if(divisor) { const result=[rank,divisor]; indexCache.set(key,result); return result; }
    }
    const result=[0,1]; indexCache.set(key,result); return result;
  }
  function member(rows,x) { return equal(index(rows),index([...rows,x])); }
  function sameLattice(a,b) {
    return equal(index(a),index(b))&&b.every(x=>member(a,x))&&a.every(x=>member(b,x));
  }
  function coefficients(rows,target) {
    const key=JSON.stringify([rows,target]);
    if(coefficientCache.has(key)) return coefficientCache.get(key);
    if(equal(target,[0,0,0])) return rows.map(()=>0);
    invariant(rows.length>0,"Nonzero vector in the zero row span");
    for(const bound of [1,2,4,8,16,32,64]) {
      const cut=Math.ceil(rows.length/2);
      const left=boundedCombinations(rows.slice(0,cut),bound);
      const right=boundedCombinations(rows.slice(cut),bound);
      const lookup=new Map();
      for(const entry of left) {
        const key=entry.vector.join(",");
        if(!lookup.has(key)) lookup.set(key,entry.coeffs);
      }
      for(const entry of right) {
        const found=lookup.get(subtract(target,entry.vector).join(","));
        if(found) {
          const result=[...found,...entry.coeffs];
          invariant(equal(linearCombination(rows,result),target),"Incorrect integer witness");
          coefficientCache.set(key,result);
          return result;
        }
      }
    }
    throw new Error("No bounded integer combination found: "+key);
  }
  const edges=[[0,4],[4,1],[0,2],[0,3],[1,2],[1,3],[2,3]];
  const step=(a,b)=>edges.slice(4).map(([x,y])=>
    (a===x&&b===y?1:0)-(a===y&&b===x?1:0));
  const nodes=input.map(([rows,walk],originalIndex)=>{
    let position=[0,0,0];
    const prefix=[],branches=[];
    for(let j=0;j<walk.length;j++) {
      const a=walk[j],b=walk[(j+1)%walk.length];
      invariant(edges.some(([x,y])=>(a===x&&b===y)||(a===y&&b===x)),"Nonedge in walk");
      for(let i=0;i<prefix.length;i++) if(prefix[i].base===a) {
        const difference=subtract(position,prefix[i].vector);
        invariant(!member(rows,difference),"Collision already in the current lattice");
        const span=[difference,...rows];
        const childOriginal=input.findIndex(([childRows])=>sameLattice(childRows,span));
        invariant(childOriginal>=0,"Missing collision child");
        const childCombinations=input[childOriginal][0].map(row=>coefficients(span,row));
        branches.push({left:i,right:j,difference,childOriginal,combinations:childCombinations});
      }
      prefix.push({base:a,vector:[...position]});
      position=add(position,step(a,b));
    }
    invariant(new Set(prefix.map(x=>JSON.stringify(x))).size===prefix.length,"Repeated integer position");
    return {originalIndex,rows,walk,prefix,total:position,closing:coefficients(rows,position),branches};
  });
  const root=input.findIndex(([rows])=>rows.length===0);
  invariant(root>=0,"Missing root");
  const visiting=new Set(),seen=new Set(),order=[];
  function visit(i) {
    if(seen.has(i)) return;
    invariant(!visiting.has(i),"Cyclic child dependency");
    visiting.add(i);
    for(const branch of nodes[i].branches) visit(branch.childOriginal);
    visiting.delete(i);seen.add(i);order.push(i);
  }
  visit(root);
  invariant(order.length===64,"Unreachable node");
  const renumber=new Map(order.map((old,index)=>[old,index]));
  const ordered=order.map((old,index)=>({
    ...nodes[old],index,
    branches:nodes[old].branches.map(b=>({...b,child:renumber.get(b.childOriginal)}))
  }));
  for(const n of ordered) for(const b of n.branches) {
    invariant(b.child<n.index,"Nondecreasing child index");
    invariant(b.combinations.length===ordered[b.child].rows.length,"Missing child row witness");
    for(let r=0;r<b.combinations.length;r++)
      invariant(equal(linearCombination([b.difference,...n.rows],b.combinations[r]),
        ordered[b.child].rows[r]),"Child witness changed in reindexing");
  }
  invariant(renumber.get(root)===63,"Root must be last");
  invariant(ordered.reduce((s,n)=>s+n.branches.length,0)===546,"Unexpected branch census");
  const census={};for(const n of ordered)census[n.walk.length]=(census[n.walk.length]??0)+1;
  invariant(equal(census,{"4":24,"8":24,"16":14,"32":2}),"Unexpected length census");
  return ordered;
}


function render(nodes) {
  const outputs={};
  const pad=n=>String(n).padStart(2,"0");
  const vector=v=>"!["+v.join(", ")+"]";
  const position=p=>"("+p.base+", "+vector(p.vector)+")";
  const list=(xs,format)=>"["+xs.map(format).join(", ")+"]";
  const header=[
    "import Conjectures.ErdosGyarfasUniversalChecker",
    "",
    "/-! Exact public 64-node certificate with explicit integer combinations.",
    "Generated by scripts/generate_erdos_gyarfas_universal.mjs.",
    "The independent Lean checker validates all finite identities and coverage. -/",
    "",
    "namespace ErdosGyarfasUniversal.Certificate",
    "",
    "open ErdosGyarfasVoltage",
    ""
  ];
  for(const n of nodes) {
    header.push("def node"+pad(n.index)+" : Node where");
    header.push("  rows := "+list(n.rows,vector));
    header.push("  start := "+n.prefix[0].base);
    header.push("  middle := "+list(n.prefix.slice(1),position));
    header.push("  total := "+vector(n.total));
    header.push("  closing := "+list(n.closing,String));
    header.push("  branches := [");
    n.branches.forEach((b,i)=>{
      header.push("    ⟨"+position(n.prefix[b.left])+", "+position(n.prefix[b.right])+
        ", "+b.child+", "+list(b.combinations,c=>list(c,String))+"⟩"+(i+1<n.branches.length?",":""));
    });
    header.push("  ]","");
  }
  header.push("def nodes : List Node := ["+nodes.map(n=>"node"+pad(n.index)).join(", ")+"]","");
  header.push("def lookup (index : ℕ) : Node := nodes.getD index default","");
  header.push("theorem root_rows_empty : (lookup 63).rows = [] := by rfl","");
  header.push("end ErdosGyarfasUniversal.Certificate","");
  outputs["lean/Conjectures/ErdosGyarfasUniversalData.lean"]=header.join("\n");
  for(let batch=0;batch<8;batch++) {
    const lines=[
      "import Conjectures.ErdosGyarfasUniversalData","",
      "/-! Eight independently kernel-reduced universal-cover certificate nodes. -/","",
      "namespace ErdosGyarfasUniversal.Certificate",""
    ];
    for(let i=8*batch;i<8*batch+8;i++)
      lines.push("theorem node"+pad(i)+"_checked : checkNode lookup "+i+" = true := by",
        "  decide +kernel","");
    lines.push("end ErdosGyarfasUniversal.Certificate","");
    outputs["lean/Conjectures/ErdosGyarfasUniversalChecks"+pad(batch)+".lean"]=lines.join("\n");
  }
  const all=[];
  for(let batch=0;batch<8;batch++)all.push("import Conjectures.ErdosGyarfasUniversalChecks"+pad(batch));
  all.push("import Mathlib.Tactic.FinCases","","namespace ErdosGyarfasUniversal.Certificate","");
  all.push("theorem all_nodes_checked (i : Fin 64) : checkNode lookup i.val = true := by",
    "  fin_cases i");
  for(let i=0;i<64;i++)all.push("  · exact node"+pad(i)+"_checked");
  all.push("","theorem table_checked (i : ℕ) (hi : i < 64) : checkNode lookup i = true :=",
    "  all_nodes_checked ⟨i, hi⟩","","end ErdosGyarfasUniversal.Certificate","");
  outputs["lean/Conjectures/ErdosGyarfasUniversalChecks.lean"]=all.join("\n");
  const main=[
    "import Conjectures.ErdosGyarfasUniversalSoundness",
    "import Conjectures.ErdosGyarfasUniversalChecks","",
    "/-! The universal theorem for every abelian group and every seven voltages.",
    "The literal certificate is discharged here; no kernel or lattice condition is assumed. -/","",
    "namespace ErdosGyarfasUniversal","",
    "open ErdosGyarfasVoltage","",
    "theorem universal_cover_cycle {A : Type*} [AddCommGroup A] (labels : Fin 7 → A) :",
    "    ∃ (u : Fin 5 × A) (p : (voltageCover labels).Walk u u),",
    "      p.IsCycle ∧ p.length ∈ [4, 8, 16, 32] :=",
    "  cycle_of_checked_table labels Certificate.lookup 64 63 Certificate.table_checked",
    "    (by decide) Certificate.root_rows_empty","",
    "theorem universal_cover_power_of_two_cycle {A : Type*} [AddCommGroup A]",
    "    (labels : Fin 7 → A) :",
    "    ∃ (u : Fin 5 × A) (p : (voltageCover labels).Walk u u) (k : ℕ),",
    "      p.IsCycle ∧ 2 ≤ k ∧ k ≤ 5 ∧ p.length = 2 ^ k := by",
    "  obtain ⟨u, p, hp, hlen⟩ := universal_cover_cycle labels",
    "  simp only [List.mem_cons, List.not_mem_nil, or_false] at hlen",
    "  rcases hlen with h | h | h | h",
    "  · exact ⟨u, p, 2, hp, by decide, by decide, h⟩",
    "  · exact ⟨u, p, 3, hp, by decide, by decide, h⟩",
    "  · exact ⟨u, p, 4, hp, by decide, by decide, h⟩",
    "  · exact ⟨u, p, 5, hp, by decide, by decide, h⟩","",
    "end ErdosGyarfasUniversal",""
  ];
  outputs["lean/Conjectures/ErdosGyarfasUniversalMain.lean"]=main.join("\n");
  return outputs;
}


const root=path.resolve(path.dirname(fileURLToPath(import.meta.url)),"..");
const input="results/erdos-gyarfas-abelian-covers/abelian-cert.jsonl";
const raw=fs.readFileSync(path.join(root,input),"utf8");
const bytes=Buffer.from(raw,"utf8");
const inputBlob=createHash("sha1").update("blob "+bytes.length+"\0").update(bytes).digest("hex");
invariant(inputBlob==="5a603413616544c7646102e3ab7d38bfa06d7eb8","The public input blob changed");
const nodes=derive(raw),outputs=render(nodes),checking=process.argv.includes("--check");
for(const arg of process.argv.slice(2))invariant(arg==="--check","Unknown argument "+arg);
const records=[];
for(const [name,content] of Object.entries(outputs)) {
  const destination=path.join(root,name);
  if(checking) invariant(fs.readFileSync(destination,"utf8")===content,"Generated source differs: "+name);
  else {fs.mkdirSync(path.dirname(destination),{recursive:true});fs.writeFileSync(destination,content);}
  records.push({path:name,sha256:createHash("sha256").update(content).digest("hex")});
}
console.log(JSON.stringify({mode:checking?"check":"write",input_blob:inputBlob,
  nodes:nodes.length,branches:nodes.reduce((s,n)=>s+n.branches.length,0),
  root:63,outputs:records},null,2));
