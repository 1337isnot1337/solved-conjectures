import Conjectures.OravcovaSotakBasic
import Conjectures.BabaiPathSpectrum
import Mathlib.Combinatorics.Compactness

/-! The general distance-graph upper bound and the complete clique family.
Finite interval colorings are joined by Rado's selection theorem. -/

namespace OravcovaSotak

open scoped BigOperators

theorem finite_coloring_exists (D : List ℕ) (S : Finset ℤ) :
    ∃ c : ℤ → Fin (D.toFinset.card+1),
      ∀ m ∈ S, ∀ n ∈ S, (graph D).Adj m n → c m ≠ c n := by
  classical
  let N := ∑ z ∈ S, z.natAbs
  have hbound : ∀ z ∈ S, -(N : ℤ) ≤ z ∧ z ≤ (N : ℤ) := by
    intro z hz
    have ha : z.natAbs ≤ N := Finset.single_le_sum (fun x _ => Nat.zero_le x.natAbs) hz
    have hb := Int.le_natAbs (a := z)
    have hc := Int.le_natAbs (a := -z)
    rw [Int.natAbs_neg] at hc
    omega
  obtain ⟨f,hf⟩ := BabaiPathSpectrum.ordered_coloring_exists D.toFinset (2*N+1)
  refine ⟨fun z => f (z+(N : ℤ)).toNat, ?_⟩
  intro m hm n hn hadj
  have hmB := hbound m hm
  have hnB := hbound n hn
  have hmC := Int.toNat_of_nonneg (by omega : 0 ≤ m+(N : ℤ))
  have hnC := Int.toNat_of_nonneg (by omega : 0 ≤ n+(N : ℤ))
  have hdC := Int.natCast_natAbs (m-n)
  by_cases hmn : m < n
  · rw [abs_of_nonpos (by omega)] at hdC
    apply hf _ _ (by omega) (by omega)
    have he : (n+(N : ℤ)).toNat-(m+(N : ℤ)).toNat = (m-n).natAbs := by omega
    simpa only [he, List.mem_toFinset] using hadj.2
  · rw [abs_of_nonneg (by omega)] at hdC
    apply Ne.symm
    apply hf _ _ (by have := hadj.1; omega) (by omega)
    have he : (m+(N : ℤ)).toNat-(n+(N : ℤ)).toNat = (m-n).natAbs := by omega
    simpa only [he, List.mem_toFinset] using hadj.2

/-- Every integer distance graph with `k` distinct distances has a proper
coloring with `k+1` colors. -/
theorem distance_colorable_card_add_one (D : List ℕ) :
    (graph D).Colorable (D.toFinset.card+1) := by
  classical
  choose c hc using finite_coloring_exists D
  obtain ⟨f,hf⟩ := Finset.rado_selection c
  refine ⟨SimpleGraph.Coloring.mk f ?_⟩
  intro m n hadj
  obtain ⟨S,hS,he⟩ := hf {m,n}
  rw [he m (by simp), he n (by simp)]
  exact hc S m (hS (by simp)) n (hS (by simp)) hadj

theorem distance_colorable_length_add_one (D : List ℕ) :
    (graph D).Colorable (D.length+1) :=
  (distance_colorable_card_add_one D).mono (by have := D.toFinset_card_le; omega)

def cliqueFamily (k s : ℕ) : List ℕ := k*s :: List.range' 1 (k-1)

theorem cliqueFamily_mem (k s d : ℕ) (hk : 1 ≤ k) (hd : 1 ≤ d) (hdk : d < k) :
    d ∈ cliqueFamily k s := by
  apply List.mem_cons_of_mem
  apply List.mem_range'.mpr
  exact ⟨d-1, by omega, by omega⟩

theorem cliqueFamily_pairwise (k s : ℕ) (hk : 2 ≤ k) (n : ℤ) :
    Pairwise (fun i j : Fin k =>
      (graph (cliqueFamily k s)).Adj (n+(i.val : ℤ)) (n+(j.val : ℤ))) := by
  intro i j hne
  have hv : i.val ≠ j.val := fun h => hne (Fin.ext h)
  refine ⟨by omega, ?_⟩
  apply cliqueFamily_mem k s _ (by omega)
  · exact Int.natAbs_pos.mpr (by omega)
  · have h := Int.natCast_natAbs (n+(i.val : ℤ)-(n+(j.val : ℤ)))
    have hi := i.isLt
    have hj := j.isLt
    have ha : |n+(i.val : ℤ)-(n+(j.val : ℤ))| < (k : ℤ) := by
      apply abs_lt.mpr
      omega
    omega

