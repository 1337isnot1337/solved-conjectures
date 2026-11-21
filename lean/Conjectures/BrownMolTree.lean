import Mathlib.Combinatorics.SimpleGraph.Connectivity.Connected
import Mathlib.Combinatorics.SimpleGraph.Acyclic
import Mathlib.Data.Fintype.Powerset
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Data.Fintype.BigOperators

/-!
Literal diameter-four tree and subtree enumeration. The graph has a central
vertex, r hubs and four leaves per hub. `subtree_sum` counts its actual
nonempty connected induced vertex sets, for every branch count.
-/

namespace BrownTree
abbrev Vertex (r : ℕ) := Option (Fin r × Option (Fin 4))

def center {r : ℕ} : Vertex r := none
def hub {r : ℕ} (i : Fin r) : Vertex r := some (i,none)
def leaf {r : ℕ} (i : Fin r) (j : Fin 4) : Vertex r := some (i,some j)

def adj {r : ℕ} : Vertex r → Vertex r → Prop
  | none, some (_,none) => True
  | some (_,none), none => True
  | some (i,none), some (j,some _) => i = j
  | some (i,some _), some (j,none) => i = j
  | _, _ => False

def graph (r : ℕ) : SimpleGraph (Vertex r) where
  Adj := adj
  symm := by
    constructor
    intro x y h
    cases x with
    | none => cases y with
      | none => simp [adj] at h
      | some y => rcases y with ⟨i,j⟩; cases j <;> simp_all [adj]
    | some x =>
      rcases x with ⟨i,j⟩
      cases j <;> cases y with
      | none => simp_all [adj]
      | some y => rcases y with ⟨k,l⟩; cases l <;> simp_all [adj]
  loopless := by
    constructor
    intro x
    cases x with
    | none => simp [adj]
    | some x => rcases x with ⟨i,j⟩; cases j <;> simp [adj]

def step {r : ℕ} (s : Finset (Vertex r)) (x y : Vertex r) : Prop :=
  x ∈ s ∧ y ∈ s ∧ adj x y

def connected {r : ℕ} (s : Finset (Vertex r)) : Prop :=
  s.Nonempty ∧ ∀ x ∈ s, ∀ y ∈ s, Relation.ReflTransGen (step s) x y

theorem card_vertices (r : ℕ) : Fintype.card (Vertex r) = 5*r+1 := by
  simp [Vertex, Fintype.card_option, Fintype.card_prod]
  omega

theorem path_to_induced {r : ℕ} (s : Finset (Vertex r)) (x y : Vertex r)
    (hx : x ∈ s) (hy : y ∈ s) (h : Relation.ReflTransGen (step s) x y) :
    Relation.ReflTransGen ((graph r).induce (s : Set (Vertex r))).Adj ⟨x,hx⟩ ⟨y,hy⟩ := by
  induction h with
  | refl => rfl
  | @tail z y hpath hstep ih =>
    have hz : z ∈ s := hstep.1
    have hind := ih hz
    exact hind.tail hstep.2.2

