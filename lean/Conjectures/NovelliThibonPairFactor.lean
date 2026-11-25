module
public import Conjectures.NovelliThibonFiniteFundamental
public import Mathlib.Data.Fintype.Prod

@[expose] public section
namespace NovelliThibon

open Classical

variable {n : ℕ} {A R : Type*} [LinearOrder A] [Fintype A] [CommSemiring R]

def alphabetSum (x : A → R) : R := ∑ a : A,x a

noncomputable def alphabetPairSum (x : A → R) : R :=
  ∑ p : A × A with p.2 < p.1, x p.1*x p.2

omit [LinearOrder A] in
theorem words_total_weight (x : A → R) :
    (∑ w : (Fin n → A),wordWeight x w) = (alphabetSum x)^n := by
  classical
  unfold wordWeight alphabetSum
  have h := Finset.prod_univ_sum (t:=fun _ : Fin n => (Finset.univ : Finset A)) (fun _ a => x a)
  simpa only [Fintype.piFinset_univ,Finset.prod_const,Finset.card_univ,Fintype.card_fin] using h.symm

/-- Fixing two distinct positions separates the two letters from the
full unrestricted product over the remaining positions. -/
theorem words_two_fixed_weight (x : A → R) {i j : Fin n} (hij : i ≠ j) (a b : A) :
    (∑ w : (Fin n → A) with w i = a ∧ w j = b,wordWeight x w) =
      x a*x b*(alphabetSum x)^(n-2) := by
  classical
  let t (k : Fin n) : Finset A := if k=i then {a} else if k=j then {b} else Finset.univ
  have he : (Finset.univ.filter fun w : Fin n → A => w i = a ∧ w j = b) =
      Fintype.piFinset t := by
    ext w
    simp only [Finset.mem_filter,Finset.mem_univ,true_and,Fintype.mem_piFinset]
    refine ⟨fun h k => ?_,fun h => ?_⟩
    · by_cases hi : k=i
      · subst k
        simp [t,h.1]
      · by_cases hj : k=j
        · subst k
          simp [t,hij.symm,h.2]
        · simp [t,hi,hj]
    · exact ⟨by simpa [t] using h i,by simpa [t,hij.symm] using h j⟩
  rw [he]
  unfold wordWeight
  rw [← Finset.prod_univ_sum]
  let c (k : Fin n) : R := ∑ v ∈ t k,x v
  change (∏ k : Fin n,c k) = _
  have hi : i ∈ (Finset.univ : Finset (Fin n)) := Finset.mem_univ _
  have hj : j ∈ (Finset.univ : Finset (Fin n)).erase i :=
    Finset.mem_erase.mpr ⟨hij.symm,Finset.mem_univ _⟩
  have hci : c i = x a := by simp [c,t]
  have hcj : c j = x b := by simp [c,t,hij.symm]
  have hrest : (∏ k ∈ (Finset.univ.erase i).erase j,c k) = (alphabetSum x)^(n-2) := by
    have h (k : Fin n) (hk : k∈(Finset.univ.erase i).erase j) : c k = alphabetSum x := by
      obtain ⟨hkj,hki⟩ := Finset.mem_erase.mp hk
      have hki' := (Finset.mem_erase.mp hki).1
      simp [c,t,hkj,hki',alphabetSum]
    rw [Finset.prod_congr rfl h,Finset.prod_const,Finset.card_erase_of_mem hj,
      Finset.card_erase_of_mem hi,Finset.card_univ,Fintype.card_fin]
    congr 1
  calc
    _ = c i*(∏ k ∈ Finset.univ.erase i,c k) := (Finset.mul_prod_erase _ _ hi).symm
    _ = c i*(c j*(∏ k ∈ (Finset.univ.erase i).erase j,c k)) := by
      rw [Finset.mul_prod_erase _ _ hj]
    _ = _ := by rw [hci,hcj,hrest,mul_assoc]

/-- The weighted strict-comparison identity for arbitrary finite
alphabet evaluations and all word lengths with a pair of positions. -/
theorem words_strict_comparison_weight (x : A → R) {i j : Fin n} (hij : i ≠ j) :
    (∑ w : (Fin n → A) with w j < w i,wordWeight x w) =
      alphabetPairSum x*(alphabetSum x)^(n-2) := by
  classical
  let g (w : Fin n → A) : A × A := (w i,w j)
  let P (w : Fin n → A) : R := if w j < w i then wordWeight x w else 0
  rw [Finset.sum_filter]
  change (∑ w : (Fin n → A),P w) = _
  rw [← Finset.sum_fiberwise Finset.univ g P]
  unfold alphabetPairSum
  rw [Finset.sum_mul,Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro q _
  have h (w : Fin n → A) : g w = q ↔ w i=q.1 ∧ w j=q.2 := Prod.ext_iff
  have he : (Finset.univ.filter fun w : Fin n → A => g w = q) =
      Finset.univ.filter (fun w : Fin n → A => w i=q.1 ∧ w j=q.2) := by
    ext w
    simp only [Finset.mem_filter,Finset.mem_univ,true_and,h]
  rw [he]
  by_cases hq : q.2<q.1
  · rw [ite_eq_left hq,← words_two_fixed_weight x hij]
    apply Finset.sum_congr rfl
    intro w hw
    obtain ⟨ha,hb⟩ := (Finset.mem_filter.mp hw).2
    simp [P,ha,hb,hq]
  · rw [ite_eq_right hq]
    apply Finset.sum_eq_zero
    intro w hw
    obtain ⟨ha,hb⟩ := (Finset.mem_filter.mp hw).2
    simp [P,ha,hb,hq]

theorem fundamentals_single_comparison (x : A → R) {i j : Fin (n+1)} (hij : i<j) :
    (∑ σ : Equiv.Perm (Fin (n+1)) with σ j<σ i, fundamentalEvaluation σ x) =
      alphabetPairSum x*(alphabetSum x)^((n+1)-2) := by
  rw [fundamental_comparison_fibre x hij,words_strict_comparison_weight x hij.ne]

end NovelliThibon
