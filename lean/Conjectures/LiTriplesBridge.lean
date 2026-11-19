import Conjectures.LiTriples2

/-!
# Connected partitions of type `(3, 2^14)` in `Li.T`: the bridge

This file starts the bridge between genuine connected partitions of `Li.T` of type
`(3, 2^{14})` and the "good triples" of `Conjectures/LiTriples2.lean`.

## What is proved here

* `WalkIn`, `ConnIn`: `ConnIn S` says the vertex set `S` spans a connected subgraph of `Li.T`.
* `conn2_adj`: a two-element vertex set spanning a connected subgraph of `Li.T` is an edge
  (so a connected 2-block is a single edge of `T`).
* `no_triangle`: `Li.T` has no triangle (a tree fact, checked by kernel).
* `IsPerfectMatchingH` with explicit checks `pv1`, `pv2`, and `pv8` for representative
  good triples; the eight `good1`–`good8` kernel checks live in `LiTriples2`.
* `Partition325`: the type of connected partitions of type `(3, 2^{14})` of `Li.T`.

## Status

The final cardinality `Fintype.card Partition325 = 8` is proved in
`Conjectures/LiTriplesFinal.lean`, using uniqueness of perfect matchings in a tree and
the resulting bijection with the eight good triples.  This file supplies the bridge
predicates and the preliminary lemmas used there.
-/

open SimpleGraph

namespace Li
namespace LiBridge

instance instDecRel : DecidableRel Li.T.Adj := LiTriples2.instDecRel

/-! ## Vertex sets spanning connected subgraphs -/

/-- All vertices of a walk `p` lie in `S`. -/
def WalkIn (S : Finset (Fin 31)) {u v : Fin 31} (p : Li.T.Walk u v) : Prop :=
  ∀ x ∈ p.support, x ∈ S

/-- `S` spans a connected subgraph of `Li.T`. -/
def ConnIn (S : Finset (Fin 31)) : Prop :=
  S.Nonempty ∧ ∀ u ∈ S, ∀ v ∈ S, ∃ p : Li.T.Walk u v, WalkIn S p

