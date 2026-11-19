import Conjectures.BinaryZeroPrefix
import Mathlib.Data.Finset.Union
import Mathlib.Data.Fintype.Powerset

/-! Computable finite-set automata on arbitrary finite state types. This avoids
choosing a noncomputable reindexing of dependent products into a natural interval. -/
namespace BinaryAutomata

structure FiniteNFA (Q : Type) where
  successors : Q → Digit → Finset Q
  starts : Finset Q
  final : Q → Bool

variable {Q : Type} [DecidableEq Q]

def FiniteNFA.next (A : FiniteNFA Q) (S : Finset Q) (d : Digit) : Finset Q :=
  S.biUnion (fun s => A.successors s d)

def FiniteNFA.deterministic (A : FiniteNFA Q) : DFA (Finset Q) := {
  step := A.next
  start := A.starts
  final := fun S => decide (∃ s∈S, A.final s=true)
}

def FiniteNFA.Path (A : FiniteNFA Q) : Q → List Digit → Q → Prop
  | s,[],t => s=t
  | s,d::ds,t => ∃ u, u∈A.successors s d ∧ A.Path u ds t

theorem FiniteNFA.run_mem (A : FiniteNFA Q) (S : Finset Q) (w : List Digit) (t : Q) :
    t∈A.deterministic.runFrom S w ↔ ∃ s∈S, A.Path s w t := by
  induction w generalizing S with
  | nil => simp [DFA.runFrom,FiniteNFA.Path]
  | cons d ds ih =>
    change t∈A.deterministic.runFrom (A.next S d) ds ↔ _
    rw [ih]
    constructor
    · rintro ⟨u,hu,hpath⟩
      obtain ⟨s,hs,hsu⟩ := Finset.mem_biUnion.mp hu
      exact ⟨s,hs,u,hsu,hpath⟩
    · rintro ⟨s,hs,u,hsu,hpath⟩
      exact ⟨u,Finset.mem_biUnion.mpr ⟨s,hs,hsu⟩,hpath⟩

theorem FiniteNFA.accepts_iff (A : FiniteNFA Q) (w : List Digit) :
    A.deterministic.accepts w=true ↔
      ∃ s t, s∈A.starts ∧ A.Path s w t ∧ A.final t=true := by
  change decide (∃ t∈A.deterministic.runFrom A.starts w, A.final t=true)=true ↔ _
  rw [decide_eq_true_eq]
  constructor
  · rintro ⟨t,ht,hf⟩
    obtain ⟨s,hs,hpath⟩ := (A.run_mem A.starts w t).mp ht
    exact ⟨s,t,hs,hpath,hf⟩
  · rintro ⟨s,t,hs,hpath,hf⟩
    exact ⟨t,(A.run_mem A.starts w t).mpr ⟨s,hs,hpath⟩,hf⟩

def DFA.zeroPrefixFinite [Fintype Q] (A : DFA Q) : FiniteNFA Q := {
  successors := fun s d => {A.step s d}
  starts := ((List.range (Fintype.card Q)).map
    (fun k => A.runFrom A.start (List.replicate k 0))).toFinset
  final := A.final
}

theorem DFA.zeroPrefixFinite_starts [Fintype Q] (A : DFA Q) (s : Q) :
    s∈A.zeroPrefixFinite.starts ↔ ∃ k, A.runFrom A.start (List.replicate k 0)=s := by
  simp only [DFA.zeroPrefixFinite,List.mem_toFinset,List.mem_map,List.mem_range]
  constructor
  · rintro ⟨k,_,hk⟩
    exact ⟨k,hk⟩
  · rintro ⟨k,hk⟩
    obtain ⟨j,hj,heq⟩ := A.short_zero_prefix A.start k
    exact ⟨j,hj,heq.trans hk⟩

theorem DFA.zeroPrefixFinite_path [Fintype Q] (A : DFA Q) (s t : Q) (w : List Digit) :
    A.zeroPrefixFinite.Path s w t ↔ A.runFrom s w=t := by
  induction w generalizing s with
  | nil => rfl
  | cons d ds ih =>
    change (∃ u, u∈({A.step s d} : Finset Q) ∧ A.zeroPrefixFinite.Path u ds t) ↔
      A.runFrom (A.step s d) ds=t
    simp only [Finset.mem_singleton,exists_eq_left]
    exact ih (A.step s d)

def DFA.dropZeroPrefixes [Fintype Q] (A : DFA Q) : DFA (Finset Q) :=
  A.zeroPrefixFinite.deterministic

theorem DFA.dropZeroPrefixes_accepts [Fintype Q] (A : DFA Q) (w : List Digit) :
    A.dropZeroPrefixes.accepts w=true ↔
      ∃ k, A.accepts (List.replicate k 0++w)=true := by
  rw [DFA.dropZeroPrefixes,FiniteNFA.accepts_iff]
  constructor
  · rintro ⟨s,t,hs,hpath,hfinal⟩
    obtain ⟨k,hk⟩ := (A.zeroPrefixFinite_starts s).mp hs
    have hp := (A.zeroPrefixFinite_path s t w).mp hpath
    refine ⟨k,?_⟩
    simpa only [DFA.accepts,DFA.runFrom_append,hk,hp,DFA.zeroPrefixFinite] using hfinal
  · rintro ⟨k,hk⟩
    let s := A.runFrom A.start (List.replicate k 0)
    let t := A.runFrom s w
    refine ⟨s,t,(A.zeroPrefixFinite_starts s).mpr ⟨k,rfl⟩,
      (A.zeroPrefixFinite_path s t w).mpr rfl,?_⟩
    simpa only [DFA.accepts,DFA.runFrom_append,DFA.zeroPrefixFinite,s,t] using hk

#print axioms FiniteNFA.accepts_iff
#print axioms DFA.dropZeroPrefixes_accepts
end BinaryAutomata
