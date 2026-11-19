module

public import Conjectures.FranklIncidence
public import Conjectures.FranklTreeBall
public import Conjectures.FranklFamilyCanonical

/-! Finite incidence degrees, distinct-union counts, and the girth-to-linearity step.

The ground type need not be assumed finite: three-regularity and a finite
index type imply that every point lies in the finite union of the generators.
All family counts below count distinct unions and include the empty union. -/
@[expose] public section

namespace FranklIncidence

open SimpleGraph FranklTreeBall

variable {α ι : Type*}

def pointNeighborsEquiv (gen : ι → Set α) (a : α) :
    (incidenceGraph gen).neighborSet (.inl a) ≃ {i : ι // a ∈ gen i} where
  toFun v := by
    rcases v with ⟨x | i, h⟩
    · exact h.elim
    · exact ⟨i, h⟩
  invFun i := ⟨.inr i.1, i.2⟩
  left_inv v := by
    rcases v with ⟨x | i, h⟩
    · exact h.elim
    · rfl
  right_inv _ := rfl

def generatorNeighborsEquiv (gen : ι → Set α) (i : ι) :
    (incidenceGraph gen).neighborSet (.inr i) ≃ gen i where
  toFun v := by
    rcases v with ⟨a | j, h⟩
    · exact ⟨a, h⟩
    · exact h.elim
  invFun a := ⟨.inl a.1, a.2⟩
  left_inv v := by
    rcases v with ⟨a | j, h⟩
    · rfl
    · exact h.elim
  right_inv _ := rfl

theorem point_neighbors_card [DecidableEq α] [Fintype ι]
    (gen : ι → Finset α) (a : α) :
    Nat.card ((incidenceGraph (fun i => (gen i : Set α))).neighborSet (.inl a)) =
      (Frankl.Large.incident gen a).card := by
  calc
    _ = Nat.card {i : ι // a ∈ gen i} :=
      Nat.card_congr (pointNeighborsEquiv (fun i => (gen i : Set α)) a)
    _ = _ := Nat.subtype_card (Frankl.Large.incident gen a)
      (fun i => Frankl.Large.mem_incident gen a i)

theorem generator_neighbors_card (gen : ι → Finset α) (i : ι) :
    Nat.card ((incidenceGraph (fun j => (gen j : Set α))).neighborSet (.inr i)) =
      (gen i).card :=
  (Nat.card_congr (generatorNeighborsEquiv (fun j => (gen j : Set α)) i)).trans
    (Nat.card_eq_finsetCard (gen i))

theorem finite_ground_of_three_regular [DecidableEq α] [Fintype ι]
    (gen : ι → Finset α)
    (hregular : ∀ a, (Frankl.Large.incident gen a).card = 3) : Finite α := by
  classical
  let support := Finset.univ.biUnion gen
  have hcover : ∀ a, a ∈ support := by
    intro a
    have hpos : 0 < (Frankl.Large.incident gen a).card := by rw [hregular]; decide
    obtain ⟨i, hi⟩ := Finset.card_pos.mp hpos
    exact Finset.mem_biUnion.mpr
      ⟨i, Finset.mem_univ i, (Frankl.Large.mem_incident gen a i).mp hi⟩
  let _ : Fintype α := ⟨support, hcover⟩
  exact Finite.of_fintype α

theorem mem_family_iff_generated [DecidableEq α] [Fintype ι]
    (gen : ι → Finset α) (U : Finset α) :
    U ∈ FranklLocal.family (Finset.univ.image gen) ↔
      IsGeneratedUnion (fun i => (gen i : Set α)) (U : Set α) := by
  rw [isGeneratedUnion_finset_iff, Frankl.Large.indexed_family]
  simp only [Finset.mem_image, Finset.mem_univ, true_and, Frankl.Large.generated]

noncomputable def finsetFamilyEquivGenerated [DecidableEq α] [Fintype α] [Fintype ι]
    (gen : ι → Finset α) :
    {U : Finset α // U ∈ FranklLocal.family (Finset.univ.image gen)} ≃
      {U : Set α // IsGeneratedUnion (fun i => (gen i : Set α)) U} :=
  Fintype.finsetEquivSet.subtypeEquiv (fun U => mem_family_iff_generated gen U)

noncomputable def absentFinsetFamilyEquivGenerated
    [DecidableEq α] [Fintype α] [Fintype ι] (gen : ι → Finset α) (a : α) :
    {U : Finset α // U ∈ (FranklLocal.family (Finset.univ.image gen)).filter
      (fun U => a ∉ U)} ≃
    {U : {U : Set α // IsGeneratedUnion (fun i => (gen i : Set α)) U} // a ∉ U.1} := by
  let e :
      {U : Finset α // U ∈ (FranklLocal.family (Finset.univ.image gen)).filter
        (fun U => a ∉ U)} ≃
      {U : {U : Finset α // U ∈ FranklLocal.family (Finset.univ.image gen)} // a ∉ U.1} :=
    { toFun := fun U => ⟨⟨U.1, (Finset.mem_filter.mp U.2).1⟩, (Finset.mem_filter.mp U.2).2⟩
      invFun := fun U => ⟨U.1.1, Finset.mem_filter.mpr ⟨U.1.2, U.2⟩⟩
      left_inv := fun _ => rfl
      right_inv := fun _ => rfl }
  exact e.trans ((finsetFamilyEquivGenerated gen).subtypeEquiv (fun _ => Iff.rfl))

theorem family_card_eq_generated [DecidableEq α] [Fintype α] [Fintype ι]
    (gen : ι → Finset α) :
    (FranklLocal.family (Finset.univ.image gen)).card =
      Nat.card {U : Set α // IsGeneratedUnion (fun i => (gen i : Set α)) U} :=
  (Nat.card_eq_finsetCard (FranklLocal.family (Finset.univ.image gen))).symm.trans
    (Nat.card_congr (finsetFamilyEquivGenerated gen))

theorem absent_family_card_eq_generated [DecidableEq α] [Fintype α] [Fintype ι]
    (gen : ι → Finset α) (a : α) :
    ((FranklLocal.family (Finset.univ.image gen)).filter (fun U => a ∉ U)).card =
      Nat.card {U : {U : Set α // IsGeneratedUnion (fun i => (gen i : Set α)) U} //
        a ∉ U.1} :=
  (Nat.card_eq_finsetCard
    ((FranklLocal.family (Finset.univ.image gen)).filter (fun U => a ∉ U))).symm.trans
      (Nat.card_congr (absentFinsetFamilyEquivGenerated gen a))

theorem common_point_unique_of_no_short_cycle (gen : ι → Set α)
    (hg : NoShortCycle (incidenceGraph gen) 16) (i j : ι) (hij : i ≠ j)
    (x y : α) (hxi : x ∈ gen i) (hxj : x ∈ gen j)
    (hyi : y ∈ gen i) (hyj : y ∈ gen j) : x = y := by
  let G := incidenceGraph gen
  let p : G.Walk (.inr i) (.inr j) := .cons hxi (.cons hxj .nil)
  let q : G.Walk (.inr i) (.inr j) := .cons hyi (.cons hyj .nil)
  have hp : p.IsPath := by
    apply (Walk.cons_isPath_iff hxi _).mpr
    exact ⟨Walk.IsPath.of_adj hxj, by simp [hij]⟩
  have hq : q.IsPath := by
    apply (Walk.cons_isPath_iff hyi _).mpr
    exact ⟨Walk.IsPath.of_adj hyj, by simp [hij]⟩
  have hpq := short_paths_unique hg hp hq (by change 2 + 2 < 16; decide)
  have hxy : (Sum.inl x : α ⊕ ι) = Sum.inl y := congrArg Walk.snd hpq
  exact Sum.inl.inj hxy

theorem linear_of_no_short_cycle [DecidableEq α] (gen : ι → Finset α)
    (hg : NoShortCycle (incidenceGraph (fun i => (gen i : Set α))) 16) :
    ∀ i j, i ≠ j → (gen i ∩ gen j).card ≤ 1 := by
  intro i j hij
  apply Finset.card_le_one.mpr
  intro x hx y hy
  obtain ⟨hxi, hxj⟩ := Finset.mem_inter.mp hx
  obtain ⟨hyi, hyj⟩ := Finset.mem_inter.mp hy
  exact common_point_unique_of_no_short_cycle (fun i => (gen i : Set α)) hg
    i j hij x y hxi hxj hyi hyj

end FranklIncidence
