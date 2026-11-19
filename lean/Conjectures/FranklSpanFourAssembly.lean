module

public import Conjectures.FranklSpanFourAssemblyCore
public import Conjectures.FranklSpanFourAdmissible
public import Conjectures.FranklSmallCyclicSchedule
public import Conjectures.FranklSmallCyclicZMod
public import Conjectures.FranklSmallCyclicMaskWindows
public import Conjectures.FranklCyclicPairs
public import Conjectures.FranklSpanFourFamily

/-! Assemble the literal cyclic argument from finite window lists, local
weight checks, and rank checks. No abundance assertion is a packet premise. -/
@[expose] public section

namespace FranklSpanFour.Assembly

open FranklCyclic FranklLocal

def encodeWindow {k : ℕ} (v : Word k) : List ℕ :=
  List.ofFn (fun j => FranklSmallCyclic.encodeLetter (v j))

/-- All data are finite lists or functions on finite window/point types.
No numerical cardinalities of these lists are assumed by soundness. -/
structure Packet where
  states : List (Word 6)
  edges : List (Word 7)
  recurrent : List (Word 7)
  left4 : List (Word 7)
  extensions : List (Word 8)
  left5 : List (Word 8)
  rankPair : Word 6 → ℕ
  rank4 : Word 6 → ℕ
  rank5 : Word 7 → ℕ
  weights4 : Word 7 → Fin 10 → ℕ
  weights5 : Word 8 → Fin 11 → ℕ

def statesCheck (P : Packet) : Bool :=
  decide (∀ v : Word 6, windowAdmissibleCheck 3 v = true → v ∈ P.states)

def edgesCheck (P : Packet) : Bool :=
  decide (∀ v : Word 7, wordPrefix v ∈ P.states → wordSuffix v ∈ P.states →
    windowPairCheck v = false → v ∈ P.edges)

def pairRankCheck (P : Packet) : Bool :=
  rankListCheck (P.edges.map edge) (fun e => decide (sevenOfEdge e ∈ P.recurrent))
    P.rankPair

def weight4Check (P : Packet) : Bool :=
  P.recurrent.all (fun v => decide (v ∈ P.left4) ||
    certificateCheck (localTiles 4 v) (windowCore 4) (P.weights4 v))

def residualRankCheck (P : Packet) : Bool :=
  rankListCheck (P.left4.map edge)
    (fun e => decide (encodeWindow (sevenOfEdge e) ∈ FranklSmallCyclic.residualEdges))
    P.rank4

def extensionsCheck (P : Packet) : Bool :=
  decide (∀ v : Word 8,
    encodeWindow (wordPrefix v) ∈ FranklSmallCyclic.residualEdges →
    encodeWindow (wordSuffix v) ∈ FranklSmallCyclic.residualEdges → v ∈ P.extensions)

def weight5Check (P : Packet) : Bool :=
  P.extensions.all (fun v => decide (v ∈ P.left5) ||
    certificateCheck (localTiles 5 v) (windowCore 5) (P.weights5 v))

def finalRankCheck (P : Packet) : Bool :=
  rankListCheck (P.left5.map edge)
    (fun e => decide (e = ((fun _ => ∅), (fun _ => ∅)))) P.rank5

/-- These are finite enumeration, arithmetic, and rank checks only. A
concrete packet must provide a proof of each Boolean equality. -/
structure Checked (P : Packet) : Prop where
  states : statesCheck P = true
  edges : edgesCheck P = true
  pairRank : pairRankCheck P = true
  weight4 : weight4Check P = true
  residualRank : residualRankCheck P = true
  extensions : extensionsCheck P = true
  weight5 : weight5Check P = true
  finalRank : finalRankCheck P = true

/-- Short-cycle weights have finite domains in the actual quotient ground. -/
structure ShortWeights where
  weights7 : Word 7 → Fin 7 → ℕ
  weights8 : Word 7 → Fin 8 → ℕ
  weights9 : Word 7 → Fin 9 → ℕ

def extendWeights {m : ℕ} (w : Fin m → ℕ) (i : ℕ) : ℕ :=
  if h : i < m then w ⟨i, h⟩ else 0

