import Conjectures.MaTangCoreBirthday

/-!
# Ma–Tang's random subset-sum threshold conjecture

Rectangular transposition identifies iid row-matrix samples with
iid group-element columns, so that distinctness is a property of
the actual mixed group samples rather than of a proxy space.
-/
namespace MaTangCoreTranspose
open MaTangCoreMatrix MaTangCoreIndexed MaTangCoreOccupancy MaTangCoreSubspace
open MaTangCoreRank MaTangCoreGenerator MaTangCoreQuotient MaTangCoreLinear
open MaTangCoreEncoding MaTangCoreFactor MaTangCoreMultiplicity MaTangCoreCoupling
open MaTangCoreDecay MaTangCoreLowerBound MaTangCoreBirthday

def transposeCols (n : Nat) : List (List Bool) → List (List Bool)
  | [] => List.replicate n []
  | a::as => prependColumn a (transposeCols n as)

theorem transposeCols_length (n : Nat) (cols : List (List Bool))
    (h : RowsOfSize cols n) : (transposeCols n cols).length = n := by
  induction cols with
  | nil => simp [transposeCols]
  | cons a as ih =>
    have ha := h a (by simp)
    have hs : RowsOfSize as n := fun c hc => h c (by simp [hc])
    have ht := ih hs
    rw [transposeCols,prependColumn_length _ _ (ha.trans ht.symm),ht]

theorem transposeCols_size (n : Nat) (cols : List (List Bool)) :
    RowsOfSize (transposeCols n cols) cols.length := by
  induction cols with
  | nil =>
    intro r hr
    simp [transposeCols] at hr
    simp [hr]
  | cons a as ih => exact prependColumn_size a (transposeCols n as) as.length ih

def headColumn (rows : List (List Bool)) : List Bool :=
  rows.map (fun r => r.headD false)

def tailRows (rows : List (List Bool)) : List (List Bool) :=
  rows.map List.tail

theorem headColumn_length (rows : List (List Bool)) :
    (headColumn rows).length = rows.length := by simp [headColumn]

theorem tailRows_length (rows : List (List Bool)) :
    (tailRows rows).length = rows.length := by simp [tailRows]

theorem tailRows_size (k : Nat) (rows : List (List Bool))
    (h : RowsOfSize rows (k+1)) : RowsOfSize (tailRows rows) k := by
  intro r hr
  obtain ⟨u,hu,e⟩ := List.mem_map.mp hr
  have hlen := h u hu
  cases u with
  | nil => simp at hlen
  | cons a as =>
    have he : as.length = k := by simpa using hlen
    simpa [← e] using he

theorem split_rows (k : Nat) (rows : List (List Bool))
    (h : RowsOfSize rows (k+1)) :
    prependColumn (headColumn rows) (tailRows rows) = rows := by
  induction rows with
  | nil => rfl
  | cons a as ih =>
    have ha := h a (by simp)
    have hs : RowsOfSize as (k+1) := fun r hr => h r (by simp [hr])
    cases a with
    | nil => simp at ha
    | cons b bs =>
      change (b::bs) :: prependColumn (headColumn as) (tailRows as) = (b::bs)::as
      rw [ih hs]

theorem head_prepend (a : List Bool) (rows : List (List Bool))
    (h : a.length = rows.length) :
    headColumn (prependColumn a rows) = a := by
  induction a generalizing rows with
  | nil => cases rows with
    | nil => rfl
    | cons r rs => simp at h
  | cons b bs ih =>
    cases rows with
    | nil => simp at h
    | cons r rs =>
      have hs : bs.length = rs.length := by simpa using h
      change b :: headColumn (prependColumn bs rs) = b :: bs
      rw [ih rs hs]

theorem tail_prepend (a : List Bool) (rows : List (List Bool))
    (h : a.length = rows.length) :
    tailRows (prependColumn a rows) = rows := by
  induction a generalizing rows with
  | nil => cases rows with
    | nil => rfl
    | cons r rs => simp at h
  | cons b bs ih =>
    cases rows with
    | nil => simp at h
    | cons r rs =>
      have hs : bs.length = rs.length := by simpa using h
      change r :: tailRows (prependColumn bs rs) = r :: rs
      rw [ih rs hs]

def rowsToCols : Nat → List (List Bool) → List (List Bool)
  | 0, _ => []
  | k+1, rows => headColumn rows :: rowsToCols k (tailRows rows)

theorem rowsToCols_length (k : Nat) (rows : List (List Bool)) :
    (rowsToCols k rows).length = k := by
  induction k generalizing rows with
  | zero => rfl
  | succ k ih => simp [rowsToCols,ih]

theorem rowsToCols_size (k : Nat) (rows : List (List Bool)) :
    RowsOfSize (rowsToCols k rows) rows.length := by
  induction k generalizing rows with
  | zero => simp [RowsOfSize,rowsToCols]
  | succ k ih =>
    intro c hc
    simp only [rowsToCols,List.mem_cons] at hc
    rcases hc with e | he
    · rw [e,headColumn_length]
    · exact (ih (tailRows rows) c he).trans (tailRows_length rows)

theorem transposeCols_inverse (n : Nat) (cols : List (List Bool))
    (h : RowsOfSize cols n) :
    rowsToCols cols.length (transposeCols n cols) = cols := by
  induction cols with
  | nil => rfl
  | cons a as ih =>
    have ha := h a (by simp)
    have hs : RowsOfSize as n := fun c hc => h c (by simp [hc])
    have he : a.length = (transposeCols n as).length :=
      ha.trans (transposeCols_length n as hs).symm
    simp only [List.length_cons,transposeCols,rowsToCols]
    rw [head_prepend _ _ he,tail_prepend _ _ he,ih hs]

