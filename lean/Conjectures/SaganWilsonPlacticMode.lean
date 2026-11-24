import Init

/-!
# Sagan–Wilson’s plactic coefficient-mode conjecture

Partial formalization using the insertion-tableau definition of
centralizers given by Sagan and Wilson, p. 725. The row-insertion
characterization and counting reduction hold for every positive alphabet
and word length. The hook formula and polynomial bridge to the actual
centralizer count remain to be formalized.
-/

namespace SaganWilsonPlacticMode

def insertRow (x : Nat) : List Nat → List Nat × Option Nat
  | [] => ([x], none)
  | y :: ys =>
    if x < y then (x :: ys, some y)
    else let (r, b) := insertRow x ys
         (y :: r, b)

def insert (x : Nat) : List (List Nat) → List (List Nat)
  | [] => [[x]]
  | r :: rs =>
    let (r', b) := insertRow x r
    r' :: (match b with | none => rs | some y => insert y rs)

def process (t : List (List Nat)) : List Nat → List (List Nat)
  | [] => t
  | x :: xs => process (insert x t) xs

def tableau (w : List Nat) := process [] w

def prependOne : List (List Nat) → List (List Nat)
  | [] => [[1]]
  | r :: rs => (1 :: r) :: rs

theorem insert_prependOne (x : Nat) (h : 1 ≤ x) (t : List (List Nat)) :
    insert x (prependOne t) = prependOne (insert x t) := by
  cases t with
  | nil => simp [insert, prependOne, insertRow, Nat.not_lt.mpr h]
  | cons r rs =>
    cases hr : insertRow x r with
    | mk a b =>
      cases b <;> simp [insert, prependOne, insertRow, Nat.not_lt.mpr h, hr]

theorem process_prependOne (w : List Nat) (t : List (List Nat))
    (h : ∀ x ∈ w, 1 ≤ x) :
    process (prependOne t) w = prependOne (process t w) := by
  induction w generalizing t with
  | nil => rfl
  | cons x xs ih =>
    simp only [process]
    rw [insert_prependOne x (h x (by simp))]
    exact ih _ (fun y hy => h y (by simp [hy]))

theorem process_append (t : List (List Nat)) (u v : List Nat) :
    process t (u ++ v) = process (process t u) v := by
  induction u generalizing t with
  | nil => rfl
  | cons x xs ih => exact ih (insert x t)

theorem tableau_prependOne (w : List Nat) (h : ∀ x ∈ w, 1 ≤ x) :
    tableau (1 :: w) = prependOne (tableau w) :=
  process_prependOne w [] h

theorem tableau_appendOne (w : List Nat) :
    tableau (w ++ [1]) = insert 1 (tableau w) :=
  process_append [] w [1]

def aboveOne (r : List Nat) := r.filter (fun x => decide (1 < x))

theorem aboveOne_insertOne (r : List Nat) :
    aboveOne (insertRow 1 r).1 = (aboveOne r).tail := by
  induction r with
  | nil => simp [insertRow, aboveOne]
  | cons y ys ih =>
    by_cases hy : 1 < y
    · simp [insertRow, aboveOne, hy]
    · cases hr : insertRow 1 ys with
      | mk rr b =>
        simp [insertRow, aboveOne, hy, hr] at *
        exact ih

theorem aboveOne_insertBig (x : Nat) (hx : 1 < x) (r : List Nat) :
    aboveOne (insertRow x r).1 = (insertRow x (aboveOne r)).1 := by
  induction r with
  | nil => simp [aboveOne, insertRow, hx]
  | cons y ys ih =>
    by_cases hy : 1 < y
    · by_cases hxy : x < y
      · simp [aboveOne, insertRow, hx, hy, hxy]
      · cases hr : insertRow x ys with
        | mk rr b =>
          cases hs : insertRow x (aboveOne ys) with
          | mk sr sb =>
            have hi : aboveOne rr = sr := by
              simpa only [hr, hs] using ih
            have hs' : insertRow x (List.filter (fun x => decide (1 < x)) ys) = (sr, sb) := hs
            simp [aboveOne, insertRow, hy, hxy, hr, hs']
            exact hi
    · have hxy : ¬ x < y := by omega
      cases hr : insertRow x ys with
      | mk rr b =>
        simp [aboveOne, insertRow, hy, hxy, hr] at *
        exact ih

def state (t : List (List Nat)) : List Nat := aboveOne (t.headD [])

def next (x : Nat) (r : List Nat) : List Nat :=
  if x = 1 then r.tail else (insertRow x r).1

theorem state_insert (x : Nat) (h : 1 ≤ x) (t : List (List Nat)) :
    state (insert x t) = next x (state t) := by
  cases t with
  | nil =>
    by_cases hx : x = 1
    · subst x
      simp [state, insert, next, aboveOne]
    · have hbig : 1 < x := by omega
      simp [state, insert, next, aboveOne, hx, hbig, insertRow]
  | cons r rs =>
    cases hr : insertRow x r with
    | mk rr b =>
      by_cases hx : x = 1
      · subst x
        have hh := aboveOne_insertOne r
        simp [state, insert, hr, next] at *
        exact hh
      · have hh := aboveOne_insertBig x (by omega) r
        simp [state, insert, hr, next, hx] at *
        exact hh

def run (r : List Nat) : List Nat → List Nat
  | [] => r
  | x :: xs => run (next x r) xs

theorem state_process (w : List Nat) (t : List (List Nat))
    (h : ∀ x ∈ w, 1 ≤ x) :
    state (process t w) = run (state t) w := by
  induction w generalizing t with
  | nil => rfl
  | cons x xs ih =>
    simp only [process, run]
    rw [ih _ (fun y hy => h y (by simp [hy])), state_insert x (h x (by simp))]

theorem insertRow_positive (x : Nat) (hx : 1 ≤ x) (r : List Nat)
    (h : ∀ y ∈ r, 1 ≤ y) :
    ∀ y ∈ (insertRow x r).1, 1 ≤ y := by
  induction r with
  | nil => simp [insertRow, hx]
  | cons a as ih =>
    by_cases ha : x < a
    · simp only [insertRow, ite_eq_left ha, List.mem_cons]
      intro y hy
      rcases hy with rfl | hy
      · exact hx
      · exact h y (by simp [hy])
    · have hh := ih (fun y hy => h y (by simp [hy]))
      cases hr : insertRow x as with
      | mk rr b =>
        simp only [hr] at hh
        simp only [insertRow, ite_eq_right ha, hr, List.mem_cons]
        intro y hy
        rcases hy with rfl | hy
        · exact h _ (by simp)
        · exact hh y hy

theorem top_positive_insert (x : Nat) (hx : 1 ≤ x) (t : List (List Nat))
    (h : ∀ y ∈ t.headD [], 1 ≤ y) :
    ∀ y ∈ (insert x t).headD [], 1 ≤ y := by
  cases t with
  | nil => simp [insert, hx]
  | cons r rs =>
    have hh := insertRow_positive x hx r (by simpa using h)
    cases hr : insertRow x r with
    | mk rr b => simpa [insert, hr] using hh

theorem top_positive_process (w : List Nat) (t : List (List Nat))
    (h : ∀ x ∈ w, 1 ≤ x) (ht : ∀ y ∈ t.headD [], 1 ≤ y) :
    ∀ y ∈ (process t w).headD [], 1 ≤ y := by
  induction w generalizing t with
  | nil => exact ht
  | cons x xs ih =>
    exact ih _ (fun y hy => h y (by simp [hy]))
      (top_positive_insert x (h x (by simp)) t ht)

theorem aboveOne_prepend (t : List (List Nat)) :
    state (prependOne t) = state t := by
  cases t <;> simp [state, prependOne, aboveOne]

theorem insertOne_allOnes (r : List Nat)
    (hp : ∀ x ∈ r, 1 ≤ x) (he : aboveOne r = []) :
    insertRow 1 r = (1 :: r, none) := by
  induction r with
  | nil => rfl
  | cons x xs ih =>
    have hx : 1 ≤ x := hp x (by simp)
    have hnot : ¬ 1 < x := by
      intro hc
      simp [aboveOne, hc] at he
    have hone : x = 1 := by omega
    subst x
    have htail : aboveOne xs = [] := by simpa [aboveOne] using he
    rw [insertRow, ite_eq_right (by omega : ¬ 1 < 1),
        ih (fun y hy => hp y (by simp [hy])) htail]

def CentralizesOne (w : List Nat) : Prop :=
  tableau (1 :: w) = tableau (w ++ [1])

theorem centralizes_iff_empty_state (w : List Nat) (h : ∀ x ∈ w, 1 ≤ x) :
    CentralizesOne w ↔ run [] w = [] := by
  have hs : state (tableau w) = run [] w :=
    state_process w [] h
  have hp : ∀ x ∈ (tableau w).headD [], 1 ≤ x :=
    top_positive_process w [] h (by simp)
  rw [CentralizesOne, tableau_prependOne w h, tableau_appendOne, ← hs]
  constructor
  · intro heq
    have hc := congrArg state heq
    rw [aboveOne_prepend, state_insert 1 (by omega)] at hc
    simp only [next] at hc
    cases hh : state (tableau w) with
    | nil => rfl
    | cons a as =>
      rw [hh] at hc
      have hlen := congrArg List.length hc
      simp at hlen
  · intro he
    generalize ht : tableau w = t at *
    cases t with
    | nil => rfl
    | cons r rs =>
      have hrow : aboveOne r = [] := he
      have hpos : ∀ x ∈ r, 1 ≤ x := by simpa using hp
      simp [prependOne, insert, insertOne_allOnes r hpos hrow]

/-- Recursive enumeration of length-n words over a finite list alphabet. -/
def words (alphabet : List Nat) : Nat → List (List Nat)
  | 0 => [[]]
  | n+1 => alphabet.flatMap fun x => (words alphabet n).map (List.cons x)

def count (alphabet : List Nat) : Nat → List Nat → Nat
  | 0, r => if r = [] then 1 else 0
  | n+1, r => (alphabet.map fun x => count alphabet n (next x r)).sum

theorem count_correct (alphabet : List Nat) (n : Nat) (r : List Nat) :
    count alphabet n r = (words alphabet n).countP (fun w => decide (run r w = [])) := by
  induction n generalizing r with
  | zero =>
    by_cases hr : r = [] <;> simp [count, words, run, hr]
  | succ n ih =>
    simp only [count, words]
    have aux (a : List Nat) :
        (a.map fun x => count alphabet n (next x r)).sum =
        (a.flatMap fun x => (words alphabet n).map (List.cons x)).countP
          (fun w => decide (run r w = [])) := by
      induction a with
      | nil => rfl
      | cons x xs ihxs =>
        simp only [List.map_cons, List.sum_cons, List.flatMap_cons,
          List.countP_append, List.countP_map]
        rw [ihxs, ih]
        rfl
    exact aux alphabet

theorem words_mem_iff (a : List Nat) (n : Nat) (w : List Nat) :
    w ∈ words a n ↔ w.length = n ∧ ∀ x ∈ w, x ∈ a := by
  induction n generalizing w with
  | zero =>
    cases w <;> simp [words]
  | succ n ih =>
    cases w with
    | nil => simp [words, List.mem_flatMap]
    | cons x xs =>
      simp [words, List.mem_flatMap, List.mem_map, ih, and_left_comm]

def isCentralizer (w : List Nat) : Bool :=
  decide (tableau (1 :: w) = tableau (w ++ [1]))

theorem centralizer_count (a : List Nat) (n : Nat)
    (hp : ∀ x ∈ a, 1 ≤ x) :
    count a n [] = (words a n).countP isCentralizer := by
  rw [count_correct]
  have hc (w : List Nat) (hw : w ∈ words a n) :
      decide (run [] w = []) = isCentralizer w := by
    have hm := (words_mem_iff a n w).mp hw
    have h := centralizes_iff_empty_state w (fun x hx => hp x (hm.2 x hx))
    by_cases he : run [] w = []
    · have ht := h.mpr he
      simp [isCentralizer, he, CentralizesOne] at ht ⊢
      exact ht
    · have ht : ¬ CentralizesOne w := fun hh => he (h.mp hh)
      simp [isCentralizer, he, CentralizesOne] at ht ⊢
      exact ht
  have aux (ws : List (List Nat))
      (hh : ∀ w ∈ ws, decide (run [] w = []) = isCentralizer w) :
      ws.countP (fun w => decide (run [] w = [])) = ws.countP isCentralizer := by
    induction ws with
    | nil => rfl
    | cons w ws ih =>
      simp only [List.countP_cons]
      rw [hh w (by simp), ih (fun z hz => hh z (by simp [hz]))]
  exact aux _ hc

/-- Arithmetic part of the repository's check.py, independent of the
    row-insertion reduction above. The theorem linking this formula to
    the cardinality of the centralizer is a separate obligation. -/
def fact : Nat → Nat
  | 0 => 1
  | n+1 => (n+1) * fact n

def partitions : Nat → Nat → Nat → List (List Nat)
  | 0, n, _ => if n = 0 then [[]] else []
  | fuel+1, n, hi =>
    if n = 0 then [[]] else
      (List.range (min n hi)).flatMap fun d0 =>
        let d := d0+1
        (partitions fuel (n-d) d).map (List.cons d)

def hookProduct (s : List Nat) : Nat :=
  ((s.zipIdx).flatMap fun (row, i) =>
    (List.range row).map fun j =>
      row - j + (s.drop (i+1)).countP (fun q => decide (j < q))).foldl (· * ·) 1

def contentProduct (m : Nat) (s : List Nat) : Nat :=
  ((s.zipIdx).flatMap fun (row, i) =>
    (List.range row).map fun j => m-1+j-i).foldl (· * ·) 1

def hookCount (n m : Nat) : Nat :=
  ((partitions n n n).map fun s =>
    (fact n / hookProduct s) * (contentProduct m s.tail / hookProduct s.tail)).sum

def binom (n k : Nat) : Nat :=
  if k ≤ n then fact n / (fact k * fact (n-k)) else 0

def evalRow (a : Nat → Int) (m : Nat) : Int :=
  ((List.range 10).map fun k => a k * (binom m k : Int)).sum

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem hook_values :
    (List.range 10).map (fun i => hookCount 10 (10+i)) =
      [49807595, 101412784, 194002051, 352242670, 611804935, 1022861455, 1654328158, 2598939073, 3979251830, 5954685690] := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem hookCount10_10 : hookCount 10 10 = 49807595 := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem hookCount10_11 : hookCount 10 11 = 101412784 := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem hookCount10_12 : hookCount 10 12 = 194002051 := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem hookCount10_13 : hookCount 10 13 = 352242670 := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem hookCount10_14 : hookCount 10 14 = 611804935 := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem hookCount10_15 : hookCount 10 15 = 1022861455 := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem hookCount10_16 : hookCount 10 16 = 1654328158 := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem hookCount10_17 : hookCount 10 17 = 2598939073 := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem hookCount10_18 : hookCount 10 18 = 3979251830 := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem hookCount10_19 : hookCount 10 19 = 5954685690 := by decide

/-- Exact signed coefficient-extraction functional on the degree-nine
    binomial basis, using only samples m ≥ n. -/
def differenceWeights : List Int := [1287, -11141, 42900, -96445, 139505, -134642, 86706, -35925, 8690, -935]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem differenceWeights_basis :
    (List.range 10).map (fun k =>
      ((List.range 10).map fun i =>
        (differenceWeights[i]!) * (binom (10+i) k : Int)).sum) =
      [0, 0, 0, 0, 0, -1, 1, 0, 0, 0] := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Conditional integer-coefficient comparison for the hook expression.
    The identity of the hook expression with the true centralizer count
    has not been formalized. -/
theorem coefficient_gap_of_hook_formula (a : Nat → Int)
    (h : ∀ m, 10 ≤ m → evalRow a m = (hookCount 10 m : Int)) :
    a 6 - a 5 = 13609 := by
  have hh : ((1287 : Int) * evalRow a 10 + ((-11141 : Int) * evalRow a 11 + ((42900 : Int) * evalRow a 12 + ((-96445 : Int) * evalRow a 13 + ((139505 : Int) * evalRow a 14 + ((-134642 : Int) * evalRow a 15 + ((86706 : Int) * evalRow a 16 + ((-35925 : Int) * evalRow a 17 + ((8690 : Int) * evalRow a 18 + ((-935 : Int) * evalRow a 19 + 0)))))))))) = 13609 := by
    rw [h 10 (by decide), hookCount10_10]
    rw [h 11 (by decide), hookCount10_11]
    rw [h 12 (by decide), hookCount10_12]
    rw [h 13 (by decide), hookCount10_13]
    rw [h 14 (by decide), hookCount10_14]
    rw [h 15 (by decide), hookCount10_15]
    rw [h 16 (by decide), hookCount10_16]
    rw [h 17 (by decide), hookCount10_17]
    rw [h 18 (by decide), hookCount10_18]
    rw [h 19 (by decide), hookCount10_19]
    all_goals decide
  change ((1287 : Int) * (a 0 * 1 + (a 1 * 10 + (a 2 * 45 + (a 3 * 120 + (a 4 * 210 + (a 5 * 252 + (a 6 * 210 + (a 7 * 120 + (a 8 * 45 + (a 9 * 10 + 0)))))))))) + ((-11141 : Int) * (a 0 * 1 + (a 1 * 11 + (a 2 * 55 + (a 3 * 165 + (a 4 * 330 + (a 5 * 462 + (a 6 * 462 + (a 7 * 330 + (a 8 * 165 + (a 9 * 55 + 0)))))))))) + ((42900 : Int) * (a 0 * 1 + (a 1 * 12 + (a 2 * 66 + (a 3 * 220 + (a 4 * 495 + (a 5 * 792 + (a 6 * 924 + (a 7 * 792 + (a 8 * 495 + (a 9 * 220 + 0)))))))))) + ((-96445 : Int) * (a 0 * 1 + (a 1 * 13 + (a 2 * 78 + (a 3 * 286 + (a 4 * 715 + (a 5 * 1287 + (a 6 * 1716 + (a 7 * 1716 + (a 8 * 1287 + (a 9 * 715 + 0)))))))))) + ((139505 : Int) * (a 0 * 1 + (a 1 * 14 + (a 2 * 91 + (a 3 * 364 + (a 4 * 1001 + (a 5 * 2002 + (a 6 * 3003 + (a 7 * 3432 + (a 8 * 3003 + (a 9 * 2002 + 0)))))))))) + ((-134642 : Int) * (a 0 * 1 + (a 1 * 15 + (a 2 * 105 + (a 3 * 455 + (a 4 * 1365 + (a 5 * 3003 + (a 6 * 5005 + (a 7 * 6435 + (a 8 * 6435 + (a 9 * 5005 + 0)))))))))) + ((86706 : Int) * (a 0 * 1 + (a 1 * 16 + (a 2 * 120 + (a 3 * 560 + (a 4 * 1820 + (a 5 * 4368 + (a 6 * 8008 + (a 7 * 11440 + (a 8 * 12870 + (a 9 * 11440 + 0)))))))))) + ((-35925 : Int) * (a 0 * 1 + (a 1 * 17 + (a 2 * 136 + (a 3 * 680 + (a 4 * 2380 + (a 5 * 6188 + (a 6 * 12376 + (a 7 * 19448 + (a 8 * 24310 + (a 9 * 24310 + 0)))))))))) + ((8690 : Int) * (a 0 * 1 + (a 1 * 18 + (a 2 * 153 + (a 3 * 816 + (a 4 * 3060 + (a 5 * 8568 + (a 6 * 18564 + (a 7 * 31824 + (a 8 * 43758 + (a 9 * 48620 + 0)))))))))) + ((-935 : Int) * (a 0 * 1 + (a 1 * 19 + (a 2 * 171 + (a 3 * 969 + (a 4 * 3876 + (a 5 * 11628 + (a 6 * 27132 + (a 7 * 50388 + (a 8 * 75582 + (a 9 * 92378 + 0)))))))))) + 0)))))))))) = 13609 at hh
  clear h
  omega

end SaganWilsonPlacticMode
