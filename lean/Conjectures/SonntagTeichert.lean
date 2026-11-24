module

public import Mathlib.Data.Finset.Card
public import Mathlib.Data.Finset.Powerset
public import Mathlib.Data.Finset.Max
public import Mathlib.Data.Fintype.Card
public import Mathlib.Data.Fintype.Prod
public import Mathlib.Data.Fintype.Sum
public import Mathlib.Logic.Relation

/-! The original Sonntag–Teichert conjecture on domination hypergraphs
of tournaments. Nontrivial components are represented by a split of the
nonempty edges of the domination hypergraph into two disjoint vertex sides.
The separate classification for oriented graphs is not asserted here. -/

@[expose] public section

namespace SonntagTeichert

variable {V : Type*} [Fintype V] [DecidableEq V]

def Tournament (arc : V → V → Prop) : Prop :=
  ∀ u v, u ≠ v → (arc u v ∨ arc v u) ∧ ¬ (arc u v ∧ arc v u)

def Dominates (arc : V → V → Prop) (D : Finset V) : Prop :=
  ∀ v, ∃ u ∈ D, u = v ∨ arc u v

def MinDominating (arc : V → V → Prop) (D : Finset V) : Prop :=
  Dominates arc D ∧ ∀ E ⊆ D, Dominates arc E → E = D

def HitsSide (arc : V → V → Prop) (X D : Finset V) : Prop :=
  ∀ E ⊆ X, MinDominating arc E → (D ∩ E).Nonempty

def MinHitsSide (arc : V → V → Prop) (X D : Finset V) : Prop :=
  D ⊆ X ∧ HitsSide arc X D ∧ ∀ E ⊆ D, HitsSide arc X E → E = D

noncomputable def closedIn (arc : V → V → Prop) (v : V) : Finset V := by
  classical
  exact Finset.univ.filter (fun u => u = v ∨ arc u v)

@[simp] theorem mem_closedIn (arc : V → V → Prop) (u v : V) :
    u ∈ closedIn arc v ↔ u = v ∨ arc u v := by
  classical
  simp [closedIn]

omit [Fintype V] [DecidableEq V] in
theorem find_min_subset (P : Finset V → Prop) {S : Finset V} (hs : P S) :
    ∃ D, D ⊆ S ∧ P D ∧ ∀ E ⊆ D, P E → E = D := by
  classical
  let B := S.powerset.filter P
  have hB : B.Nonempty := ⟨S, by simp [B, hs]⟩
  obtain ⟨D, hD, hmin⟩ := Finset.exists_min_image B Finset.card hB
  have hd : D ⊆ S ∧ P D := by simpa [B] using hD
  refine ⟨D, hd.1, hd.2, fun E hED hE => ?_⟩
  apply Finset.eq_of_subset_of_card_le hED
  apply hmin
  simpa [B] using And.intro (hED.trans hd.1) hE

theorem closedIn_hits {arc : V → V → Prop} (v : V) (X : Finset V) :
    HitsSide arc X (closedIn arc v) := by
  intro E _ hE
  obtain ⟨u, hu, h⟩ := hE.1 v
  exact ⟨u, Finset.mem_inter.2 ⟨(mem_closedIn arc u v).2 h, hu⟩⟩

theorem contains_closedIn {arc : V → V → Prop} {D : Finset V}
    (hD : HitsSide arc Finset.univ D) : ∃ v, closedIn arc v ⊆ D := by
  classical
  by_contra hnone
  let E := Finset.univ \ D
  have hE : Dominates arc E := by
    intro v
    have hx : ¬ closedIn arc v ⊆ D := fun h => hnone ⟨v, h⟩
    obtain ⟨u, hu, huD⟩ := Finset.not_subset.1 hx
    exact ⟨u, by simp [E, huD], (mem_closedIn arc u v).1 hu⟩
  obtain ⟨M, hME, hM, hMin⟩ := find_min_subset (Dominates arc) hE
  obtain ⟨u, hu⟩ := hD M (Finset.subset_univ M) ⟨hM, hMin⟩
  have huD := (Finset.mem_inter.1 hu).1
  have huE := hME (Finset.mem_inter.1 hu).2
  have hnu : u ∉ D := by simpa [E] using huE
  exact hnu huD

