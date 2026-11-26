module
public import Conjectures.PomeranceSarkozyResidueWindow
public import Mathlib.Data.Nat.ChineseRemainder

@[expose] public section
namespace PomeranceSarkozy

open Finset
open Classical
open scoped Function

abbrev Incidence := ℕ×ℕ

def compatible (S : Finset Incidence) : Prop :=
  ∀ e∈S,∀ f∈S,e.2=f.2 → e=f

def incidenceModulus (S : Finset Incidence) : ℕ := ∏ e ∈ S,e.2

def incidenceWindow (L N : ℕ) (S : Finset Incidence) : Finset ℕ :=
  (range N).filter fun j => ∀ e∈S,e.2 ∣ L+j-e.1

theorem modEq_incidenceModulus_iff (S : Finset Incidence)
    (hP : ∀ e∈S,e.2.Prime) (hc : compatible S) (a b : ℕ) :
    a ≡ b [MOD incidenceModulus S] ↔ ∀ e∈S,a ≡ b [MOD e.2] := by
  have hco : S.toList.Pairwise (Nat.Coprime on Prod.snd) := by
    apply S.nodup_toList.pairwise_of_forall_ne
    intro e he f hf hef
    rw [Finset.mem_toList] at he hf
    exact (Nat.coprime_primes (hP e he) (hP f hf)).mpr (fun h => hef (hc e he f hf h))
  simpa [incidenceModulus] using (Nat.modEq_list_map_prod_iff (a:=a) (b:=b) hco)

theorem incidenceWindow_incompatible (L N : ℕ) (S : Finset Incidence)
    (hsmall : ∀ e∈S,e.1 < e.2) (hstart : ∀ e∈S,e.1≤L)
    (hn : ¬ compatible S) :
    incidenceWindow L N S = ∅ := by
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro j hj
  obtain ⟨hJ,hJdiv⟩ := Finset.mem_filter.mp hj
  apply hn
  intro e he f hf h
  have hc₁ : e.1 ≡ L+j [MOD e.2] :=
    (Nat.modEq_iff_dvd' ((hstart e he).trans (Nat.le_add_right _ _))).mpr (hJdiv e he)
  have hc₂ : f.1 ≡ L+j [MOD f.2] :=
    (Nat.modEq_iff_dvd' ((hstart f hf).trans (Nat.le_add_right _ _))).mpr (hJdiv f hf)
  rw [← h] at hc₂
  have heq := hc₁.trans hc₂.symm
  unfold Nat.ModEq at heq
  rw [Nat.mod_eq_of_lt (hsmall e he),Nat.mod_eq_of_lt (h ▸ hsmall f hf)] at heq
  exact Prod.ext heq h

noncomputable def incidenceResidue (S : Finset Incidence)
    (hP : ∀ e∈S,e.2.Prime) (hc : compatible S) :
    {r : ℕ // ∀ e∈S,r ≡ e.1 [MOD e.2]} :=
  Nat.chineseRemainderOfFinset Prod.fst Prod.snd S
    (fun e he => (hP e he).ne_zero)
    (fun e he f hf hef => (Nat.coprime_primes (hP e he) (hP f hf)).mpr
      (fun h => hef (hc e he f hf h)))

theorem incidenceWindow_eq_residueWindow (L N : ℕ) (S : Finset Incidence)
    (hP : ∀ e∈S,e.2.Prime) (hc : compatible S) (hstart : ∀ e∈S,e.1≤L) :
    incidenceWindow L N S =
      residueWindow L N (incidenceModulus S) ((incidenceResidue S hP hc).val:ZMod (incidenceModulus S)) := by
  ext j
  simp only [incidenceWindow,residueWindow,Finset.mem_filter,and_congr_right_iff]
  intro _
  rw [ZMod.natCast_eq_natCast_iff,modEq_incidenceModulus_iff S hP hc]
  constructor
  · intro hd e he
    have hh : e.1≡ L+j [MOD e.2] :=
      (Nat.modEq_iff_dvd' ((hstart e he).trans (Nat.le_add_right _ _))).mpr (hd e he)
    exact hh.symm.trans ((incidenceResidue S hP hc).property e he).symm
  · intro hr e he
    have hh := ((incidenceResidue S hP hc).property e he).symm.trans (hr e he).symm
    exact (Nat.modEq_iff_dvd' ((hstart e he).trans (Nat.le_add_right _ _))).mp hh

theorem incidenceWindow_count_error (L N : ℕ) (S : Finset Incidence)
    (hP : ∀ e∈S,e.2.Prime) (hc : compatible S) (hstart : ∀ e∈S,e.1≤L) :
    |((incidenceWindow L N S).card:ℚ)-(N:ℚ)/(incidenceModulus S:ℚ)| ≤ 1 := by
  have hd : 0 < incidenceModulus S := Finset.prod_pos (fun e he => (hP e he).pos)
  let inst : NeZero (incidenceModulus S) := ⟨hd.ne'⟩
  rw [incidenceWindow_eq_residueWindow L N S hP hc hstart]
  exact @residueWindow_count_error L N (incidenceModulus S) inst _

end PomeranceSarkozy
