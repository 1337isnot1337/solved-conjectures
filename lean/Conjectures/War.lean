import Std

/-! Exact three-player War. Cards in each list are ordered front to back.
The transition compares the three exposed ranks; collection is winner first.
All certificates below are reduced by Lean, without `native_decide`. -/
namespace War

structure State where
  a : List Nat
  b : List Nat
  c : List Nat
  deriving DecidableEq, Repr

inductive Policy where
  | rank | seat | clockwise
  deriving DecidableEq, Repr

def live (s : State) : Bool :=
  !s.a.isEmpty && !s.b.isEmpty && !s.c.isEmpty

def collect (p : Policy) (winner x y z : Nat) : List Nat :=
  match p with
  | .rank => if x > y then
      (if y > z then [x,y,z] else if x > z then [x,z,y] else [z,x,y])
    else (if x > z then [y,x,z] else if y > z then [y,z,x] else [z,y,x])
  | .seat => if winner = 0 then [x,y,z]
      else if winner = 1 then [y,x,z] else [z,x,y]
  | .clockwise => if winner = 0 then [x,y,z]
      else if winner = 1 then [y,z,x] else [z,x,y]

def step (p : Policy) (s : State) : State :=
  match s.a, s.b, s.c with
  | x::xs, y::ys, z::zs =>
    let winner := if x > y && x > z then 0 else if y > z then 1 else 2
    let trick := collect p winner x y z
    if winner = 0 then ⟨xs ++ trick, ys, zs⟩
    else if winner = 1 then ⟨xs, ys ++ trick, zs⟩
    else ⟨xs, ys, zs ++ trick⟩
  | _, _, _ => s

def run (p : Policy) : Nat → State → State
  | 0, s => s
  | n+1, s => run p n (step p s)

/-- A certificate checks every intermediate state and the return at its end. -/
def check (p : Policy) (target : State) : Nat → State → Bool
  | 0, s => decide (s = target) && live s
  | n+1, s => live s && check p target n (step p s)

theorem check_sound (p : Policy) (target : State) (n : Nat) (s : State)
    (h : check p target n s = true) :
    run p n s = target ∧ ∀ i, i ≤ n → live (run p i s) = true := by
  induction n generalizing s with
  | zero =>
    simp only [check, Bool.and_eq_true, decide_eq_true_eq] at h
    refine ⟨h.1, ?_⟩
    intro i hi
    have heq : i = 0 := by omega
    subst i
    exact h.2
  | succ n ih =>
    simp only [check, Bool.and_eq_true] at h
    obtain ⟨hend, hs⟩ := ih (step p s) h.2
    refine ⟨hend, ?_⟩
    intro i hi
    cases i with
    | zero => exact h.1
    | succ i => exact hs i (by omega)

theorem run_add (p : Policy) (a b : Nat) (s : State) :
    run p (a+b) s = run p b (run p a s) := by
  induction a generalizing s with
  | zero => simp only [Nat.zero_add, run]
  | succ a ih => simpa only [Nat.succ_add, run] using ih (step p s)

/-- A positive, live return proves that every player stays active forever. -/
theorem live_forever_of_check (p : Policy) (s : State) (period : Nat)
    (hp : 0 < period) (h : check p s period s = true) :
    ∀ t, live (run p t s) = true := by
  obtain ⟨hreturn, hsafe⟩ := check_sound p s period s h
  intro t
  induction t using Nat.strongRecOn with
  | ind t ih =>
    by_cases ht : t ≤ period
    · exact hsafe t ht
    · have hlt : t - period < t := by omega
      have heq : t = period + (t - period) := by omega
      rw [heq, run_add, hreturn]
      exact ih (t - period) hlt

def rankDeal : State := ⟨
  [15,7,16,8,1,22,17,9],
  [10,2,23,18,11,19,12,3],
  [4,20,13,5,21,14,6]⟩

def seatDeal : State := ⟨
  [1,2,14,3,4,15,5,6],
  [16,17,7,8,21,9,18],
  [10,22,11,19,20,12,13]⟩

def clockwiseDeal : State := ⟨
  [35,1,2,36,24,3,25,4,5,43,37,6,38,7,8],
  [26,9,10,44,11,39,40,27,12,41,13,28,29,14,15],
  [16,30,31,17,18,32,19,20,33,21,22,42,23,34]⟩

