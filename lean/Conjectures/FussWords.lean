import Conjectures.FussCycle
import Mathlib.Data.List.Basic
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith

/-! North-run blocks and their literal word statistics. -/
namespace FussWords

def encode : List ℕ → List Bool
  | [] => []
  | n :: ns => List.replicate n true ++ false :: encode ns

def decode : List Bool → List ℕ
  | [] => []
  | false :: xs => 0 :: decode xs
  | true :: xs => match decode xs with
    | [] => []
    | n :: ns => (n+1) :: ns

theorem decode_run (n : ℕ) (xs : List Bool) :
    decode (List.replicate n true ++ false :: xs) = n :: decode xs := by
  induction n with
  | zero => rfl
  | succ n ih => simp [List.replicate_succ, decode, ih]

theorem decode_encode (ns : List ℕ) : decode (encode ns) = ns := by
  induction ns with
  | nil => rfl
  | cons n ns ih => simp [encode, decode_run, ih]

theorem encode_injective : Function.Injective encode := by
  intro x y h
  simpa [decode_encode] using congrArg decode h

def countNE : List Bool → ℕ
  | [] => 0
  | x :: xs => (if x = true ∧ xs.head? = some false then 1 else 0) + countNE xs

def countNNE : List Bool → ℕ
  | [] => 0
  | x :: xs => (if x = true ∧ xs.take 2 = [true, false] then 1 else 0) + countNNE xs

theorem countNE_run (n : ℕ) (xs : List Bool) :
    countNE (List.replicate n true ++ false :: xs) = (if 0 < n then 1 else 0) + countNE xs := by
  cases n with
  | zero => simp [countNE]
  | succ n =>
    induction n with
    | zero => simp [countNE]
    | succ n ih =>
      simpa [List.replicate_succ, countNE] using ih

theorem countNNE_run (n : ℕ) (xs : List Bool) :
    countNNE (List.replicate n true ++ false :: xs) = (if 1 < n then 1 else 0) + countNNE xs := by
  cases n with
  | zero => simp [countNNE]
  | succ n =>
    cases n with
    | zero => simp [countNNE]
    | succ n =>
      induction n with
      | zero => simp [countNNE]
      | succ n ih =>
        simpa [List.replicate_succ, countNNE] using ih

theorem countNE_encode (ns : List ℕ) : countNE (encode ns) = (ns.filter (fun n => 0 < n)).length := by
  induction ns with
  | nil => rfl
  | cons n ns ih =>
    rw [encode, countNE_run, ih]
    by_cases hn : 0 < n <;> simp [hn, Nat.add_comm]

theorem countNNE_encode (ns : List ℕ) : countNNE (encode ns) = (ns.filter (fun n => 1 < n)).length := by
  induction ns with
  | nil => rfl
  | cons n ns ih =>
    rw [encode, countNNE_run, ih]
    by_cases hn : 1 < n <;> simp [hn, Nat.add_comm]

theorem encode_decode_of_ends_east (xs : List Bool) (h : xs.getLast? = some false) :
    encode (decode xs) = xs := by
  induction xs with
  | nil => simp at h
  | cons x xs ih =>
    cases xs with
    | nil =>
      cases x <;> simp [decode, encode] at h ⊢
    | cons y ys =>
      have htail : (y :: ys).getLast? = some false := by simpa using h
      have ht := ih htail
      cases x with
      | false => simpa [decode, encode] using congrArg (List.cons false) ht
      | true =>
        cases hd : decode (y :: ys) with
        | nil => simp [hd, encode] at ht
        | cons n ns =>
          have he : encode (n :: ns) = y :: ys := by simpa [hd] using ht
          simpa [decode, hd, encode, List.replicate_succ] using congrArg (List.cons true) he

/-- Every proper prefix starts at nonnegative height. `true` is north. -/
def safeWord (m : ℕ) : ℤ → List Bool → Prop
  | _, [] => True
  | h, x :: xs => 0 ≤ h ∧ safeWord m (if x then h + m else h - 1) xs

