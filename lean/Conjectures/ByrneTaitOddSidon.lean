module

public import Mathlib.Analysis.Complex.Polynomial.Basic
public import Mathlib.Analysis.SpecialFunctions.Pow.Real
public import Mathlib.Data.Fintype.Perm
public import Mathlib.GroupTheory.GroupAction.Quotient
public import Mathlib.GroupTheory.Index
public import Mathlib.LinearAlgebra.Eigenspace.Charpoly
public import Mathlib.LinearAlgebra.Eigenspace.Matrix
import Mathlib.LinearAlgebra.Matrix.Charpoly.Eigs
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.GCongr
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Ordered Sidon words in groups with an abelian subgroup

Formalization of Cinna Davis's proof of the odd-length extension asked for by
John Byrne and Michael Tait. See `results/byrne-tait-odd-sidon/PROOF.md`.
We use the unnormalized walk matrix. After removing one constant eigenvalue,
the root of least real part gives the trace bound, including when the walk is
not diagonalizable. The complement estimate uses the largest coordinate of an
eigenvector, so it also covers full density without a division by zero.
-/

@[expose] public section

namespace ByrneTaitOddSidon

open Finset
open scoped BigOperators

variable {G : Type*} [Group G]

/-- Product in position order. Each position independently ranges over all of `A`. -/
def wordProduct (A : Finset G) : (k : ℕ) → (Fin k → A) → G
  | 0, _ => 1
  | k + 1, w => (w 0 : G) * wordProduct A k (Fin.tail w)

/-- The recursive evaluation agrees with the usual left-to-right list product. -/
theorem wordProduct_eq_list_prod (A : Finset G) (k : ℕ) (w : Fin k → A) :
    wordProduct A k w = (List.ofFn fun i => (w i : G)).prod := by
  induction k with
  | zero => simp [wordProduct]
  | succ k ih => rw [wordProduct, List.ofFn_succ, List.prod_cons, ih]; rfl

/-- Byrne–Tait's ordered, repetitions-allowed Sidon condition. -/
def IsSk (A : Finset G) (k : ℕ) : Prop := Function.Injective (wordProduct A k)

/-- Swapping two commuting letters in front of a common suffix forces equality. -/
theorem eq_of_commute {A : Finset G} {k : ℕ} (hk : 2 ≤ k) (hA : IsSk A k)
    (a b : A) (hc : Commute (a : G) b) : a = b := by
  obtain ⟨n, rfl⟩ : ∃ n, k = n + 2 := ⟨k - 2, by omega⟩
  let t : Fin n → A := fun _ => a
  have he := @hA (Fin.cons a (Fin.cons b t)) (Fin.cons b (Fin.cons a t)) (by
    simp only [wordProduct, Fin.cons_zero, Fin.tail_cons, ← mul_assoc, hc.eq])
  simpa using congrFun he 0

/-- In particular the index-one case has at most one letter. -/
theorem card_le_one_of_index_one (H : Subgroup G) [IsMulCommutative H]
    (hH : H.index = 1) {A : Finset G} {k : ℕ} (hk : 2 ≤ k) (hA : IsSk A k) :
    A.card ≤ 1 := by
  apply Finset.card_le_one.mpr
  intro a ha b hb
  have memH (g : G) : g ∈ H := by simp [Subgroup.index_eq_one.mp hH]
  have hc := IsMulCommutative.is_comm.comm (⟨a, memH a⟩ : H) ⟨b, memH b⟩
  exact congrArg Subtype.val (eq_of_commute hk hA ⟨a, ha⟩ ⟨b, hb⟩
    (congrArg Subtype.val hc))

section Walk

variable {X : Type*} [Fintype X] [DecidableEq X] [MulAction G X]

private def walk (A : Finset G) : Matrix X X ℂ :=
  fun x y => ∑ a : A, if (a : G) • x = y then 1 else 0

private lemma walk_apply (A : Finset G) (v : X → ℂ) (x : X) :
    (walk A).toLin' v x = ∑ a : A, v ((a : G) • x) := by
  classical
  change ∑ y, (∑ a : A, if (a : G) • x = y then (1 : ℂ) else 0) * v y = _
  simp_rw [Finset.sum_mul]
  rw [Finset.sum_comm]
  simp [ite_mul]