def shortWeightCheck (n : ℕ) (P : Packet) (weights : Word 7 → Fin n → ℕ) : Bool :=
  P.recurrent.all (fun v => decide (v ∈ P.left4) ||
    FranklSmallCyclic.MaskWindows.windowCheck n v (extendWeights (weights v)))

/-- Only periods seven, eight and nine need quotient checks. The ten-point
literal support already embeds at period ten. -/
structure ShortChecked (P : Packet) (Q : ShortWeights) : Prop where
  seven : shortWeightCheck 7 P Q.weights7 = true
  eight : shortWeightCheck 8 P Q.weights8 = true
  nine : shortWeightCheck 9 P Q.weights9 = true

section Cycle

variable {n : ℕ} [NeZero n]

theorem pair_failure_of_no_abundance (hn : 7 ≤ n)
    (word : ZMod n → Letter)
    (hno : ∀ x, ¬ Abundant (family (generatedTiles word)) x) (start : ZMod n) :
    windowPairCheck (windowSchedule word start 4) = false := by
  cases h : windowPairCheck (windowSchedule word start 4) with
  | false => rfl
  | true =>
      obtain ⟨x, _, hx⟩ := window_pair_certificate_global word start hn h
      exact False.elim (hno x hx)

/-- Admissibility and the two-point shortcut put every cyclic window into
the packet's explicitly covered initial edge list. -/
theorem initial_windows_mem (P : Packet) (hc : Checked P) (hn : 7 ≤ n)
    (word : ZMod n → Letter)
    (hadm : ∀ start, windowAdmissibleCheck 3 (windowSchedule word start 3) = true)
    (hno : ∀ x, ¬ Abundant (family (generatedTiles word)) x) :
    ∀ start, windowSchedule word start 4 ∈ P.edges := by
  have hs := of_decide_eq_true hc.states
  have he := of_decide_eq_true hc.edges
  intro start
  apply he (windowSchedule word start 4)
  · rw [prefix_windowSchedule]
    exact hs _ (hadm start)
  · rw [suffix_windowSchedule]
    exact hs _ (hadm (start + 1))
  · exact pair_failure_of_no_abundance hn word hno start

theorem recurrent_windows_mem (P : Packet) (hc : Checked P) (hn : 7 ≤ n)
    (word : ZMod n → Letter)
    (hadm : ∀ start, windowAdmissibleCheck 3 (windowSchedule word start 3) = true)
    (hno : ∀ x, ¬ Abundant (family (generatedTiles word)) x) :
    ∀ start, windowSchedule word start 4 ∈ P.recurrent :=
  checked_seven_windows_mem word P.edges P.recurrent P.rankPair hc.pairRank
    (initial_windows_mem P hc hn word hadm hno)

/-- Once the literal ten-point support embeds, the first weight table and
the second finite rank check force the fixed residual seven-window list. -/
theorem residual_windows_of_ten_le (P : Packet) (hc : Checked P) (hn : 10 ≤ n)
    (word : ZMod n → Letter)
    (hadm : ∀ start, windowAdmissibleCheck 3 (windowSchedule word start 3) = true)
    (hno : ∀ x, ¬ Abundant (family (generatedTiles word)) x) :
    ∀ start, encodeWindow (windowSchedule word start 4) ∈ FranklSmallCyclic.residualEdges := by
  have hrec := recurrent_windows_mem P hc (by omega) word hadm hno
  have hleft : ∀ start, windowSchedule word start 4 ∈ P.left4 := by
    intro start
    have hw := List.all_eq_true.mp hc.weight4 (windowSchedule word start 4) (hrec start)
    rcases Bool.or_eq_true_iff.mp hw with hm | hweight
    · exact of_decide_eq_true hm
    · obtain ⟨x, _, hx⟩ := literal_certificate_global word start 4 hn
        (P.weights4 (windowSchedule word start 4)) hweight
      exact False.elim (hno x hx)
  intro start
  have h := checked_cyclic_windows word 3 P.left4
    (fun e => decide (encodeWindow (sevenOfEdge e) ∈ FranklSmallCyclic.residualEdges))
    P.rank4 hc.residualRank hleft start
  simpa only [sevenOfEdge_edge] using of_decide_eq_true h

