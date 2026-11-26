import Conjectures.SaganWilsonPlacticModeAlphabet

namespace SaganWilsonPlacticMode

theorem run_length_ge_no_one (r w : List Nat)
    (h : ∀ x ∈ w, x ≠ 1) : r.length ≤ (run r w).length := by
  induction w generalizing r with
  | nil => exact Nat.le_refl _
  | cons x xs ih =>
    have hx := h x (by simp)
    have hstep : r.length ≤ (next x r).length := by
      simp only [next, ite_eq_right hx]
      exact (insertRow_length_bounds x r).1
    exact Nat.le_trans hstep (ih (next x r) (fun y hy => h y (by simp [hy])))

theorem centralizer_has_one (w : List Nat) (hn : w ≠ [])
    (hp : ∀ x ∈ w, 1 ≤ x) (hc : CentralizesOne w) : 1 ∈ w := by
  by_cases h : 1 ∈ w
  · exact h
  · exfalso
    have he := (centralizes_iff_empty_state w hp).mp hc
    have hno : ∀ x ∈ w, x ≠ 1 := by
      intro x hx hx1
      subst x
      exact h hx
    cases w with
    | nil => exact hn rfl
    | cons x xs =>
      have hx := hno x (by simp)
      have hstep : next x [] = [x] := by simp [next, hx, insertRow]
      have hh := run_length_ge_no_one [x] xs (fun y hy => hno y (by simp [hy]))
      simp only [run, hstep] at he
      rw [he] at hh
      simp at hh

theorem reqCount_diagonal_zero (n m : Nat) (hn : 0 < n) :
    reqCount n n m = 0 := by
  unfold reqCount
  calc
    _ = (words (alphabet m) n).countP (fun _ => false) := by
      apply List.countP_congr
      intro w hw
      constructor
      · intro hacc
        have hm := (words_mem_iff (alphabet m) n w).mp hw
        have hpos : ∀ x ∈ w, 1 ≤ x := fun x hx =>
          ((mem_alphabet m x).mp (hm.2 x hx)).1
        have hne : w ≠ [] := by intro he; simp [he] at hm; omega
        have ha : isCentralizer w = true ∧ requires n w = true := by
          simpa only [acceptReq, Bool.and_eq_true] using hacc
        have hc : CentralizesOne w := by
          unfold CentralizesOne
          exact of_decide_eq_true ha.1
        have h1 := centralizer_has_one w hne hpos hc
        have hr : ∀ i, i < n → i+2 ∈ w := by
          simpa only [requires, List.all_eq_true, List.mem_range, List.contains_iff_mem] using ha.2
        let letters : List Nat := 1 :: (List.range n).map (·+2)
        have hnodup : letters.Nodup := by
          dsimp [letters]
          rw [List.nodup_cons]
          refine ⟨?_, nodup_map_injective (·+2) (fun x y h => by omega)
            (List.range n) List.nodup_range⟩
          intro he
          rcases List.mem_map.mp he with ⟨i, _, hi⟩
          omega
        have hsub : letters ⊆ w := by
          intro x hx
          simp only [letters, List.mem_cons] at hx
          rcases hx with rfl | hx
          · exact h1
          · rcases List.mem_map.mp hx with ⟨i, hi, rfl⟩
            exact hr i (List.mem_range.mp hi)
        have hl := hnodup.length_le_of_subset hsub
        simp [letters, hm.1] at hl
        omega
      · intro h
        contradiction
    _ = 0 := by simp

def delta (f : Nat → Int) (m : Nat) : Int := f (m+1) - f m

def iterDelta : Nat → (Nat → Int) → Nat → Int
  | 0, f => f
  | k+1, f => delta (iterDelta k f)

theorem iterDelta_reqCount (n k m : Nat) (hm : 1 ≤ m) :
    iterDelta k (fun t => (reqCount n 0 t : Int)) m =
      (reqCount n k (m+k) : Int) := by
  induction k generalizing m with
  | zero => simp [iterDelta]
  | succ k ih =>
    simp only [iterDelta, delta]
    rw [ih (m+1) (by omega), ih m hm]
    have h := reqCount_succ n k (m+k) (by omega)
    have he : m+1+k = m+k+1 := by omega
    rw [he]
    change (reqCount n k (m+k+1) : Int) - (reqCount n k (m+k) : Int) =
      (reqCount n (k+1) (m+k+1) : Int)
    omega

theorem iterDelta_centralizer_zero (n : Nat) (hn : 0 < n)
    (m : Nat) (hm : 1 ≤ m) :
    iterDelta n (fun t => ((centralizerWords t n).length : Int)) m = 0 := by
  have he : (fun t => ((centralizerWords t n).length : Int)) =
      (fun t => (reqCount n 0 t : Int)) := by
    funext t
    rw [reqCount_zero]
  rw [he, iterDelta_reqCount n n m hm, reqCount_diagonal_zero n (m+n) hn]
  rfl

