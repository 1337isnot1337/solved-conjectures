import Conjectures.JohnsonPfaffianKernel
import Conjectures.JohnsonPfaffianCircularUncrossing

/-!
# Johnson's conjecture

Full Conjecture 7.1 of William Johnson, *Pfaffian Positivity for Convex Kernels
and Optimal Matching Bounds*, arXiv:2610.24371v1, p.14.  The proof follows
`results/johnson-pfaffian/PROOF.md`, including the cited endpoint inequality
and Johnson's uncrossing reduction.  The existing repository entry records
the proof authors and the qualification that its priority audit is bounded.

`matchingPfaffian` is the literal signed perfect-matching expansion: each
upper entry is `f (x_j-x_i)` and the sign is `(-1)` to the number of chord
crossings.  The input nodes below need to be ordered only on the finite
vertex set.  No property of an artificial infinite continuation is assumed.
-/

namespace JohnsonPfaffian

open GilmoreCrossingNesting Set

def extendNodes (nodes : ℕ → ℝ) (n i : ℕ) : ℝ :=
  if i < n then nodes i else nodes (n-1) + ((i : ℝ) - (n-1 : ℕ))

theorem extendNodes_eq (nodes : ℕ → ℝ) (n i : ℕ) (hi : i < n) :
    extendNodes nodes n i = nodes i := by simp [extendNodes, hi]

theorem extendNodes_strictMono (nodes : ℕ → ℝ) (n : ℕ)
    (hnodes : ∀ i j, i < j → j < n → nodes i < nodes j) :
    StrictMono (extendNodes nodes n) := by
  intro i j hij
  by_cases hi : i < n
  · by_cases hj : j < n
    · simpa only [extendNodes, ite_eq_left hi, ite_eq_left hj] using hnodes i j hij hj
    · have hle : nodes i ≤ nodes (n-1) := by
        by_cases he : i = n-1
        · simp [he]
        · exact (hnodes i (n-1) (by omega) (by omega)).le
      have hgap : (n-1 : ℕ) < j := by omega
      have hgapR : (n-1 : ℕ) < (j : ℝ) := by exact_mod_cast hgap
      simp only [extendNodes, ite_eq_left hi, ite_eq_right hj]
      linarith
  · have hj : ¬ j < n := by omega
    have hijR : (i : ℝ) < j := by exact_mod_cast hij
    simp only [extendNodes, ite_eq_right hi, ite_eq_right hj]
    linarith

/-- Johnson's full conjecture, for every even order and every perfect matching. -/
theorem johnson_conjecture (u : ℕ) (f : ℝ → ℝ) (nodes : ℕ → ℝ)
    (hnodes : ∀ i j, i < j → j < 2*u → nodes i < nodes j)
    (hf : ∀ x > 0, 0 < f x) (hanti : AntitoneOn f (Ioi 0))
    (hconv : ConvexOn ℝ (Ioi 0) (fun x => Real.log (f x)))
    (M : List (ℕ × ℕ)) (hM : M ∈ matchingFinset u) :
    edgeProduct (fun i j => f (nodes j-nodes i)) M ≤
      matchingPfaffian u (fun i j => f (nodes j-nodes i)) := by
  let x := extendNodes nodes (2*u)
  have hbound := kernel_matching_bound u f x (extendNodes_strictMono nodes (2*u) hnodes)
    hf hanti hconv M hM
  have hw : ∀ i j, i < j → j < 2*u →
      f (x j-x i) = f (nodes j-nodes i) := by
    intro i j hij hj
    simp only [x, extendNodes_eq nodes (2*u) i (lt_trans hij hj), extendNodes_eq nodes (2*u) j hj]
  rw [edgeProduct_congr_on u M hM _ _ hw, matchingPfaffian_congr_on u _ _ hw] at hbound
  exact hbound

/-- The matching need not be stored in the canonical enumeration order. -/
theorem johnson_conjecture_arbitrary_matching (u : ℕ) (f : ℝ → ℝ) (nodes : ℕ → ℝ)
    (hnodes : ∀ i j, i < j → j < 2*u → nodes i < nodes j)
    (hf : ∀ x > 0, 0 < f x) (hanti : AntitoneOn f (Ioi 0))
    (hconv : ConvexOn ℝ (Ioi 0) (fun x => Real.log (f x)))
    (M : List (ℕ × ℕ)) (hpart : (arcEndpoints M).Perm (List.range (2*u)))
    (horder : ∀ e ∈ M, e.1 < e.2) :
    edgeProduct (fun i j => f (nodes j-nodes i)) M ≤
      matchingPfaffian u (fun i j => f (nodes j-nodes i)) := by
  obtain ⟨N, hN, hp⟩ := matching_canonicalize u M hpart horder
  have h := johnson_conjecture u f nodes hnodes hf hanti hconv N hN
  rw [edgeProduct_perm _ hp] at h
  exact h

/-- Extend a genuinely finite tuple by a harmless default outside its domain. -/
def finiteNodeValues {n : ℕ} (nodes : Fin n → ℝ) (i : ℕ) : ℝ :=
  if h : i < n then nodes ⟨i,h⟩ else 0

/-- Source statement with an ordered tuple of exactly `2*u` real nodes. -/
theorem johnson_conjecture_fin (u : ℕ) (f : ℝ → ℝ) (nodes : Fin (2*u) → ℝ)
    (hnodes : StrictMono nodes) (hf : ∀ x > 0, 0 < f x)
    (hanti : AntitoneOn f (Ioi 0))
    (hconv : ConvexOn ℝ (Ioi 0) (fun x => Real.log (f x)))
    (M : List (ℕ × ℕ)) (hpart : (arcEndpoints M).Perm (List.range (2*u)))
    (horder : ∀ e ∈ M, e.1 < e.2) :
    edgeProduct (fun i j => f (finiteNodeValues nodes j-finiteNodeValues nodes i)) M ≤
      matchingPfaffian u (fun i j => f (finiteNodeValues nodes j-finiteNodeValues nodes i)) := by
  apply johnson_conjecture_arbitrary_matching u f (finiteNodeValues nodes) ?_ hf hanti hconv M hpart horder
  intro i j hij hj
  have hi : i < 2*u := lt_trans hij hj
  simpa only [finiteNodeValues, dite_eq_left hi, dite_eq_left hj] using
    hnodes (show (⟨i,hi⟩ : Fin (2*u)) < ⟨j,hj⟩ from hij)

end JohnsonPfaffian