/-- The second weight table applies to the literal eleven-point support.
The last rank certificate leaves only the all-empty loop. -/
theorem schedule_abundant_of_eleven_le (P : Packet) (hc : Checked P) (hn : 11 ≤ n)
    (word : ZMod n → Letter)
    (hadm : ∀ start, windowAdmissibleCheck 3 (windowSchedule word start 3) = true)
    (hnonzero : ∃ start, word start ≠ ∅) :
    ∃ x, Abundant (family (generatedTiles word)) x := by
  by_contra hnone
  have hno : ∀ x, ¬ Abundant (family (generatedTiles word)) x := by
    intro x hx
    exact hnone ⟨x, hx⟩
  have hres := residual_windows_of_ten_le P hc (by omega) word hadm hno
  have he := of_decide_eq_true hc.extensions
  have hext : ∀ start, windowSchedule word start 5 ∈ P.extensions := by
    intro start
    apply he (windowSchedule word start 5)
    · rw [prefix_windowSchedule]
      exact hres start
    · rw [suffix_windowSchedule]
      exact hres (start + 1)
  have hleft : ∀ start, windowSchedule word start 5 ∈ P.left5 := by
    intro start
    have hw := List.all_eq_true.mp hc.weight5 (windowSchedule word start 5) (hext start)
    rcases Bool.or_eq_true_iff.mp hw with hm | hweight
    · exact of_decide_eq_true hm
    · obtain ⟨x, _, hx⟩ := literal_certificate_global word start 5 hn
        (P.weights5 (windowSchedule word start 5)) hweight
      exact False.elim (hno x hx)
  have hz := zero_of_checked_eight_windows word P.left5 P.rank5 hc.finalRank hleft
  obtain ⟨start, hstart⟩ := hnonzero
  exact hstart (hz start)

/-- The already checked residual graph theorem also closes period ten. -/
theorem schedule_abundant_of_ten_le (P : Packet) (hc : Checked P) (hn : 10 ≤ n)
    (word : ZMod n → Letter)
    (hadm : ∀ start, windowAdmissibleCheck 3 (windowSchedule word start 3) = true)
    (hnonzero : ∃ start, word start ≠ ∅) :
    ∃ x, Abundant (family (generatedTiles word)) x := by
  by_cases hlarge : 11 ≤ n
  · exact schedule_abundant_of_eleven_le P hc hlarge word hadm hnonzero
  · by_contra hnone
    have hno : ∀ x, ¬ Abundant (family (generatedTiles word)) x := by
      intro x hx
      exact hnone ⟨x, hx⟩
    have hres := residual_windows_of_ten_le P hc hn word hadm hno
    apply hnone
    exact FranklSmallCyclic.residual_window_schedule_abundant (by omega) (by omega)
      word hres hnonzero

/-- The large-cycle endpoint has only finite packet checks in addition to
the literal generator span and nontriviality hypotheses. -/
theorem generators_abundant_of_ten_le (P : Packet) (hc : Checked P) (hn : 10 ≤ n)
    (G : Finset (Finset (ZMod n))) (hspan : SpanFourGenerators G)
    (hpos : ∃ g ∈ G, g.Nonempty) : ∃ x, Abundant (family G) x := by
  by_contra hnone
  have hno : ∀ x, ¬ Abundant (family G) x := by
    intro x hx
    exact hnone ⟨x, hx⟩
  obtain ⟨word, hfamily, _, hnonzero, hadm⟩ :=
    counterexample_has_admissible_schedule (by omega) G hspan hpos hno
  obtain ⟨x, hx⟩ := schedule_abundant_of_ten_le P hc hn word hadm hnonzero
  exact hno x (by simpa only [hfamily] using hx)

