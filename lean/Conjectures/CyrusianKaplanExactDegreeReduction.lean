module
public import Conjectures.CyrusianKaplanDegreeTransfer
public import Conjectures.CyrusianKaplanLatticeFibres
public import Conjectures.CyrusianKaplanTrueCountGrowth
public import Conjectures.CyrusianKaplanQuasipolynomial
public import Mathlib.Algebra.Polynomial.Degree.Lemmas
import Mathlib.Tactic.Positivity

@[expose] public section
namespace CyrusianKaplan

open Polynomial
open scoped BigOperators

/-- Reduces the exact quasipolynomial assertion to the remaining
per-stratum counting theorem. The exact finite sum and common period
preserve all positive genera and do not weaken the scope to eventual. -/
theorem ordinarization_quasipolynomial_of_literal_strata (r : ℕ)
    (h : ∀ s : TupleAffineTest r → Ordering,
      HasPositiveGenusQuasipolynomial
        (fun g => (Nat.card (tupleLatticeFibre g r s) : ℚ)) (2*r)) :
    HasPositiveGenusQuasipolynomial
      (fun g => (Nat.card (ExactOrdinarizationClass g r) : ℚ)) (2*r) := by
  have eq : (fun g => (Nat.card (ExactOrdinarizationClass g r) : ℚ)) =
      fun g => ∑ s : TupleAffineTest r → Ordering, (Nat.card (tupleLatticeFibre g r s):ℚ) := by
    funext g
    exact_mod_cast exact_ordinarization_count_sum_lattice_fibres g r
  rw [eq]
  exact positive_genus_quasipolynomial_sum _ _ h

/-- Once the literal stratum counts yield a quasipolynomial of
degree at most 2r, the verified actual-count growth forces exact
degree 2r in every residue class. No Ehrhart leading coefficient
is used for the lower degree bound. -/
theorem ordinarization_exact_degree_of_quasipolynomial (r : ℕ) (hr : 1≤r)
    (h : HasPositiveGenusQuasipolynomial
      (fun g => (Nat.card (ExactOrdinarizationClass g r) : ℚ)) (2*r)) :
    ∃ p : ℕ, ∃ hp : 0<p, ∃ P : Fin p → ℚ[X],
      (∀ s, (P s).natDegree=2*r) ∧
      ∀ g : ℕ, 0<g →
        (Nat.card (ExactOrdinarizationClass g r):ℚ)=
          (P ⟨g%p,Nat.mod_lt _ hp⟩).eval (g:ℚ) := by
  obtain ⟨p,hp,P,hD,hEq⟩ := h
  refine ⟨p,hp,P,?_,hEq⟩
  intro s
  apply le_antisymm (hD s)
  let R := (P s).map (algebraMap ℚ ℝ)
  let N (g : ℕ) : ℝ := Nat.card (ExactOrdinarizationClass g r)
  let K : ℕ := 32^(2*r)*(r.factorial*r.factorial)
  have hK : 0<(K:ℝ) := by
    have hkn : 0<K := by unfold K; positivity
    exact_mod_cast hkn
  have hLow (g : ℕ) (hg : 32*r≤g) : (g:ℝ)^(2*r)≤(K:ℝ)*N g := by
    have hh := exact_ordinarization_count_scaled_power_lower g r hr hg
    change g^(2*r)≤K*Nat.card (ExactOrdinarizationClass g r) at hh
    unfold N
    exact_mod_cast hh
  have hEval (g : ℕ) (hg : 32*r≤g) (hmod : g%p=s.val) :
      R.eval (g:ℝ)=N g := by
    have he := hEq g (by omega)
    have hs : (⟨g%p,Nat.mod_lt _ hp⟩ : Fin p)=s := Fin.ext hmod
    rw [hs] at he
    have hc : (algebraMap ℚ ℝ) (g:ℚ)=(g:ℝ) := map_natCast _ _
    unfold R N
    rw [← hc,Polynomial.eval_map_apply,← he,map_natCast]
  have hDeg := positive_growth_forces_residue_degree N (2*r) (32*r) p s.val hp s.isLt R
      (K:ℝ) hK hLow hEval
  have hn : 2*r≤R.natDegree := by
    exact_mod_cast hDeg.trans (Polynomial.degree_le_natDegree (p:=R))
  simpa only [R,Polynomial.natDegree_map_eq_of_injective (algebraMap ℚ ℝ).injective] using hn

end CyrusianKaplan
