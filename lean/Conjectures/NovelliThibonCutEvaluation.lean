module
public import Conjectures.NovelliThibonCutWords

@[expose] public section
namespace NovelliThibon

open Classical
open Polynomial
variable {n : ℕ}

noncomputable instance (D : Finset (Fin n)) (m a : ℕ) : Fintype (OrdinaryCutWord D m a) := by
  classical
  exact Subtype.fintype _

def weakRankBoundaryCount (D : Finset (Fin n)) (a : ℕ) : ℕ :=
  (Finset.univ.filter fun i : Fin n => i.val+1 < a ∧ i∉D).card

theorem weakRankBoundaryCount_eq_prefix (D : Finset (Fin n)) {k : ℕ} (hk : k ≤ n) :
    weakRankBoundaryCount D (k+1) = (weakPrefixBoundaries D k hk).card := by
  unfold weakRankBoundaryCount
  have he : (Finset.univ.filter fun i : Fin n => i.val+1 < k+1 ∧ i∉D) =
      (weakPrefixBoundaries D k hk).map (Fin.castLEEmb hk) := by
    ext i
    simp only [Finset.mem_filter,Finset.mem_univ,true_and,Finset.mem_map,mem_weakPrefixBoundaries]
    constructor
    · intro ⟨h1,h2⟩
      let j : Fin k := ⟨i.val,by omega⟩
      have hh : j.castLE hk=i := Fin.ext rfl
      exact ⟨j,by simpa only [hh] using h2,hh⟩
    · rintro ⟨j,h1,rfl⟩
      exact ⟨Nat.succ_lt_succ j.isLt,h1⟩
  rw [he,Finset.card_map]

theorem weakRankBoundaryCount_eq_zero (D : Finset (Fin n)) (a : ℕ) :
    weakRankBoundaryCount D a=0 ↔ ∀ i : Fin n,i.val+1 < a → i∈D := by
  unfold weakRankBoundaryCount
  rw [Finset.card_eq_zero,Finset.eq_empty_iff_forall_notMem]
  simp only [Finset.mem_filter,Finset.mem_univ,true_and]
  constructor
  · intro h i hi
    by_contra hd
    exact h i ⟨hi,hd⟩
  · intro h i hi
    exact hi.2 (h i hi.1)

theorem ordinaryCutWord_weight (D : Finset (Fin n)) {m a : ℕ} (ha : a ≤ n+1)
    (f : OrdinaryCutWord D m a) (z : ℚ) :
    wordWeight (repeatedLetterWeight m z) f.val = z^a := by
  unfold wordWeight repeatedLetterWeight
  simp_rw [f.property.2]
  rw [← Finset.prod_filter,Finset.prod_const]
  exact congrArg (fun j => z^j) (card_initialRanks ha)

theorem ordinaryCutWord_zero_card (D : Finset (Fin n)) (m : ℕ) (h : SuffixClean D 0) :
    Fintype.card (OrdinaryCutWord D m 0)=1 := by
  let f : OrdinaryCutWord D m 0 :=
    ⟨fun _ => Fin.last m,⟨monotone_const,fun i hi => (h i (Nat.zero_le _) hi).elim⟩,
      fun i => by simp⟩
  let u : Unique (OrdinaryCutWord D m 0) :=
    ⟨⟨f⟩,fun w => by
      apply Subtype.ext
      funext i
      apply Fin.ext
      have hl := (w.val i).isLt
      have hn : ¬(w.val i).val < m := fun hm => (Nat.not_lt_zero _) ((w.property.2 i).mp hm)
      change (w.val i).val=m
      omega⟩
  exact @Fintype.card_unique _ u _

theorem ordinaryCutWord_card (D : Finset (Fin n)) {m a : ℕ} (ha : a ≤ n+1)
    (hc : SuffixClean D a) :
    Fintype.card (OrdinaryCutWord D m a) = (m+weakRankBoundaryCount D a).choose a := by
  cases a with
  | zero => simp [ordinaryCutWord_zero_card D m hc]
  | succ k =>
    have hk : k ≤ n := Nat.le_of_succ_le_succ ha
    rw [Fintype.card_congr (cutWordEquivSlice D m k hk hc),
      Fintype.card_congr (repeatedAlphabetSliceEquiv _ _ _),weakBoundaryWord_card,
      weakRankBoundaryCount_eq_prefix D hk]

/-- The exact counting polynomial for one cut of a fundamental word
with (m) repeated copies of (z), followed by the letter of weight 1. -/
noncomputable def cutContribution (D : Finset (Fin n)) (a : ℕ) (z : ℚ) : ℚ[X] :=
  if SuffixClean D a then shiftedBinomial a (weakRankBoundaryCount D a)*C (z^a) else 0

theorem cutContribution_eval_nat (D : Finset (Fin n)) {a : ℕ} (ha : a ≤ n+1) (m : ℕ) (z : ℚ) :
    (cutContribution D a z).eval (m:ℚ) =
      ∑ f : OrdinaryCutWord D m a,wordWeight (repeatedLetterWeight m z) f.val := by
  unfold cutContribution
  by_cases hc : SuffixClean D a
  · rw [ite_eq_left hc,eval_mul,shiftedBinomial_eval_nat,eval_C]
    simp_rw [ordinaryCutWord_weight D ha]
    rw [Finset.sum_const,Finset.card_univ,nsmul_eq_mul,ordinaryCutWord_card D ha hc]
  · rw [ite_eq_right hc,eval_zero]
    have em : IsEmpty (OrdinaryCutWord D m a) := ⟨fun f => hc (ordinaryCutWord_suffixClean D f)⟩
    simp

theorem cutContribution_eval_neg_one (D : Finset (Fin n)) {a : ℕ} (ha : a ≤ n+1) (z : ℚ) :
    (cutContribution D a z).eval (-1) =
      if SignedCutAdmissible D a then (-z)^a else 0 := by
  have hw : weakRankBoundaryCount D a ≤ a := by
    cases a with
    | zero => simp [weakRankBoundaryCount]
    | succ k =>
      rw [weakRankBoundaryCount_eq_prefix D (Nat.le_of_succ_le_succ ha)]
      have hk := Finset.card_le_univ (weakPrefixBoundaries D k (Nat.le_of_succ_le_succ ha))
      simpa using Nat.le_succ_of_le hk
  unfold cutContribution
  by_cases hc : SuffixClean D a
  · rw [ite_eq_left hc,eval_mul,eval_C,shiftedBinomial_eval_neg_one _ _ hw]
    by_cases hp : ∀ i : Fin n,i.val+1 < a → i∈D
    · have hz := (weakRankBoundaryCount_eq_zero D a).mpr hp
      have hh : SignedCutAdmissible D a := ⟨hp,hc⟩
      rw [ite_eq_left hz,ite_eq_left hh,← mul_pow,neg_one_mul]
    · have hz : weakRankBoundaryCount D a≠0 :=
        fun h => hp ((weakRankBoundaryCount_eq_zero D a).mp h)
      have hh : ¬ SignedCutAdmissible D a := fun h => hp h.1
      rw [ite_eq_right hz,ite_eq_right hh,zero_mul]
  · have hh : ¬ SignedCutAdmissible D a := fun h => hc h.2
    rw [ite_eq_right hc,eval_zero,ite_eq_right hh]

end NovelliThibon
