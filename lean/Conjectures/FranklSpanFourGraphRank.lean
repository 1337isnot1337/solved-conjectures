module

public import Conjectures.FranklSpanFourGraphEncoding

/-! Exact integer rank certificates with finite balanced lookup trees.
No ordering assumption is trusted: successful lookup implies key membership. -/
@[expose] public section

namespace FranklSpanFour.Graph

open Assembly FranklCyclic

inductive Table where
  | empty
  | node (key value : ℕ) (left right : Table)

namespace Table

def lookup : Table → ℕ → Option ℕ
  | .empty, _ => none
  | .node key value left right, a =>
      if a < key then left.lookup a
      else if a = key then some value else right.lookup a

def keys : Table → List ℕ
  | .empty => []
  | .node key _ left right => left.keys ++ key :: right.keys

def contains (table : Table) (a : ℕ) : Bool := (table.lookup a).isSome

def get (table : Table) (a : ℕ) : ℕ := (table.lookup a).getD 0

theorem lookup_mem {table : Table} {a value : ℕ}
    (h : table.lookup a = some value) : a ∈ table.keys := by
  induction table generalizing a value with
  | empty => cases h
  | node key val left right ihLeft ihRight =>
      by_cases hlt : a < key
      · have hh : left.lookup a = some value := by simpa only [lookup, ite_eq_left hlt] using h
        exact List.mem_append.mpr (Or.inl (ihLeft hh))
      · by_cases heq : a = key
        · subst a
          exact List.mem_append.mpr (Or.inr (List.mem_cons.mpr (Or.inl rfl)))
        · have hh : right.lookup a = some value := by
            simpa only [lookup, ite_eq_right hlt, ite_eq_right heq] using h
          exact List.mem_append.mpr (Or.inr (List.mem_cons_of_mem _ (ihRight hh)))

theorem contains_mem {table : Table} {a : ℕ}
    (h : table.contains a = true) : a ∈ table.keys := by
  cases hl : table.lookup a with
  | none => simp [contains, hl] at h
  | some value => exact lookup_mem hl

end Table

def rankRowCheck (k : ℕ) (kept ranks : Table) (a : ℕ) : Bool :=
  decide (a < 16 ^ (k + 1)) &&
    (decide (ranks.get (a / 16) ≤ ranks.get (a % 16 ^ k)) &&
      (decide (ranks.get (a / 16) ≠ ranks.get (a % 16 ^ k)) || kept.contains a))

def rankCodeCheck (k : ℕ) (codes : List ℕ) (kept ranks : Table) : Bool :=
  codes.all (rankRowCheck k kept ranks)

theorem rankCodeCheck_append (k : ℕ) (left right : List ℕ) (kept ranks : Table) :
    rankCodeCheck k (left ++ right) kept ranks =
      (rankCodeCheck k left kept ranks && rankCodeCheck k right kept ranks) := by
  simp only [rankCodeCheck, List.all_append]

theorem rankCodeCheck_bounded {k : ℕ} {codes : List ℕ} {kept ranks : Table}
    (hc : rankCodeCheck k codes kept ranks = true) : ∀ a ∈ codes, a < 16 ^ (k + 1) := by
  intro a ha
  exact of_decide_eq_true (Bool.and_eq_true_iff.mp (List.all_eq_true.mp hc a ha)).1

theorem rankCodeCheck_sound {k : ℕ} {codes : List ℕ} {kept ranks : Table}
    (hc : rankCodeCheck k codes kept ranks = true)
    (keep : Word k × Word k → Bool)
    (hk : ∀ a ∈ codes, kept.contains a = true → keep (edge (wordOfCode (k + 1) a)) = true) :
    rankListCheck ((decodeWords (k + 1) codes).map edge) keep
      (fun v => ranks.get (wordCode v)) = true := by
  apply List.all_eq_true.mpr
  intro e he
  obtain ⟨v, hv, rfl⟩ := List.mem_map.mp he
  obtain ⟨a, ha, rfl⟩ := List.mem_map.mp hv
  have hrow := List.all_eq_true.mp hc a ha
  obtain ⟨hbound, hrest⟩ := Bool.and_eq_true_iff.mp hrow
  have hb : a < 16 ^ (k + 1) := of_decide_eq_true hbound
  have hp : wordCode (wordPrefix (wordOfCode (k + 1) a)) = a % 16 ^ k := by
    rw [wordCode_prefix, wordCode_wordOfCode hb]
  have hs : wordCode (wordSuffix (wordOfCode (k + 1) a)) = a / 16 := by
    rw [wordCode_suffix, wordCode_wordOfCode hb]
  change (decide (ranks.get (wordCode (wordSuffix (wordOfCode (k + 1) a))) ≤
      ranks.get (wordCode (wordPrefix (wordOfCode (k + 1) a)))) &&
    (decide (ranks.get (wordCode (wordSuffix (wordOfCode (k + 1) a))) ≠
      ranks.get (wordCode (wordPrefix (wordOfCode (k + 1) a)))) ||
      keep (edge (wordOfCode (k + 1) a)))) = true
  rw [hp, hs]
  obtain ⟨hweak, hstrict⟩ := Bool.and_eq_true_iff.mp hrest
  apply Bool.and_eq_true_iff.mpr
  refine ⟨hweak, ?_⟩
  rcases Bool.or_eq_true_iff.mp hstrict with hlt | hkeep
  · exact Bool.or_eq_true_iff.mpr (Or.inl hlt)
  · exact Bool.or_eq_true_iff.mpr (Or.inr (hk a ha hkeep))

theorem rankCodeCheck_seven {codes : List ℕ} {kept ranks : Table}
    (hc : rankCodeCheck 6 codes kept ranks = true) :
    rankListCheck ((decodeWords 7 codes).map edge)
      (fun e => decide (sevenOfEdge e ∈ decodeWords 7 kept.keys))
      (fun v => ranks.get (wordCode v)) = true := by
  apply rankCodeCheck_sound hc
  intro a _ hkeep
  apply decide_eq_true
  rw [sevenOfEdge_edge]
  exact mem_decodeWords (Table.contains_mem hkeep)

end FranklSpanFour.Graph
