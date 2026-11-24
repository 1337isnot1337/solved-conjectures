import Init

/-!
# Ma–Tang's random subset-sum threshold conjecture

Core-Lean version of the deterministic balancing and constant-fiber
argument, using integer representatives of residues modulo three.
This proves a component of equations (4)–(5), not the random-model
or asymptotic claims.
-/

namespace MaTangCoreBalance

def signed (c : Int) (u : Bool) : Int :=
  if u then -c else c

def chooseSign (c : Int) (positive : Bool) : Bool :=
  if c % 3 = 1 then !positive else positive

theorem chooseSign_mod (c : Int) (positive : Bool)
    (hc : c % 3 ≠ 0) :
    signed c (chooseSign c positive) % 3 = (if positive then 1 else 2) := by
  cases positive <;> simp only [chooseSign, signed]
  all_goals split <;> simp_all <;> omega

def assign (cs : List Int) (p : Nat) : List (Int × Bool) :=
  match cs with
  | [] => []
  | c :: ds => (c, chooseSign c (p != 0)) :: assign ds (p - 1)

def signedSum : List (Int × Bool) → Int
  | [] => 0
  | (c,u) :: ds => signed c u + signedSum ds

def bitSum : List (Int × Bool) → Int
  | [] => 0
  | (c,u) :: ds => (if u then c else 0) + bitSum ds

def flip : List (Int × Bool) → List (Int × Bool)
  | [] => []
  | (c,u) :: ds => (c,!u) :: flip ds

theorem assign_projection (cs : List Int) (p : Nat) :
    (assign cs p).map Prod.fst = cs := by
  induction cs generalizing p with
  | nil => rfl
  | cons c ds ih => simp [assign, ih]

/-- The first p residues are +1, the rest −1 (represented by 2). -/
theorem assign_sum_mod (cs : List Int) (p : Nat) (hp : p ≤ cs.length)
    (hc : ∀ c ∈ cs, c % 3 ≠ 0) :
    signedSum (assign cs p) % 3 = (2 * (cs.length : Int) - (p : Int)) % 3 := by
  induction cs generalizing p with
  | nil =>
    simp at hp
    subst p
    rfl
  | cons c ds ih =>
    have hcn : c % 3 ≠ 0 := hc c (by simp)
    have hds : ∀ d ∈ ds, d % 3 ≠ 0 := by
      intro d hd
      exact hc d (by simp [hd])
    have hpn : p - 1 ≤ ds.length := by simp at hp; omega
    have ht := ih (p - 1) hpn hds
    have hh := chooseSign_mod c (p != 0) hcn
    simp only [assign, signedSum, List.length_cons] at *
    by_cases hz : p = 0
    · subst p
      simp at hh ht ⊢
      omega
    · have hp0 : p ≠ 0 := hz
      have hbool : (p != 0) = true := by simp [hp0]
      rw [hbool] at hh ⊢
      simp at hh
      omega

/-- An occupied group with size other than one admits zero signed sum
modulo three. The selected number of +1 residues is (2*n) mod 3. -/
theorem exists_balanced (cs : List Int)
    (hc : ∀ c ∈ cs, c % 3 ≠ 0) (hn : cs.length ≠ 1) :
    ∃ ds : List (Int × Bool), ds.map Prod.fst = cs ∧ signedSum ds % 3 = 0 := by
  let p := (2 * cs.length) % 3
  have hp : p ≤ cs.length := by
    dsimp [p]
    have hm := Nat.mod_lt (2 * cs.length) (by decide : 0 < 3)
    omega
  refine ⟨assign cs p, assign_projection cs p, ?_⟩
  rw [assign_sum_mod cs p hp hc]
  dsimp [p]
  omega

theorem flip_sub (ds : List (Int × Bool)) :
    bitSum (flip ds) = bitSum ds + signedSum ds := by
  induction ds with
  | nil => rfl
  | cons a ds ih =>
    rcases a with ⟨c,u⟩
    cases u <;> simp [flip, bitSum, signedSum, signed, ih] <;> omega

theorem flip_mod (ds : List (Int × Bool)) (h : signedSum ds % 3 = 0) :
    bitSum (flip ds) % 3 = bitSum ds % 3 := by
  rw [flip_sub]
  omega

def groupedSum (gs : List (Nat × List (Int × Bool))) (a : Nat → Bool) : Int :=
  match gs with
  | [] => 0
  | (b,ds) :: rest => bitSum (if a b then flip ds else ds) + groupedSum rest a

/-- Every type-constant flip preserving the zero type leaves the ternary
sum invariant, provided all nonzero types have been balanced. -/
theorem grouped_mod_invariant (gs : List (Nat × List (Int × Bool)))
    (h : ∀ g ∈ gs, g.1 ≠ 0 → signedSum g.2 % 3 = 0)
    (a : Nat → Bool) (ha : a 0 = false) :
    groupedSum gs a % 3 = groupedSum gs (fun _ => false) % 3 := by
  induction gs with
  | nil => rfl
  | cons g rest ih =>
    rcases g with ⟨b,ds⟩
    have hr : ∀ g ∈ rest, g.1 ≠ 0 → signedSum g.2 % 3 = 0 := by
      intro g hg
      exact h g (by simp [hg])
    have ht := ih hr
    have hh : bitSum (if a b then flip ds else ds) % 3 = bitSum ds % 3 := by
      by_cases hb : b = 0
      · subst b
        simp [ha]
      · have hd := h (b,ds) (by simp) hb
        cases hab : a b
        · rfl
        · exact flip_mod ds hd
    simp only [groupedSum, Bool.false_eq_true, ite_false]
    omega


