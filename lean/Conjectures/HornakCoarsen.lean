import Conjectures.HornakSubset

/-! Refining arm-assigned pieces, a step in Barth's partition reduction. -/
namespace Hornak

/-- When the first part is largest, a realizable partition has an arm
assignment for all the remaining parts with that part reserved centrally. -/
theorem largest_first_to_assignment {m q : ℕ} (arms : Fin m → ℕ)
    (center : ℕ) (sizes : Fin q → ℕ)
    (hmax : ∀ k, sizes k ≤ center)
    (hpart : Partitionable arms (Fin.cases center sizes)) :
    ∃ host : Fin q → Fin m, ∀ j,
      (∑ k : {k // host k = j}, sizes k.val) ≤ arms j := by
  classical
  have hmax' : ∀ k : Fin (q+1), (Fin.cases center sizes : Fin (q+1) → ℕ) k ≤ center := by
    intro k
    cases k using Fin.cases with
    | zero => exact le_rfl
    | succ k => exact hmax k
  obtain ⟨host0,hfit⟩ := partition_assigns_with_largest_center arms (Fin.cases center sizes) 0 hmax' hpart
  let step : Fin q → {k : Fin (q+1) // k ≠ 0} := fun k => ⟨k.succ,Fin.succ_ne_zero k⟩
  have hstep : Function.Bijective step := by
    constructor
    · intro a b hab
      exact (Fin.succ_injective q) (congrArg Subtype.val hab)
    · rintro ⟨k,hk⟩
      cases k using Fin.cases with
      | zero => exact (hk rfl).elim
      | succ k => exact ⟨k,Subtype.ext rfl⟩
  let e : Fin q ≃ {k : Fin (q+1) // k ≠ 0} := Equiv.ofBijective step hstep
  let host : Fin q → Fin m := fun k => host0 (e k)
  refine ⟨host,?_⟩
  intro j
  let ej : {k // host k = j} ≃ {k : {k : Fin (q+1) // k ≠ 0} // host0 k = j} :=
    Equiv.subtypeEquiv e (fun _ => Iff.rfl)
  have heq : (∑ k : {k // host k = j}, sizes k.val) =
      ∑ k : {k : {k : Fin (q+1) // k ≠ 0} // host0 k = j}, Fin.cases center sizes k.val.val := by
    apply Fintype.sum_equiv ej
    intro k
    rfl
  rw [heq]
  exact hfit j

/-- Grouping indices and then assigning groups to arms preserves the
sum of sizes in every arm. -/
theorem grouped_arm_sum {m q r : ℕ} (sizes : Fin q → ℕ)
    (group : Fin q → Fin r) (host : Fin r → Fin m) (j : Fin m) :
    (∑ k : {k // host (group k) = j}, sizes k.val) =
      ∑ u : {u // host u = j}, ∑ k : {k // group k = u.val}, sizes k.val := by
  classical
  let A := {k // host (group k) = j}
  let B := Σ u : {u // host u = j}, {k // group k = u.val}
  let e : B ≃ A := {
    toFun := fun z => ⟨z.2.val, by rw [z.2.property]; exact z.1.property⟩
    invFun := fun k => ⟨⟨group k.val,k.property⟩,⟨k.val,rfl⟩⟩
    left_inv := by
      rintro ⟨⟨u,hu⟩,⟨k,hk⟩⟩
      dsimp
      change group k = u at hk
      subst u
      rfl
    right_inv := by
      rintro ⟨k,hk⟩
      rfl }
  calc
    (∑ k : A, sizes k.val) = ∑ z : B, sizes (e z).val := (e.sum_comp _).symm
    _ = ∑ u : {u // host u = j}, ∑ k : {k // group k = u.val}, sizes k.val :=
      Fintype.sum_sigma _

/-- Splitting each noncentral coarse part into positive smaller pieces
preserves realizability when the central part is a largest coarse part. -/
theorem refine_noncentral_parts {m q r : ℕ} (arms : Fin m → ℕ)
    (center : ℕ) (sizes : Fin q → ℕ) (group : Fin q → Fin r)
    (hpos : ∀ k, 0 < sizes k)
    (hmax : ∀ u, (∑ k : {k // group k = u}, sizes k.val) ≤ center)
    (htotal : center+(∑ k, sizes k) = 1+∑ j, arms j)
    (hcoarse : Partitionable arms (Fin.cases center
      (fun u => ∑ k : {k // group k = u}, sizes k.val))) :
    Partitionable arms (Fin.cases center sizes) := by
  let coarse : Fin r → ℕ := fun u => ∑ k : {k // group k = u}, sizes k.val
  obtain ⟨host,hfit⟩ := largest_first_to_assignment arms center coarse hmax hcoarse
  let host' : Fin q → Fin m := fun k => host (group k)
  apply partition_from_assignment arms center sizes host' hpos _ htotal
  intro j
  rw [grouped_arm_sum sizes group host j]
  exact hfit j

end Hornak
