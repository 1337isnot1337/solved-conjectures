import Conjectures.SaganWilsonPlacticModeRelabel

namespace SaganWilsonPlacticMode

theorem words_map_letters (a : List Nat) (f : Nat → Nat) (n : Nat) :
    words (a.map f) n = (words a n).map (List.map f) := by
  induction n with
  | zero => rfl
  | succ n ih =>
    simp only [words, ih, List.flatMap_map, List.map_flatMap, List.map_map]
    rfl

theorem words_filter_letters (a : List Nat) (p : Nat → Bool) (n : Nat) :
    words (a.filter p) n = (words a n).filter (fun w => w.all p) := by
  induction n with
  | zero => rfl
  | succ n ih =>
    simp only [words, ih]
    have aux (b : List Nat) :
        (b.filter p).flatMap (fun x =>
          ((words a n).filter (fun w => w.all p)).map (List.cons x)) =
        (b.flatMap fun x => (words a n).map (List.cons x)).filter (fun w => w.all p) := by
      induction b with
      | nil => rfl
      | cons x xs ihxs =>
        cases hx : p x <;>
          simp [List.filter, hx, List.filter_append, List.filter_map,
            Function.comp_def, ihxs]
    exact aux a

theorem alphabet_succ (m : Nat) :
    alphabet (m+1) = alphabet m ++ [m+1] := by
  simp [alphabet, List.range_succ, List.map_append]

def avoidLetter (p x : Nat) : Bool := decide (x ≠ p)

theorem all_avoidLetter (p : Nat) (w : List Nat) :
    w.all (avoidLetter p) = true ↔ p ∉ w := by
  simp only [List.all_eq_true, avoidLetter, decide_eq_true_eq]
  constructor
  · intro h hp
    exact h p hp rfl
  · intro h x hx he
    subst x
    exact h hx

theorem alphabet_delete_map (m p : Nat) (hp1 : 1 ≤ p) (hp2 : p ≤ m+1) :
    (alphabet (m+1)).filter (avoidLetter p) = (alphabet m).map (skipLetter p) := by
  induction m generalizing p with
  | zero =>
    have he : p = 1 := by omega
    subst p
    rfl
  | succ m ih =>
    by_cases hp : p ≤ m+1
    · rw [alphabet_succ (m+1), List.filter_append, ih p hp1 hp,
        alphabet_succ m, List.map_append]
      have hskip : skipLetter p (m+1) = m+2 := by
        simp [skipLetter, show ¬ m+1 < p by omega]
      have ha : avoidLetter p (m+2) = true := by
        simp [avoidLetter]
        omega
      simp [hskip, ha]
    · have he : p = m+2 := by omega
      subst p
      rw [alphabet_succ (m+1), List.filter_append]
      have hf : (alphabet (m+1)).filter (avoidLetter (m+2)) =
          alphabet (m+1) := by
        apply List.filter_eq_self.mpr
        intro x hx
        have hh := (mem_alphabet (m+1) x).mp hx
        simp [avoidLetter]
        omega
      have hm : (alphabet (m+1)).map (skipLetter (m+2)) = alphabet (m+1) := by
        calc
          _ = (alphabet (m+1)).map id := List.map_congr_left (by
            intro x hx
            exact skipLetter_fixed (m+2) x (by
              have hh := (mem_alphabet (m+1) x).mp hx
              omega))
          _ = _ := by simp
      rw [hf, hm]
      simp [avoidLetter]

def requires (k : Nat) (w : List Nat) : Bool :=
  (List.range k).all (fun i => w.contains (i+2))

theorem requires_succ (k : Nat) (w : List Nat) :
    requires (k+1) w = (requires k w && w.contains (k+2)) := by
  simp [requires, List.range_succ, List.all_append]

theorem requires_map_iff (f : Nat → Nat) (hf : OrderRelabel f)
    (k : Nat) (hfix : ∀ i, i < k → f (i+2) = i+2) (w : List Nat) :
    requires k (w.map f) = true ↔ requires k w = true := by
  simp only [requires, List.all_eq_true, List.mem_range, List.contains_iff_mem]
  constructor
  · intro h i hi
    exact (fixed_letter_mem_map hf (i+2) (hfix i hi) w).mp (h i hi)
  · intro h i hi
    exact (fixed_letter_mem_map hf (i+2) (hfix i hi) w).mpr (h i hi)

