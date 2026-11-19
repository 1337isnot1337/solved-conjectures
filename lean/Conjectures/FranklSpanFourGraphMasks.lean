module

public import Conjectures.FranklSpanFourGraphCoverage

/-! Fixed occurrence masks replace repeated finite-set calculations in
the local graph checks. Their small semantic metadata is checked once.
Every successful mask computation is then connected to the existing
admissibility and pair-certificate definitions. -/
@[expose] public section

namespace FranklSpanFour.Graph

open Assembly FranklCyclic FranklLocal

theorem mem_wordOfCode_iff {k : ℕ} (a : ℕ) (p : Fin k) (j : Fin 4) :
    j ∈ wordOfCode k a p ↔ a.testBit (4 * p.val + j.val) = true := by
  induction k generalizing a with
  | zero => exact Fin.elim0 p
  | succ k ih =>
      refine Fin.cases ?_ (fun q => ?_) p
      · have hmod : (a % 16).testBit j.val = a.testBit j.val := by
          simpa only [decide_eq_true j.isLt, Bool.true_and] using
            Nat.testBit_mod_two_pow a 4 j.val
        simp only [wordOfCode, Fin.cons_zero, letterOfCode, Finset.mem_filter,
          Finset.mem_univ, true_and, Fin.val_zero, Nat.mul_zero, Nat.zero_add, hmod]
      · have hdiv : (a / 16).testBit (4 * q.val + j.val) =
            a.testBit (4 * (q.val + 1) + j.val) := by
          have he : 4 * q.val + j.val + 4 = 4 * (q.val + 1) + j.val := by omega
          simpa only [he] using Nat.testBit_div_two_pow (n := 4) a (4 * q.val + j.val)
        change j ∈ wordOfCode k (a / 16) q ↔ a.testBit (4 * (q.val + 1) + j.val) = true
        rw [ih, hdiv]

theorem wordOfCode_subset {k a b : ℕ} (h : a &&& b = a) :
    ∀ p : Fin k, wordOfCode k a p ⊆ wordOfCode k b p := by
  intro p j hj
  rw [mem_wordOfCode_iff] at hj ⊢
  have he := congrArg (fun c => c.testBit (4 * p.val + j.val)) h
  rw [Nat.testBit_and] at he
  exact (Bool.and_eq_true_iff.mp (he.trans hj)).2

theorem localTiles_mono {w : ℕ} {v u : Word (w + 3)}
    (h : ∀ p, v p ⊆ u p) : localTiles w v ⊆ localTiles w u := by
  intro g hg
  obtain ⟨p, j, hj, rfl⟩ := (mem_localTiles _ _ g).mp hg
  exact (mem_localTiles _ _ _).mpr ⟨p, j, h p hj, rfl⟩

theorem admissible_mono {α : Type*} [DecidableEq α] {G H : Finset (Finset α)}
    (hGH : G ⊆ H) (hH : AdmissibleGenerators H) : AdmissibleGenerators G := by
  constructor
  · intro x
    apply le_trans (Finset.card_le_card ?_) (hH.1 x)
    intro g hg
    obtain ⟨hg, hp⟩ := Finset.mem_filter.mp hg
    exact Finset.mem_filter.mpr ⟨hGH hg, hp⟩
  · intro Q hQ hcard
    apply le_trans (Finset.card_le_card ?_) (hH.2 Q (hGH hQ) hcard)
    intro g hg
    obtain ⟨hg, hp⟩ := Finset.mem_filter.mp hg
    exact Finset.mem_filter.mpr ⟨hGH hg, hp⟩

def patternMetadataCheck (patterns : List ℕ) : Bool :=
  patterns.all (fun p => !(windowAdmissibleCheck 1 (wordOfCode 4 p)))

def patternAllowed (patterns : List ℕ) (a : ℕ) : Bool :=
  patterns.all (fun p => decide (p &&& a ≠ p))

