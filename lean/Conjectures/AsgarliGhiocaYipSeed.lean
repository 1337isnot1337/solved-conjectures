import Conjectures.AsgarliGhiocaYipLines
import Mathlib.Combinatorics.Pigeonhole
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.Separable
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith

/-! # A common regular root-free specialization

Counting ordered collisions for `c X^d + u X` gives many omitted values for one
nonzero slope. Discarding the images of the geometric critical points gives separable
root-free specializations even when the characteristic divides `d`.
-/

namespace Conjectures.AsgarliGhiocaYip

open Finset Polynomial
open scoped Classical

variable {K : Type*} [Field K]

/-- The common polynomial before subtracting its specialization value. -/
noncomputable def seed (c u : K) (d : ℕ) : K[X] := C c * X ^ d + C u * X

theorem seed_degree {c : K} (hc : c ≠ 0) (u : K) {d : ℕ} (hd : 2 ≤ d) :
    (seed c u d).natDegree = d := by
  rw [seed, natDegree_add_eq_left_of_natDegree_lt, natDegree_C_mul hc, natDegree_X_pow]
  rw [natDegree_C_mul hc, natDegree_X_pow]
  have h := natDegree_mul_le (p := C u) (q := X)
  simp only [natDegree_C, natDegree_X, zero_add] at h
  omega

variable [Fintype K]