def acceptReq (k : Nat) (w : List Nat) : Bool :=
  isCentralizer w && requires k w

theorem acceptReq_map_iff (f : Nat → Nat) (hf : OrderRelabel f)
    (k : Nat) (hfix : ∀ i, i < k → f (i+2) = i+2)
    (w : List Nat) (hp : ∀ x ∈ w, 1 ≤ x) :
    acceptReq k (w.map f) = true ↔ acceptReq k w = true := by
  simp only [acceptReq, Bool.and_eq_true, isCentralizer, decide_eq_true_eq]
  exact and_congr (centralizes_map_relabel f hf w hp) (requires_map_iff f hf k hfix w)

theorem countP_partition_bool {A : Type} (p q : A → Bool) (l : List A) :
    l.countP p =
      l.countP (fun a => p a && q a) + l.countP (fun a => p a && !q a) := by
  induction l with
  | nil => rfl
  | cons a as ih =>
    cases hp : p a <;> cases hq : q a <;>
      simp [hp, hq] <;> omega

def reqCount (n k m : Nat) : Nat :=
  (words (alphabet m) n).countP (acceptReq k)

theorem reqCount_zero (n m : Nat) :
    reqCount n 0 m = (centralizerWords m n).length := by
  unfold reqCount centralizerWords
  rw [← List.countP_eq_length_filter]
  apply List.countP_congr
  intro w _
  simp [acceptReq, requires]

/-- Deleting the first nonrequired letter reduces the alphabet by one,
with an order-preserving relabeling of all larger letters. -/
theorem reqCount_avoid (n k m : Nat) (hm : k+1 ≤ m) :
    ((words (alphabet (m+1)) n).filter
      (fun w => w.all (avoidLetter (k+2)))).countP (acceptReq k) =
      reqCount n k m := by
  rw [← words_filter_letters, alphabet_delete_map m (k+2) (by omega) (by omega),
      words_map_letters, List.countP_map]
  unfold reqCount
  apply List.countP_congr
  intro w hw
  have h := (words_mem_iff (alphabet m) n w).mp hw
  exact acceptReq_map_iff (skipLetter (k+2)) (skipLetter_relabel _ (by omega)) k
    (fun i hi => skipLetter_fixed _ _ (by omega)) w
    (fun x hx => ((mem_alphabet m x).mp (h.2 x hx)).1)

theorem reqCount_succ (n k m : Nat) (hm : k+1 ≤ m) :
    reqCount n k (m+1) = reqCount n k m + reqCount n (k+1) (m+1) := by
  have h := countP_partition_bool (acceptReq k)
    (fun w : List Nat => w.contains (k+2)) (words (alphabet (m+1)) n)
  have hpos :
      (words (alphabet (m+1)) n).countP
        (fun w => acceptReq k w && w.contains (k+2)) =
      reqCount n (k+1) (m+1) := by
    unfold reqCount
    apply List.countP_congr
    intro w _
    rw [acceptReq, acceptReq, requires_succ]
    simp [Bool.and_assoc]
  have hneg :
      (words (alphabet (m+1)) n).countP
        (fun w => acceptReq k w && !w.contains (k+2)) =
      ((words (alphabet (m+1)) n).filter
        (fun w => w.all (avoidLetter (k+2)))).countP (acceptReq k) := by
    rw [List.countP_filter]
    apply List.countP_congr
    intro w _
    simp only [Bool.and_eq_true, Bool.not_eq_true', List.contains_eq_mem, decide_eq_false_iff_not]
    exact and_congr_right (fun _ => (all_avoidLetter (k+2) w).symm)
  rw [hpos, hneg, reqCount_avoid n k m hm] at h
  exact h.trans (Nat.add_comm _ _)

end SaganWilsonPlacticMode