def safeBlocks (m : ℕ) : ℤ → List ℕ → Prop
  | _, [] => True
  | h, n :: ns => 0 ≤ h ∧ safeBlocks m (h + (m : ℤ) * n - 1) ns

theorem safeWord_run (m n : ℕ) (h : ℤ) (xs : List Bool) :
    safeWord m h (List.replicate n true ++ false :: xs) ↔
      0 ≤ h ∧ safeWord m (h + (m : ℤ)*n - 1) xs := by
  induction n generalizing h with
  | zero => simp [safeWord]
  | succ n ih =>
    simp only [List.replicate_succ, List.cons_append, safeWord,
      ↓reduceIte, ih, Nat.cast_succ]
    have hm : (0 : ℤ) ≤ m := by exact_mod_cast (Nat.zero_le m)
    constructor
    · rintro ⟨hh, _, ht⟩
      refine ⟨hh, ?_⟩
      convert ht using 1; ring
    · rintro ⟨hh, ht⟩
      refine ⟨hh, by omega, ?_⟩
      convert ht using 1; ring

theorem safeWord_encode (m : ℕ) (h : ℤ) (ns : List ℕ) :
    safeWord m h (encode ns) ↔ safeBlocks m h ns := by
  induction ns generalizing h with
  | nil => simp [encode, safeWord, safeBlocks]
  | cons n ns ih => simp only [encode, safeWord_run, safeBlocks, ih]

def blockWeight (m n : ℕ) : ℤ := (m : ℤ)*n - 1

def safeWeights : ℤ → List ℤ → Prop
  | _, [] => True
  | h, x :: xs => 0 ≤ h ∧ safeWeights (h+x) xs

theorem safeBlocks_iff_safeWeights (m : ℕ) (h : ℤ) (ns : List ℕ) :
    safeBlocks m h ns ↔ safeWeights h (ns.map (blockWeight m)) := by
  induction ns generalizing h with
  | nil => simp [safeBlocks, safeWeights]
  | cons n ns ih =>
    simp only [safeBlocks, List.map_cons, safeWeights, ih, blockWeight]
    constructor <;> rintro ⟨hh, ht⟩ <;> refine ⟨hh, ?_⟩ <;> convert ht using 1 <;> ring

theorem safeWeights_iff_prefix (xs : List ℤ) (h : ℤ) :
    safeWeights h xs ↔ ∀ t < xs.length, 0 ≤ h + FussCycle.partialSum xs t := by
  induction xs generalizing h with
  | nil => simp [safeWeights]
  | cons x xs ih =>
    simp only [safeWeights, ih, List.length_cons]
    constructor
    · rintro ⟨hh, ht⟩ t hlen
      cases t with
      | zero => simpa [FussCycle.partialSum] using hh
      | succ t =>
        have ht' := ht t (by omega)
        simpa [FussCycle.partialSum, add_assoc] using ht'
    · intro hgood
      constructor
      · have ht := hgood 0 (by simp)
        simpa [FussCycle.partialSum] using ht
      · intro t ht
        have ht' := hgood (t+1) (by omega)
        simpa [FussCycle.partialSum, add_assoc] using ht'

theorem safeWord_encode_iff_good (m : ℕ) (ns : List ℕ) (hne : ns ≠ []) :
    safeWord m 0 (encode ns) ↔ FussCycle.GoodRotation (ns.map (blockWeight m)) 0 := by
  rw [safeWord_encode, safeBlocks_iff_safeWeights, safeWeights_iff_prefix]
  simp only [FussCycle.GoodRotation, List.length_map, List.rotate_zero, zero_add]
  have hlen : 0 < ns.length := List.length_pos_iff.mpr hne
  simp [hlen]

def endHeight (m : ℕ) : ℤ → List Bool → ℤ
  | h, [] => h
  | h, x :: xs => endHeight m (if x then h+m else h-1) xs

theorem safeWord_append (m : ℕ) (h : ℤ) (xs ys : List Bool) :
    safeWord m h (xs ++ ys) ↔ safeWord m h xs ∧ safeWord m (endHeight m h xs) ys := by
  induction xs generalizing h with
  | nil => simp [safeWord, endHeight]
  | cons x xs ih => simp only [List.cons_append, safeWord, endHeight, ih, and_assoc]