omit [Fintype V] in
theorem minHits_of_hits {arc : V → V → Prop} {X D : Finset V}
    (hDX : D ⊆ X) (hD : HitsSide arc X D) :
    ∃ E, E ⊆ D ∧ MinHitsSide arc X E := by
  obtain ⟨E, hED, hE, hmin⟩ := find_min_subset (HitsSide arc X) hD
  exact ⟨E, hED, hED.trans hDX, hE, hmin⟩

theorem closedIn_union_minHits {arc : V → V → Prop} {X Y A B : Finset V}
    (hXY : Disjoint X Y) (hA : MinHitsSide arc X A) (hB : MinHitsSide arc Y B)
    (hpartition : ∀ E, MinDominating arc E → E ⊆ X ∨ E ⊆ Y) :
    ∃ v, closedIn arc v = A ∪ B := by
  have hcross : HitsSide arc Finset.univ (A ∪ B) := by
    intro E _ hE
    rcases hpartition E hE with hEX | hEY
    · obtain ⟨u, hu⟩ := hA.2.1 E hEX hE
      obtain ⟨huA, huE⟩ := Finset.mem_inter.1 hu
      exact ⟨u, Finset.mem_inter.2 ⟨Finset.mem_union.2 (Or.inl huA), huE⟩⟩
    · obtain ⟨u, hu⟩ := hB.2.1 E hEY hE
      obtain ⟨huB, huE⟩ := Finset.mem_inter.1 hu
      exact ⟨u, Finset.mem_inter.2 ⟨Finset.mem_union.2 (Or.inr huB), huE⟩⟩
  obtain ⟨v, hv⟩ := contains_closedIn hcross
  let I := closedIn arc v
  change I ⊆ A ∪ B at hv
  have hIA : HitsSide arc X (I ∩ A) := by
    intro E hEX hE
    obtain ⟨u, hu⟩ := closedIn_hits v X E hEX hE
    obtain ⟨huI, huE⟩ := Finset.mem_inter.1 hu
    have huA : u ∈ A := (Finset.mem_union.1 (hv huI)).resolve_right
      (fun huB => Finset.disjoint_left.1 hXY (hEX huE) (hB.1 huB))
    exact ⟨u, Finset.mem_inter.2 ⟨Finset.mem_inter.2 ⟨huI, huA⟩, huE⟩⟩
  have hIB : HitsSide arc Y (I ∩ B) := by
    intro E hEY hE
    obtain ⟨u, hu⟩ := closedIn_hits v Y E hEY hE
    obtain ⟨huI, huE⟩ := Finset.mem_inter.1 hu
    have huB : u ∈ B := (Finset.mem_union.1 (hv huI)).resolve_left
      (fun huA => Finset.disjoint_left.1 hXY (hA.1 huA) (hEY huE))
    exact ⟨u, Finset.mem_inter.2 ⟨Finset.mem_inter.2 ⟨huI, huB⟩, huE⟩⟩
  have ha : I ∩ A = A := hA.2.2 _ Finset.inter_subset_right hIA
  have hb : I ∩ B = B := hB.2.2 _ Finset.inter_subset_right hIB
  exact ⟨v, Finset.Subset.antisymm hv (by
    intro u hu
    rcases Finset.mem_union.1 hu with hu | hu
    · exact (Finset.mem_inter.1 (ha.symm ▸ hu)).1
    · exact (Finset.mem_inter.1 (hb.symm ▸ hu)).1)⟩