/-- A two-element vertex set that spans a connected subgraph of `Li.T` is an edge. -/
theorem conn2_adj {S : Finset (Fin 31)} (hS : S.card = 2) (hC : ConnIn S) :
    ∃ u v, S = {u, v} ∧ Li.T.Adj u v := by
  obtain ⟨hne, hconn⟩ := hC
  obtain ⟨u, hu⟩ := hne
  have hrest : (S.erase u).Nonempty := by
    rw [Finset.nonempty_iff_ne_empty]
    intro he
    have : S.card = 1 := by
      rw [← Finset.card_erase_add_one hu, he, Finset.card_empty]
    omega
  obtain ⟨v, hv⟩ := hrest
  have hvu : v ≠ u := Finset.ne_of_mem_erase hv
  have hvS : v ∈ S := Finset.mem_of_mem_erase hv
  obtain ⟨p, hp⟩ := hconn u hu v hvS
  have hnil : ¬ p.Nil := by
    intro h0
    have hlen : p.length = 0 := by
      rw [SimpleGraph.Walk.length_eq_zero_iff]; exact h0
    have h1 : p.getVert 0 = p.getVert p.length := by rw [hlen]
    rw [SimpleGraph.Walk.getVert_zero, SimpleGraph.Walk.getVert_length] at h1
    exact hvu h1.symm
  obtain ⟨w, huw, q, hpq⟩ := SimpleGraph.Walk.not_nil_iff.mp hnil
  have hwS : w ∈ S := by rw [hpq] at hp; exact hp w (by simp)
  have hwu : w ≠ u := huw.1.symm
  have hsub : ({u, v} : Finset (Fin 31)) ⊆ S := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact hu
    · exact hvS
  have hne' : u ≠ v := fun h => hvu h.symm
  have hcard2 : ({u, v} : Finset (Fin 31)).card = 2 := by
    rw [Finset.card_insert_of_notMem (by simp [hne']), Finset.card_singleton]
  have heq : ({u, v} : Finset (Fin 31)) = S := by
    refine Finset.eq_of_subset_of_card_le hsub ?_
    rw [hcard2, hS]
  have hwuv : w ∈ ({u, v} : Finset (Fin 31)) := by rw [heq]; exact hwS
  simp only [Finset.mem_insert, Finset.mem_singleton] at hwuv
  have hwv : w = v := by
    rcases hwuv with h | h
    · exact absurd h hwu
    · exact h
  exact ⟨u, v, heq.symm, hwv ▸ huw⟩

/-- `Li.T` has no triangle. -/
theorem no_triangle : ∀ a b c : Fin 31, ¬ (Li.T.Adj a b ∧ Li.T.Adj b c ∧ Li.T.Adj a c) := by
  decide

/-- A connected set of at least two vertices contains an edge of `Li.T`. -/
theorem edge_of_conn {S : Finset (Fin 31)} (h2 : 2 ≤ S.card) (hC : ConnIn S) :
    ∃ u ∈ S, ∃ v ∈ S, Li.T.Adj u v := by
  obtain ⟨hne, hconn⟩ := hC
  obtain ⟨u, hu⟩ := hne
  have hrest : (S.erase u).Nonempty := by
    rw [Finset.nonempty_iff_ne_empty]
    intro he
    have : S.card = 1 := by rw [← Finset.card_erase_add_one hu, he, Finset.card_empty]
    omega
  obtain ⟨v, hv⟩ := hrest
  have hvS : v ∈ S := Finset.mem_of_mem_erase hv
  have hvu : v ≠ u := Finset.ne_of_mem_erase hv
  obtain ⟨p, hp⟩ := hconn u hu v hvS
  have hnil : ¬ p.Nil := by
    intro h0
    have hlen : p.length = 0 := by rw [SimpleGraph.Walk.length_eq_zero_iff]; exact h0
    have h1 : p.getVert 0 = p.getVert p.length := by rw [hlen]
    rw [SimpleGraph.Walk.getVert_zero, SimpleGraph.Walk.getVert_length] at h1
    exact hvu h1.symm
  obtain ⟨w, huw, q, hq⟩ := SimpleGraph.Walk.not_nil_iff.mp hnil
  have hwS : w ∈ S := by rw [hq] at hp; exact hp w (by simp)
  exact ⟨u, hu, w, hwS, huw⟩

/-- The first edge of a walk inside `S` starting at `z` lands in `S`. -/
theorem first_step_in {S : Finset (Fin 31)} {z u : Fin 31} (p : Li.T.Walk z u)
    (hp : WalkIn S p) (_hz : z ∈ S) (hzu : z ≠ u) : ∃ y ∈ S, Li.T.Adj z y := by
  have hnil : ¬ p.Nil := by
    intro h0
    have hlen : p.length = 0 := by rw [SimpleGraph.Walk.length_eq_zero_iff]; exact h0
    have h1 : p.getVert 0 = p.getVert p.length := by rw [hlen]
    rw [SimpleGraph.Walk.getVert_zero, SimpleGraph.Walk.getVert_length] at h1
    exact hzu h1
  obtain ⟨w, hzw, q, hpq⟩ := SimpleGraph.Walk.not_nil_iff.mp hnil
  have hwS : w ∈ S := by rw [hpq] at hp; exact hp w (by simp)
  exact ⟨w, hwS, hzw⟩

/-- A connected three-element vertex set is a path of length two. -/
theorem conn3_path {S : Finset (Fin 31)} (hS : S.card = 3) (hC : ConnIn S) :
    ∃ a b c, a ≠ b ∧ b ≠ c ∧ a ≠ c ∧ S = {a, b, c} ∧ Li.T.Adj a b ∧ Li.T.Adj b c := by
  obtain ⟨u, huS, v, hvS, huv⟩ := edge_of_conn (by omega) hC
  have huv_ne : u ≠ v := huv.1
  have hsub_uv : ({u, v} : Finset (Fin 31)) ⊆ S := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact huS
    · exact hvS
  have hcard_uv : ({u, v} : Finset (Fin 31)).card = 2 := by
    rw [Finset.card_insert_of_notMem (by simp [huv_ne]), Finset.card_singleton]
  have hrest : (S \ {u, v}).Nonempty := by
    have key := Finset.card_sdiff_add_card_eq_card hsub_uv
    rw [hcard_uv, hS] at key
    have hcard_sd : (S \ {u, v}).card = 1 := by omega
    exact Finset.card_pos.mp (by omega)
  obtain ⟨z, hzSd⟩ := hrest
  have hzS : z ∈ S := (Finset.mem_sdiff.mp hzSd).1
  have hzuv : z ∉ ({u, v} : Finset (Fin 31)) := (Finset.mem_sdiff.mp hzSd).2
  have hzu : z ≠ u := fun h => hzuv (by simp [h])
  have hzv : z ≠ v := fun h => hzuv (by simp [h])
  have hSuvz : S = {u, v, z} := by
    have hsub : ({u, v, z} : Finset (Fin 31)) ⊆ S := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl | rfl
      · exact huS
      · exact hvS
      · exact hzS
    have hcard3 : ({u, v, z} : Finset (Fin 31)).card = 3 := by
      have h1 : u ∉ ({v, z} : Finset (Fin 31)) := by
        simp only [Finset.mem_insert, Finset.mem_singleton, not_or]
        exact ⟨huv_ne, fun h => hzu h.symm⟩
      have h2 : v ∉ ({z} : Finset (Fin 31)) := by
        simp only [Finset.mem_singleton]
        exact fun h => hzv h.symm
      rw [Finset.card_insert_of_notMem h1, Finset.card_insert_of_notMem h2, Finset.card_singleton]
    exact (Finset.eq_of_subset_of_card_le hsub (by omega)).symm
  obtain ⟨p, hp⟩ := hC.2 z hzS u huS
  obtain ⟨y, hyS, hzy⟩ := first_step_in p hp hzS hzu
  have hyuvz : y ∈ ({u, v, z} : Finset (Fin 31)) := by rw [← hSuvz]; exact hyS
  have hyz : y ≠ z := fun h => hzy.1 (h.symm ▸ rfl)
  simp only [Finset.mem_insert, Finset.mem_singleton] at hyuvz
  rcases hyuvz with hyu | hyv | hyz'
  · refine ⟨v, u, z, huv_ne.symm, hzu.symm, hzv.symm, ?_, huv.symm, ?_⟩
    · rw [hSuvz, Finset.insert_comm v u {z}]
    · have : Li.T.Adj u z := hyu ▸ hzy.symm
      exact this
  · refine ⟨u, v, z, huv_ne, hzv.symm, hzu.symm, ?_, huv, ?_⟩
    · rw [hSuvz]
    · have : Li.T.Adj v z := hyv ▸ hzy.symm
      exact this
  · exact absurd hyz' hyz

/-! ## Perfect matchings as edge lists -/

/-- Vertex set of a list of edges. -/
def vset (es : List (Fin 31 × Fin 31)) : Finset (Fin 31) :=
  es.foldr (fun p acc => insert p.1 (insert p.2 acc)) ∅

/-- All endpoints of the list are distinct. -/
def IsMatchingList (es : List (Fin 31 × Fin 31)) : Bool :=
  (es.flatMap (fun p => [p.1, p.2])).eraseDups.length == (es.flatMap (fun p => [p.1, p.2])).length

/-- Every edge of the list is an edge of `Li.T` with both endpoints in `H`. -/
def EdgesIn (es : List (Fin 31 × Fin 31)) (H : Finset (Fin 31)) : Bool :=
  es.all (fun p => Li.T.Adj p.1 p.2 && p.1 ∈ H && p.2 ∈ H)

/-- `es` is a perfect matching of `H` inside `Li.T`. -/
def IsPerfectMatchingH (es : List (Fin 31 × Fin 31)) (H : Finset (Fin 31)) : Bool :=
  EdgesIn es H && IsMatchingList es && (vset es == H)

set_option maxRecDepth 400000 in
theorem pv1 : IsPerfectMatchingH LiTriples2.m1 (Finset.univ \ {0, 1, 16}) = true := by decide

set_option maxRecDepth 400000 in
theorem pv2 : IsPerfectMatchingH
    [(LiTriples2.f 0, LiTriples2.f 1), (LiTriples2.f 2, LiTriples2.f 3),
     (LiTriples2.f 4, LiTriples2.f 5), (LiTriples2.f 6, LiTriples2.f 7),
     (LiTriples2.f 8, LiTriples2.f 15), (LiTriples2.f 9, LiTriples2.f 10),
     (LiTriples2.f 11, LiTriples2.f 12), (LiTriples2.f 13, LiTriples2.f 14),
     (LiTriples2.f 19, LiTriples2.f 20), (LiTriples2.f 21, LiTriples2.f 22),
     (LiTriples2.f 23, LiTriples2.f 24), (LiTriples2.f 25, LiTriples2.f 26),
     (LiTriples2.f 27, LiTriples2.f 28), (LiTriples2.f 29, LiTriples2.f 30)]
    (Finset.univ \ {16, 17, 18}) = true := by decide

set_option maxRecDepth 400000 in
theorem pv8 : IsPerfectMatchingH
    [(LiTriples2.f 0, LiTriples2.f 1), (LiTriples2.f 2, LiTriples2.f 3),
     (LiTriples2.f 4, LiTriples2.f 5), (LiTriples2.f 6, LiTriples2.f 7),
     (LiTriples2.f 8, LiTriples2.f 15), (LiTriples2.f 9, LiTriples2.f 10),
     (LiTriples2.f 11, LiTriples2.f 12), (LiTriples2.f 13, LiTriples2.f 14),
     (LiTriples2.f 16, LiTriples2.f 17), (LiTriples2.f 18, LiTriples2.f 19),
     (LiTriples2.f 20, LiTriples2.f 21), (LiTriples2.f 22, LiTriples2.f 23),
     (LiTriples2.f 24, LiTriples2.f 25), (LiTriples2.f 26, LiTriples2.f 27)]
    (Finset.univ \ {28, 29, 30}) = true := by decide

/-! ## Connected partitions of type (3, 2^14) -/

/-- A set of vertex sets partitions `Fin 31`: blocks are nonempty, pairwise disjoint, and cover. -/
def IsPartition (P : Finset (Finset (Fin 31))) : Prop :=
  (∀ B ∈ P, B.Nonempty) ∧
  (∀ B ∈ P, ∀ C ∈ P, B ≠ C → Disjoint B C) ∧
  P.biUnion id = Finset.univ

/-- `P` has exactly one block of size 3 and all other blocks have size 2. -/
def IsType325 (P : Finset (Finset (Fin 31))) : Prop :=
  (P.filter (fun B => B.card = 3)).card = 1 ∧
  (∀ B ∈ P, B.card = 3 ∨ B.card = 2)

/-- A connected partition of type `(3, 2^14)` of `Li.T`. -/
def Partition325 (P : Finset (Finset (Fin 31))) : Prop :=
  IsPartition P ∧ IsType325 P ∧ (∀ B ∈ P, ConnIn B)

/-- Every size-two block of a `(3, 2^14)`-partition is an edge of `Li.T`. -/
theorem block2_is_edge {P : Finset (Finset (Fin 31))} (hP : Partition325 P)
    {B : Finset (Fin 31)} (hB : B ∈ P) (hcard : B.card = 2) :
    ∃ u v, B = {u, v} ∧ Li.T.Adj u v :=
  conn2_adj hcard (hP.2.2 B hB)

/-- The three-block of a `(3, 2^14)`-partition spans a path of length two. -/
theorem threeBlock_is_path {P : Finset (Finset (Fin 31))} (hP : Partition325 P)
    {B : Finset (Fin 31)} (hB : B ∈ P) (hcard : B.card = 3) :
    ∃ a b c, a ≠ b ∧ b ≠ c ∧ a ≠ c ∧ B = {a, b, c} ∧ Li.T.Adj a b ∧ Li.T.Adj b c :=
  conn3_path hcard (hP.2.2 B hB)

end LiBridge
end Li