theorem safeWord_append_east (m : ℕ) (h : ℤ) (xs : List Bool) :
    safeWord m h (xs ++ [false]) ↔ safeWord m h xs ∧ 0 ≤ endHeight m h xs := by
  rw [safeWord_append]
  simp [safeWord]

theorem endHeight_counts (m : ℕ) (h : ℤ) (xs : List Bool) :
    endHeight m h xs = h + (m : ℤ) * (xs.count true : ℤ) - (xs.count false : ℤ) := by
  induction xs generalizing h with
  | nil => simp [endHeight]
  | cons x xs ih => cases x <;> simp [endHeight, ih] <;> ring

theorem encode_count_north (ns : List ℕ) : (encode ns).count true = ns.sum := by
  induction ns with
  | nil => rfl
  | cons n ns ih => simp [encode, ih]

theorem encode_count_east (ns : List ℕ) : (encode ns).count false = ns.length := by
  induction ns with
  | nil => rfl
  | cons n ns ih => simp [encode, ih, List.count_replicate]

theorem endHeight_encode (m : ℕ) (h : ℤ) (ns : List ℕ) :
    endHeight m h (encode ns) = h + (m : ℤ)*(ns.sum : ℤ) - ns.length := by
  rw [endHeight_counts, encode_count_north, encode_count_east]

theorem encode_append (as bs : List ℕ) : encode (as ++ bs) = encode as ++ encode bs := by
  induction as with
  | nil => rfl
  | cons a as ih => simp [encode, ih, List.append_assoc]

theorem weight_sum (m : ℕ) (ns : List ℕ) :
    (ns.map (blockWeight m)).sum = (m : ℤ) * (ns.sum : ℤ) - ns.length := by
  induction ns with
  | nil => simp
  | cons n ns ih =>
    simp only [List.map_cons, List.sum_cons, blockWeight, List.length_cons, Nat.cast_add,
      Nat.cast_succ, ih]
    ring

theorem good_blocks_end_zero (m : ℕ) (hm : 0 < m) (ns : List ℕ) (hne : ns ≠ [])
    (hsum : (ns.map (blockWeight m)).sum = -1)
    (hgood : FussCycle.GoodRotation (ns.map (blockWeight m)) 0) : ns.getLast hne = 0 := by
  let a := ns.getLast hne
  let front := ns.dropLast
  have hsplit : front ++ [a] = ns := List.dropLast_append_getLast hne
  have hgood' := hgood.2 front.length (by rw [← hsplit]; simp)
  have hprefix : FussCycle.partialSum ((front ++ [a]).map (blockWeight m)) front.length =
      (front.map (blockWeight m)).sum := by
    simp [FussCycle.partialSum]
  rw [← hsplit] at hsum hgood'
  simp only [List.rotate_zero] at hgood'
  rw [hprefix] at hgood'
  simp only [List.map_append, List.map_cons, List.map_nil, List.sum_append, List.sum_cons,
    List.sum_nil, add_zero, blockWeight] at hsum
  have hp : (0 : ℤ) < m := by exact_mod_cast hm
  have ha : (0 : ℤ) ≤ a := by exact_mod_cast Nat.zero_le a
  have hprod : (m : ℤ) * a = 0 := by nlinarith
  have haz : (a : ℤ) = 0 := (mul_eq_zero.mp hprod).resolve_left (ne_of_gt hp)
  exact_mod_cast haz