theorem path_from_induced {r : ℕ} (s : Finset (Vertex r)) (x y : {v // v ∈ s})
    (h : Relation.ReflTransGen ((graph r).induce (s : Set (Vertex r))).Adj x y) :
    Relation.ReflTransGen (step s) x.val y.val := by
  induction h with
  | refl => rfl
  | @tail z y hpath hstep ih =>
    exact ih.tail ⟨z.property, y.property, hstep⟩

theorem connected_iff_induced_connected {r : ℕ} (s : Finset (Vertex r)) :
    connected s ↔ ((graph r).induce (s : Set (Vertex r))).Connected := by
  rw [SimpleGraph.connected_iff]
  constructor
  · rintro ⟨⟨v,hv⟩,hconn⟩
    constructor
    · intro x y
      apply (SimpleGraph.reachable_iff_reflTransGen x y).mpr
      exact path_to_induced s x.val y.val x.property y.property (hconn x.val x.property y.val y.property)
    · exact ⟨⟨v,hv⟩⟩
  · rintro ⟨hconn,⟨⟨v,hv⟩⟩⟩
    refine ⟨⟨v,hv⟩,?_⟩
    intro x hx y hy
    let x' : {v // v ∈ s} := ⟨x,hx⟩
    let y' : {v // v ∈ s} := ⟨y,hy⟩
    have hp := (SimpleGraph.reachable_iff_reflTransGen x' y').mp (hconn x' y')
    exact path_from_induced s x' y' hp

theorem leaf_adj_iff {r : ℕ} (i : Fin r) (j : Fin 4) (v : Vertex r) :
    adj (leaf i j) v ↔ v = hub i := by
  cases v with
  | none => simp [adj, leaf, hub]
  | some v =>
    rcases v with ⟨k,l⟩
    cases l <;> simp [adj, leaf, hub, eq_comm]

theorem isolated_leaf_path {r : ℕ} (s : Finset (Vertex r)) (i : Fin r) (j : Fin 4)
    (hno : hub i ∉ s) (v : Vertex r)
    (hp : Relation.ReflTransGen (step s) (leaf i j) v) : v = leaf i j := by
  induction hp with
  | refl => rfl
  | @tail z v hp he ih =>
    subst z
    have hv := (leaf_adj_iff i j v).mp he.2.2
    subst v
    exact False.elim (hno he.2.1)

theorem center_leaf_requires_hub {r : ℕ} (s : Finset (Vertex r))
    (hs : connected s) (hc : center ∈ s) (i : Fin r) (j : Fin 4) (hl : leaf i j ∈ s) :
    hub i ∈ s := by
  by_contra hno
  have hp := hs.2 (leaf i j) hl center hc
  have heq := isolated_leaf_path s i j hno center hp
  simp [center, leaf] at heq

theorem center_closed_connected {r : ℕ} (s : Finset (Vertex r)) (hc : center ∈ s)
    (hclosed : ∀ i j, leaf i j ∈ s → hub i ∈ s) : connected s := by
  have hpath : ∀ v ∈ s, Relation.ReflTransGen (step s) v center := by
    intro v hv
    cases v with
    | none => rfl
    | some v =>
      rcases v with ⟨i,j⟩
      cases j with
      | none =>
        exact Relation.ReflTransGen.single ⟨hv,hc,by simp [adj, center]⟩
      | some j =>
        have hh : hub i ∈ s := hclosed i j hv
        have h1 : step s (leaf i j) (hub i) := ⟨hv,hh,by simp [adj, leaf, hub]⟩
        have h2 : step s (hub i) center := ⟨hh,hc,by simp [adj, hub, center]⟩
        exact (Relation.ReflTransGen.single h1).tail h2
  refine ⟨⟨center,hc⟩,?_⟩
  intro x hx y hy
  have hsym : Function.swap (step s) ≤ step s :=
    fun a b h => ⟨h.2.1,h.1,(graph r).symm.symm b a h.2.2⟩
  have hrev : Relation.ReflTransGen (step s) center y :=
    (Relation.ReflTransGen.mono hsym) _ _ (hpath y hy).swap
  exact (hpath x hx).trans hrev

theorem center_connected_iff {r : ℕ} (s : Finset (Vertex r)) (hc : center ∈ s) :
    connected s ↔ ∀ i j, leaf i j ∈ s → hub i ∈ s := by
  constructor
  · intro hs i j hl
    exact center_leaf_requires_hub s hs hc i j hl
  · exact center_closed_connected s hc

theorem graph_connected (r : ℕ) : (graph r).Connected := by
  have hc : center ∈ (Finset.univ : Finset (Vertex r)) := Finset.mem_univ _
  have h := center_closed_connected (Finset.univ : Finset (Vertex r)) hc (by simp)
  rw [SimpleGraph.connected_iff]
  constructor
  · intro x y
    apply (SimpleGraph.reachable_iff_reflTransGen x y).mpr
    have hm : step (Finset.univ : Finset (Vertex r)) ≤ (graph r).Adj := fun _ _ ht => ht.2.2
    exact (Relation.ReflTransGen.mono hm) _ _ (h.2 x (Finset.mem_univ _) y (Finset.mem_univ _))
  · exact ⟨center⟩

def hubEdge {r : ℕ} (i : Fin r) : Sym2 (Vertex r) := s(center,hub i)
def leafEdge {r : ℕ} (p : Fin r × Fin 4) : Sym2 (Vertex r) := s(hub p.1,leaf p.1 p.2)

theorem hubEdge_injective {r : ℕ} : Function.Injective (@hubEdge r) := by
  intro i j h
  rw [hubEdge, hubEdge] at h
  simp [center, hub] at h
  exact h

theorem leafEdge_injective {r : ℕ} : Function.Injective (@leafEdge r) := by
  rintro ⟨i,j⟩ ⟨k,l⟩ h
  rw [leafEdge, leafEdge] at h
  simp [hub, leaf] at h
  exact Prod.ext h.1 h.2

theorem edge_types_disjoint (r : ℕ) :
    Disjoint (Finset.univ.image (@hubEdge r)) (Finset.univ.image (@leafEdge r)) := by
  classical
  apply Finset.disjoint_left.mpr
  intro e he1 he2
  obtain ⟨i,_,rfl⟩ := Finset.mem_image.mp he1
  obtain ⟨⟨k,l⟩,_,he⟩ := Finset.mem_image.mp he2
  rw [hubEdge, leafEdge] at he
  simp [center, hub, leaf] at he

noncomputable def edges (r : ℕ) : Finset (Sym2 (Vertex r)) := by
  classical
  exact (graph r).edgeFinset

theorem edges_explicit (r : ℕ) :
    edges r = Finset.univ.image (@hubEdge r) ∪ Finset.univ.image (@leafEdge r) := by
  classical
  ext e
  induction e using Sym2.ind with
  | _ x y =>
    change _ ∈ (graph r).edgeFinset ↔ _
    rw [SimpleGraph.mem_edgeFinset, SimpleGraph.mem_edgeSet]
    change adj x y ↔ _
    cases x with
    | none =>
      cases y with
      | none => simp [adj, hubEdge, leafEdge, center, hub, leaf]
      | some y =>
        rcases y with ⟨i,j⟩
        cases j with
        | none => simp [adj, hubEdge, leafEdge, center, hub, leaf]
        | some j => simp [adj, hubEdge, leafEdge, center, hub, leaf]
    | some x =>
      rcases x with ⟨i,j⟩
      cases j with
      | none =>
        cases y with
        | none => simp [adj, hubEdge, leafEdge, center, hub, leaf]
        | some y =>
          rcases y with ⟨k,l⟩
          cases l with
          | none => simp [adj, hubEdge, leafEdge, center, hub, leaf]
          | some l => simp [adj, hubEdge, leafEdge, center, hub, leaf, eq_comm]
      | some j =>
        cases y with
        | none => simp [adj, hubEdge, leafEdge, center, hub, leaf]
        | some y =>
          rcases y with ⟨k,l⟩
          cases l with
          | none => simp [adj, hubEdge, leafEdge, center, hub, leaf, eq_comm]
          | some l => simp [adj, hubEdge, leafEdge, center, hub, leaf]

theorem edges_card (r : ℕ) : (edges r).card = 5*r := by
  classical
  rw [edges_explicit, Finset.card_union_of_disjoint (edge_types_disjoint r),
    Finset.card_image_of_injective _ hubEdge_injective,
    Finset.card_image_of_injective _ leafEdge_injective]
  simp [Fintype.card_prod]
  omega

theorem graph_isTree (r : ℕ) : (graph r).IsTree := by
  classical
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · exact graph_connected r
  · rw [Nat.card_eq_fintype_card, Nat.card_eq_fintype_card]
    rw [← SimpleGraph.edgeFinset_card]
    change (edges r).card + 1 = Fintype.card (Vertex r)
    rw [edges_card, card_vertices]

def branch {r : ℕ} : Vertex r → Option (Fin r)
  | none => none
  | some (i,_) => some i

theorem adj_same_branch {r : ℕ} (x y : Vertex r)
    (hx : x ≠ center) (hy : y ≠ center) (h : adj x y) : branch x = branch y := by
  cases x with
  | none => exact False.elim (hx rfl)
  | some x =>
    rcases x with ⟨i,j⟩
    cases y with
    | none => exact False.elim (hy rfl)
    | some y =>
      rcases y with ⟨k,l⟩
      cases j <;> cases l <;> simp_all [adj, branch]

theorem path_same_branch {r : ℕ} (s : Finset (Vertex r)) (hcenter : center ∉ s)
    (x y : Vertex r) (hp : Relation.ReflTransGen (step s) x y) : branch x = branch y := by
  induction hp with
  | refl => rfl
  | @tail z y hp he ih =>
    have hz : z ≠ center := by intro h; subst z; exact hcenter he.1
    have hy : y ≠ center := by intro h; subst y; exact hcenter he.2.1
    exact ih.trans (adj_same_branch z y hz hy he.2.2)

theorem no_center_one_branch {r : ℕ} (s : Finset (Vertex r)) (hs : connected s)
    (hcenter : center ∉ s) (i : Fin r) (hh : hub i ∈ s) :
    ∀ v ∈ s, branch v = some i := by
  intro v hv
  have heq := path_same_branch s hcenter (hub i) v (hs.2 (hub i) hh v hv)
  simpa [branch, hub] using heq.symm

theorem connected_no_hubs_singleton {r : ℕ} (s : Finset (Vertex r)) (hs : connected s)
    (hcenter : center ∉ s) (hno : ∀ i, hub i ∉ s) : s.card = 1 := by
  obtain ⟨v,hv⟩ := hs.1
  cases v with
  | none => exact False.elim (hcenter hv)
  | some v =>
    rcases v with ⟨i,j⟩
    cases j with
    | none => exact False.elim (hno i hv)
    | some j =>
      have heq : s = {leaf i j} := by
        apply Finset.Subset.antisymm
        · intro w hw
          have hp := hs.2 (leaf i j) hv w hw
          have he := isolated_leaf_path s i j (hno i) w hp
          simp [he]
        · exact Finset.singleton_subset_iff.mpr (show leaf i j ∈ s from hv)
      simp [heq]

def branchVertices {r : ℕ} (i : Fin r) : Finset (Vertex r) :=
  insert (hub i) (Finset.univ.image (leaf i))

theorem branch_eq_iff {r : ℕ} (i : Fin r) (v : Vertex r) :
    branch v = some i ↔ v ∈ branchVertices i := by
  cases v with
  | none => simp [branch, branchVertices, hub, leaf]
  | some v =>
    rcases v with ⟨k,l⟩
    cases l <;> simp [branch, branchVertices, hub, leaf, eq_comm]

theorem branch_connected {r : ℕ} (s : Finset (Vertex r)) (i : Fin r)
    (hh : hub i ∈ s) (hsub : s ⊆ branchVertices i) : connected s := by
  have hpath : ∀ v ∈ s, Relation.ReflTransGen (step s) v (hub i) := by
    intro v hv
    have hvb := hsub hv
    simp only [branchVertices, Finset.mem_insert, Finset.mem_image, Finset.mem_univ, true_and] at hvb
    rcases hvb with he | ⟨j,rfl⟩
    · subst v
      rfl
    · exact Relation.ReflTransGen.single ⟨hv,hh,by simp [adj,leaf,hub]⟩
  refine ⟨⟨hub i,hh⟩,?_⟩
  intro x hx y hy
  have hsym : Function.swap (step s) ≤ step s :=
    fun a b h => ⟨h.2.1,h.1,(graph r).symm.symm b a h.2.2⟩
  exact (hpath x hx).trans ((Relation.ReflTransGen.mono hsym) _ _ (hpath y hy).swap)

theorem no_center_hub_iff {r : ℕ} (s : Finset (Vertex r)) (i : Fin r)
    (hcenter : center ∉ s) (hh : hub i ∈ s) : connected s ↔ s ⊆ branchVertices i := by
  constructor
  · intro hs v hv
    exact (branch_eq_iff i v).mp (no_center_one_branch s hs hcenter i hh v hv)
  · exact branch_connected s i hh

noncomputable def branchChoice {r : ℕ} (i : Fin r) : Option (Finset (Fin 4)) → Finset (Vertex r)
  | none => ∅
  | some t => insert (hub i) (t.image (leaf i))

noncomputable def encodeCenter {r : ℕ} (f : Fin r → Option (Finset (Fin 4))) : Finset (Vertex r) :=
  insert center (Finset.univ.biUnion (fun i => branchChoice i (f i)))

noncomputable def decodeCenter {r : ℕ} (s : Finset (Vertex r)) (i : Fin r) : Option (Finset (Fin 4)) :=
  if hub i ∈ s then some (Finset.univ.filter (fun j => leaf i j ∈ s)) else none

theorem mem_branch_hub {r : ℕ} (i k : Fin r) (o : Option (Finset (Fin 4))) :
    hub k ∈ branchChoice i o ↔ i = k ∧ o.isSome := by
  classical
  cases o <;> simp [branchChoice, hub, leaf, eq_comm]

theorem mem_branch_leaf {r : ℕ} (i k : Fin r) (j : Fin 4) (o : Option (Finset (Fin 4))) :
    leaf k j ∈ branchChoice i o ↔ i = k ∧ ∃ t, o = some t ∧ j ∈ t := by
  classical
  cases o <;> simp [branchChoice, hub, leaf, eq_comm, and_comm]

theorem center_mem_encode {r : ℕ} (f : Fin r → Option (Finset (Fin 4))) : center ∈ encodeCenter f := by
  simp [encodeCenter]

theorem hub_mem_encode {r : ℕ} (f : Fin r → Option (Finset (Fin 4))) (i : Fin r) :
    hub i ∈ encodeCenter f ↔ (f i).isSome := by
  classical
  simp only [encodeCenter, Finset.mem_insert, Finset.mem_biUnion, Finset.mem_univ, true_and]
  have hn : hub i ≠ center := by simp [hub, center]
  simp only [hn, false_or, mem_branch_hub]
  simp

theorem leaf_mem_encode {r : ℕ} (f : Fin r → Option (Finset (Fin 4))) (i : Fin r) (j : Fin 4) :
    leaf i j ∈ encodeCenter f ↔ ∃ t, f i = some t ∧ j ∈ t := by
  classical
  simp only [encodeCenter, Finset.mem_insert, Finset.mem_biUnion, Finset.mem_univ, true_and]
  have hn : leaf i j ≠ center := by simp [leaf, center]
  simp only [hn, false_or, mem_branch_leaf]
  simp

theorem encode_center_connected {r : ℕ} (f : Fin r → Option (Finset (Fin 4))) :
    connected (encodeCenter f) := by
  apply center_closed_connected _ (center_mem_encode f)
  intro i j hl
  obtain ⟨t, ht, _⟩ := (leaf_mem_encode f i j).mp hl
  apply (hub_mem_encode f i).mpr
  rw [ht]
  rfl

theorem decode_encode {r : ℕ} (f : Fin r → Option (Finset (Fin 4))) :
    decodeCenter (encodeCenter f) = f := by
  classical
  funext i
  cases hfi : f i with
  | none => simp [decodeCenter, hub_mem_encode, hfi]
  | some t =>
    simp only [decodeCenter, hub_mem_encode, hfi, Option.isSome_some, ↓reduceIte, Option.some.injEq]
    ext j
    simp [leaf_mem_encode, hfi]

theorem encode_decode {r : ℕ} (s : Finset (Vertex r)) (hc : center ∈ s)
    (hs : connected s) : encodeCenter (decodeCenter s) = s := by
  classical
  ext v
  cases v with
  | none =>
    change center ∈ encodeCenter (decodeCenter s) ↔ center ∈ s
    simp [center_mem_encode, hc]
  | some v =>
    rcases v with ⟨i,j⟩
    cases j with
    | none =>
      change hub i ∈ encodeCenter (decodeCenter s) ↔ hub i ∈ s
      simp [hub_mem_encode, decodeCenter]
    | some j =>
      change leaf i j ∈ encodeCenter (decodeCenter s) ↔ leaf i j ∈ s
      have hcl := (center_connected_iff s hc).mp hs i j
      by_cases hh : hub i ∈ s
      · simp [leaf_mem_encode, decodeCenter, hh]
      · have hl : leaf i j ∉ s := fun h => hh (hcl h)
        simp [leaf_mem_encode, decodeCenter, hh, hl]

noncomputable def centerEquiv (r : ℕ) :
    (Fin r → Option (Finset (Fin 4))) ≃ {s : Finset (Vertex r) // center ∈ s ∧ connected s} where
  toFun f := ⟨encodeCenter f, center_mem_encode f, encode_center_connected f⟩
  invFun s := decodeCenter s.val
  left_inv := decode_encode
  right_inv s := Subtype.ext (encode_decode s.val s.property.1 s.property.2)

theorem branchChoice_subset {r : ℕ} (i : Fin r) (o : Option (Finset (Fin 4))) :
    branchChoice i o ⊆ branchVertices i := by
  classical
  cases o with
  | none => simp [branchChoice]
  | some t =>
    intro v hv
    simp only [branchChoice, Finset.mem_insert, Finset.mem_image] at hv
    simp only [branchVertices, Finset.mem_insert, Finset.mem_image, Finset.mem_univ, true_and]
    rcases hv with h | ⟨j,hj,rfl⟩
    · exact Or.inl h
    · exact Or.inr ⟨j,rfl⟩

theorem branchChoice_disjoint {r : ℕ} (i k : Fin r) (h : i ≠ k)
    (a b : Option (Finset (Fin 4))) : Disjoint (branchChoice i a) (branchChoice k b) := by
  apply Finset.disjoint_left.mpr
  intro v hva hvb
  have hi := (branch_eq_iff i v).mpr (branchChoice_subset i a hva)
  have hk := (branch_eq_iff k v).mpr (branchChoice_subset k b hvb)
  exact h (Option.some.inj (hi.symm.trans hk))

theorem leaf_injective {r : ℕ} (i : Fin r) : Function.Injective (leaf i) := by
  intro x y h
  simpa [leaf] using h

def choiceSize : Option (Finset (Fin 4)) → ℕ
  | none => 0
  | some t => 1+t.card

theorem branchChoice_card {r : ℕ} (i : Fin r) (o : Option (Finset (Fin 4))) :
    (branchChoice i o).card = choiceSize o := by
  classical
  cases o with
  | none => simp [branchChoice, choiceSize]
  | some t =>
    have hh : hub i ∉ t.image (leaf i) := by simp [hub, leaf]
    rw [branchChoice, Finset.card_insert_of_notMem hh, Finset.card_image_of_injective _ (leaf_injective i)]
    simp [choiceSize, Nat.add_comm]

theorem encodeCenter_card {r : ℕ} (f : Fin r → Option (Finset (Fin 4))) :
    (encodeCenter f).card = 1 + ∑ i, choiceSize (f i) := by
  classical
  have hn : center ∉ Finset.univ.biUnion (fun i => branchChoice i (f i)) := by
    intro hm
    obtain ⟨i,_,hi⟩ := Finset.mem_biUnion.mp hm
    have hb := (branch_eq_iff i center).mpr (branchChoice_subset i (f i) hi)
    simp [branch,center] at hb
  rw [encodeCenter, Finset.card_insert_of_notMem hn, Finset.card_biUnion]
  · simp only [branchChoice_card]
    omega
  · intro i _ k _ hne
    exact branchChoice_disjoint i k hne (f i) (f k)

theorem leaf_subset_sum {R : Type*} [CommSemiring R] (z : R) :
    (∑ t : Finset (Fin 4), z ^ t.card) = (1+z)^4 := by
  classical
  have h := (Finset.prod_one_add (R := R) (f := fun _ : Fin 4 => z) Finset.univ)
  simpa only [Finset.powerset_univ, Finset.prod_const, Finset.card_univ, Fintype.card_fin] using h.symm

theorem choice_sum {R : Type*} [CommSemiring R] (z : R) :
    (∑ o : Option (Finset (Fin 4)), z ^ choiceSize o) = 1 + z*(1+z)^4 := by
  classical
  rw [Fintype.sum_option]
  simp only [choiceSize, pow_zero, pow_add, pow_one]
  rw [← Finset.mul_sum, leaf_subset_sum]

noncomputable instance centerFintype (r : ℕ) :
    Fintype {s : Finset (Vertex r) // center ∈ s ∧ connected s} := by
  classical
  exact Fintype.ofFinite _

theorem center_sum {R : Type*} [CommSemiring R] (r : ℕ) (z : R) :
    (∑ s : {s : Finset (Vertex r) // center ∈ s ∧ connected s}, z ^ s.val.card) =
      z*(1+z*(1+z)^4)^r := by
  classical
  have heq := Fintype.sum_equiv (centerEquiv r)
    (fun f => z^(encodeCenter f).card) (fun s => z^s.val.card) (fun _ => rfl)
  rw [← heq]
  simp only [encodeCenter_card, pow_add, pow_one]
  rw [← Finset.mul_sum]
  congr 1
  simp_rw [← Finset.prod_pow_eq_pow_sum]
  rw [← Fintype.prod_sum (fun _ : Fin r => fun o : Option (Finset (Fin 4)) => z^(choiceSize o))]
  simp only [choice_sum, Finset.prod_const, Finset.card_univ, Fintype.card_fin]

abbrev OuterCode (r : ℕ) := (Fin r × Finset (Fin 4)) ⊕ (Fin r × Fin 4)

noncomputable def encodeOuter {r : ℕ} : OuterCode r → Finset (Vertex r)
  | Sum.inl (i,t) => branchChoice i (some t)
  | Sum.inr (i,j) => {leaf i j}

theorem outer_encode_no_center {r : ℕ} (c : OuterCode r) : center ∉ encodeOuter c := by
  cases c with
  | inl p => rcases p with ⟨i,t⟩; simp [encodeOuter, branchChoice, hub, leaf, center]
  | inr p => rcases p with ⟨i,j⟩; simp [encodeOuter, leaf, center]

theorem outer_encode_connected {r : ℕ} (c : OuterCode r) : connected (encodeOuter c) := by
  classical
  cases c with
  | inl p =>
    rcases p with ⟨i,t⟩
    exact branch_connected _ i (by simp [encodeOuter, branchChoice]) (branchChoice_subset i _)
  | inr p =>
    rcases p with ⟨i,j⟩
    refine ⟨⟨leaf i j, by simp [encodeOuter]⟩, ?_⟩
    intro x hx y hy
    have hx' : x = leaf i j := by simpa [encodeOuter] using hx
    have hy' : y = leaf i j := by simpa [encodeOuter] using hy
    subst x
    subst y
    rfl

theorem outer_encode_injective {r : ℕ} : Function.Injective (@encodeOuter r) := by
  classical
  intro c d h
  cases c with
  | inl p =>
    rcases p with ⟨i,t⟩
    cases d with
    | inl q =>
      rcases q with ⟨k,u⟩
      change branchChoice i (some t) = branchChoice k (some u) at h
      have hh : hub i ∈ branchChoice k (some u) := by
        rw [← h]
        simp [branchChoice]
      have hik : i = k := by
        have := (mem_branch_hub k i (some u)).mp hh
        exact this.1.symm
      subst k
      have htu : t = u := by
        ext j
        have he := congrArg (fun v : Finset (Vertex r) => leaf i j ∈ v) h
        simpa [encodeOuter, mem_branch_leaf] using he
      subst u
      rfl
    | inr q =>
      rcases q with ⟨k,j⟩
      change branchChoice i (some t) = {leaf k j} at h
      have hh : hub i ∈ ({leaf k j} : Finset (Vertex r)) := by
        rw [← h]
        simp [branchChoice]
      simp [hub, leaf] at hh
  | inr p =>
    rcases p with ⟨i,j⟩
    cases d with
    | inl q =>
      rcases q with ⟨k,t⟩
      change ({leaf i j} : Finset (Vertex r)) = branchChoice k (some t) at h
      have hh : hub k ∈ ({leaf i j} : Finset (Vertex r)) := by
        rw [h]
        simp [branchChoice]
      simp [hub, leaf] at hh
    | inr q =>
      rcases q with ⟨k,l⟩
      have he : leaf i j = leaf k l := by simpa [encodeOuter] using h
      have : i = k ∧ j = l := by simpa [leaf] using he
      obtain ⟨rfl,rfl⟩ := this
      rfl

theorem outer_encode_surjective {r : ℕ} (s : Finset (Vertex r))
    (hc : center ∉ s) (hs : connected s) : ∃ c : OuterCode r, encodeOuter c = s := by
  classical
  by_cases hh : ∃ i, hub i ∈ s
  · obtain ⟨i,hi⟩ := hh
    let t : Finset (Fin 4) := Finset.univ.filter (fun j => leaf i j ∈ s)
    refine ⟨Sum.inl (i,t), ?_⟩
    change branchChoice i (some t) = s
    apply Finset.Subset.antisymm
    · intro v hv
      simp only [branchChoice, Finset.mem_insert, Finset.mem_image] at hv
      rcases hv with rfl | ⟨j,hj,rfl⟩
      · exact hi
      · exact (Finset.mem_filter.mp hj).2
    · intro v hv
      have hsub := (no_center_hub_iff s i hc hi).mp hs
      have hvb := hsub hv
      simp only [branchVertices, Finset.mem_insert, Finset.mem_image, Finset.mem_univ, true_and] at hvb
      simp only [branchChoice, Finset.mem_insert, Finset.mem_image]
      rcases hvb with rfl | ⟨j,rfl⟩
      · exact Or.inl rfl
      · exact Or.inr ⟨j, by simp [t,hv], rfl⟩
  · have hno : ∀ i, hub i ∉ s := by simpa using hh
    have hc1 := connected_no_hubs_singleton s hs hc hno
    obtain ⟨v,hv⟩ := Finset.card_eq_one.mp hc1
    have hvmem : v ∈ s := by rw [hv]; simp
    cases v with
    | none => exact False.elim (hc hvmem)
    | some v =>
      rcases v with ⟨i,j⟩
      cases j with
      | none => exact False.elim (hno i hvmem)
      | some j =>
        refine ⟨Sum.inr (i,j), ?_⟩
        simpa [encodeOuter,leaf] using hv.symm

noncomputable instance outerFintype (r : ℕ) :
    Fintype {s : Finset (Vertex r) // center ∉ s ∧ connected s} := by
  classical
  exact Fintype.ofFinite _

noncomputable def outerEquiv (r : ℕ) :
    OuterCode r ≃ {s : Finset (Vertex r) // center ∉ s ∧ connected s} :=
  Equiv.ofBijective
    (fun c => ⟨encodeOuter c, outer_encode_no_center c, outer_encode_connected c⟩)
    ⟨fun _ _ h => outer_encode_injective (congrArg Subtype.val h),
      fun s => by
        obtain ⟨c,hc⟩ := outer_encode_surjective s.val s.property.1 s.property.2
        exact ⟨c,Subtype.ext hc⟩⟩

theorem outer_sum {R : Type*} [CommSemiring R] (r : ℕ) (z : R) :
    (∑ s : {s : Finset (Vertex r) // center ∉ s ∧ connected s}, z ^ s.val.card) =
      (r : R)*z*((1+z)^4+4) := by
  classical
  have heq := Fintype.sum_equiv (outerEquiv r)
    (fun c => z^(encodeOuter c).card) (fun s => z^s.val.card) (fun _ => rfl)
  rw [← heq, Fintype.sum_sum_type]
  simp only [Fintype.sum_prod_type]
  have hleft : ∀ i : Fin r, (∑ t : Finset (Fin 4), z ^ (encodeOuter (Sum.inl (i,t))).card) = z*(1+z)^4 := by
    intro i
    simp only [encodeOuter, branchChoice_card, choiceSize, pow_add, pow_one]
    rw [← Finset.mul_sum, leaf_subset_sum]
  have hright : ∀ i : Fin r, (∑ j : Fin 4, z ^ (encodeOuter (Sum.inr (i,j))).card) = 4*z := by
    intro i
    simp [encodeOuter]
  simp only [hleft,hright, Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]
  ring

noncomputable instance connectedFintype (r : ℕ) :
    Fintype {s : Finset (Vertex r) // connected s} := by
  classical
  exact Fintype.ofFinite _

noncomputable def connectedEquiv (r : ℕ) :
    ({s : Finset (Vertex r) // center ∈ s ∧ connected s} ⊕
      {s : Finset (Vertex r) // center ∉ s ∧ connected s}) ≃
    {s : Finset (Vertex r) // connected s} where
  toFun x := match x with
    | Sum.inl s => ⟨s.val,s.property.2⟩
    | Sum.inr s => ⟨s.val,s.property.2⟩
  invFun s := if h : center ∈ s.val then Sum.inl ⟨s.val,h,s.property⟩
    else Sum.inr ⟨s.val,h,s.property⟩
  left_inv x := by
    classical
    cases x with
    | inl s => simp [s.property.1]
    | inr s => simp [s.property.1]
  right_inv s := by
    classical
    dsimp
    split_ifs <;> rfl

theorem subtree_sum {R : Type*} [CommSemiring R] (r : ℕ) (z : R) :
    (∑ s : {s : Finset (Vertex r) // connected s}, z ^ s.val.card) =
      z*((1+z*(1+z)^4)^r + (r : R)*((1+z)^4+4)) := by
  classical
  have heq := Fintype.sum_equiv (connectedEquiv r)
    (fun s => match s with | Sum.inl a => z^a.val.card | Sum.inr b => z^b.val.card)
    (fun s => z^s.val.card) (by intro x; cases x <;> rfl)
  rw [← heq, Fintype.sum_sum_type, center_sum, outer_sum]
  ring

end BrownTree