theorem cliqueFamily_window_injective (k s : ℕ) (hk : 2 ≤ k)
    (C : (graph (cliqueFamily k s)).Coloring (Fin k)) (n : ℤ) :
    Function.Injective (fun i : Fin k => C (n+(i.val : ℤ))) :=
  C.injective_comp_of_pairwise_adj _ (cliqueFamily_pairwise k s hk n)

def cliqueFamilyCopy (k s : ℕ) (hk : 2 ≤ k) :
    SimpleGraph.Copy (SimpleGraph.completeGraph (Fin k)) (graph (cliqueFamily k s)) where
  toHom := ⟨(fun i => (i.val : ℤ)), by
    intro i j hij
    simpa only [zero_add] using cliqueFamily_pairwise k s hk 0 hij⟩
  injective' := by
    intro i j hij
    exact Fin.ext (Int.natCast_inj.mp hij)

theorem cliqueFamily_has_clique (k s : ℕ) (hk : 2 ≤ k) :
    ∃ S : Finset ℤ, (graph (cliqueFamily k s)).IsNClique k S := by
  have h := SimpleGraph.isNClique_map_copy_top (cliqueFamilyCopy k s hk)
  exact ⟨_,by simpa only [Fintype.card_fin] using h⟩

theorem cliqueFamily_periodic (k s : ℕ) (hk : 2 ≤ k)
    (C : (graph (cliqueFamily k s)).Coloring (Fin k)) :
    Function.Periodic C (k : ℤ) := by
  intro n
  have hsurj := Finite.surjective_of_injective (cliqueFamily_window_injective k s hk C n)
  obtain ⟨i,hi⟩ := hsurj (C (n+(k : ℤ)))
  by_cases hz : i.val = 0
  · simpa only [hz, Nat.cast_zero, add_zero] using hi.symm
  · exfalso
    apply C.valid (v := n+(i.val : ℤ)) (w := n+(k : ℤ)) ?_ hi
    refine ⟨by have := i.isLt; omega, ?_⟩
    apply cliqueFamily_mem k s _ (by omega)
    · exact Int.natAbs_pos.mpr (by have := i.isLt; omega)
    · have hi' := i.isLt
      have ha := Int.natCast_natAbs (n+(i.val : ℤ)-(n+(k : ℤ)))
      rw [abs_of_nonpos (by omega)] at ha
      omega

theorem cliqueFamily_not_colorable (k s : ℕ) (hk : 2 ≤ k) (hs : 0 < s) :
    ¬(graph (cliqueFamily k s)).Colorable k := by
  rintro ⟨C⟩
  have hperiod := cliqueFamily_periodic k s hk C
  have he := (hperiod.int_mul (s : ℤ)) 0
  have hne := coloring_shift C 0 ((k*s : ℕ) : ℤ)
    (by change k*s ∈ cliqueFamily k s; exact List.mem_cons_self)
    (by have hpos : 0 < k*s := Nat.mul_pos (by omega) hs; omega)
  apply hne
  simpa [mul_comm] using he.symm

/-- The unbounded clique family has chromatic number exactly `k+1`. -/
theorem cliqueFamily_chromaticNumber (k s : ℕ) (hk : 2 ≤ k) (hs : 0 < s) :
    (graph (cliqueFamily k s)).chromaticNumber = (k : ℕ∞)+1 := by
  apply SimpleGraph.chromaticNumber_eq_iff_colorable_not_colorable.mpr
  refine ⟨?_, cliqueFamily_not_colorable k s hk hs⟩
  have h := distance_colorable_length_add_one (cliqueFamily k s)
  have hlen : (cliqueFamily k s).length = k := by
    simp only [cliqueFamily, List.length_cons, List.length_range']
    omega
  simpa only [hlen] using h

end OravcovaSotak