/-- Removing the compulsory final east step gives a literal Fuss--Dyck word. -/
theorem good_blocks_give_path (m n : ℕ) (hm : 0 < m) (ns : List ℕ)
    (hsum : ns.sum = n) (hlen : ns.length = m*n+1)
    (hgood : FussCycle.GoodRotation (ns.map (blockWeight m)) 0) :
    ∃ w : List Bool, encode ns = w ++ [false] ∧
      w.count true = n ∧ w.count false = m*n ∧ safeWord m 0 w ∧ endHeight m 0 w = 0 ∧
      countNE w = (ns.filter (fun a => 0 < a)).length ∧
      countNNE w = (ns.filter (fun a => 1 < a)).length := by
  have hne : ns ≠ [] := by intro he; simp [he] at hlen
  have hw : (ns.map (blockWeight m)).sum = -1 := by
    rw [weight_sum, hsum, hlen]
    push_cast
    ring
  have hz := good_blocks_end_zero m hm ns hne hw hgood
  let front := ns.dropLast
  have hsplit : front ++ [0] = ns := by
    simpa [hz, front] using (List.dropLast_append_getLast hne)
  have hfrontsum : front.sum = n := by simpa [← hsplit] using hsum
  have hfrontlen : front.length = m*n := by
    rw [← hsplit] at hlen
    simp at hlen
    omega
  refine ⟨encode front, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · rw [← hsplit, encode_append]
    rfl
  · simpa [encode_count_north] using hfrontsum
  · simpa [encode_count_east] using hfrontlen
  · have hs := (safeWord_encode_iff_good m ns hne).mpr hgood
    rw [← hsplit, encode_append] at hs
    exact (safeWord_append_east m 0 (encode front)).mp hs |>.1
  · rw [endHeight_encode, hfrontsum, hfrontlen]
    push_cast
    ring
  · rw [countNE_encode, ← hsplit]
    simp
  · rw [countNNE_encode, ← hsplit]
    simp

theorem endHeight_append (m : ℕ) (h : ℤ) (xs ys : List Bool) :
    endHeight m h (xs ++ ys) = endHeight m (endHeight m h xs) ys := by
  induction xs generalizing h with
  | nil => rfl
  | cons x xs ih => simp only [List.cons_append, endHeight, ih]

theorem positive_path_ends_east (m : ℕ) (hm : 0 < m) (w : List Bool) (hne : w ≠ [])
    (hsafe : safeWord m 0 w) (hend : endHeight m 0 w = 0) : w.getLast? = some false := by
  let last := w.getLast hne
  let front := w.dropLast
  have hsplit : front ++ [last] = w := List.dropLast_append_getLast hne
  cases hl : last with
  | false => rw [← hsplit, hl]; simp
  | true =>
    rw [← hsplit, safeWord_append] at hsafe
    rw [← hsplit, endHeight_append, hl] at hend
    have hstart : 0 ≤ endHeight m 0 front := by simpa [safeWord, hl] using hsafe.2
    simp only [endHeight, ↓reduceIte] at hend
    have hm' : (0 : ℤ) < m := by exact_mod_cast hm
    omega

theorem countNE_append_east (w : List Bool) (h : w.getLast? = some false) :
    countNE (w ++ [false]) = countNE w := by
  have he := encode_decode_of_ends_east w h
  have henc : encode (decode w ++ [0]) = w ++ [false] := by rw [encode_append, he]; rfl
  rw [← henc, countNE_encode, ← he, countNE_encode]
  simp [decode_encode]

theorem countNNE_append_east (w : List Bool) (h : w.getLast? = some false) :
    countNNE (w ++ [false]) = countNNE w := by
  have he := encode_decode_of_ends_east w h
  have henc : encode (decode w ++ [0]) = w ++ [false] := by rw [encode_append, he]; rfl
  rw [← henc, countNNE_encode, ← he, countNNE_encode]
  simp [decode_encode]

/-- Appending east and decoding recovers the unique good block sequence. -/
theorem path_gives_good_blocks (m n : ℕ) (hm : 0 < m) (hn : 0 < n) (w : List Bool)
    (hN : w.count true = n) (hE : w.count false = m*n)
    (hsafe : safeWord m 0 w) (hend : endHeight m 0 w = 0) :
    ∃ ns : List ℕ, encode ns = w ++ [false] ∧ ns.sum = n ∧ ns.length = m*n+1 ∧
      FussCycle.GoodRotation (ns.map (blockWeight m)) 0 ∧
      (ns.filter (fun a => 0 < a)).length = countNE w ∧
      (ns.filter (fun a => 1 < a)).length = countNNE w := by
  have hne : w ≠ [] := by intro he; simp [he] at hN; omega
  have hlast := positive_path_ends_east m hm w hne hsafe hend
  let ns := decode (w ++ [false])
  have hencode : encode ns = w ++ [false] := by
    apply encode_decode_of_ends_east
    simp
  have hnsne : ns ≠ [] := by intro he; simp [he, encode] at hencode
  refine ⟨ns, hencode, ?_, ?_, ?_, ?_, ?_⟩
  · rw [← encode_count_north, hencode]
    simpa using hN
  · rw [← encode_count_east, hencode]
    simp [hE]
  · apply (safeWord_encode_iff_good m ns hnsne).mp
    rw [hencode, safeWord_append_east, hend]
    exact ⟨hsafe, by simp⟩
  · rw [← countNE_encode, hencode, countNE_append_east w hlast]
  · rw [← countNNE_encode, hencode, countNNE_append_east w hlast]