/-- Count occupied positions, excluding coefficients zero modulo three. -/
def occupiedCount : List Int → Nat
  | [] => 0
  | c :: cs => if c % 3 = 0 then occupiedCount cs else occupiedCount cs + 1

/-- Keep all positions, choosing signs only for occupied coefficients. -/
def assignOccupied : List Int → Nat → List (Int × Bool)
  | [], _ => []
  | c :: cs, p =>
    if c % 3 = 0 then (c,false) :: assignOccupied cs p
    else (c,chooseSign c (p != 0)) :: assignOccupied cs (p - 1)

theorem assignOccupied_projection (cs : List Int) (p : Nat) :
    (assignOccupied cs p).map Prod.fst = cs := by
  induction cs generalizing p with
  | nil => rfl
  | cons c ds ih =>
    by_cases hc : c % 3 = 0 <;> simp [assignOccupied, hc, ih]

theorem assignOccupied_sum_mod (cs : List Int) (p : Nat)
    (hp : p ≤ occupiedCount cs) :
    signedSum (assignOccupied cs p) % 3 =
      (2 * (occupiedCount cs : Int) - (p : Int)) % 3 := by
  induction cs generalizing p with
  | nil =>
    simp [occupiedCount] at hp
    subst p
    rfl
  | cons c ds ih =>
    by_cases hc : c % 3 = 0
    · simp only [occupiedCount, hc, ite_true] at hp
      have ht := ih p hp
      simp [assignOccupied, occupiedCount, hc, signedSum, signed]
      omega
    · simp only [occupiedCount, hc, ite_false] at hp
      have hpn : p - 1 ≤ occupiedCount ds := by omega
      have ht := ih (p - 1) hpn
      have hh := chooseSign_mod c (p != 0) hc
      simp only [assignOccupied, occupiedCount, hc, ite_false, signedSum]
      by_cases hz : p = 0
      · subst p
        simp at hh ht ⊢
        omega
      · have hbool : (p != 0) = true := by simp [hz]
        rw [hbool] at hh ⊢
        simp at hh
        omega

def decorate (cs : List Int) : List (Int × Bool) :=
  assignOccupied cs ((2 * occupiedCount cs) % 3)

theorem decorate_projection (cs : List Int) :
    (decorate cs).map Prod.fst = cs :=
  assignOccupied_projection _ _

theorem decorate_balanced (cs : List Int) (hn : occupiedCount cs ≠ 1) :
    signedSum (decorate cs) % 3 = 0 := by
  let p := (2 * occupiedCount cs) % 3
  have hp : p ≤ occupiedCount cs := by
    dsimp [p]
    have hm := Nat.mod_lt (2 * occupiedCount cs) (by decide : 0 < 3)
    omega
  change signedSum (assignOccupied cs p) % 3 = 0
  rw [assignOccupied_sum_mod cs p hp]
  dsimp [p]
  omega

def decorateGroups (gs : List (Nat × List Int)) :
    List (Nat × List (Int × Bool)) :=
  gs.map fun g => (g.1, decorate g.2)

def groupProjection (gs : List (Nat × List (Int × Bool))) :
    List (Nat × List Int) :=
  gs.map fun g => (g.1, g.2.map Prod.fst)

theorem decorateGroups_projection (gs : List (Nat × List Int)) :
    groupProjection (decorateGroups gs) = gs := by
  induction gs with
  | nil => rfl
  | cons g rest ih =>
    rcases g with ⟨b,cs⟩
    change (b,(decorate cs).map Prod.fst) ::
        groupProjection (decorateGroups rest) = (b,cs) :: rest
    rw [decorate_projection, ih]

/-- Deterministic conclusion of the column-type argument, including zero
coefficients. The lists are exactly the original grouped coefficients;
the constructed binary signs are chosen simultaneously for every group. -/
theorem exists_grouped_constant_fiber (gs : List (Nat × List Int))
    (h : ∀ g ∈ gs, g.1 ≠ 0 → occupiedCount g.2 ≠ 1) :
    ∃ ds : List (Nat × List (Int × Bool)),
      groupProjection ds = gs ∧
      ∀ a : Nat → Bool, a 0 = false →
        groupedSum ds a % 3 = groupedSum ds (fun _ => false) % 3 := by
  refine ⟨decorateGroups gs, decorateGroups_projection gs, ?_⟩
  intro a ha
  apply grouped_mod_invariant _ _ a ha
  intro g hg hb
  obtain ⟨raw, hraw, heq⟩ := List.mem_map.mp hg
  subst g
  exact decorate_balanced raw.2 (h raw hraw hb)

end MaTangCoreBalance
