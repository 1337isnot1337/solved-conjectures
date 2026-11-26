import Conjectures.SaganWilsonPlacticMode

/-!
# Certified dynamic program for the plactic centralizer count

The trie enumerates only weakly increasing bounded row states. Its
lookups and the length-based pruning are justified by theorems for
every alphabet and every word length.
-/

namespace SaganWilsonPlacticMode

inductive ValidRow : Nat → Nat → List Nat → Prop where
  | nil {lo hi : Nat} : ValidRow lo hi []
  | cons {lo hi x : Nat} {xs : List Nat} :
      lo ≤ x → x ≤ hi → ValidRow x hi xs → ValidRow lo hi (x :: xs)

theorem validRow_weaken {lo lo' hi : Nat} {r : List Nat}
    (h : ValidRow lo hi r) (hl : lo' ≤ lo) : ValidRow lo' hi r := by
  cases h with
  | nil => exact .nil
  | cons h1 h2 ht => exact .cons (Nat.le_trans hl h1) h2 ht

theorem insertRow_valid (x : Nat) (r : List Nat) {lo hi : Nat}
    (hxlo : lo ≤ x) (hxhi : x ≤ hi) (hr : ValidRow lo hi r) :
    ValidRow lo hi (insertRow x r).1 := by
  induction r generalizing lo with
  | nil => exact .cons hxlo hxhi .nil
  | cons y ys ih =>
    cases hr with
    | cons hlo hhi ht =>
      by_cases hxy : x < y
      · simp only [insertRow, ite_eq_left hxy]
        exact .cons hxlo hxhi (validRow_weaken ht (Nat.le_of_lt hxy))
      · have hh := ih (Nat.le_of_not_lt hxy) ht
        cases hp : insertRow x ys with
        | mk rr b =>
          rw [hp] at hh
          simp only [insertRow, ite_eq_right hxy, hp]
          exact .cons hlo hhi hh

theorem insertRow_length_bounds (x : Nat) (r : List Nat) :
    r.length ≤ (insertRow x r).1.length ∧
      (insertRow x r).1.length ≤ r.length+1 := by
  induction r with
  | nil => simp [insertRow]
  | cons y ys ih =>
    by_cases hxy : x < y
    · simp [insertRow, hxy]
    · cases hp : insertRow x ys with
      | mk rr b =>
        rw [hp] at ih
        change ys.length ≤ rr.length ∧ rr.length ≤ ys.length+1 at ih
        simp only [insertRow, ite_eq_right hxy, hp, List.length_cons]
        omega

theorem next_length_bounds (x : Nat) (r : List Nat) :
    r.length ≤ (next x r).length+1 ∧ (next x r).length ≤ r.length+1 := by
  by_cases hx : x = 1
  · subst x
    cases r <;> simp [next]
    omega
  · have h := insertRow_length_bounds x r
    simp only [next, ite_eq_right hx]
    omega

theorem count_zero_of_length (a : List Nat) (n : Nat) (r : List Nat)
    (h : n < r.length) : count a n r = 0 := by
  induction n generalizing r with
  | zero =>
    have hr : r ≠ [] := by
      intro he
      simp [he] at h
    simp [count, hr]
  | succ n ih =>
    simp only [count]
    have hzero (x : Nat) : count a n (next x r) = 0 := by
      have hl := (next_length_bounds x r).1
      exact ih _ (by omega)
    have hsum (b : List Nat) :
        (b.map fun x => count a n (next x r)).sum = 0 := by
      induction b with
      | nil => rfl
      | cons x xs ihxs =>
        simp only [List.map_cons, List.sum_cons, hzero x, ihxs, Nat.zero_add]
    exact hsum a

def alphabet (m : Nat) : List Nat := (List.range m).map (·+1)

theorem mem_alphabet (m x : Nat) : x ∈ alphabet m ↔ 1 ≤ x ∧ x ≤ m := by
  simp only [alphabet, List.mem_map, List.mem_range]
  constructor
  · rintro ⟨i, hi, rfl⟩
    omega
  · rintro ⟨h1,h2⟩
    exact ⟨x-1, by omega, by omega⟩

theorem next_valid {m : Nat} {x : Nat} {r : List Nat}
    (hr : ValidRow 2 m r) (hx : x ∈ alphabet m) :
    ValidRow 2 m (next x r) := by
  have hx' := (mem_alphabet m x).mp hx
  by_cases he : x = 1
  · subst x
    simp only [next]
    cases hr with
    | nil => exact .nil
    | cons hlo hhi ht => exact validRow_weaken ht hlo
  · simp only [next, ite_eq_right he]
    exact insertRow_valid x r (by omega) hx'.2 hr

inductive RowTrie where
  | node (value : Nat) (children : List RowTrie)

def tabulate (f : List Nat → Nat) (m : Nat) :
    Nat → Nat → List Nat → RowTrie
  | 0, _, pre => .node (f pre) []
  | d+1, lo, pre =>
    .node (f pre) ((List.range (m+1-lo)).map fun i =>
      tabulate f m d (lo+i) (pre ++ [lo+i]))

def lookup : List Nat → Nat → RowTrie → Nat
  | [], _, .node v _ => v
  | x::xs, lo, .node _ children =>
    match children[x-lo]? with
    | none => 0
    | some t => lookup xs x t

theorem lookup_tabulate (f : List Nat → Nat) (m d lo : Nat)
    (pre r : List Nat) (hlen : r.length ≤ d) (hr : ValidRow lo m r) :
    lookup r lo (tabulate f m d lo pre) = f (pre ++ r) := by
  induction d generalizing lo pre r with
  | zero =>
    cases r with
    | nil => simp [lookup, tabulate]
    | cons x xs => simp at hlen
  | succ d ih =>
    cases r with
    | nil => simp [lookup, tabulate]
    | cons x xs =>
      cases hr with
      | cons h1 h2 ht =>
        have hi : x-lo < m+1-lo := by omega
        have he : lo+(x-lo) = x := by omega
        have hget :
            ((List.range (m+1-lo)).map fun i =>
                tabulate f m d (lo+i) (pre ++ [lo+i]))[x-lo]? =
              some (tabulate f m d x (pre ++ [x])) := by
          simp [hi, he]
        simp only [tabulate, lookup, hget]
        rw [ih x (pre ++ [x]) xs (by simp at hlen; omega) ht]
        simp

def cap (N n : Nat) := min n (N-n)

def countTrie (m N : Nat) : Nat → RowTrie
  | 0 => tabulate (fun r => if r = [] then 1 else 0) m 0 2 []
  | n+1 =>
    let prev := countTrie m N n
    tabulate (fun r =>
      ((alphabet m).map fun x =>
        let rr := next x r
        if n < rr.length then 0 else lookup rr 2 prev).sum)
      m (cap N (n+1)) 2 []

theorem countTrie_correct (m N n : Nat) (hn : n ≤ N) (r : List Nat)
    (hlen : r.length ≤ cap N n) (hr : ValidRow 2 m r) :
    lookup r 2 (countTrie m N n) = count (alphabet m) n r := by
  induction n generalizing r with
  | zero =>
    have h0 : r.length ≤ 0 := by simpa [cap] using hlen
    rw [countTrie, lookup_tabulate _ _ _ _ _ _ h0 hr]
    simp [count]
  | succ n ih =>
    simp only [countTrie]
    rw [lookup_tabulate _ _ _ _ _ _ hlen hr]
    simp only [List.nil_append, count]
    have he (x : Nat) (hx : x ∈ alphabet m) :
        (if n < (next x r).length then 0
         else lookup (next x r) 2 (countTrie m N n)) =
         count (alphabet m) n (next x r) := by
      by_cases hl : n < (next x r).length
      · simp only [ite_eq_left hl]
        exact (count_zero_of_length _ _ _ hl).symm
      · simp only [ite_eq_right hl]
        have hb := (next_length_bounds x r).2
        have hh : (next x r).length ≤ cap N n := by
          simp only [cap, Nat.le_min] at hlen ⊢
          omega
        exact ih (by omega) _ hh (next_valid hr hx)
    have ha (b : List Nat) (hb : ∀ x ∈ b, x ∈ alphabet m) :
        (b.map fun x =>
          if n < (next x r).length then 0
          else lookup (next x r) 2 (countTrie m N n)).sum =
        (b.map fun x => count (alphabet m) n (next x r)).sum := by
      induction b with
      | nil => rfl
      | cons x xs ihxs =>
        simp only [List.map_cons, List.sum_cons]
        rw [he x (hb x (by simp)), ihxs (fun y hy => hb y (by simp [hy]))]
    exact ha _ (fun x hx => hx)

def countFast (m n : Nat) : Nat := lookup [] 2 (countTrie m n n)

theorem countFast_correct (m n : Nat) :
    countFast m n = count (alphabet m) n [] := by
  exact countTrie_correct m n n (Nat.le_refl n) [] (Nat.zero_le _) .nil

end SaganWilsonPlacticMode