/-- Every rank 1,...,N occurs exactly once and the sizes are those of a
round-robin deal starting with player A. -/
def standard (s : State) : Prop :=
  let cards := s.a ++ s.b ++ s.c
  (List.range' 1 cards.length).all (fun c => cards.count c == 1) = true ∧
  s.a.length = (cards.length + 2) / 3 ∧
  s.b.length = (cards.length + 1) / 3 ∧
  s.c.length = cards.length / 3

instance (s : State) : Decidable (standard s) := by unfold standard; infer_instance

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem rank_certificate : check .rank rankDeal 90 rankDeal = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem seat_certificate : check .seat seatDeal 180 seatDeal = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem clockwise_certificate : check .clockwise clockwiseDeal 19320 clockwiseDeal = true := by decide

theorem rank_standard : standard rankDeal := by decide
theorem seat_standard : standard seatDeal := by decide
theorem clockwise_standard : standard clockwiseDeal := by decide

theorem three_standard_cycles :
    (standard rankDeal ∧ run .rank 90 rankDeal = rankDeal ∧
      ∀ t, live (run .rank t rankDeal) = true) ∧
    (standard seatDeal ∧ run .seat 180 seatDeal = seatDeal ∧
      ∀ t, live (run .seat t seatDeal) = true) ∧
    (standard clockwiseDeal ∧ run .clockwise 19320 clockwiseDeal = clockwiseDeal ∧
      ∀ t, live (run .clockwise t clockwiseDeal) = true) := by
  exact ⟨⟨rank_standard, (check_sound _ _ _ _ rank_certificate).1,
      live_forever_of_check _ _ _ (by decide) rank_certificate⟩,
    ⟨seat_standard, (check_sound _ _ _ _ seat_certificate).1,
      live_forever_of_check _ _ _ (by decide) seat_certificate⟩,
    ⟨clockwise_standard, (check_sound _ _ _ _ clockwise_certificate).1,
      live_forever_of_check _ _ _ (by decide) clockwise_certificate⟩⟩

/-- Check that a trajectory avoids the initial state until its final step. -/
def firstCheck (p : Policy) (target : State) : Nat → State → Bool
  | 0, s => decide (s = target)
  | n+1, s => decide (s ≠ target) && firstCheck p target n (step p s)

theorem firstCheck_sound (p : Policy) (target : State) (n : Nat) (s : State)
    (h : firstCheck p target n s = true) :
    run p n s = target ∧ ∀ i < n, run p i s ≠ target := by
  induction n generalizing s with
  | zero =>
    simp only [firstCheck, decide_eq_true_eq] at h
    exact ⟨h, fun i hi => by omega⟩
  | succ n ih =>
    simp only [firstCheck, Bool.and_eq_true, decide_eq_true_eq] at h
    obtain ⟨he, ha⟩ := ih (step p s) h.2
    refine ⟨he, ?_⟩
    intro i hi
    cases i with
    | zero => exact h.1
    | succ i => exact ha i (by omega)

def FirstReturn (p : Policy) (s : State) (period : Nat) : Prop :=
  run p period s = s ∧ ∀ t, 0 < t → t < period → run p t s ≠ s

theorem firstReturn_of_check (p : Policy) (s : State) (n : Nat)
    (h : firstCheck p s n (step p s) = true) : FirstReturn p s (n+1) := by
  obtain ⟨he, ha⟩ := firstCheck_sound p s n (step p s) h
  refine ⟨he, ?_⟩
  intro t ht hlt
  cases t with
  | zero => omega
  | succ t => exact ha t (by omega)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem rank_first_return : FirstReturn .rank rankDeal 90 :=
  firstReturn_of_check _ _ 89 (by decide)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem seat_first_return : FirstReturn .seat seatDeal 180 :=
  firstReturn_of_check _ _ 179 (by decide)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem clockwise_first_return : FirstReturn .clockwise clockwiseDeal 19320 :=
  firstReturn_of_check _ _ 19319 (by decide)

/-- Deal successive cards to A, B, C in rotation, preserving queue order. -/
def dealFrom (seat : Nat) : List Nat → State → State
  | [], s => s
  | card::cards, s =>
    let next := if seat%3 = 0 then {s with a := s.a ++ [card]}
      else if seat%3 = 1 then {s with b := s.b ++ [card]}
      else {s with c := s.c ++ [card]}
    dealFrom (seat+1) cards next

def deal (deck : List Nat) : State := dealFrom 0 deck ⟨[],[],[]⟩

def ValidDeck (deck : List Nat) : Prop :=
  deck.Nodup ∧ deck.all (fun c => decide (1 ≤ c ∧ c ≤ deck.length)) = true

instance (deck : List Nat) : Decidable (ValidDeck deck) := by
  unfold ValidDeck
  infer_instance

def rankDeck : List Nat := [15,10,4,7,2,20,16,23,13,8,18,5,1,11,21,22,19,14,17,12,6,9,3]

def seatDeck : List Nat := [1,16,10,2,17,22,14,7,11,3,8,19,4,21,20,15,9,12,5,18,13,6]

def clockwiseDeck : List Nat := [35,26,16,1,9,30,2,10,31,36,44,17,24,11,18,3,39,32,25,40,19,4,27,20,5,12,33,43,41,21,37,13,22,6,28,42,38,29,23,7,14,34,8,15]

/-- Explicit standard decks whose ordinary round-robin deals are the three
initial queue configurations used by the cycle theorems. -/
theorem standard_deal_witnesses :
    (ValidDeck rankDeck ∧ deal rankDeck = rankDeal) ∧
    (ValidDeck seatDeck ∧ deal seatDeck = seatDeal) ∧
    (ValidDeck clockwiseDeck ∧ deal clockwiseDeck = clockwiseDeal) := by decide

#print axioms standard_deal_witnesses

#print axioms three_standard_cycles
#print axioms rank_first_return
#print axioms seat_first_return
#print axioms clockwise_first_return
end War