private theorem fiber_bound [DecidableEq K] (p : K[X]) (hp : 0 < p.natDegree) (a : K) :
    (univ.filter fun x : K ↦ p.eval x = a).card ≤ p.natDegree := by
  have hp' : 0 < p.degree := lt_of_lt_of_le (WithBot.coe_lt_coe.mpr hp)
    (le_of_eq (degree_eq_natDegree (fun h ↦ by simp [h] at hp)).symm)
  have he : (univ.filter fun x : K ↦ p.eval x = a) = (p - C a).roots.toFinset := by
    ext; simp [mem_roots_sub_C hp']
  rw [he]
  exact (Multiset.toFinset_card_le _).trans (card_roots_sub_C' hp')

private noncomputable def collisions (f : K → K) : Finset (K × K) := by
  classical exact univ.offDiag.filter fun xy ↦ f xy.1 = f xy.2

omit [Field K] in
private theorem collisions_le [DecidableEq K] (f : K → K) (d : ℕ)
    (h : ∀ a, (univ.filter fun x ↦ f x = a).card ≤ d) :
    (collisions f).card ≤ d * (univ.image f)ᶜ.card := by
  classical
  let I := univ.image f
  let F (a : K) := univ.filter fun x ↦ f x = a
  have hpart : (collisions f).card = ∑ a ∈ I, (F a).offDiag.card := by
    rw [card_eq_sum_card_fiberwise (f := fun xy : K × K ↦ f xy.1)
      (t := I) (s := collisions f) (fun xy _ ↦ mem_image_of_mem _ (mem_univ xy.1))]
    apply sum_congr rfl; intro a _; congr 1; ext xy
    simp [collisions, F, mem_offDiag]; grind
  have hsum : ∑ a ∈ I, (F a).card = Fintype.card K :=
    (card_eq_sum_card_fiberwise (s := univ) (t := I) (f := f)
      (fun x hx ↦ mem_image_of_mem f hx)).symm
  have hpoint (a : K) (ha : a ∈ I) : (F a).offDiag.card + d ≤ d * (F a).card := by
    obtain ⟨x, _, hx⟩ := mem_image.mp ha
    have hpos : 0 < (F a).card := card_pos.mpr ⟨x, mem_filter.mpr ⟨mem_univ _, hx⟩⟩
    rw [offDiag_card, ← Nat.mul_sub_one]
    have he : (F a).card - 1 + 1 = (F a).card := by omega
    calc
      _ ≤ d * ((F a).card - 1) + d := by gcongr; exact h a
      _ = _ := by nth_rw 2 [← he]; ring
  have hh := sum_le_sum hpoint
  rw [sum_add_distrib, sum_const, nsmul_eq_mul, ← hpart, ← mul_sum, hsum] at hh
  have he := congrArg (d * ·) I.card_compl_add_card
  change _ ≤ d * Iᶜ.card
  simp only [mul_add, mul_comm d I.card] at he
  have hh' : (collisions f).card + I.card * d ≤ d * Fintype.card K := by simpa using hh
  exact Nat.le_of_add_le_add_right (hh'.trans_eq he.symm)

private theorem exists_many_collisions {c : K} (hc : c ≠ 0) {d : ℕ} (hd : 2 ≤ d)
    (hq : 2 * d ≤ Fintype.card K) : ∃ u : K, u ≠ 0 ∧
      Fintype.card K - d ≤ (collisions (fun x ↦ (seed c u d).eval x)).card := by
  classical
  let P : K[X] := C c * X ^ d
  have hP : P.natDegree = d := by simp [P, natDegree_C_mul hc]
  let pairs := (univ : Finset (K × K)).filter fun xy ↦ P.eval xy.1 ≠ P.eval xy.2
  have hsize : Fintype.card K * (Fintype.card K - d) ≤ pairs.card := by
    rw [card_eq_sum_card_fiberwise (s := pairs) (t := univ) (f := Prod.snd)
      (fun _ _ ↦ mem_univ _)]
    calc _ = ∑ _y : K, (Fintype.card K - d) := by simp
         _ ≤ _ := by
           apply sum_le_sum; intro y _
           let T := univ.filter fun x : K ↦ P.eval x = P.eval y
           have hT : T.card ≤ d := hP ▸ fiber_bound P (by omega) (P.eval y)
           have hcomp := T.card_compl_add_card
           have hmap : Tᶜ.card ≤ (pairs.filter fun xy ↦ xy.2 = y).card := by
             apply card_le_card_of_injOn (fun x ↦ (x, y))
             · intro x hx; simpa [pairs, T] using hx
             · intro x _ z _ h; exact congrArg Prod.fst h
           omega
  let slope (xy : K × K) := (P.eval xy.2 - P.eval xy.1) / (xy.1 - xy.2)
  obtain ⟨u, _, hu⟩ := exists_le_card_fiber_of_mul_le_card_of_maps_to (f := slope)
    (t := univ) (fun _ _ ↦ mem_univ _) univ_nonempty hsize
  have hs (xy : K × K) (hxy : xy ∈ pairs) : xy.1 ≠ xy.2 ∧ slope xy ≠ 0 := by
    have hne := (mem_filter.mp hxy).2
    have hdiff : xy.1 ≠ xy.2 := fun he ↦ hne (congrArg P.eval he)
    exact ⟨hdiff, div_ne_zero (sub_ne_zero.mpr hne.symm) (sub_ne_zero.mpr hdiff)⟩
  obtain ⟨w, hw⟩ := card_pos.mp (lt_of_lt_of_le (by omega : 0 < Fintype.card K - d) hu)
  obtain ⟨hwp, hwu⟩ := mem_filter.mp hw
  refine ⟨u, hwu ▸ (hs w hwp).2, hu.trans (card_le_card ?_)⟩
  intro xy hxy
  obtain ⟨hp, he⟩ := mem_filter.mp hxy
  have hn := (hs xy hp).1
  have hm := (div_eq_iff (sub_ne_zero.mpr hn)).mp he
  apply mem_filter.mpr
  refine ⟨mem_offDiag.mpr ⟨mem_univ _, mem_univ _, hn⟩, ?_⟩
  change (seed c u d).eval xy.1 = (seed c u d).eval xy.2
  simp [seed, P] at hm ⊢; linear_combination -hm

private theorem critical_value_bound (p : K[X]) (hp : p.derivative ≠ 0) :
    (univ.filter fun a : K ↦ ¬ (p - C a).Separable).card ≤ p.natDegree - 1 := by
  classical
  let E := AlgebraicClosure K
  let D := (p.derivative.aroots E).toFinset
  let B := univ.filter fun a : K ↦ ¬ (p - C a).Separable
  have root (a : B) : ∃ x ∈ D, aeval x p = algebraMap K E a.val := by
    have ha := (mem_filter.mp a.property).2
    change ¬ IsCoprime (p - C a.val) (derivative (p - C a.val)) at ha
    rw [isCoprime_iff_aeval_ne_zero_of_isAlgClosed K E (p - C a.val) _] at ha
    push Not at ha
    obtain ⟨x, h1, h2⟩ := ha
    have hr : x ∈ p.derivative.rootSet E := (mem_rootSet_of_ne hp).mpr (by simpa using h2)
    exact ⟨x, hr, sub_eq_zero.mp (by simpa only [map_sub, aeval_C] using h1)⟩
  choose r hr hv using root
  have hle : B.card ≤ D.card := by
    apply card_le_card_of_injective (f := fun a ↦ ⟨r a, hr a⟩)
    intro a b he
    apply Subtype.ext; apply (algebraMap K E).injective
    rw [← hv a, ← hv b, show r a = r b from congrArg Subtype.val he]
  exact hle.trans <| (Multiset.toFinset_card_le _).trans <|
    p.derivative.card_roots_map_le_natDegree.trans (natDegree_derivative_le _)

/-- If `q ≥ 4d²`, one nonzero slope has at least `q/(4d)` regular omitted values.
The cardinality inequality is cleared of denominators, so no rounding is implicit. -/
theorem exists_regular_seeds {d : ℕ} (hd : 2 ≤ d) {c : K} (hc : c ≠ 0)
    (hq : 4 * d ^ 2 ≤ Fintype.card K) : ∃ u : K, u ≠ 0 ∧ ∃ A : Finset K,
      Fintype.card K ≤ 4 * d * A.card ∧ ∀ a ∈ A,
        (seed c u d - C a).Separable ∧ ∀ x : K, (seed c u d - C a).eval x ≠ 0 := by
  classical
  have hqd : 2 * d ≤ Fintype.card K := by nlinarith
  obtain ⟨u, hu, hcoll⟩ := exists_many_collisions hc hd hqd
  let p := seed c u d
  have hp : p.natDegree = d := seed_degree hc u hd
  let M := (univ.image fun x ↦ p.eval x)ᶜ
  let B := univ.filter fun a : K ↦ ¬ (p - C a).Separable
  have hmiss : Fintype.card K - d ≤ d * M.card := hcoll.trans <|
    collisions_le _ _ (fun a ↦ (fiber_bound p (by omega) a).trans hp.le)
  have hder : p.derivative ≠ 0 := by
    intro he; have h0 := congrArg (eval (0 : K)) he
    simp [p, seed, derivative_mul, derivative_X_pow, zero_pow (show d - 1 ≠ 0 by omega), hu] at h0
  have hbad : B.card ≤ d - 1 := by simpa only [hp] using critical_value_bound p hder
  refine ⟨u, hu, M \ B, ?_, ?_⟩
  · have hsplit := card_sdiff_add_card_inter M B
    have hsmall := card_le_card (inter_subset_right (s₁ := M) (s₂ := B))
    have hm : M.card ≤ (M \ B).card + (d - 1) := by omega
    have hb := Nat.mul_le_mul_left d hm
    have hsub : Fintype.card K - d + d = Fintype.card K := by omega
    nlinarith [Nat.sub_le d 1, Nat.mul_le_mul_left d (Nat.sub_le d 1)]
  · intro a ha; obtain ⟨hm, hb⟩ := mem_sdiff.mp ha
    refine ⟨by simpa [B] using hb, ?_⟩
    intro x hx
    exact (mem_compl.mp hm) (mem_image.mpr ⟨x, mem_univ _, sub_eq_zero.mp (by simpa using hx)⟩)

/-- For one arbitrary graph there is no point-counting premise: the secants alone give
at least `q(q-1)/d` missing projective lines. -/
theorem single_graph_missing_lines (g : K[X]) {d : ℕ} (hd : 2 ≤ d) (hg : g.natDegree = d) :
    Fintype.card K * (Fintype.card K - 1) ≤ d * (missingLines (fun _ : Unit ↦ g) d).card := by
  classical
  let p (m : K) := g - C m * X
  let s (z : K × K) := (g.eval z.1 - g.eval z.2) / (z.1 - z.2)
  let miss := missingLines (fun _ : Unit ↦ g) d
  have hm (m : K) : (p m).natDegree = d := by
    dsimp only [p]; rw [natDegree_sub_eq_left_of_natDegree_lt, hg]
    have h := natDegree_mul_le (p := C m) (q := X)
    simp only [natDegree_C, natDegree_X, zero_add] at h
    omega
  have hcollision (m : K) : (univ.offDiag.filter fun z ↦ s z = m) =
      collisions (fun x ↦ (p m).eval x) := by
    ext z
    simp only [collisions, mem_filter, mem_offDiag, mem_univ, true_and, and_congr_right_iff]
    intro hne
    dsimp only [s]; rw [div_eq_iff (sub_ne_zero.mpr hne)]
    simp only [p, eval_sub, eval_mul, eval_C, eval_X]; constructor <;> intro h <;> linear_combination h
  have homit (m : K) : (miss.filter fun l ↦ l.1 = m) =
      {m} ×ˢ (univ.image fun x : K ↦ (p m).eval x)ᶜ := by
    ext ⟨n,b⟩; simp only [mem_filter, mem_product, mem_singleton, mem_compl,
      mem_image, mem_univ, true_and, not_exists, miss, mem_missingLines_iff hd (fun _ ↦ hg),
      forall_const, p, eval_sub, eval_mul, eval_C, eval_X]
    constructor
    · rintro ⟨h, rfl⟩; exact ⟨rfl, fun x he ↦ h x (by linear_combination he)⟩
    · rintro ⟨rfl,h⟩; exact ⟨fun x he ↦ h x (by linear_combination he), rfl⟩
  have hc (m : K) : (univ.offDiag.filter fun z ↦ s z = m).card ≤
      d * (miss.filter fun l ↦ l.1 = m).card := by
    rw [hcollision, homit, card_product, card_singleton, one_mul]
    exact collisions_le _ d (fun a ↦ (fiber_bound _ (by rw [hm]; omega) a).trans (hm m).le)
  have H := sum_le_sum (s := univ) fun m _ ↦ hc m
  rw [← mul_sum, ← card_eq_sum_card_fiberwise (f := s) (fun _ _ ↦ mem_univ _),
    ← card_eq_sum_card_fiberwise (s := miss) (f := Prod.fst) (fun _ _ ↦ mem_univ _),
    offDiag_card, card_univ, ← Nat.mul_sub_one] at H
  exact H

end Conjectures.AsgarliGhiocaYip