/-- Actual words and good block sequences with the two pattern statistics fixed. -/
def DyckPaths (m n k i : ℕ) :=
  {w : List Bool // w.count true = n ∧ w.count false = m*n ∧ safeWord m 0 w ∧
    endHeight m 0 w = 0 ∧ countNE w = k ∧ countNNE w = i}

def GoodBlocks (m n k i : ℕ) :=
  {ns : List ℕ // ns.sum = n ∧ ns.length = m*n+1 ∧
    FussCycle.GoodRotation (ns.map (blockWeight m)) 0 ∧
    (ns.filter (fun a => 0 < a)).length = k ∧
    (ns.filter (fun a => 1 < a)).length = i}

noncomputable def blocksToWord (m n k i : ℕ) (hm : 0 < m) (b : GoodBlocks m n k i) : DyckPaths m n k i := by
  obtain ⟨hs, hl, hg, hk, hi⟩ := b.property
  let ex := good_blocks_give_path m n hm b.val hs hl hg
  refine ⟨Classical.choose ex, ?_⟩
  obtain ⟨he, hN, hE, hsafe, hend, hNE, hNNE⟩ := Classical.choose_spec ex
  exact ⟨hN, hE, hsafe, hend, hNE.trans hk, hNNE.trans hi⟩

theorem blocksToWord_encode (m n k i : ℕ) (hm : 0 < m) (b : GoodBlocks m n k i) :
    encode b.val = (blocksToWord m n k i hm b).val ++ [false] := by
  exact (Classical.choose_spec (good_blocks_give_path m n hm b.val b.property.1
    b.property.2.1 b.property.2.2.1)).1

noncomputable def wordToBlocks (m n k i : ℕ) (hm : 0 < m) (hn : 0 < n) (w : DyckPaths m n k i) : GoodBlocks m n k i := by
  obtain ⟨hN, hE, hsafe, hend, hNE, hNNE⟩ := w.property
  let ex := path_gives_good_blocks m n hm hn w.val hN hE hsafe hend
  refine ⟨Classical.choose ex, ?_⟩
  obtain ⟨he, hs, hl, hg, hk, hi⟩ := Classical.choose_spec ex
  exact ⟨hs, hl, hg, hk.trans hNE, hi.trans hNNE⟩

theorem wordToBlocks_encode (m n k i : ℕ) (hm : 0 < m) (hn : 0 < n) (w : DyckPaths m n k i) :
    encode (wordToBlocks m n k i hm hn w).val = w.val ++ [false] := by
  exact (Classical.choose_spec (path_gives_good_blocks m n hm hn w.val w.property.1
    w.property.2.1 w.property.2.2.1 w.property.2.2.2.1)).1

noncomputable def goodBlocksEquivPaths (m n k i : ℕ) (hm : 0 < m) (hn : 0 < n) :
    GoodBlocks m n k i ≃ DyckPaths m n k i where
  toFun := blocksToWord m n k i hm
  invFun := wordToBlocks m n k i hm hn
  left_inv b := by
    apply Subtype.ext
    apply encode_injective
    rw [wordToBlocks_encode, ← blocksToWord_encode]
  right_inv w := by
    apply Subtype.ext
    apply List.append_cancel_right (bs := [false])
    rw [← blocksToWord_encode, wordToBlocks_encode]

end FussWords
