module

public import Mathlib.Analysis.Calculus.Deriv.Polynomial
public import Mathlib.Analysis.Calculus.DerivativeTest
public import Mathlib.Topology.Algebra.Polynomial
public import Mathlib.Topology.Order.IntermediateValue
public import Mathlib.Algebra.Polynomial.Roots

@[expose] public section
namespace RossiPermutohedron
open Polynomial Set Filter SignType

/-- Strict opposite endpoint signs give an interior root. -/
theorem interior_root {p : ℝ[X]} {a b : ℝ} (hab : a < b)
    (h : (p.eval a < 0 ∧ 0 < p.eval b) ∨ (p.eval b < 0 ∧ 0 < p.eval a)) :
    ∃ x ∈ Ioo a b, IsRoot p x := by
  rcases h with h | h
  · obtain ⟨x, hx, he⟩ := intermediate_value_Icc hab.le p.continuous.continuousOn
      (show 0 ∈ Icc (p.eval a) (p.eval b) from ⟨h.1.le, h.2.le⟩)
    refine ⟨x, ⟨hx.1.lt_of_ne ?_, hx.2.lt_of_ne ?_⟩, he⟩
    · rintro rfl
      exact h.1.ne he
    · rintro rfl
      exact h.2.ne' he
  · obtain ⟨x, hx, he⟩ := intermediate_value_Icc' hab.le p.continuous.continuousOn
      (show 0 ∈ Icc (p.eval b) (p.eval a) from ⟨h.1.le, h.2.le⟩)
    refine ⟨x, ⟨hx.1.lt_of_ne ?_, hx.2.lt_of_ne ?_⟩, he⟩
    · rintro rfl
      exact h.2.ne he.symm
    · rintro rfl
      exact h.1.ne he

/-- Negative sign-grid cells give a finite set of distinct negative roots,
without any assumptions about the other real roots or the degree. -/
theorem negative_roots_from_grid {m : ℕ} (p : ℝ[X]) (g : Fin (m+1) → ℝ)
    (hmono : StrictAnti g) (hneg : ∀ j, g j < 0)
    (halt : ∀ i : Fin m,
       (p.eval (g i.succ) < 0 ∧ 0 < p.eval (g i.castSucc)) ∨
       (p.eval (g i.castSucc) < 0 ∧ 0 < p.eval (g i.succ))) :
    ∃ r : Finset ℝ, r.card = m ∧ ∀ x ∈ r, x < 0 ∧ IsRoot p x := by
  classical
  have hg (i : Fin m) : g i.succ < g i.castSucc := hmono (by
    change i.val < i.val + 1
    omega)
  choose z hz hroot using fun i : Fin m => interior_root (hg i) (halt i)
  have hanti : StrictAnti z := by
    intro i j hij
    have h := hmono.antitone (show i.succ ≤ j.castSucc by
      change i.val + 1 ≤ j.val
      exact Nat.succ_le_of_lt hij)
    exact ((hz j).2.trans_le h).trans (hz i).1
  refine ⟨Finset.univ.map ⟨z, hanti.injective⟩, by simp, ?_⟩
  intro x hx
  obtain ⟨i, _, rfl⟩ := Finset.mem_map.mp hx
  exact ⟨(hz i).2.trans (hneg _), hroot i⟩

/-- A polynomial vanishing at zero with negative derivative there and
positive value at one has a root strictly between zero and one. -/
theorem positive_root_of_deriv_neg {p : ℝ[X]} (h0 : p.eval 0 = 0)
    (hd : p.derivative.eval 0 < 0) (h1 : 0 < p.eval 1) :
    ∃ x ∈ Ioo (0:ℝ) 1, IsRoot p x := by
  have hd' : deriv (fun x => p.eval x) 0 < 0 := by
    rw [(p.hasDerivAt (x := (0:ℝ))).deriv]
    exact hd
  have hs := eventually_nhdsWithin_sign_eq_of_deriv_neg hd' h0
  have hev : ∀ᶠ x in nhdsWithin (0:ℝ) (Ioi 0), p.eval x < 0 := by
    filter_upwards [nhdsWithin_le_nhds hs, self_mem_nhdsWithin] with x hx (hp : 0<x)
    exact sign_eq_neg_one_iff.mp (hx.trans (sign_eq_neg_one_iff.mpr (sub_neg.mpr hp)))
  have hh : ∀ᶠ x in nhdsWithin (0:ℝ) (Ioi 0), x ∈ Ioo (0:ℝ) 1 := by
    filter_upwards [self_mem_nhdsWithin,
      mem_nhdsWithin_of_mem_nhds (Iio_mem_nhds (show (0:ℝ) < 1 by norm_num))]
      with x hx hy using ⟨hx,hy⟩
  have : (nhdsWithin (0:ℝ) (Ioi 0)).NeBot := nhdsWithin_Ioi_neBot le_rfl
  obtain ⟨x,hx,hx'⟩ := (hh.and hev).exists
  obtain ⟨y,hy,hr⟩ := interior_root (p := p) hx.2 (Or.inl ⟨hx',h1⟩)
  exact ⟨y, ⟨hx.1.trans hy.1,hy.2⟩, hr⟩

/-- Once the grid and positive root are certified, the degree forces the
precise three-way split and excludes any repeated real root. -/
theorem roots_exact_of_sign_grid {m : ℕ} (p : ℝ[X]) (hdeg : p.natDegree = m+2)
    (g : Fin (m+1) → ℝ) (hmono : StrictAnti g) (hneg : ∀ j, g j < 0)
    (halt : ∀ i : Fin m,
       (p.eval (g i.succ) < 0 ∧ 0 < p.eval (g i.castSucc)) ∨
       (p.eval (g i.castSucc) < 0 ∧ 0 < p.eval (g i.succ)))
    (h0 : p.eval 0 = 0) (hd : p.derivative.eval 0 < 0) (h1 : 0 < p.eval 1) :
    ∃ (r : Finset ℝ) (y : ℝ), r.card = m ∧ (∀ x ∈ r, x < 0) ∧ y ∈ Ioo 0 1 ∧
      p.roots = (insert y (insert 0 r)).val := by
  classical
  have hn : p ≠ 0 := by
    intro h
    rw [h, natDegree_zero] at hdeg
    omega
  rcases negative_roots_from_grid p g hmono hneg halt with ⟨r,hr,hr'⟩
  rcases positive_root_of_deriv_neg h0 hd h1 with ⟨y,hy,hy'⟩
  have h0r : (0:ℝ) ∉ r := fun h => (lt_irrefl 0) (hr' 0 h).1
  have hyr : y ∉ insert 0 r := by
    intro h
    rcases Finset.mem_insert.mp h with h | h
    · exact hy.1.ne' h
    · exact (not_lt_of_ge hy.1.le) (hr' y h).1
  have hcard : (insert y (insert 0 r)).card = m+2 := by
    rw [Finset.card_insert_of_notMem hyr, Finset.card_insert_of_notMem h0r, hr]
  have hle : (insert y (insert 0 r)).val ≤ p.roots := by
    apply (Multiset.le_iff_subset (insert y (insert 0 r)).nodup).mpr
    intro x hx
    apply (mem_roots hn).mpr
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact hy'
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact h0
    · exact (hr' x hx).2
  have he := Multiset.eq_of_le_of_card_le hle (by
    simpa only [←Finset.card_def, hcard, ←hdeg] using card_roots' p)
  exact ⟨r,y,hr, fun x hx => (hr' x hx).1,hy,he.symm⟩

end RossiPermutohedron