theorem patternAllowed_of_admissible {patterns : List ℕ}
    (hm : patternMetadataCheck patterns = true) (a : ℕ)
    (ha : windowAdmissibleCheck 1 (wordOfCode 4 a) = true) : patternAllowed patterns a = true := by
  apply List.all_eq_true.mpr
  intro p hp
  apply decide_eq_true
  intro hsub
  have hadm := admissible_mono (localTiles_mono (wordOfCode_subset hsub))
    ((windowAdmissibleCheck_eq_true _ _).mp ha)
  have hadm' := (windowAdmissibleCheck_eq_true _ _).mpr hadm
  have hbad := List.all_eq_true.mp hm p hp
  simp only [hadm', Bool.not_true, Bool.false_eq_true] at hbad

def patternSliceCheck (table : Table) (patterns : List ℕ) (start count : ℕ) : Bool :=
  (List.range count).all (fun i =>
    !(patternAllowed patterns (start + i)) || table.contains (start + i))

def patternCoverageCheck (table : Table) (patterns : List ℕ) : Bool :=
  (List.range 256).all (fun i => patternSliceCheck table patterns (i * 256) 256)

theorem fourSliceCheck_of_patterns {table : Table} {patterns : List ℕ} {start count : ℕ}
    (hm : patternMetadataCheck patterns = true)
    (hc : patternSliceCheck table patterns start count = true) :
    fourSliceCheck table start count = true := by
  apply List.all_eq_true.mpr
  intro i hi
  have hrow := List.all_eq_true.mp hc i hi
  by_cases ha : windowAdmissibleCheck 1 (wordOfCode 4 (start + i)) = true
  · have hp := patternAllowed_of_admissible hm (start + i) ha
    have ht : table.contains (start + i) = true := by
      simpa only [hp, Bool.not_true, Bool.false_or] using hrow
    exact Bool.or_eq_true_iff.mpr (Or.inr ht)
  · have ha' : windowAdmissibleCheck 1 (wordOfCode 4 (start + i)) = false :=
      Bool.eq_false_iff.mpr ha
    exact Bool.or_eq_true_iff.mpr (Or.inl (by rw [ha']; rfl))

theorem patternCoverageCheck_sound {table : Table} {patterns : List ℕ}
    (hc : patternCoverageCheck table patterns = true) {a : ℕ}
    (ha : a < 16 ^ 4) (hp : patternAllowed patterns a = true) : table.contains a = true := by
  have hq : a / 256 < 256 := by norm_num at ha ⊢; omega
  have hr : a % 256 < 256 := Nat.mod_lt _ (by decide)
  have hs := List.all_eq_true.mp hc (a / 256) (List.mem_range.mpr hq)
  have hrow := List.all_eq_true.mp hs (a % 256) (List.mem_range.mpr hr)
  have he : a / 256 * 256 + a % 256 = a := by omega
  simpa only [he, hp, Bool.not_true, Bool.false_or] using hrow

theorem fourCoverageCheck_of_patterns {table : Table} {patterns : List ℕ}
    (hm : patternMetadataCheck patterns = true)
    (hc : patternCoverageCheck table patterns = true) : fourCoverageCheck table = true := by
  apply fourCoverageCheck_of_covers
  intro v hv
  apply patternCoverageCheck_sound hc (wordCode_lt v)
  apply patternAllowed_of_admissible hm
  simpa only [wordOfCode_wordCode] using hv

structure PairRow where
  shape : Fin 4
  x : Fin 10
  y : Fin 10
  forbidden : ℕ

def pairRowMetadataCheck (r : PairRow) : Bool :=
  decide (r.x ∈ centralTile r.shape ∧ r.y ∈ centralTile r.shape ∧
    ∀ p : Fin 7, ∀ j : Fin 4, ¬ Disjoint (localTile 4 p j) (centralTile r.shape) →
      r.x ∈ localTile 4 p j ∨ r.y ∈ localTile 4 p j ∨
        r.forbidden.testBit (4 * p.val + j.val) = true)

def pairMetadataCheck (rows : List PairRow) : Bool := rows.all pairRowMetadataCheck

def pairRowTest (a : ℕ) (r : PairRow) : Bool :=
  a.testBit (12 + r.shape.val) && decide (a &&& r.forbidden = 0)

def pairMaskCheck (rows : List PairRow) (a : ℕ) : Bool := rows.any (pairRowTest a)

theorem pairCertificateCheck_complete {α : Type*} [DecidableEq α]
    {G : Finset (Finset α)} {g : Finset α}
    (h : ∃ x ∈ g, ∃ y ∈ g, ∀ k ∈ G, ¬ Disjoint k g → x ∈ k ∨ y ∈ k) :
    pairCertificateCheck G g = true :=
  decide_eq_true h

theorem pairRowTest_sound {r : PairRow} (hm : pairRowMetadataCheck r = true)
    {a : ℕ} (hc : pairRowTest a r = true) : windowPairCheck (wordOfCode 7 a) = true := by
  obtain ⟨hx, hy, hforbidden⟩ := of_decide_eq_true hm
  obtain ⟨hshape, hzero⟩ := Bool.and_eq_true_iff.mp hc
  have hzero' : a &&& r.forbidden = 0 := of_decide_eq_true hzero
  have hshape' : r.shape ∈ wordOfCode 7 a ⟨3, by decide⟩ :=
    (mem_wordOfCode_iff _ _ _).mpr hshape
  apply decide_eq_true
  refine ⟨r.shape, hshape', ?_⟩
  apply pairCertificateCheck_complete
  refine ⟨r.x, hx, r.y, hy, ?_⟩
  intro g hg hmeet
  obtain ⟨p, j, hj, rfl⟩ := (mem_localTiles _ _ g).mp hg
  rcases hforbidden p j hmeet with hhit | hhit | hbad
  · exact Or.inl hhit
  · exact Or.inr hhit
  · have hselected := (mem_wordOfCode_iff _ _ _).mp hj
    have hbit := congrArg (fun c => c.testBit (4 * p.val + j.val)) hzero'
    simp only [Nat.testBit_and, hselected, hbad, Bool.and_self, Nat.zero_testBit] at hbit
    cases hbit

theorem pairMaskCheck_sound {rows : List PairRow} (hm : pairMetadataCheck rows = true)
    (a : ℕ) (hc : pairMaskCheck rows a = true) : windowPairCheck (wordOfCode 7 a) = true := by
  obtain ⟨r, hr, htest⟩ := List.any_eq_true.mp hc
  exact pairRowTest_sound (List.all_eq_true.mp hm r hr) htest

theorem seven_edges_cover_masks {table : Table} {rows : List PairRow}
    (hb : fourBoundCheck table = true) (hm : pairMetadataCheck rows = true)
    (v : Word 7) (hp : wordPrefix v ∈ decodeWords 6 (sixCodes table))
    (hs : wordSuffix v ∈ decodeWords 6 (sixCodes table)) (hpair : windowPairCheck v = false) :
    v ∈ decodeWords 7 (edgeCodes table (pairMaskCheck rows)) :=
  seven_edges_cover hb (fun a _ => pairMaskCheck_sound hm a) v hp hs hpair

end FranklSpanFour.Graph
