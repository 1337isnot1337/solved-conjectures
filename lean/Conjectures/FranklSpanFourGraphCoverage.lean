module

public import Conjectures.FranklSpanFourGraphAdmissible
public import Conjectures.FranklCyclicPairs

/-! Generate covering six-word states and seven-word edges from a checked
four-word table. Completeness is proved from overlapping prefix and suffix
windows rather than by enumerating the full function space. -/
@[expose] public section

namespace FranklSpanFour.Graph

open Assembly FranklCyclic

def extendCodes (k : ℕ) (parents : List ℕ) (accept : ℕ → Bool) : List ℕ :=
  parents.flatMap (fun p =>
    ((List.range 16).map (fun a => p + 16 ^ k * a)).filter accept)

theorem mem_extendCodes_iff {k a : ℕ} {parents : List ℕ} {accept : ℕ → Bool} :
    a ∈ extendCodes k parents accept ↔
      ∃ p ∈ parents, ∃ digit < 16, p + 16 ^ k * digit = a ∧ accept a = true := by
  constructor
  · intro ha
    obtain ⟨p, hp, hm⟩ := List.mem_flatMap.mp ha
    obtain ⟨hm, ht⟩ := List.mem_filter.mp hm
    obtain ⟨digit, hd, he⟩ := List.mem_map.mp hm
    exact ⟨p, hp, digit, List.mem_range.mp hd, he, ht⟩
  · rintro ⟨p, hp, digit, hd, he, ht⟩
    apply List.mem_flatMap.mpr
    refine ⟨p, hp, ?_⟩
    apply List.mem_filter.mpr
    exact ⟨List.mem_map.mpr ⟨digit, List.mem_range.mpr hd, he⟩, ht⟩

theorem mem_extendCodes_of {k p digit : ℕ} {parents : List ℕ} {accept : ℕ → Bool}
    (hp : p ∈ parents) (hd : digit < 16) (ht : accept (p + 16 ^ k * digit) = true) :
    p + 16 ^ k * digit ∈ extendCodes k parents accept :=
  mem_extendCodes_iff.mpr ⟨p, hp, digit, hd, rfl, ht⟩

theorem extendCodes_bounded {k : ℕ} {parents : List ℕ} {accept : ℕ → Bool}
    (hb : ∀ p ∈ parents, p < 16 ^ k) :
    ∀ a ∈ extendCodes k parents accept, a < 16 ^ (k + 1) := by
  intro a ha
  obtain ⟨p, hp, digit, hd, rfl, _⟩ := mem_extendCodes_iff.mp ha
  calc
    p + 16 ^ k * digit < 16 ^ k + 16 ^ k * digit :=
      Nat.add_lt_add_right (hb p hp) _
    _ = 16 ^ k * (digit + 1) := by rw [Nat.mul_succ]; omega
    _ ≤ 16 ^ k * 16 := Nat.mul_le_mul_left _ (by omega)
    _ = 16 ^ (k + 1) := (Nat.pow_succ _ _).symm

theorem extendCodes_test {k a : ℕ} {parents : List ℕ} {accept : ℕ → Bool}
    (ha : a ∈ extendCodes k parents accept) : accept a = true := by
  obtain ⟨_, _, _, _, _, ht⟩ := mem_extendCodes_iff.mp ha
  exact ht

theorem extendCodes_append (k : ℕ) (left right : List ℕ) (accept : ℕ → Bool) :
    extendCodes k (left ++ right) accept =
      extendCodes k left accept ++ extendCodes k right accept := by
  simp only [extendCodes, List.flatMap_append]

def fiveCodesFrom (table : Table) (seeds : List ℕ) : List ℕ :=
  extendCodes 4 seeds (fun a => table.contains (a / 16))

def sixCodesFrom (table : Table) (seeds : List ℕ) : List ℕ :=
  extendCodes 5 (fiveCodesFrom table seeds) (fun a => table.contains (a / 256))

def sixCodes (table : Table) : List ℕ := sixCodesFrom table table.keys

def edgeCodesFrom (table : Table) (seeds : List ℕ) (prune : ℕ → Bool) : List ℕ :=
  extendCodes 6 (sixCodesFrom table seeds)
    (fun a => table.contains (a / 4096) && !(prune a))

def edgeCodes (table : Table) (prune : ℕ → Bool) : List ℕ :=
  edgeCodesFrom table table.keys prune

def fourBoundCheck (table : Table) : Bool :=
  table.keys.all (fun a => decide (a < 16 ^ 4))

theorem fourBoundCheck_sound {table : Table} (hb : fourBoundCheck table = true) :
    ∀ a ∈ table.keys, a < 16 ^ 4 := by
  intro a ha
  exact of_decide_eq_true (List.all_eq_true.mp hb a ha)

theorem sixCodes_bounded {table : Table} (hb : fourBoundCheck table = true) :
    ∀ a ∈ sixCodes table, a < 16 ^ 6 :=
  extendCodes_bounded (extendCodes_bounded (fourBoundCheck_sound hb))

theorem edgeCodes_bounded {table : Table} {prune : ℕ → Bool}
    (hb : fourBoundCheck table = true) :
    ∀ a ∈ edgeCodes table prune, a < 16 ^ 7 :=
  extendCodes_bounded (sixCodes_bounded hb)

theorem sixCodes_lastFour {table : Table} {a : ℕ} (ha : a ∈ sixCodes table) :
    table.contains (a / 256) = true :=
  extendCodes_test ha