private lemma walk_trace (A : Finset G) {b : ℕ}
    (hb : ∀ x : X, (univ.filter fun a : A => (a : G) • x = x).card ≤ b) :
    (walk A : Matrix X X ℂ).trace.re ≤ Fintype.card X * (b : ℝ) := by
  classical
  simp only [Matrix.trace, Matrix.diag, walk, Finset.sum_boole, Complex.re_sum,
    Complex.natCast_re]
  simpa using Finset.sum_le_sum (s := (univ : Finset X))
    (fun x _ => (Nat.cast_le.mpr (hb x) : (_ : ℝ) ≤ b))

private lemma card_mul_min_re (s : Multiset ℂ) (t : ℝ) (h : ∀ z ∈ s, t ≤ z.re) :
    (s.card : ℝ) * t ≤ s.sum.re := by
  induction s using Multiset.induction_on with
  | empty => simp
  | cons z s ih =>
    have hz := h z (Multiset.mem_cons_self ..)
    have hs := ih (fun w hw => h w (Multiset.mem_cons_of_mem hw))
    simp only [Multiset.card_cons, Nat.cast_add, Nat.cast_one, Multiset.sum_cons, Complex.add_re]
    linarith

/-- Remove one occurrence of the eigenvalue on constants, then take the
remaining root with smallest real part, counting algebraic multiplicity. -/
private lemma walk_eigenvalue [Nonempty X] (A : Finset G) {b : ℕ}
    (hh : 2 ≤ Fintype.card X) (hm : b * Fintype.card X < A.card)
    (hb : ∀ x : X, (univ.filter fun a : A => (a : G) • x = x).card ≤ b) :
    ∃ (z : ℂ) (v : X → ℂ), v ≠ 0 ∧ z ≠ (A.card : ℂ) ∧
      ((A.card : ℝ) - b * Fintype.card X) / (Fintype.card X - 1 : ℝ) ≤ ‖z‖ ∧
      ∀ x, ∑ a : A, v ((a : G) • x) = z * v x := by
  classical
  let M : Matrix X X ℂ := walk A
  have hconst : Module.End.HasEigenvector M.toLin' (A.card : ℂ) (fun _ => 1) := by
    refine ⟨Module.End.mem_eigenspace_iff.mpr ?_, ?_⟩
    · ext x
      simp [M, walk_apply]
    · intro h
      simpa using congrFun h (Classical.arbitrary X)
  have hroot : (A.card : ℂ) ∈ M.charpoly.roots := by
    apply (Polynomial.mem_roots M.charpoly_monic.ne_zero).2
    rw [← Matrix.charpoly_toLin']
    exact (Module.End.hasEigenvalue_iff_isRoot_charpoly ..).1
      (Module.End.hasEigenvalue_of_hasEigenvector hconst)
  let s := M.charpoly.roots.erase (A.card : ℂ)
  have hcons : (A.card : ℂ) ::ₘ s = M.charpoly.roots := Multiset.cons_erase hroot
  have hcard : s.card + 1 = Fintype.card X := by
    simpa [IsAlgClosed.card_roots_eq_natDegree] using congrArg Multiset.card hcons
  obtain ⟨z, hz, hmin⟩ := Multiset.exists_min_image Complex.re (s := s)
    (by intro he; simp [he] at hcard; omega)
  have hsum : (A.card : ℝ) + s.sum.re = M.trace.re := by
    simpa [← Matrix.trace_eq_sum_roots_charpoly] using
      congrArg (fun r : Multiset ℂ => r.sum.re) hcons
  have hmin' := card_mul_min_re s z.re hmin
  have htrace := walk_trace A hb
  change M.trace.re ≤ _ at htrace
  have hcard' : (s.card : ℝ) + 1 = Fintype.card X := by exact_mod_cast hcard
  have hdim : (s.card : ℝ) = Fintype.card X - 1 := by linarith
  have hpos : (0 : ℝ) < Fintype.card X - 1 := sub_pos.mpr (by exact_mod_cast (by omega : 1 < Fintype.card X))
  have hgap : (b : ℝ) * Fintype.card X < A.card := by exact_mod_cast hm
  have hneg : z.re < 0 := by
    by_contra! hn
    have := mul_nonneg (Nat.cast_nonneg s.card) hn
    linarith [mul_comm (b : ℝ) (Fintype.card X)]
  have hne : z ≠ A.card := by
    intro he
    rw [he, Complex.natCast_re] at hneg
    exact (Nat.cast_nonneg A.card).not_gt hneg
  have hnorm := (abs_le.mp (Complex.abs_re_le_norm z)).1
  have hlo : ((A.card : ℝ) - b * Fintype.card X) / (Fintype.card X - 1 : ℝ) ≤ ‖z‖ := by
    apply (div_le_iff₀ hpos).2
    rw [hdim] at hmin'
    nlinarith [mul_le_mul_of_nonneg_left hnorm hpos.le]
  have heig : Module.End.HasEigenvalue M.toLin' z := by
    apply (Module.End.hasEigenvalue_iff_isRoot_charpoly ..).2
    rw [Matrix.charpoly_toLin']
    exact Polynomial.isRoot_of_mem_roots (Multiset.mem_of_mem_erase hz)
  obtain ⟨v, hv⟩ := heig.exists_hasEigenvector
  exact ⟨z, v, hv.2, hne, hlo, fun x => by
    simpa [M, walk_apply] using congrFun hv.apply_eq_smul x⟩

omit [DecidableEq X] [Fintype X] in
private lemma sum_words (A : Finset G) (v : X → ℂ) (z : ℂ)
    (hv : ∀ x, ∑ a : A, v ((a : G) • x) = z * v x) (k : ℕ) (x : X) :
    ∑ w : Fin k → A, v (wordProduct A k w • x) = z ^ k * v x := by
  induction k with
  | zero => simp [wordProduct]
  | succ k ih =>
    rw [← (Fin.consEquiv (fun _ : Fin (k + 1) => A)).sum_comp, Fintype.sum_prod_type,
      Finset.sum_comm]
    change (∑ w : Fin k → A, ∑ a : A,
      v (((a : G) * wordProduct A k w) • x)) = _
    simp_rw [mul_smul, hv]
    rw [← Finset.mul_sum, ih, pow_succ']
    ring

omit [DecidableEq X] [Fintype X] in
private lemma sum_group_zero [Fintype G] (A : Finset G) (v : X → ℂ) (z : ℂ)
    (hz : z ≠ (A.card : ℂ)) (hv : ∀ x, ∑ a : A, v ((a : G) • x) = z * v x) (x : X) :
    ∑ g : G, v (g • x) = 0 := by
  let S := ∑ g : G, v (g • x)
  have h : z * S = (A.card : ℂ) * S := calc
    _ = ∑ g : G, ∑ a : A, v ((a : G) • (g • x)) := by simp only [S, hv, Finset.mul_sum]
    _ = ∑ a : A, ∑ g : G, v (((a : G) * g) • x) := by rw [Finset.sum_comm]; simp [mul_smul]
    _ = ∑ _a : A, S := by
      apply Finset.sum_congr rfl
      intro a _
      exact Equiv.sum_comp (Equiv.mulLeft (a : G)) (fun g => v (g • x))
    _ = _ := by simp [nsmul_eq_mul]
  exact (mul_eq_zero.mp (show (z - A.card) * S = 0 by linear_combination h)).resolve_left
    (sub_ne_zero.mpr hz)

end Walk

/-- Number of ordered words representing the given group element. -/
noncomputable def repCount (A : Finset G) (k : ℕ) (g : G) := Nat.card {w : Fin k → A // wordProduct A k w = g}

private lemma fiber_sum [Fintype G] (A : Finset G) (k : ℕ) {R : Type*} [Semiring R]
    (f : G → R) : ∑ g, (repCount A k g : R) * f g = ∑ w, f (wordProduct A k w) := by
  classical
  simpa [repCount, Nat.card_eq_fintype_card, nsmul_eq_mul] using
    Fintype.sum_fiberwise' (wordProduct A k) f

/-- The residual multiplicities have total mass `q |G| - |A|^k`. Their
action cancels the word sum on a nonconstant eigenmode. -/
private lemma complement_bound [Fintype G] {X : Type*} [Fintype X] [Nonempty X]
    [MulAction G X] (A : Finset G) (k q : ℕ) (hq : ∀ g, repCount A k g ≤ q)
    (v : X → ℂ) (hne : v ≠ 0) (z : ℂ) (hz : z ≠ (A.card : ℂ))
    (hv : ∀ x, ∑ a : A, v ((a : G) • x) = z * v x) :
    ‖z‖ ^ k ≤ q * (Fintype.card G : ℝ) - (A.card : ℝ) ^ k := by
  classical
  obtain ⟨x, _, hx⟩ := univ.exists_max_image (fun x => ‖v x‖) univ_nonempty
  have hpos : 0 < ‖v x‖ := by
    by_contra! h
    apply hne
    funext y
    exact norm_le_zero_iff.mp ((hx y (mem_univ y)).trans h)
  let r := repCount A k
  have htotal : ∑ g, (r g : ℝ) = (A.card : ℝ) ^ k := by
    simpa [r, nsmul_eq_mul] using fiber_sum A k (fun _ => (1 : ℝ))
  have hmass : ∑ g, ((q - r g : ℕ) : ℝ) = q * (Fintype.card G : ℝ) - (A.card : ℝ) ^ k := by
    have hsub (g : G) : ((q - r g : ℕ) : ℝ) = (q : ℝ) - r g := Nat.cast_sub (hq g)
    simp only [hsub, Finset.sum_sub_distrib, htotal, Finset.sum_const, card_univ,
      nsmul_eq_mul, mul_comm (Fintype.card G : ℝ)]
  have hcancel : ∑ g, ((q - r g : ℕ) : ℂ) * v (g • x) = -(z ^ k * v x) := by
    have hsub (g : G) : ((q - r g : ℕ) : ℂ) = (q : ℂ) - r g := Nat.cast_sub (hq g)
    simp only [hsub, sub_mul, Finset.sum_sub_distrib, ← Finset.mul_sum,
      sum_group_zero A v z hz hv x, mul_zero, zero_sub, r, fiber_sum, sum_words A v z hv]
  apply le_of_mul_le_mul_right (a := ‖v x‖) _ hpos
  calc
    ‖z‖ ^ k * ‖v x‖ = ‖∑ g, ((q - r g : ℕ) : ℂ) * v (g • x)‖ := by simp [hcancel]
    _ ≤ ∑ g, ‖((q - r g : ℕ) : ℂ) * v (g • x)‖ := norm_sum_le ..
    _ ≤ ∑ g, ((q - r g : ℕ) : ℝ) * ‖v x‖ := by
      apply Finset.sum_le_sum
      intro g _
      simp only [norm_mul, Complex.norm_natCast]
      exact mul_le_mul_of_nonneg_left (hx _ (mem_univ _)) (Nat.cast_nonneg _)
    _ = _ := by rw [← Finset.sum_mul, hmass]

/-- The bounded-multiplicity extension in the written proof, for any finite
action with the stated stabilizer bound. The action need not be faithful. -/
theorem bounded_multiplicity_density [Fintype G] {X : Type*} [Fintype X] [DecidableEq X]
    [Nonempty X] [MulAction G X] (A : Finset G) (k b q : ℕ)
    (hh : 2 ≤ Fintype.card X) (hm : b * Fintype.card X < A.card)
    (hb : ∀ x : X, (univ.filter fun a : A => (a : G) • x = x).card ≤ b)
    (hq : ∀ g, repCount A k g ≤ q) :
    (A.card : ℝ) ^ k / (q * (Fintype.card G : ℝ)) ≤
      1 / (1 + ((1 - b * (Fintype.card X : ℝ) / A.card) / (Fintype.card X - 1 : ℝ)) ^ k) := by
  classical
  obtain ⟨z, v, hv, hz, hlo, heq⟩ := walk_eigenvalue A hh hm hb
  have hc := complement_bound A k q hq v hv z hz heq
  have hmpos : (0 : ℝ) < A.card := by exact_mod_cast (by omega : 0 < A.card)
  have hdim : (1 : ℝ) < Fintype.card X := by exact_mod_cast (by omega : 1 < Fintype.card X)
  have hgap : (b : ℝ) * Fintype.card X < A.card := by exact_mod_cast hm
  let d : ℝ := (1 - b * (Fintype.card X : ℝ) / A.card) / (Fintype.card X - 1 : ℝ)
  have hd : 0 ≤ d := div_nonneg (sub_nonneg.mpr ((div_le_one hmpos).2 hgap.le))
    (sub_nonneg.mpr hdim.le)
  have he : (A.card : ℝ) * d = (A.card - b * (Fintype.card X : ℝ)) / (Fintype.card X - 1 : ℝ) := by
    dsimp [d]
    field_simp
  have hp := pow_le_pow_left₀ (mul_nonneg hmpos.le hd) (he.trans_le hlo) k
  rw [mul_pow] at hp
  have hqpos : 0 < (q : ℝ) * Fintype.card G := by
    linarith [pow_pos hmpos k, pow_nonneg (norm_nonneg z) k]
  change _ ≤ 1 / (1 + d ^ k)
  rw [div_le_div_iff₀ hqpos (by positivity)]
  linarith

private lemma coset_fixed_le_one (H : Subgroup G) [IsMulCommutative H] {A : Finset G}
    {k : ℕ} (hk : 2 ≤ k) (hA : IsSk A k) [DecidableEq (G ⧸ H)] (x : G ⧸ H) :
    (univ.filter fun a : A => (a : G) • x = x).card ≤ 1 := by
  induction x using Quotient.inductionOn with
  | _ t =>
    apply Finset.card_le_one.mpr
    intro a ha b hb
    have memH (c : A) (hc : (c : G) • (t : G ⧸ H) = (t : G ⧸ H)) :
        t⁻¹ * ((c : G) * t) ∈ H := QuotientGroup.eq.mp hc.symm
    let e := MulAut.conj t⁻¹
    have hmem (c : A) (hc : (c : G) • (t : G ⧸ H) = (t : G ⧸ H)) : e (c : G) ∈ H := by
      simpa [e, MulAut.conj_apply, mul_assoc] using memH c hc
    have hc := IsMulCommutative.is_comm.comm
      (⟨e (a : G), hmem a (mem_filter.mp ha).2⟩ : H) ⟨e (b : G), hmem b (mem_filter.mp hb).2⟩
    apply eq_of_commute hk hA a b
    apply e.injective
    rw [map_mul, map_mul]
    exact congrArg (fun c : H => (c : G)) hc

/-- Evaluate an ordered word whose letters lift to a commutative group. -/
private lemma wordProduct_lift {C : Type*} [CommGroup C] (f : C →* G) (A : Finset G)
    (k : ℕ) (w : Fin k → A) (u : Fin k → C) (h : ∀ i, (w i : G) = f (u i)) :
    wordProduct A k w = f (∏ i, u i) := by
  induction k with
  | zero => simp [wordProduct]
  | succ n ih =>
    rw [wordProduct, Fin.prod_univ_succ, map_mul, h 0]
    exact congrArg (f (u 0) * ·) (ih (Fin.tail w) (Fin.tail u) (fun i => h i.succ))

/-- If fewer than `k!` words can have any one product, an abelian subgroup
contains at most `k - 1` letters. This applies to each abelian coset stabilizer. -/
theorem abelian_intersection_bound (H : Subgroup G) [IsMulCommutative H] (A : Finset G)
    [DecidablePred (· ∈ H)] {k q : ℕ} (hq : ∀ g, repCount A k g ≤ q)
    (hfac : q < k.factorial) : (A.filter (· ∈ H)).card ≤ k - 1 := by
  classical
  by_contra! h
  obtain ⟨e, he⟩ := Function.Embedding.exists_of_card_le_finset (α := Fin k)
    (s := A.filter (· ∈ H)) (by simpa using (show k ≤ (A.filter (· ∈ H)).card by omega))
  have hletters (i : Fin k) := mem_filter.mp (he (Set.mem_range_self i))
  let : CommGroup H := { (inferInstance : Group H) with mul_comm := IsMulCommutative.is_comm.comm }
  let u (i : Fin k) : H := ⟨e i, (hletters i).2⟩
  let g : G := H.subtype (∏ i, u i)
  let words (σ : Equiv.Perm (Fin k)) : {w : Fin k → A // wordProduct A k w = g} :=
    ⟨fun i => ⟨e (σ i), (hletters _).1⟩, by
      rw [wordProduct_lift H.subtype A k _ (fun i => u (σ i)) (fun _ => rfl), Equiv.prod_comp]⟩
  have hinj : Function.Injective words := by
    intro σ τ heq
    apply Equiv.ext
    intro i
    exact e.injective (congrArg (fun w : {w : Fin k → A // wordProduct A k w = g} => (w.val i : G)) heq)
  have hcount : k.factorial ≤ repCount A k g := by
    simpa [repCount, Nat.card_eq_fintype_card, Fintype.card_perm] using Fintype.card_le_of_injective words hinj
  exact (hcount.trans (hq g)).not_gt hfac

/-- Density estimate, for every word length at least two and any
abelian subgroup of index at least two, including nonnormal subgroups. -/
theorem density_bound [Fintype G] (H : Subgroup G) [IsMulCommutative H] {A : Finset G}
    {k : ℕ} (hk : 2 ≤ k) (hA : IsSk A k) (hh : 2 ≤ H.index) (hm : H.index < A.card) :
    (A.card : ℝ) ^ k / Fintype.card G ≤
      1 / (1 + ((1 - (H.index : ℝ) / A.card) / (H.index - 1 : ℝ)) ^ k) := by
  classical
  let := Fintype.ofFinite (G ⧸ H)
  have hi : Fintype.card (G ⧸ H) = H.index := by
    rw [Subgroup.index_eq_card, Nat.card_eq_fintype_card]
  have hq (g : G) : repCount A k g ≤ 1 := by
    let : Subsingleton {w : Fin k → A // wordProduct A k w = g} :=
      ⟨fun u v => Subtype.ext (hA (u.property.trans v.property.symm))⟩
    simpa only [repCount, Nat.card_eq_fintype_card] using
      (Fintype.card_le_one_iff_subsingleton.mpr (inferInstance : Subsingleton {w : Fin k → A // wordProduct A k w = g}))
  simpa [hi] using bounded_multiplicity_density (X := G ⧸ H) A k 1 1
    (by simpa [hi] using hh) (by simpa [hi] using hm) (coset_fixed_le_one H hk hA) hq

/-- The largest cardinality of an ordered Sidon set of length `k`. -/
noncomputable def maxSize (G : Type*) [Group G] [Fintype G] (k : ℕ) : ℕ := by
  classical
  exact (univ.filter fun A : Finset G => IsSk A k).sup Finset.card

private lemma maxSize_attained [Fintype G] (k : ℕ) :
    ∃ A : Finset G, IsSk A k ∧ maxSize G k = A.card := by
  classical
  let s := univ.filter fun A : Finset G => IsSk A k
  have he : IsSk (∅ : Finset G) k := fun _ _ _ => Subsingleton.elim ..
  have hs : s.Nonempty := ⟨∅, mem_filter.mpr ⟨mem_univ _, he⟩⟩
  obtain ⟨A, ha, hcard⟩ := s.exists_mem_eq_sup hs Finset.card
  exact ⟨A, (mem_filter.mp ha).2, hcard⟩

theorem maxSize_le_one [Fintype G] (H : Subgroup G) [IsMulCommutative H]
    (hH : H.index = 1) {k : ℕ} (hk : 2 ≤ k) : maxSize G k ≤ 1 := by
  obtain ⟨A, hA, he⟩ := maxSize_attained (G := G) k
  exact he.trans_le (card_le_one_of_index_one H hH hk hA)

/-- The explicit uniform bound on the extremal size. In particular it holds
for every odd `k ≥ 3`. -/
theorem maxSize_uniform_bound [Fintype G] (H : Subgroup G) [IsMulCommutative H]
    {k : ℕ} (hk : 2 ≤ k) (hh : 2 ≤ H.index) (hn : 2 * (2 * H.index) ^ k ≤ Fintype.card G) :
    (maxSize G k : ℝ) ≤ (1 + (1 / (2 * (H.index - 1 : ℝ))) ^ k) ^ (-(k : ℝ)⁻¹) *
      (Fintype.card G : ℝ) ^ (k : ℝ)⁻¹ := by
  obtain ⟨A, hA, he⟩ := maxSize_attained (G := G) k
  rw [he]
  let d : ℝ := 1 / (2 * (H.index - 1 : ℝ))
  have hh' : (2 : ℝ) ≤ H.index := by exact_mod_cast hh
  have hdpos : 0 < d := by
    exact one_div_pos.mpr (mul_pos (by norm_num) (by linarith))
  have hd1 : d ≤ 1 := by
    apply (div_le_one (by linarith : 0 < 2 * ((H.index : ℝ) - 1))).2
    linarith
  have hden : 0 < 1 + d ^ k := by positivity
  have hG : (0 : ℝ) < Fintype.card G := by exact_mod_cast Fintype.card_pos
  have hpow : (A.card : ℝ) ^ k ≤ Fintype.card G / (1 + d ^ k) := by
    apply (le_div_iff₀ hden).2
    by_cases hm : 2 * H.index ≤ A.card
    · have hm' : 2 * (H.index : ℝ) ≤ A.card := by exact_mod_cast hm
      have hmpos : (0 : ℝ) < A.card := by linarith
      have hhalf : (H.index : ℝ) / A.card ≤ 1 / 2 := (div_le_iff₀ hmpos).2 (by linarith)
      have hdle : d ≤ (1 - (H.index : ℝ) / A.card) / (H.index - 1 : ℝ) := by
        dsimp [d]
        rw [div_mul_eq_div_div]
        exact div_le_div_of_nonneg_right (by linarith) (by linarith)
      have hbig := density_bound H hk hA hh (by omega : H.index < A.card)
      rw [div_le_div_iff₀ hG (by have := hdpos.trans_le hdle; positivity)] at hbig
      calc
        _ ≤ (A.card : ℝ) ^ k * (1 + ((1 - (H.index : ℝ) / A.card) / (H.index - 1 : ℝ)) ^ k) := by
          gcongr
        _ ≤ _ := by simpa using hbig
    · have hsmall := Nat.pow_le_pow_left (by omega : A.card ≤ 2 * H.index) k
      have hsmall' : (A.card : ℝ) ^ k ≤ (2 * (H.index : ℝ)) ^ k := by exact_mod_cast hsmall
      have hn' : 2 * (2 * (H.index : ℝ)) ^ k ≤ Fintype.card G := by exact_mod_cast hn
      have hdle := pow_le_one₀ hdpos.le hd1 (n := k)
      nlinarith [mul_nonneg (pow_nonneg (Nat.cast_nonneg (α := ℝ) A.card) k)
        (sub_nonneg.mpr hdle)]
  have hr := Real.rpow_le_rpow (pow_nonneg (Nat.cast_nonneg A.card) k) hpow
    (by positivity : (0 : ℝ) ≤ (k : ℝ)⁻¹)
  rw [Real.pow_rpow_inv_natCast (by positivity) (by omega), Real.div_rpow hG.le hden.le] at hr
  change (A.card : ℝ) ≤ (1 + d ^ k) ^ (-(k : ℝ)⁻¹) * _
  rw [Real.rpow_neg hden.le]
  simpa only [div_eq_mul_inv, mul_comm] using hr

/-- A single positive gap works simultaneously for all sufficiently large
groups of the prescribed index and word length. The threshold is explicit. -/
theorem uniform_gap (h k : ℕ) (hh : 1 ≤ h) (hk : 2 ≤ k) :
    ∃ ε : ℝ, 0 < ε ∧ ∀ (Γ : Type*) [Group Γ] [Fintype Γ]
      (H : Subgroup Γ) [IsMulCommutative H], H.index = h →
      2 * (2 * h) ^ k ≤ Fintype.card Γ →
      (maxSize Γ k : ℝ) ≤ (1 - ε) * (Fintype.card Γ : ℝ) ^ (k : ℝ)⁻¹ := by
  rcases eq_or_lt_of_le hh with hone | htwo
  · subst h
    refine ⟨1 / 2, by norm_num, ?_⟩
    intro Γ _ _ H _ hH hn
    have hcard : (maxSize Γ k : ℝ) ≤ 1 := by exact_mod_cast maxSize_le_one H hH hk
    have hpow : (2 : ℝ) ^ k ≤ Fintype.card Γ := by
      exact_mod_cast (show 2 ^ k ≤ Fintype.card Γ by simp only [mul_one] at hn; omega)
    have hr := Real.rpow_le_rpow (by positivity) hpow (by positivity : (0 : ℝ) ≤ (k : ℝ)⁻¹)
    rw [Real.pow_rpow_inv_natCast (by norm_num) (by omega)] at hr
    linarith
  have hh : 2 ≤ h := by omega
  let c : ℝ := (1 + (1 / (2 * (h - 1 : ℝ))) ^ k) ^ (-(k : ℝ)⁻¹)
  have hh' : 1 < (h : ℝ) := by exact_mod_cast (by omega : 1 < h)
  have hk' : (0 : ℝ) < k := by exact_mod_cast (by omega : 0 < k)
  have hc : c < 1 := Real.rpow_lt_one_of_one_lt_of_neg
    (lt_add_of_pos_right _ (pow_pos (one_div_pos.mpr (mul_pos (by norm_num) (sub_pos.mpr hh'))) k))
    (neg_lt_zero.mpr (inv_pos.mpr hk'))
  refine ⟨1 - c, sub_pos.mpr hc, ?_⟩
  intro Γ _ _ H _ hi hn
  subst h
  simpa [c] using maxSize_uniform_bound H hk hh hn

/-- The bounded-index formulation of the Byrne–Tait question. Both the gap
and the size threshold are chosen before the group or subgroup. -/
theorem bounded_index_gap (h k : ℕ) (hk : 2 ≤ k) :
    ∃ ε : ℝ, 0 < ε ∧ ∃ N : ℕ, ∀ (Γ : Type*) [Group Γ] [Fintype Γ]
      (H : Subgroup Γ) [IsMulCommutative H], H.index ≤ h → N ≤ Fintype.card Γ →
      (maxSize Γ k : ℝ) ≤ (1 - ε) * (Fintype.card Γ : ℝ) ^ (k : ℝ)⁻¹ := by
  induction h with
  | zero =>
    refine ⟨1, by norm_num, 0, ?_⟩
    intro Γ _ _ H _ hi _
    exact (H.index_ne_zero_of_finite (Nat.eq_zero_of_le_zero hi)).elim
  | succ h ih =>
    obtain ⟨e, he, N, hN⟩ := ih
    obtain ⟨d, hd, hD⟩ := uniform_gap (h + 1) k (by omega) hk
    refine ⟨min e d, lt_min he hd, max N (2 * (2 * (h + 1)) ^ k), ?_⟩
    intro Γ _ _ H _ hi hn
    rcases eq_or_lt_of_le hi with hi | hi
    · exact (hD Γ H hi ((le_max_right ..).trans hn)).trans
        (mul_le_mul_of_nonneg_right (sub_le_sub_left (min_le_right ..) _) (by positivity))
    · exact (hN Γ H (by omega) ((le_max_left ..).trans hn)).trans
        (mul_le_mul_of_nonneg_right (sub_le_sub_left (min_le_left ..) _) (by positivity))

end ByrneTaitOddSidon