theorem iterDelta_sub (k : Nat) (f g : Nat → Int) (m : Nat) :
    iterDelta k (fun t => f t - g t) m =
      iterDelta k f m - iterDelta k g m := by
  induction k generalizing m with
  | zero => rfl
  | succ k ih =>
    simp only [iterDelta, delta, ih]
    omega

theorem iterDelta_delta (k : Nat) (f : Nat → Int) (m : Nat) :
    iterDelta k (delta f) m = iterDelta (k+1) f m := by
  induction k generalizing m with
  | zero => rfl
  | succ k ih =>
    simp only [iterDelta, delta] at *
    rw [ih]
    -- The second summand is the same induction identity at m.
    rw [ih]

theorem eventually_zero_of_iterDelta_zero (k : Nat) (f : Nat → Int)
    (M : Nat) (ht : ∀ m, M ≤ m → f m = 0)
    (hz : ∀ m, 1 ≤ m → iterDelta k f m = 0) :
    ∀ m, 1 ≤ m → f m = 0 := by
  induction k generalizing f with
  | zero => exact hz
  | succ k ih =>
    have htail : ∀ m, M ≤ m → delta f m = 0 := by
      intro m hm
      simp [delta, ht m hm, ht (m+1) (by omega)]
    have hdiff : ∀ m, 1 ≤ m → iterDelta k (delta f) m = 0 := by
      intro m hm
      rw [iterDelta_delta]
      exact hz m hm
    have h := ih (delta f) htail hdiff
    intro m hm
    have hconst : ∀ a, f (m+a) = f m := by
      intro a
      induction a with
      | zero => rfl
      | succ a iha =>
        have hh := h (m+a) (by omega)
        simp only [delta] at hh
        change f (m+a+1) = f m
        omega
    have hh := ht (m+M) (by omega)
    rw [hconst M] at hh
    exact hh

/-- Standard recursive binomial coefficient (Pascal's rule). -/
def pascalChoose : Nat → Nat → Nat
  | _, 0 => 1
  | 0, _+1 => 0
  | m+1, k+1 => pascalChoose m k + pascalChoose m (k+1)

def basisValue (a : Nat → Int) : Nat → Nat → Int
  | 0, _ => 0
  | d+1, m => basisValue a d m + a d * (pascalChoose m d : Int)

theorem delta_basisValue (a : Nat → Int) (d m : Nat) :
    delta (basisValue a (d+1)) m = basisValue (fun k => a (k+1)) d m := by
  induction d with
  | zero => simp [delta, basisValue, pascalChoose]
  | succ d ih =>
    change (basisValue a (d+1) (m+1) + a (d+1) * (pascalChoose (m+1) (d+1) : Int)) -
      (basisValue a (d+1) m + a (d+1) * (pascalChoose m (d+1) : Int)) =
      basisValue (fun k => a (k+1)) d m + a (d+1) * (pascalChoose m d : Int)
    have hcast : ((pascalChoose m d + pascalChoose m (d+1) : Nat) : Int) =
        (pascalChoose m d : Int) + (pascalChoose m (d+1) : Int) := by omega
    rw [pascalChoose, hcast, Int.mul_add]
    unfold delta at ih
    omega

theorem iterDelta_basis_zero (a : Nat → Int) (d m : Nat) :
    iterDelta d (basisValue a d) m = 0 := by
  induction d generalizing a m with
  | zero => rfl
  | succ d ih =>
    rw [← iterDelta_delta]
    have he : delta (basisValue a (d+1)) = basisValue (fun k => a (k+1)) d := by
      funext t
      exact delta_basisValue a d t
    rw [he]
    exact ih _ _

/-- Agreement of a degree-(n-1) binomial row with the centralizer count
for m ≥ n extends to every positive alphabet size. The row is integer
valued here; the real-scalar identification is a separate obligation. -/
theorem positive_polynomial_extension (n : Nat) (hn : 0 < n) (a : Nat → Int)
    (ht : ∀ m, n ≤ m → basisValue a n m = ((centralizerWords m n).length : Int)) :
    ∀ m, 1 ≤ m → basisValue a n m = ((centralizerWords m n).length : Int) := by
  let f : Nat → Int := fun m => basisValue a n m - ((centralizerWords m n).length : Int)
  have htail : ∀ m, n ≤ m → f m = 0 := by
    intro m hm
    simp [f, ht m hm]
  have hzero : ∀ m, 1 ≤ m → iterDelta n f m = 0 := by
    intro m hm
    unfold f
    rw [iterDelta_sub, iterDelta_basis_zero, iterDelta_centralizer_zero n hn m hm]
    rfl
  intro m hm
  have hh := eventually_zero_of_iterDelta_zero n f n htail hzero m hm
  dsimp [f] at hh
  omega

end SaganWilsonPlacticMode