/-- Checked quotient masks, rather than an unwrapped certificate, justify
the retained edge list when boundary positions coincide. -/
theorem left_windows_of_short_check (P : Packet) (hc : Checked P) (hn : 7 ≤ n)
    (word : ZMod n → Letter)
    (hadm : ∀ start, windowAdmissibleCheck 3 (windowSchedule word start 3) = true)
    (hno : ∀ x, ¬ Abundant (family (generatedTiles word)) x)
    (weights : Word 7 → Fin n → ℕ) (hweights : shortWeightCheck n P weights = true) :
    ∀ start, windowSchedule word start 4 ∈ P.left4 := by
  have hrec := recurrent_windows_mem P hc hn word hadm hno
  intro start
  have hw := List.all_eq_true.mp hweights (windowSchedule word start 4) (hrec start)
  rcases Bool.or_eq_true_iff.mp hw with hm | hweight
  · exact of_decide_eq_true hm
  · obtain ⟨x, _, hx⟩ := FranklSmallCyclic.MaskWindows.windowCheck_global hn word start
      (extendWeights (weights (windowSchedule word start 4))) hweight
    exact False.elim (hno x hx)

theorem residual_windows_of_short (P : Packet) (Q : ShortWeights)
    (hc : Checked P) (hshort : ShortChecked P Q) (hn : 7 ≤ n) (hn' : n ≤ 9)
    (word : ZMod n → Letter)
    (hadm : ∀ start, windowAdmissibleCheck 3 (windowSchedule word start 3) = true)
    (hno : ∀ x, ¬ Abundant (family (generatedTiles word)) x) :
    ∀ start, encodeWindow (windowSchedule word start 4) ∈ FranklSmallCyclic.residualEdges := by
  have hleft : ∀ start, windowSchedule word start 4 ∈ P.left4 := by
    have hcases : n = 7 ∨ n = 8 ∨ n = 9 := by omega
    rcases hcases with rfl | rfl | rfl
    · exact left_windows_of_short_check P hc hn word hadm hno Q.weights7 hshort.seven
    · exact left_windows_of_short_check P hc hn word hadm hno Q.weights8 hshort.eight
    · exact left_windows_of_short_check P hc hn word hadm hno Q.weights9 hshort.nine
  intro start
  have h := checked_cyclic_windows word 3 P.left4
    (fun e => decide (encodeWindow (sevenOfEdge e) ∈ FranklSmallCyclic.residualEdges))
    P.rank4 hc.residualRank hleft start
  simpa only [sevenOfEdge_edge] using of_decide_eq_true h

theorem schedule_abundant_of_seven_le (P : Packet) (Q : ShortWeights)
    (hc : Checked P) (hshort : ShortChecked P Q) (hn : 7 ≤ n)
    (word : ZMod n → Letter)
    (hadm : ∀ start, windowAdmissibleCheck 3 (windowSchedule word start 3) = true)
    (hnonzero : ∃ start, word start ≠ ∅) :
    ∃ x, Abundant (family (generatedTiles word)) x := by
  by_cases hlarge : 10 ≤ n
  · exact schedule_abundant_of_ten_le P hc hlarge word hadm hnonzero
  · by_contra hnone
    have hno : ∀ x, ¬ Abundant (family (generatedTiles word)) x := by
      intro x hx
      exact hnone ⟨x, hx⟩
    have hres := residual_windows_of_short P Q hc hshort hn (by omega) word hadm hno
    apply hnone
    exact FranklSmallCyclic.residual_window_schedule_abundant hn (by omega)
      word hres hnonzero

omit [NeZero n] in
theorem spanFourGenerators_of_contained (G : Finset (Finset (ZMod n)))
    (hspan : ∀ g ∈ G, ∃ p : ZMod n,
      g ⊆ (Finset.univ : Finset (Fin 4)).image (fun j => p + (j.val : ZMod n))) :
    SpanFourGenerators G := by
  intro g hg
  obtain ⟨p, hp⟩ := hspan g hg
  refine ⟨p, Finset.univ.filter (fun j : Fin 4 => p + (j.val : ZMod n) ∈ g), ?_⟩
  ext x
  constructor
  · intro hx
    obtain ⟨j, hj, rfl⟩ := Finset.mem_image.mp hx
    exact (Finset.mem_filter.mp hj).2
  · intro hx
    obtain ⟨j, _, hjx⟩ := Finset.mem_image.mp (hp hx)
    refine Finset.mem_image.mpr ⟨j, Finset.mem_filter.mpr ⟨Finset.mem_univ j, ?_⟩, hjx⟩
    simpa only [hjx] using hx

/-- All positive cycle lengths are covered. The remaining hypotheses are
eleven concrete finite checks on the supplied lists, ranks and weights. -/
theorem generators_abundant (P : Packet) (Q : ShortWeights)
    (hc : Checked P) (hshort : ShortChecked P Q)
    (G : Finset (Finset (ZMod n))) (hspan : SpanFourGenerators G)
    (hpos : ∃ g ∈ G, g.Nonempty) : ∃ x, Abundant (family G) x := by
  by_cases hsmall : n ≤ 6
  · have hcontain : ∀ g ∈ G, ∃ p : ZMod n,
        g ⊆ (Finset.univ : Finset (Fin 4)).image (fun j => p + (j.val : ZMod n)) := by
      intro g hg
      obtain ⟨p, R, rfl⟩ := hspan g hg
      exact ⟨p, Finset.image_subset_image (Finset.subset_univ R)⟩
    exact FranklSmallCyclic.cyclic_abundance_le_six_zmod hsmall hcontain hpos
  · by_contra hnone
    have hno : ∀ x, ¬ Abundant (family G) x := by
      intro x hx
      exact hnone ⟨x, hx⟩
    obtain ⟨word, hfamily, _, hnonzero, hadm⟩ :=
      counterexample_has_admissible_schedule (by omega) G hspan hpos hno
    obtain ⟨x, hx⟩ := schedule_abundant_of_seven_le P Q hc hshort (by omega)
      word hadm hnonzero
    exact hno x (by simpa only [hfamily] using hx)

theorem generators_abundant_of_contained (P : Packet) (Q : ShortWeights)
    (hc : Checked P) (hshort : ShortChecked P Q)
    (G : Finset (Finset (ZMod n)))
    (hspan : ∀ g ∈ G, ∃ p : ZMod n,
      g ⊆ (Finset.univ : Finset (Fin 4)).image (fun j => p + (j.val : ZMod n)))
    (hpos : ∃ g ∈ G, g.Nonempty) : ∃ x, Abundant (family G) x :=
  generators_abundant P Q hc hshort G (spanFourGenerators_of_contained G hspan) hpos

/-- This formulation allows the input family to omit the empty member.
The generator relation records precisely the empty-adjoined family. -/
theorem family_abundant_of_generated_eq (P : Packet) (Q : ShortWeights)
    (hc : Checked P) (hshort : ShortChecked P Q)
    (F G : Finset (Finset (ZMod n)))
    (hspan : ∀ g ∈ G, ∃ p : ZMod n,
      g ⊆ (Finset.univ : Finset (Fin 4)).image (fun j => p + (j.val : ZMod n)))
    (hfamily : family G = insert ∅ F) (hpos : ∃ U ∈ F, U.Nonempty) :
    ∃ x, Abundant F x := by
  obtain ⟨U, hUF, hU⟩ := hpos
  have hUG : U ∈ family G := by
    rw [hfamily]
    exact Finset.mem_insert_of_mem hUF
  have hG := nonempty_generator_of_nonempty_member hUG hU
  obtain ⟨x, hx⟩ := generators_abundant_of_contained P Q hc hshort G hspan hG
  exact ⟨x, abundant_of_generated_eq_insert_empty hfamily hx⟩

/-- The literal published hypothesis: a finite union-closed family generated
by members contained in four consecutive cyclic positions. -/
theorem unionClosed_family_abundant (P : Packet) (Q : ShortWeights)
    (hc : Checked P) (hshort : ShortChecked P Q)
    (F G : Finset (Finset (ZMod n))) (hu : Frankl.UnionClosed F) (hG : G ⊆ F)
    (hspan : ∀ g ∈ G, ∃ p : ZMod n,
      g ⊆ (Finset.univ : Finset (Fin 4)).image (fun j => p + (j.val : ZMod n)))
    (hcover : ∀ U ∈ F, ∃ H ⊆ G, unionOf H = U) (hpos : ∃ U ∈ F, U.Nonempty) :
    ∃ x, Abundant F x :=
  family_abundant_of_generated_eq P Q hc hshort F G hspan
    (generated_family_eq_insert_empty_of_representations hu hG hcover) hpos

end Cycle

end FranklSpanFour.Assembly
