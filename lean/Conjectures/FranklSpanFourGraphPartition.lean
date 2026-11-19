module

public import Conjectures.FranklSpanFourGraphRank

/-! Balanced-tree metadata for the final recurrent-word partition.
Lookup paths are checked against every stored entry. No ordering condition
or Python row count is assumed by the soundness statements. -/
@[expose] public section

namespace FranklSpanFour.Graph

open Assembly FranklCyclic

namespace Table

def entriesCheck : Table → (ℕ → ℕ → Bool) → Bool
  | .empty, _ => true
  | .node key value left right, predicate =>
      predicate key value &&
        (entriesCheck left predicate && entriesCheck right predicate)

theorem entriesCheck_empty (predicate : ℕ → ℕ → Bool) :
    entriesCheck .empty predicate = true := rfl

theorem entriesCheck_node {key value : ℕ} {left right : Table}
    {predicate : ℕ → ℕ → Bool}
    (hkey : predicate key value = true)
    (hleft : left.entriesCheck predicate = true)
    (hright : right.entriesCheck predicate = true) :
    entriesCheck (.node key value left right) predicate = true :=
  Bool.and_eq_true_iff.mpr ⟨hkey, Bool.and_eq_true_iff.mpr ⟨hleft, hright⟩⟩

theorem entriesCheck_lookup {table : Table} {predicate : ℕ → ℕ → Bool}
    {a value : ℕ} (hc : table.entriesCheck predicate = true)
    (hl : table.lookup a = some value) : predicate a value = true := by
  induction table generalizing a value with
  | empty => cases hl
  | node key val left right ihLeft ihRight =>
      obtain ⟨hkey, hrest⟩ := Bool.and_eq_true_iff.mp hc
      obtain ⟨hleft, hright⟩ := Bool.and_eq_true_iff.mp hrest
      by_cases hlt : a < key
      · apply ihLeft hleft
        simpa only [lookup, ite_eq_left hlt] using hl
      · by_cases heq : a = key
        · subst a
          have hvalue : val = value := Option.some.inj (by
            rw [lookup, ite_eq_right hlt, ite_eq_left (Eq.refl key)] at hl
            exact hl)
          simpa only [hvalue] using hkey
        · apply ihRight hright
          simpa only [lookup, ite_eq_right hlt, ite_eq_right heq] using hl

theorem entriesCheck_keys {table : Table} {predicate : ℕ → Bool}
    (hc : table.entriesCheck (fun key _ => predicate key) = true) :
    table.keys.all predicate = true := by
  induction table with
  | empty => rfl
  | node key _value left right ihLeft ihRight =>
      obtain ⟨hkey, hrest⟩ := Bool.and_eq_true_iff.mp hc
      obtain ⟨hleft, hright⟩ := Bool.and_eq_true_iff.mp hrest
      apply List.all_eq_true.mpr
      intro a ha
      rcases List.mem_append.mp ha with ha | ha
      · exact List.all_eq_true.mp (ihLeft hleft) a ha
      · rcases List.mem_cons.mp ha with heq | ha
        · simpa only [heq] using hkey
        · exact List.all_eq_true.mp (ihRight hright) a ha

end Table

def retainedPartitionCheck (kept left : Table) (count : ℕ)
    (codeAt : ℕ → ℕ) : Bool :=
  kept.entriesCheck (fun code row =>
    left.contains code || (decide (row < count) && decide (codeAt row = code)))

theorem retainedPartitionCheck_sound {kept left : Table} {count : ℕ}
    {codeAt : ℕ → ℕ} (hc : retainedPartitionCheck kept left count codeAt = true)
    {code : ℕ} (hkeep : kept.contains code = true) :
    wordOfCode 7 code ∈ decodeWords 7 left.keys ++
      (List.range count).map (fun row => wordOfCode 7 (codeAt row)) := by
  cases hl : kept.lookup code with
  | none => simp [Table.contains, hl] at hkeep
  | some row =>
      have hrow := Table.entriesCheck_lookup hc hl
      rcases Bool.or_eq_true_iff.mp hrow with hleft | hindexed
      · exact List.mem_append_left _ (mem_decodeWords (Table.contains_mem hleft))
      · obtain ⟨hbound, hcode⟩ := Bool.and_eq_true_iff.mp hindexed
        apply List.mem_append_right
        refine List.mem_map.mpr ⟨row, List.mem_range.mpr (of_decide_eq_true hbound), ?_⟩
        rw [of_decide_eq_true hcode]

theorem rankCodeCheck_seven_partition {codes : List ℕ} {kept left ranks : Table}
    {count : ℕ} {codeAt : ℕ → ℕ}
    (hc : rankCodeCheck 6 codes kept ranks = true)
    (hp : retainedPartitionCheck kept left count codeAt = true) :
    rankListCheck ((decodeWords 7 codes).map edge)
      (fun e => decide (sevenOfEdge e ∈ decodeWords 7 left.keys ++
        (List.range count).map (fun row => wordOfCode 7 (codeAt row))))
      (fun v => ranks.get (wordCode v)) = true := by
  apply rankCodeCheck_sound hc
  intro code _ hkeep
  apply decide_eq_true
  rw [sevenOfEdge_edge]
  exact retainedPartitionCheck_sound hp hkeep

def rankTableCheck (k : ℕ) (codes kept ranks : Table) : Bool :=
  codes.entriesCheck (fun code _ => rankRowCheck k kept ranks code)

theorem rankTableCheck_sound {k : ℕ} {codes kept ranks : Table}
    (hc : rankTableCheck k codes kept ranks = true) :
    rankCodeCheck k codes.keys kept ranks = true :=
  Table.entriesCheck_keys hc

end FranklSpanFour.Graph