theorem rowsToCols_inverse (k : Nat) (rows : List (List Bool))
    (h : RowsOfSize rows k) :
    transposeCols rows.length (rowsToCols k rows) = rows := by
  induction k generalizing rows with
  | zero =>
    induction rows with
    | nil => rfl
    | cons a as ih' =>
      have ha : a = [] := List.length_eq_zero_iff.mp (h a (by simp))
      have hs : RowsOfSize as 0 := fun c hc => h c (by simp [hc])
      have he := ih' hs
      change List.replicate as.length ([] : List Bool) = as at he
      simp [rowsToCols,transposeCols,List.replicate_succ,ha,he]
  | succ k ih =>
    simp only [rowsToCols,transposeCols]
    have he := ih (tailRows rows) (tailRows_size k rows h)
    rw [tailRows_length] at he
    rw [he,split_rows k rows h]

def elementWords (d k : Nat) : List (List Raw) :=
  words (alphabet (2^d)) k

def sampleOfWord (d : Nat) (w : List Raw) : QuotientSample :=
  (transposeCols d (generatorRows d (w.map Prod.fst)),w.map Prod.snd)

def wordOfSample (k : Nat) (s : QuotientSample) : List Raw :=
  pairLabels ((rowsToCols k s.1).map codeRow) s.2

theorem wordOfSample_mem (d k : Nat) (s : QuotientSample)
    (h : s ∈ allSamples d k) : wordOfSample k s ∈ elementWords d k := by
  obtain ⟨ha,hc⟩ := (allSamples_mem d k s).mp h
  have hmat := (matrices_mem d k s.1).mp ha
  apply pairLabels_mem d k _ _ _ hc
  apply (labelWords_mem d k _).mpr
  refine ⟨by rw [List.length_map,rowsToCols_length],?_⟩
  intro b hb
  obtain ⟨u,hu,e⟩ := List.mem_map.mp hb
  rw [← e,← hmat.1,← rowsToCols_size k s.1 u hu]
  exact codeRow_bound u

theorem sampleOfWord_mem (d k : Nat) (w : List Raw)
    (h : w ∈ elementWords d k) : sampleOfWord d w ∈ allSamples d k := by
  have hlen := ((mem_words _ _ _).mp h).1
  apply (allSamples_mem d k _).mpr
  refine ⟨(matrices_mem _ _ _).mpr ⟨?_,?_⟩,raw_snd_mem d k w h⟩
  · exact transposeCols_length d _ (generatorRows_size d _)
  · have hs := transposeCols_size d (generatorRows d (w.map Prod.fst))
    rw [generatorRows_length,List.length_map,hlen] at hs
    exact hs

theorem sample_word_inverse (d k : Nat) (w : List Raw)
    (h : w ∈ elementWords d k) : wordOfSample k (sampleOfWord d w) = w := by
  have hlen := ((mem_words _ _ _).mp h).1
  let ls := w.map Prod.fst
  have hls := (labelWords_mem d k ls).mp (raw_fst_mem d k w h)
  let cols := generatorRows d ls
  have hcols : cols.length = k := (generatorRows_length _ _).trans hls.1
  have he := transposeCols_inverse d cols (generatorRows_size d ls)
  rw [hcols] at he
  change pairLabels ((rowsToCols k (transposeCols d cols)).map codeRow)
    (w.map Prod.snd) = w
  rw [he,generatorRows_decode d ls hls.2]
  exact pairLabels_reconstruct w

theorem word_sample_inverse (d k : Nat) (s : QuotientSample)
    (h : s ∈ allSamples d k) : sampleOfWord d (wordOfSample k s) = s := by
  obtain ⟨ha,hc⟩ := (allSamples_mem d k s).mp h
  have hm := (matrices_mem d k s.1).mp ha
  have hclen := ((coeffWords_mem k s.2).mp hc).1
  let cols := rowsToCols k s.1
  let ls := cols.map codeRow
  have hls : ls.length = s.2.length := by
    dsimp [ls,cols]
    rw [List.length_map,rowsToCols_length,hclen]
  have hs : RowsOfSize cols d := by
    rw [← hm.1]
    exact rowsToCols_size k s.1
  have he := rowsToCols_inverse k s.1 hm.2
  rw [hm.1] at he
  change (transposeCols d (generatorRows d ((pairLabels ls s.2).map Prod.fst)),
    (pairLabels ls s.2).map Prod.snd) = s
  rw [pairLabels_fst _ _ hls,pairLabels_snd _ _ hls,generatorRows_code d cols hs,he]

theorem elementWords_card (d k : Nat) :
    (elementWords d k).length = (allSamples d k).length := by
  apply card_of_bijection _ _ (nodup_words _ _ (alphabet_nodup _))
    (allSamples_nodup d k) (sampleOfWord d)
  · exact sampleOfWord_mem d k
  · intro w hw v hv he
    have h1 := sample_word_inverse d k w hw
    have h2 := sample_word_inverse d k v hv
    rw [← h1,← h2,he]
  · intro s hs
    exact ⟨wordOfSample k s,wordOfSample_mem d k s hs,word_sample_inverse d k s hs⟩

end MaTangCoreTranspose
