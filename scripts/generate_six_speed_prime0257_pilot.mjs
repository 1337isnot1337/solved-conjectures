#!/usr/bin/env node
// Deterministic untrusted producer for the prime-257 minimum-pair-two pilot.
// Every generated numerical statement still requires the Lean kernel.
import { readFileSync, writeFileSync, mkdirSync, existsSync } from "node:fs";
import { resolve, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import { createHash } from "node:crypto";

const root = resolve(dirname(fileURLToPath(import.meta.url)), "..");
const args = process.argv.slice(2);
if (args.length !== 1 || !["--check", "--write"].includes(args[0]))
  throw new Error("Usage: node scripts/generate_six_speed_prime0257_pilot.mjs --check|--write");
const rows = [
  {root: [1, 2, 3, 4, 5, 6], time: 1},
  {root: [1, 2, 3, 126, 127, 128], time: 2},
  {root: [1, 2, 84, 85, 86, 87], time: 3},
];
function renderRows() {
  const prefix = "import Conjectures.LonelinessSixSpeedFiniteSound\nimport Mathlib.Data.Fin.VecNotation\nimport Mathlib.Tactic.FinCases\n\n/-!\n# Actual retained rows for the prime-257 minimum-pair-two pilot\n\nThese are the three six-element folded dilations of the consecutive speeds\nwhich the pilot retains. The facts below verify the complete existing\n`Row.Valid 257` predicate, including the short-direction inequality.\nNo initial-support coverage or complete-prime assertion is made here.\n-/\n\nnamespace Loneliness.Modular.SixSpeed.Prime0257\n\n";
  const suffix = "\ntheorem row0_valid : (rows 0).Valid 257 := by\n  decide +kernel\n\ntheorem row1_valid : (rows 1).Valid 257 := by\n  decide +kernel\n\ntheorem row2_valid : (rows 2).Valid 257 := by\n  decide +kernel\n\ntheorem rows_valid (i : Fin 3) : (rows i).Valid 257 := by\n  fin_cases i\n  · exact row0_valid\n  · exact row1_valid\n  · exact row2_valid\n\ntheorem terminal_sound :\n    ∀ s index, SixSpeed.terminal rows s index = true → Retained rows s :=\n  SixSpeed.terminal_sound rows\n\nend Loneliness.Modular.SixSpeed.Prime0257\n";
  const entries = rows.map(row => "⟨![" + row.root.join(", ") + "], " + row.time + "⟩");
  return prefix + "def rows : Fin " + rows.length + " → Row :=\n  ![" +
    entries.join(",\n    ") + "]\n" + suffix;
}

const buildPacket = function(strategy="gain",limit=100000) {
 const P=257,B=2,N=128;const bits=Array.from({length:N+1},(_,i)=>1n<<BigInt(i));
 const fold=x=>Math.min(x%P,P-x%P);const inverse=Array(N+1).fill(0);for(let a=1;a<=N;a++)for(let t=1;t<P;t++)if(a*t%P===1){inverse[a]=t;break;}
 const cover=Array(N+1).fill(0n),compat=Array(N+1).fill(0n);let full=0n;for(let t=1;t<=N;t++)full|=bits[t];cover[0]=full;for(let a=1;a<=N;a++)for(let t=1;t<=N;t++){if(7*fold(t*a)<P)cover[a]|=bits[t];if(B<=fold(inverse[a]*t)&&B<=fold(inverse[t]*a))compat[a]|=bits[t];}
 const roots=[[1,2,3,4,5,6],[1,2,3,126,127,128],[1,2,84,85,86,87]],rows=roots.map(xs=>xs.reduce((s,x)=>s|bits[x],0n));
 const pc32=x=>{x=x-((x>>>1)&0x55555555);x=(x&0x33333333)+((x>>>2)&0x33333333);return (((x+(x>>>4))&0x0f0f0f0f)*0x01010101)>>>24;}; const pc=x=>{let n=0;while(x){n+=pc32(Number(x&4294967295n));x>>=32n;}return n;};
 const ids=mask=>{const out=[];for(let i=1;i<=N;i++)if(mask&bits[i])out.push(i);return out;};
 const nodes=[],nodeIds=new Map(),frames=[],memo=new Map(),stats={calls:0,reuses:0,capacity:0,witness:0,retained:0,splits:0,maxDepth:0};
 const node=(entry)=>{const key=entry.join(",");if(nodeIds.has(key))return nodeIds.get(key);const id=nodes.length;nodes.push(entry);nodeIds.set(key,id);return id;};
 function visit(fuel,selected,available,uncovered,slots,depth){
   stats.calls++;if(stats.calls>limit)throw Error("budget "+strategy);stats.maxDepth=Math.max(stats.maxDepth,depth);
   const key=[fuel,selected,available,uncovered,slots].join("|");if(memo.has(key)){stats.reuses++;return memo.get(key);}
   if(fuel<=0)throw Error("fuel");const av=ids(available),un=ids(uncovered);let nd,children=[];
   if(uncovered===0n){const r=rows.findIndex(x=>x===selected);if(r<0||!(slots===0||available===0n))throw Error("unexpected retained "+ids(selected));nd=node(["retained",r]);stats.retained++;}
   else {
    const gains=av.map(a=>({a,g:pc(uncovered&cover[a])}));const sorted=gains.slice().sort((x,y)=>y.g-x.g||x.a-y.a);const threshold=slots===0?0:(sorted[slots-1]?.g||0),capacity=slots*threshold+gains.reduce((s,x)=>s+Math.max(x.g-threshold,0),0);
    if(capacity<un.length){nd=node(["capacity",threshold]);stats.capacity++;}
    else {
     let tmin=-1,support=[],best=Infinity;
     for(const t of un){const supportT=av.filter(a=>(cover[a]&bits[t])!==0n);if(supportT.length<best){best=supportT.length;tmin=t;support=supportT;if(best===0)break;}}
     if(best===0){nd=node(["witness",tmin]);stats.witness++;}
     else {
      if(slots===0||av.length===0)throw Error("nonterminal empty");
      let a;if(strategy==="gain")a=sorted[0].a;else {const supp=new Set(support);a=sorted.find(x=>supp.has(x.a)).a;}
      const without=visit(fuel-1,selected,available&~bits[a],uncovered,slots,depth+1);
      const withA=visit(fuel-1,selected|bits[a],available&~bits[a]&compat[a],uncovered&~cover[a],slots-1,depth+1);
      children=[without,withA];nd=node(["split",a,frames[without].index,frames[withA].index]);stats.splits++;
     }
    }
   }
   const id=frames.length;if(children.some(c=>c>=id))throw Error("backreference");frames.push({fuel,index:nd,selected:String(selected),available:String(available),uncovered:String(uncovered),slots,children});memo.set(key,id);return id;
 }
 const selected=bits[1]|bits[B],available=(full&~((1n<<BigInt(B+1))-1n))&compat[1]&compat[B],uncovered=full&~cover[1]&~cover[B];
 const root=visit(256,selected,available,uncovered,4,0);
 return{prime:P,b:B,strategy,inverse,cover:cover.map(String),compatible:compat.map(String),nodes,frames,root,stats,roots};
};

const renderPacket = function(packet) {
 const NS="Loneliness.Modular.SixSpeed.Prime0257.B2",MOD="Conjectures.LonelinessSixSpeedPrime0257B2",CUT="SupportSearch.Bits.Cuts";
 const rarray=(values,lo=0,hi=values.length,indent=2)=>{const p=" ".repeat(indent);if(hi-lo===1)return p+"(.leaf "+values[lo]+")";const mid=Math.floor((lo+hi)/2);return p+"(.branch "+mid+"\n"+rarray(values,lo,mid,indent+2)+"\n"+rarray(values,mid,hi,indent+2)+"\n"+p+")";};
 const memo=(pairs,lo=0,hi=pairs.length,indent=2)=>{const p=" ".repeat(indent);if(hi-lo===1)return p+"(.entry "+pairs[lo][0]+" "+pairs[lo][1]+")";const mid=Math.floor((lo+hi)/2);return p+"(.branch "+pairs[mid][0]+"\n"+memo(pairs,lo,mid,indent+2)+"\n"+memo(pairs,mid,hi,indent+2)+"\n"+p+")";};
 const frame=f=>"⟨"+[f.fuel,f.index,f.selected,f.available,f.uncovered,f.slots].join(", ")+"⟩";
 const root=packet.frames[packet.root], nodeValue=x=>x[0]==="split"?"(.split "+x.slice(1).join(" ")+")":"(.leaf (."+x[0]+" "+x[1]+"))";
 const files={};
 files["lean/"+MOD.replaceAll(".","/")+"Data.lean"]=[
  "import Conjectures.LonelinessSixSpeedPrime0257Rows","import Conjectures.LonelinessModularInitialMemo","import Conjectures.LonelinessModularCoverCuts","import Init.Data.RArray","",
  "/-! Literal data for the single prime-257 minimum-pair-two pilot.",
  "Generated deterministically. The exact tape is checked in bounded fragments;",
  "this packet does not assert coverage of any other minimum pair. -/","",
  "namespace "+NS,"","def inverseData : Lean.RArray ℕ :=",rarray(packet.inverse.map(String)),"","def inverse (a : ℕ) : ℕ := inverseData.get a","",
  "def coverTable : Memo.Tree :=",memo(packet.cover.map((v,i)=>[i,v])),"",
  "def compatibleTable : Memo.Tree :=",memo(packet.compatible.map((v,i)=>[512+i,v])),"",
  "def nodeData : Lean.RArray SupportSearch.Tape.Node :=",rarray(packet.nodes.map(nodeValue)),"",
  "def lookup (index : ℕ) : SupportSearch.Tape.Node := nodeData.get index","",
  "def tree : SupportSearch.Tree := SupportSearch.Tape.toTree lookup "+root.fuel+" "+root.index,"",
  "def coverMask : ℕ → ℕ := InitialMemo.cover 7 257 coverTable","",
  "def compatibleMask : ℕ → ℕ := InitialMemo.compatible 257 inverse 256 compatibleTable 2","",
  "def terminal : Finset ℕ → ℕ → Bool := SixSpeed.terminal Prime0257.rows","",
  "def frameData : Lean.RArray "+CUT+".Frame :=",rarray(packet.frames.map(frame)),"",
  "def frames (index : ℕ) : "+CUT+".Frame := frameData.get index","",
  "def fragmentData : Lean.RArray "+CUT+".Fragment :=",rarray(packet.frames.map(f=>f.children.length?".split (.reuse "+f.children[0]+") (.reuse "+f.children[1]+")":".leaf").map(x=>x.startsWith(".split")?"("+x+")":x)),"",
  "def fragments (index : ℕ) : "+CUT+".Fragment := fragmentData.get index","",
  "def rootFrame : "+CUT+".Frame := "+frame(root),"","end "+NS,""
 ].join("\n");
 files["lean/"+MOD.replaceAll(".","/")+"Facts.lean"]=[
  "import "+MOD+"Data","","/-! Exact arithmetic maps and the literal initial b=2 state. -/","",
  "namespace "+NS,"",
  "theorem inverse_checked : ∀ a : Fin 129, 0 < a.val → (a.val * inverse a.val) % 257 = 1 := by","  decide +kernel","",
  "theorem cover_checked : Memo.check (InitialBits.cover 7 257) coverTable = true := by","  decide +kernel","",
  "theorem compatible_checked :","    Memo.check (InitialMemo.compatibleBase 257 inverse 256) compatibleTable = true := by","  decide +kernel","",
  "theorem selected_mask_checked : InitialBits.encode (InitialSupport.selected 2) = "+root.selected+" := by","  decide +kernel","",
  "theorem available_mask_checked :","    InitialBits.encode (InitialSupport.available 257 inverse 2) = "+root.available+" := by","  decide +kernel","",
  "theorem uncovered_mask_checked :","    InitialBits.encode (InitialSupport.uncovered 7 257 2) = "+root.uncovered+" := by","  decide +kernel","",
  "end "+NS,""
 ].join("\n");
 const blockCount=Math.ceil(packet.frames.length/32),privateNames={};
 for(let block=0;block<blockCount;block++){
  const suffix=String(block).padStart(2,"0"),module=MOD+"Checks"+suffix,start=block*32,count=Math.min(32,packet.frames.length-start);
  const lines=["import "+MOD+"Data","import Mathlib.Tactic.FinCases","","/-! Kernel checks for exact frame indices "+start+" through "+(start+count-1)+". -/","","namespace "+NS,""];
  privateNames[module]=[];
  for(let i=start;i<start+count;i++){const name="frame"+String(i).padStart(4,"0")+"_checked";privateNames[module].push(NS+"."+name);lines.push("private theorem "+name+" :","    "+CUT+".boundedCheck coverMask compatibleMask terminal lookup frames "+i+" 3","      (fragments "+i+") (frames "+i+") = true := by","  decide +kernel","");}
  const index="(j.val + "+start+")";lines.push("theorem block"+suffix+"_checked (j : Fin "+count+") :","    "+CUT+".boundedCheck coverMask compatibleMask terminal lookup frames "+index+" 3","      (fragments "+index+") (frames "+index+") = true := by","  fin_cases j");for(let i=start;i<start+count;i++)lines.push("  · exact frame"+String(i).padStart(4,"0")+"_checked");lines.push("","end "+NS,"");files["lean/"+module.replaceAll(".","/")+".lean"]=lines.join("\n");
 }
 const lines=[...Array.from({length:blockCount},(_,i)=>"import "+MOD+"Checks"+String(i).padStart(2,"0")),"import "+MOD+"Facts","import Lean.Elab.Tactic.Omega","",
  "/-! Complete checked coverage of the single minimum-pair-two support state.",
  "The other 126 initial minimum pairs are outside this module. -/","","namespace "+NS,"",
  "theorem table_checks (index : ℕ) (hi : index < "+packet.frames.length+") :","    "+CUT+".boundedCheck coverMask compatibleMask terminal lookup frames","      index 3 (fragments index) (frames index) = true := by"];
 for(let block=0;block<blockCount-1;block++){const start=block*32,end=start+32,suffix=String(block).padStart(2,"0");lines.push("  by_cases h"+block+" : index < "+end);if(block===0)lines.push("  · exact block00_checked ⟨index, h0⟩");else lines.push("  · have hshift : index - "+start+" + "+start+" = index := by omega","    simpa only [hshift] using (block"+suffix+"_checked ⟨index - "+start+", by omega⟩)");}
 const lastStart=(blockCount-1)*32,lastSuffix=String(blockCount-1).padStart(2,"0");
 lines.push("  have hshift : index - "+lastStart+" + "+lastStart+" = index := by omega","  simpa only [hshift] using (block"+lastSuffix+"_checked ⟨index - "+lastStart+", by omega⟩)","",
  "theorem fragment_size_le_three (index : ℕ) (hi : index < "+packet.frames.length+") :","    (fragments index).size ≤ 3 :=","  "+CUT+".boundedCheck_size coverMask compatibleMask terminal lookup frames","    index 3 (fragments index) (frames index) (table_checks index hi)","",
  "theorem all_frames_checked (index : ℕ) (hi : index < "+packet.frames.length+") :","    "+CUT+".Frame.Checked coverMask compatibleMask terminal lookup (frames index) :=","  "+CUT+".table_sound coverMask compatibleMask terminal lookup frames fragments","    "+packet.frames.length+" 3 table_checks index hi","",
  "theorem root_frame_eq : frames "+packet.root+" = rootFrame := by","  decide +kernel","",
  "theorem root_tape_checked :","    SupportSearch.Bits.tapeCheck coverMask compatibleMask terminal lookup "+root.fuel+" "+root.index,"      "+root.selected+" "+root.available+" "+root.uncovered+" 4 = true := by",
  "  have h := all_frames_checked "+packet.root+" (by decide)","  rw [root_frame_eq] at h","  exact h","",
  "theorem tape_checked :","    SupportSearch.Bits.tapeCheck (InitialMemo.cover 7 257 coverTable)","      (InitialMemo.compatible 257 inverse 256 compatibleTable 2) terminal lookup "+root.fuel+" "+root.index,
  "      (InitialBits.encode (InitialSupport.selected 2))","      (InitialBits.encode (InitialSupport.available 257 inverse 2))","      (InitialBits.encode (InitialSupport.uncovered 7 257 2)) 4 = true := by",
  "  rw [selected_mask_checked, available_mask_checked, uncovered_mask_checked]","  exact root_tape_checked","",
  "theorem tree_checked :","    SupportSearch.check (InitialSupport.badTimes 7 257)","      (InitialSupport.pairCompatible 257 inverse 2) terminal tree","      (InitialSupport.selected 2) (InitialSupport.available 257 inverse 2)","      (InitialSupport.uncovered 7 257 2) 4 = true := by",
  "  exact InitialMemo.checked_tree 7 257 inverse 256 (by decide) coverTable compatibleTable",
  "    cover_checked compatible_checked 2 terminal lookup "+root.fuel+" "+root.index+" 4 tape_checked","",
  "theorem normalized_cover_retained (s : Finset ℕ) (hs : FoldedSupport 257 s)",
  "    (hcard : s.card ≤ 6) (hone : 1 ∈ s) (hb : 2 ∈ s)",
  "    (hmin : ∀ a ∈ s, a ≠ 1 → 2 ≤ a)",
  "    (hpair : ∀ a ∈ s, ∀ c ∈ s, a ≠ c → 2 ≤ folded 257 (inverse a * c))",
  "    (hcover : InitialSupport.times 257 ⊆ s.biUnion (InitialSupport.badTimes 7 257)) :",
  "    SixSpeed.Retained Prime0257.rows s := by",
  "  exact InitialSupport.checked_normalized_support 6 7 257 (by decide) inverse 2",
  "    terminal (SixSpeed.Retained Prime0257.rows) Prime0257.terminal_sound tree tree_checked",
  "    s hs hcard hone hb (by decide) hmin hpair hcover","",
  "end "+NS,"");
 files["lean/"+MOD.replaceAll(".","/")+".lean"]=lines.join("\n");
 return{files,privateNames,summary:{prime:257,b:2,nodes:packet.nodes.length,frames:packet.frames.length,root:packet.root,blocks:blockCount,frame_size_limit:3,root_state:root,stats:packet.stats}};
};

const packet = buildPacket("gain");
if (packet.frames.length !== 905 || packet.nodes.length !== 464 ||
    packet.root !== 904 || packet.stats.retained !== 3 ||
    packet.stats.maxDepth !== 99 ||
    JSON.stringify(packet.roots) !== JSON.stringify(rows.map(row => row.root)))
  throw new Error("The deterministic b=2 census changed");
const rendered = renderPacket(packet);
const files = {"lean/Conjectures/LonelinessSixSpeedPrime0257Rows.lean": renderRows(),
               ...rendered.files};
const sha = value => createHash("sha256").update(value).digest("hex");
const generated = {};
for (const [path, content] of Object.entries(files)) {
  const target = resolve(root, path);
  if (args[0] === "--write") {
    if (existsSync(target) && readFileSync(target, "utf8") !== content)
      throw new Error("Refusing to overwrite a differing existing source: " + path);
    mkdirSync(dirname(target), {recursive: true});
    writeFileSync(target, content);
  } else if (readFileSync(target, "utf8") !== content) {
    throw new Error("Generated pilot source differs: " + path);
  }
  generated[path.slice(5, -5).replaceAll("/", ".")] = sha(content);
}
console.log(JSON.stringify({
  schema: "six-speed-prime0257-pilot-generation-v1",
  phase: "b2", prime: 257, minimum_pair: 2, row_count: rows.length,
  generated_sha256: generated,
  generator_sha256: sha(readFileSync(fileURLToPath(import.meta.url))),
  explicit_private_proofs: Object.values(rendered.privateNames).reduce((n, names) => n + names.length, 0),
  private_inventory_sha256: sha(JSON.stringify(rendered.privateNames)),
  numeric_census: rendered.summary,
  complete_prime_checked: false
}, null, 2));