theorem wordCode_prefix_last {k : ℕ} (v : Word (k + 1)) :
    wordCode (wordPrefix v) + 16 ^ k * letterCode (v (Fin.last k)) = wordCode v := by
  have hs := wordCode_snoc (wordPrefix v) (v (Fin.last k))
  have hv : Fin.snoc (wordPrefix v) (v (Fin.last k)) = v := Fin.snoc_init_self v
  rw [hv] at hs
  exact hs.symm

theorem admissible_five_code_mem {table : Table} (hc : fourCoverageCheck table = true)
    (v : Word 5) (hv : windowAdmissibleCheck 2 v = true) :
    wordCode v ∈ fiveCodesFrom table table.keys := by
  apply mem_extendCodes_iff.mpr
  refine ⟨wordCode (wordPrefix v), ?_, letterCode (v (Fin.last 4)),
    letterCode_lt _, wordCode_prefix_last v, ?_⟩
  · exact Table.contains_mem (fourCoverageCheck_sound hc (wordPrefix v)
      (windowAdmissibleCheck_prefix 1 v hv))
  · have ht := fourCoverageCheck_sound hc (wordSuffix v)
      (windowAdmissibleCheck_suffix 1 v hv)
    simpa only [wordCode_suffix] using ht

theorem admissible_six_code_mem {table : Table} (hc : fourCoverageCheck table = true)
    (v : Word 6) (hv : windowAdmissibleCheck 3 v = true) :
    wordCode v ∈ sixCodes table := by
  apply mem_extendCodes_iff.mpr
  refine ⟨wordCode (wordPrefix v), ?_, letterCode (v (Fin.last 5)),
    letterCode_lt _, wordCode_prefix_last v, ?_⟩
  · exact admissible_five_code_mem hc (wordPrefix v)
      (windowAdmissibleCheck_prefix 2 v hv)
  · have ht := fourCoverageCheck_sound hc (wordSuffix (wordSuffix v))
      (windowAdmissibleCheck_suffix 1 (wordSuffix v)
        (windowAdmissibleCheck_suffix 2 v hv))
    simpa only [wordCode_suffix, Nat.div_div] using ht

theorem six_states_cover {table : Table} (hc : fourCoverageCheck table = true)
    (v : Word 6) (hv : windowAdmissibleCheck 3 v = true) :
    v ∈ decodeWords 6 (sixCodes table) :=
  List.mem_map.mpr ⟨wordCode v, admissible_six_code_mem hc v hv, wordOfCode_wordCode v⟩

theorem seven_edges_cover {table : Table} {prune : ℕ → Bool}
    (hb : fourBoundCheck table = true)
    (hprune : ∀ a < 16 ^ 7, prune a = true → windowPairCheck (wordOfCode 7 a) = true)
    (v : Word 7) (hp : wordPrefix v ∈ decodeWords 6 (sixCodes table))
    (hs : wordSuffix v ∈ decodeWords 6 (sixCodes table)) (hpair : windowPairCheck v = false) :
    v ∈ decodeWords 7 (edgeCodes table prune) := by
  have hprefix := (mem_decodeWords_iff (sixCodes_bounded hb) (wordPrefix v)).mp hp
  have hsuffix := (mem_decodeWords_iff (sixCodes_bounded hb) (wordSuffix v)).mp hs
  have hlast := sixCodes_lastFour hsuffix
  have hlast' : table.contains (wordCode v / 4096) = true := by
    simpa only [wordCode_suffix, Nat.div_div] using hlast
  have hnot : prune (wordCode v) = false := by
    apply Bool.eq_false_iff.mpr
    intro h
    have hbad := hprune (wordCode v) (wordCode_lt v) h
    simp only [wordOfCode_wordCode, hpair, Bool.false_eq_true] at hbad
  have hcode : wordCode v ∈ edgeCodes table prune := by
    apply mem_extendCodes_iff.mpr
    refine ⟨wordCode (wordPrefix v), hprefix, letterCode (v (Fin.last 6)),
      letterCode_lt _, wordCode_prefix_last v, ?_⟩
    exact Bool.and_eq_true_iff.mpr ⟨hlast', by rw [hnot]; rfl⟩
  exact List.mem_map.mpr ⟨wordCode v, hcode, wordOfCode_wordCode v⟩

theorem fiveCodesFrom_append (table : Table) (left right : List ℕ) :
    fiveCodesFrom table (left ++ right) =
      fiveCodesFrom table left ++ fiveCodesFrom table right := by
  simp only [fiveCodesFrom, extendCodes_append]

theorem sixCodesFrom_append (table : Table) (left right : List ℕ) :
    sixCodesFrom table (left ++ right) =
      sixCodesFrom table left ++ sixCodesFrom table right := by
  simp only [sixCodesFrom, fiveCodesFrom_append, extendCodes_append]

theorem edgeCodesFrom_append (table : Table) (left right : List ℕ) (prune : ℕ → Bool) :
    edgeCodesFrom table (left ++ right) prune =
      edgeCodesFrom table left prune ++ edgeCodesFrom table right prune := by
  simp only [edgeCodesFrom, sixCodesFrom_append, extendCodes_append]

theorem rankCodeCheck_edgeChunks (table : Table) (chunks : List (List ℕ))
    (prune : ℕ → Bool) (kept ranks : Table) :
    rankCodeCheck 6 (edgeCodesFrom table chunks.flatten prune) kept ranks =
      chunks.all (fun seeds => rankCodeCheck 6 (edgeCodesFrom table seeds prune) kept ranks) := by
  induction chunks with
  | nil => rfl
  | cons head tail ih =>
      simp only [List.flatten_cons, edgeCodesFrom_append, rankCodeCheck_append,
        List.all_cons, ih]

end FranklSpanFour.Graph