omit [Fintype V] in
theorem no_singleton_dominates_of_split {arc : V → V → Prop} {X Y : Finset V}
    (hT : Tournament arc) (hXY : Disjoint X Y)
    (hX : ∃ E ⊆ X, MinDominating arc E)
    (hY : ∃ E ⊆ Y, MinDominating arc E) :
    ∀ v, ¬ Dominates arc {v} := by
  intro v h
  have hmust : ∀ D, Dominates arc D → v ∈ D := by
    intro D hD
    obtain ⟨u, hu, huv⟩ := hD v
    rcases huv with rfl | huv
    · exact hu
    · by_cases he : u = v
      · simpa [he] using hu
      obtain ⟨w, hw, hwu⟩ := h u
      have hwv : w = v := Finset.mem_singleton.1 hw
      have hvu : arc v u := by
        subst w
        exact hwu.resolve_left (Ne.symm he)
      exact False.elim ((hT u v he).2 ⟨huv, hvu⟩)
  obtain ⟨E, hEX, hE⟩ := hX
  obtain ⟨F, hFY, hF⟩ := hY
  exact Finset.disjoint_left.1 hXY (hEX (hmust E hE.1)) (hFY (hmust F hF.1))

theorem side_omits {arc : V → V → Prop}
    (hno : ∀ v, ¬ Dominates arc {v}) (X : Finset V) (u : V) :
    ∃ A, MinHitsSide arc X A ∧ u ∉ A := by
  classical
  by_contra hall
  apply hno u
  intro v
  let D := closedIn arc v ∩ X
  have hD : HitsSide arc X D := by
    intro E hEX hE
    obtain ⟨a, ha⟩ := closedIn_hits v X E hEX hE
    obtain ⟨haI, haE⟩ := Finset.mem_inter.1 ha
    exact ⟨a, Finset.mem_inter.2 ⟨Finset.mem_inter.2 ⟨haI, hEX haE⟩, haE⟩⟩
  obtain ⟨M, hMD, hM⟩ := minHits_of_hits Finset.inter_subset_right hD
  have huM : u ∈ M := by
    by_contra hn
    exact hall ⟨M, hM, hn⟩
  exact ⟨u, Finset.mem_singleton_self u, (mem_closedIn arc u v).1
    (Finset.mem_inter.1 (hMD huM)).1⟩

noncomputable def sides (arc : V → V → Prop) (X : Finset V) : Finset (Finset V) := by
  classical
  exact X.powerset.filter (MinHitsSide arc X)

omit [Fintype V] in
@[simp] theorem mem_sides {arc : V → V → Prop} {X A : Finset V} :
    A ∈ sides arc X ↔ MinHitsSide arc X A := by
  classical
  unfold sides
  rw [Finset.mem_filter]
  exact ⟨And.right, fun h => ⟨Finset.mem_powerset.2 h.1, h⟩⟩

theorem sides_card_lower {arc : V → V → Prop} (hno : ∀ v, ¬ Dominates arc {v})
    {X : Finset V} {E : Finset V} (hEX : E ⊆ X) (hE : MinDominating arc E)
    (hEn : E.Nonempty) : 2 ≤ (sides arc X).card := by
  have hX : HitsSide arc X X := by
    intro D hDX hD
    obtain ⟨v, _⟩ := hEn
    obtain ⟨u, huD, _⟩ := hD.1 v
    exact ⟨u, Finset.mem_inter.2 ⟨hDX huD, huD⟩⟩
  obtain ⟨A, _, hA⟩ := minHits_of_hits (fun _ h => h) hX
  obtain ⟨u, hu⟩ := hA.2.1 E hEX hE
  obtain ⟨B, hB, huB⟩ := side_omits hno X u
  have huA := (Finset.mem_inter.1 hu).1
  have hne : A ≠ B := by
    intro h
    exact huB (h ▸ huA)
  have hcard := Finset.one_lt_card.2 ⟨A, mem_sides.2 hA, B, mem_sides.2 hB, hne⟩
  omega

omit [Fintype V] in
theorem union_same_left {X Y A B C : Finset V} (hXY : Disjoint X Y)
    (hA : A ⊆ X) (hB : B ⊆ Y) (hC : C ⊆ Y)
    (he : A ∪ B = A ∪ C) : B = C := by
  ext v
  constructor
  · intro hv
    have h : v ∈ A ∪ C := he ▸ Finset.mem_union.2 (Or.inr hv)
    exact (Finset.mem_union.1 h).resolve_left
      (fun hvA => Finset.disjoint_left.1 hXY (hA hvA) (hB hv))
  · intro hv
    have h : v ∈ A ∪ B := he.symm ▸ Finset.mem_union.2 (Or.inr hv)
    exact (Finset.mem_union.1 h).resolve_left
      (fun hvA => Finset.disjoint_left.1 hXY (hA hvA) (hC hv))

