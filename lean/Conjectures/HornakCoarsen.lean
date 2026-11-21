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

/-- The sum of pieces assigned to an arm after joining two independent
assignments is the sum of the two corresponding arm loads. -/
theorem joined_assignment_load {m q r : ℕ} (left : Fin q → ℕ) (right : Fin r → ℕ)
    (hostL : Fin q → Fin m) (hostR : Fin r → Fin m) (j : Fin m) :
    let size : Fin (q+r) → ℕ := fun k => Sum.elim left right (finSumFinEquiv.symm k)
    let host : Fin (q+r) → Fin m := fun k => Sum.elim hostL hostR (finSumFinEquiv.symm k)
    (∑ k : {k // host k = j}, size k.val) =
      (∑ k : {k // hostL k = j}, left k.val)+(∑ k : {k // hostR k = j}, right k.val) := by
  classical
  dsimp only
  have hL : (∑ k : {k // hostL k = j}, left k.val) =
      ∑ k, if hostL k = j then left k else 0 := by
    rw [← Finset.sum_filter]
    symm
    exact Finset.sum_subtype _ (by simp) left
  have hR : (∑ k : {k // hostR k = j}, right k.val) =
      ∑ k, if hostR k = j then right k else 0 := by
    rw [← Finset.sum_filter]
    symm
    exact Finset.sum_subtype _ (by simp) right
  have hAll : (∑ k : {k // Sum.elim hostL hostR (finSumFinEquiv.symm k) = j},
      Sum.elim left right (finSumFinEquiv.symm k.val)) =
      ∑ k : Fin (q+r), if Sum.elim hostL hostR (finSumFinEquiv.symm k) = j
        then Sum.elim left right (finSumFinEquiv.symm k) else 0 := by
    rw [← Finset.sum_filter]
    symm
    exact Finset.sum_subtype _ (by simp) _
  rw [hAll,hL,hR,Fin.sum_univ_add]
  simp only [← finSumFinEquiv_apply_left, ← finSumFinEquiv_apply_right,
    Equiv.symm_apply_apply, Sum.elim_inl, Sum.elim_inr]

/-- A free arm can hold additional positive pieces while the other
assigned pieces remain on their existing arms. -/
theorem append_on_free_short_arm {q r : ℕ} (arms : Fin 3 → ℕ)
    (center : ℕ) (sizes : Fin q → ℕ) (extra : Fin r → ℕ) (host : Fin q → Fin 3)
    (hpos : ∀ k, 0 < sizes k) (hepos : ∀ k, 0 < extra k)
    (hfit : ∀ j, (∑ k : {k // host k = j}, sizes k.val) ≤ arms j)
    (hno : IsEmpty {k // host k = 2})
    (hefit : (∑ k, extra k) ≤ arms 2)
    (htotal : center+(∑ k, sizes k)+(∑ u, extra u) = 1+∑ j, arms j) :
    Partitionable arms (Fin.cases center
      (fun k : Fin (q+r) => Sum.elim sizes extra (finSumFinEquiv.symm k))) := by
  classical
  let joined : Fin (q+r) → ℕ := fun k => Sum.elim sizes extra (finSumFinEquiv.symm k)
  let assigned : Fin (q+r) → Fin 3 := fun k => Sum.elim host (fun _ => 2) (finSumFinEquiv.symm k)
  have hjpos : ∀ k, 0 < joined k := by
    intro k
    dsimp [joined]
    cases finSumFinEquiv.symm k with
    | inl k => exact hpos k
    | inr k => exact hepos k
  have hjfit : ∀ j, (∑ k : {k // assigned k = j}, joined k.val) ≤ arms j := by
    intro j
    have he := joined_assignment_load sizes extra host (fun _ => (2 : Fin 3)) j
    change (∑ k : {k // assigned k = j}, joined k.val) = _ at he
    rw [he]
    fin_cases j
    · change (∑ k : {k // host k = 0}, sizes k.val) +
        (∑ k : {k : Fin r // (2 : Fin 3) = 0}, extra k.val) ≤ arms 0
      have hz : IsEmpty {k : Fin r // (2 : Fin 3) = 0} := ⟨fun k => by have h := k.property; contradiction⟩
      have hzsum : (∑ k : {k : Fin r // (2 : Fin 3) = 0}, extra k.val) = 0 := Fintype.sum_empty _
      rw [hzsum, add_zero]
      exact hfit 0
    · change (∑ k : {k // host k = 1}, sizes k.val) +
        (∑ k : {k : Fin r // (2 : Fin 3) = 1}, extra k.val) ≤ arms 1
      have hz : IsEmpty {k : Fin r // (2 : Fin 3) = 1} := ⟨fun k => by have h := k.property; contradiction⟩
      have hzsum : (∑ k : {k : Fin r // (2 : Fin 3) = 1}, extra k.val) = 0 := Fintype.sum_empty _
      rw [hzsum, add_zero]
      exact hfit 1
    · change (∑ k : {k // host k = 2}, sizes k.val) +
        (∑ k : {k : Fin r // (2 : Fin 3) = 2}, extra k.val) ≤ arms 2
      have hz : (∑ k : {k // host k = 2}, sizes k.val) = 0 := Fintype.sum_empty _
      rw [hz,zero_add]
      have hh : (∑ k : {k : Fin r // (2 : Fin 3) = 2}, extra k.val) = ∑ k, extra k := by
        apply Fintype.sum_equiv (Equiv.subtypeUnivEquiv (fun _ : Fin r => rfl))
        intro k
        rfl
      rw [hh]
      exact hefit
  have hjsum : (∑ k, joined k) = (∑ k, sizes k)+(∑ k, extra k) := by
    rw [Fin.sum_univ_add]
    simp [joined, ← finSumFinEquiv_apply_left, ← finSumFinEquiv_apply_right]
  have hjtotal : center+(∑ k, joined k) = 1+∑ j, arms j := by rw [hjsum]; omega
  exact partition_from_assignment arms center joined assigned hjpos hjfit hjtotal



/-- If all noncentral coarse parts exceed the short arm, the central
coarse part can be split and the removed pieces placed on that arm. -/
theorem refine_center_on_short_arm {q r : ℕ} (arms : Fin 3 → ℕ)
    (center : ℕ) (sizes : Fin q → ℕ) (extra : Fin r → ℕ)
    (hpos : ∀ k, 0 < sizes k) (hepos : ∀ k, 0 < extra k)
    (hshort : ∀ k, arms 2 < sizes k)
    (hefit : (∑ k, extra k) ≤ arms 2)
    (hmax : ∀ k, sizes k ≤ center+∑ u, extra u)
    (htotal : center+(∑ k, sizes k)+(∑ u, extra u) = 1+∑ j, arms j)
    (hcoarse : Partitionable arms (Fin.cases (center+∑ u, extra u) sizes)) :
    Partitionable arms (Fin.cases center
      (fun k : Fin (q+r) => Sum.elim sizes extra (finSumFinEquiv.symm k))) := by
  classical
  obtain ⟨host,hfit⟩ := largest_first_to_assignment arms (center+∑ u, extra u) sizes hmax hcoarse
  have hno : IsEmpty {k // host k = 2} := by
    constructor
    rintro ⟨k,hk⟩
    have hu : (⟨k,hk⟩ : {k // host k = 2}) ∈ Finset.univ := Finset.mem_univ _
    have hs : sizes k ≤ ∑ k : {k // host k = 2}, sizes k.val :=
      Finset.single_le_sum (f := fun k : {k // host k = 2} => sizes k.val)
        (fun _ _ => Nat.zero_le _) hu
    have hh := hfit 2
    have hl := hshort k
    omega
  exact append_on_free_short_arm arms center sizes extra host hpos hepos hfit hno hefit htotal


/-- A coarse tripod partition can be refined in every noncentral class
and in the central class when the latter's discarded pieces fit on the
otherwise unused shortest arm. -/
theorem refine_all_parts_with_short_arm {q r s : ℕ} (arms : Fin 3 → ℕ)
    (center : ℕ) (sizes : Fin q → ℕ) (extra : Fin s → ℕ) (group : Fin q → Fin r)
    (hpos : ∀ k, 0 < sizes k) (hepos : ∀ k, 0 < extra k)
    (hshort : ∀ u, arms 2 < ∑ k : {k // group k = u}, sizes k.val)
    (hefit : (∑ k, extra k) ≤ arms 2)
    (hmax : ∀ u, (∑ k : {k // group k = u}, sizes k.val) ≤ center+∑ k, extra k)
    (htotal : center+(∑ k, sizes k)+(∑ k, extra k) = 1+∑ j, arms j)
    (hcoarse : Partitionable arms (Fin.cases (center+∑ k, extra k)
      (fun u => ∑ k : {k // group k = u}, sizes k.val))) :
    Partitionable arms (Fin.cases center
      (fun k : Fin (q+s) => Sum.elim sizes extra (finSumFinEquiv.symm k))) := by
  classical
  let coarse : Fin r → ℕ := fun u => ∑ k : {k // group k = u}, sizes k.val
  obtain ⟨host,hfit⟩ := largest_first_to_assignment arms (center+∑ k, extra k) coarse hmax hcoarse
  have hno : ∀ u, host u ≠ 2 := by
    intro u hu
    have hm : (⟨u,hu⟩ : {u // host u = 2}) ∈ Finset.univ := Finset.mem_univ _
    have hs : coarse u ≤ ∑ u : {u // host u = 2}, coarse u.val :=
      Finset.single_le_sum (f := fun u : {u // host u = 2} => coarse u.val)
        (fun _ _ => Nat.zero_le _) hm
    have hh := hfit 2
    have hl := hshort u
    change arms 2 < coarse u at hl
    omega
  let host' : Fin q → Fin 3 := fun k => host (group k)
  have hf : ∀ j, (∑ k : {k // host' k = j}, sizes k.val) ≤ arms j := by
    intro j
    rw [grouped_arm_sum sizes group host j]
    exact hfit j
  have hz : IsEmpty {k // host' k = 2} := ⟨fun k => hno (group k.val) k.property⟩
  exact append_on_free_short_arm arms center sizes extra host' hpos hepos hf hz hefit htotal

end Hornak