theorem sides_card_upper {arc : V → V → Prop} (hT : Tournament arc)
    {X Y : Finset V} (hXY : Disjoint X Y)
    (hpartition : ∀ D, MinDominating arc D → D ⊆ X ∨ D ⊆ Y) :
    (sides arc X).card * (sides arc Y).card ≤ (sides arc X).card + (sides arc Y).card := by
  classical
  let L := ↥(sides arc X)
  let R := ↥(sides arc Y)
  have hp (i : L) (j : R) : ∃ v, closedIn arc v = i.val ∪ j.val :=
    closedIn_union_minHits hXY (mem_sides.1 i.property) (mem_sides.1 j.property) hpartition
  let w : L → R → V := fun i j => Classical.choose (hp i j)
  have hw (i : L) (j : R) : closedIn arc (w i j) = i.val ∪ j.val :=
    Classical.choose_spec (hp i j)
  have hself (i : L) (j : R) : w i j ∈ i.val ∪ j.val := by
    rw [← hw]
    exact (mem_closedIn _ _ _).2 (Or.inl rfl)
  have hrow (i : L) (j : R) (h : w i j ∈ X) : w i j ∈ i.val :=
    (Finset.mem_union.1 (hself i j)).resolve_right (fun hm =>
      Finset.disjoint_left.1 hXY h ((mem_sides.1 j.property).1 hm))
  have hcol (i : L) (j : R) (h : w i j ∉ X) : w i j ∈ j.val :=
    (Finset.mem_union.1 (hself i j)).resolve_left (fun hm => h ((mem_sides.1 i.property).1 hm))
  have hcenters {u v : V} (hu : u ∈ closedIn arc v) (hv : v ∈ closedIn arc u) : u = v := by
    by_contra he
    exact (hT u v he).2 ⟨((mem_closedIn _ _ _).1 hu).resolve_left he,
      ((mem_closedIn _ _ _).1 hv).resolve_left (Ne.symm he)⟩
  let f : L × R → L ⊕ R := fun r =>
    if w r.1 r.2 ∈ X then Sum.inl r.1 else Sum.inr r.2
  have hf : Function.Injective f := by
    rintro ⟨i, j⟩ ⟨i', j'⟩ he
    change (if w i j ∈ X then Sum.inl i else Sum.inr j) =
      (if w i' j' ∈ X then Sum.inl i' else Sum.inr j') at he
    by_cases h : w i j ∈ X <;> by_cases h' : w i' j' ∈ X
    · rw [ite_eq_left h, ite_eq_left h'] at he
      have hi : i = i' := Sum.inl.inj he
      subst i'
      have hc : w i j = w i j' := hcenters
        (by rw [hw]; exact Finset.mem_union.2 (Or.inl (hrow _ _ h)))
        (by rw [hw]; exact Finset.mem_union.2 (Or.inl (hrow _ _ h')))
      have hu : i.val ∪ j.val = i.val ∪ j'.val := by
        rw [← hw i j, ← hw i j', hc]
      have hj : j = j' := Subtype.ext (union_same_left hXY
        (mem_sides.1 i.property).1 (mem_sides.1 j.property).1 (mem_sides.1 j'.property).1 hu)
      exact Prod.ext rfl hj
    · rw [ite_eq_left h, ite_eq_right h'] at he
      contradiction
    · rw [ite_eq_right h, ite_eq_left h'] at he
      contradiction
    · rw [ite_eq_right h, ite_eq_right h'] at he
      have hj : j = j' := Sum.inr.inj he
      subst j'
      have hc : w i j = w i' j := hcenters
        (by rw [hw]; exact Finset.mem_union.2 (Or.inr (hcol _ _ h)))
        (by rw [hw]; exact Finset.mem_union.2 (Or.inr (hcol _ _ h')))
      have hu : j.val ∪ i.val = j.val ∪ i'.val := by
        rw [Finset.union_comm j.val i.val, Finset.union_comm j.val i'.val,
          ← hw i j, ← hw i' j, hc]
      have hi : i = i' := Subtype.ext (union_same_left hXY.symm
        (mem_sides.1 j.property).1 (mem_sides.1 i.property).1 (mem_sides.1 i'.property).1 hu)
      exact Prod.ext hi rfl
  have hc := Fintype.card_le_of_injective f hf
  rw [Fintype.card_prod, Fintype.card_sum] at hc
  simpa only [L, R, Fintype.card_coe] using hc

theorem two_sides_disjoint {arc : V → V → Prop} (hno : ∀ v, ¬ Dominates arc {v})
    {X : Finset V} (hcard : (sides arc X).card = 2) :
    ∃ A B, MinHitsSide arc X A ∧ MinHitsSide arc X B ∧ Disjoint A B := by
  classical
  obtain ⟨A, hA, B, hB, hne⟩ := Finset.one_lt_card.1 (by omega :
    1 < (sides arc X).card)
  have hsub : {A, B} ⊆ sides arc X := by
    intro C hC
    rcases Finset.mem_insert.1 hC with h | h
    · exact h.symm ▸ hA
    · exact (Finset.mem_singleton.1 h).symm ▸ hB
  have he : {A, B} = sides arc X := Finset.eq_of_subset_of_card_le hsub (by
    rw [hcard]
    simp [hne])
  refine ⟨A, B, mem_sides.1 hA, mem_sides.1 hB, Finset.disjoint_left.2 ?_⟩
  intro u huA huB
  obtain ⟨C, hC, huC⟩ := side_omits hno X u
  have hc : C ∈ {A, B} := he.symm ▸ mem_sides.2 hC
  rcases Finset.mem_insert.1 hc with h | h
  · exact huC (h.symm ▸ huA)
  · exact huC ((Finset.mem_singleton.1 h).symm ▸ huB)

theorem closedIn_intersect {arc : V → V → Prop} (hT : Tournament arc) (u v : V) :
    (closedIn arc u ∩ closedIn arc v).Nonempty := by
  by_cases he : u = v
  · subst v
    exact ⟨u, Finset.mem_inter.2 ⟨(mem_closedIn _ _ _).2 (Or.inl rfl),
      (mem_closedIn _ _ _).2 (Or.inl rfl)⟩⟩
  rcases (hT u v he).1 with h | h
  · exact ⟨u, Finset.mem_inter.2 ⟨(mem_closedIn _ _ _).2 (Or.inl rfl),
      (mem_closedIn _ _ _).2 (Or.inr h)⟩⟩
  · exact ⟨v, Finset.mem_inter.2 ⟨(mem_closedIn _ _ _).2 (Or.inr h),
      (mem_closedIn _ _ _).2 (Or.inl rfl)⟩⟩

/-- No two disjoint sides can each contain a nonempty edge and jointly
contain all edges. This is connectedness after removing isolated vertices. -/
theorem sonntag_teichert_conjecture {arc : V → V → Prop} (hT : Tournament arc)
    (X Y : Finset V) (hXY : Disjoint X Y)
    (hpartition : ∀ E, MinDominating arc E → E ⊆ X ∨ E ⊆ Y) :
    ¬ ((∃ E ⊆ X, E.Nonempty ∧ MinDominating arc E) ∧
      (∃ E ⊆ Y, E.Nonempty ∧ MinDominating arc E)) := by
  rintro ⟨⟨E, hEX, hEn, hE⟩, ⟨F, hFY, hFn, hF⟩⟩
  have hno := no_singleton_dominates_of_split hT hXY ⟨E, hEX, hE⟩ ⟨F, hFY, hF⟩
  let p := (sides arc X).card
  let q := (sides arc Y).card
  have hp : 2 ≤ p := sides_card_lower hno hEX hE hEn
  have hq : 2 ≤ q := sides_card_lower hno hFY hF hFn
  have hprod : p * q ≤ p + q := sides_card_upper hT hXY hpartition
  have he : (p - 2 + 2) * (q - 2 + 2) ≤ (p - 2 + 2) + (q - 2 + 2) := by
    simpa only [Nat.sub_add_cancel hp, Nat.sub_add_cancel hq] using hprod
  simp only [Nat.add_mul, Nat.mul_add] at he
  have hp2 : p = 2 := by omega
  have hq2 : q = 2 := by omega
  obtain ⟨A, A', hA, hA', hAd⟩ := two_sides_disjoint hno hp2
  obtain ⟨B, B', hB, hB', hBd⟩ := two_sides_disjoint hno hq2
  obtain ⟨u, hu⟩ := closedIn_union_minHits hXY hA hB hpartition
  obtain ⟨v, hv⟩ := closedIn_union_minHits hXY hA' hB' hpartition
  obtain ⟨a, ha⟩ := closedIn_intersect hT u v
  rw [hu, hv, Finset.mem_inter] at ha
  rcases Finset.mem_union.1 ha.1 with h | h <;>
    rcases Finset.mem_union.1 ha.2 with h' | h'
  · exact Finset.disjoint_left.1 hAd h h'
  · exact Finset.disjoint_left.1 hXY (hA.1 h) (hB'.1 h')
  · exact Finset.disjoint_left.1 hXY (hA'.1 h') (hB.1 h)
  · exact Finset.disjoint_left.1 hBd h h'

/-- Adjacency in the two-section of the actual domination hypergraph. -/
def AdjacentByEdge (arc : V → V → Prop) (u v : V) : Prop :=
  ∃ E, MinDominating arc E ∧ u ∈ E ∧ v ∈ E

/-- Connectivity in the literal domination hypergraph on its nonisolated
vertices. A singleton edge is allowed and is harmless. -/
theorem domination_hypergraph_connected_on_support {arc : V → V → Prop}
    (hT : Tournament arc) {x y : V}
    (hx : ∃ E, MinDominating arc E ∧ x ∈ E)
    (hy : ∃ E, MinDominating arc E ∧ y ∈ E) :
    Relation.ReflTransGen (AdjacentByEdge arc) x y := by
  classical
  by_contra hxy
  let Reach := Relation.ReflTransGen (AdjacentByEdge arc) x
  let X : Finset V := Finset.univ.filter Reach
  let Y : Finset V := Finset.univ \ X
  have hmemX (v : V) : v ∈ X ↔ Reach v := by simp [X]
  have hmemY (v : V) : v ∈ Y ↔ v ∉ X := by simp [Y]
  have hXx : x ∈ X := (hmemX x).2 Relation.ReflTransGen.refl
  have hYy : y ∈ Y := (hmemY y).2 (fun h => hxy ((hmemX y).1 h))
  have hdisj : Disjoint X Y := Finset.disjoint_left.2 (by
    intro v hX hY
    exact (hmemY v).1 hY hX)
  have hpart (E : Finset V) (hE : MinDominating arc E) : E ⊆ X ∨ E ⊆ Y := by
    by_cases h : E ⊆ X
    · exact Or.inl h
    · right
      obtain ⟨v, hvE, hvX⟩ := Finset.not_subset.1 h
      exact fun u huE => (hmemY u).2 (fun huX => hvX ((hmemX v).2
        (Relation.ReflTransGen.tail ((hmemX u).1 huX) ⟨E, hE, huE, hvE⟩)))
  obtain ⟨E, hE, hxE⟩ := hx
  obtain ⟨F, hF, hyF⟩ := hy
  have hEX : E ⊆ X := (hpart E hE).resolve_right (fun h => (hmemY _).1 (h hxE) hXx)
  have hFY : F ⊆ Y := (hpart F hF).resolve_left (fun h => (hmemY _).1 hYy (h hyF))
  exact sonntag_teichert_conjecture hT X Y hdisj hpart
    ⟨⟨E, hEX, ⟨x, hxE⟩, hE⟩, ⟨F, hFY, ⟨y, hyF⟩, hF⟩⟩

#print axioms domination_hypergraph_connected_on_support

end SonntagTeichert
