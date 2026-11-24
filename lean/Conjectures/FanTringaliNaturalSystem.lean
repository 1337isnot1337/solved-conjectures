import Conjectures.FanTringaliNatural

/-!
# Fan–Tringali's power-monoid length-set conjecture: the complete natural system

Every finite subset of `ℕ` containing zero has a nonempty finite atomic length
set. Its length set is `{0}`, `{1}`, or a finite nonempty subset of `{2,3,...}`.
Together with the construction, this identifies the complete system of lengths.
-/

open scoped Pointwise

namespace FanTringali

def degree (A : Finset ℕ) : ℕ := A.sup id

@[simp] theorem degree_zero : degree (0 : Finset ℕ) = 0 := by
  simp [degree]

theorem le_degree {A : Finset ℕ} {a : ℕ} (ha : a ∈ A) : a ≤ degree A :=
  Finset.le_sup (f := id) ha

theorem degree_mem {A : Finset ℕ} (hA : 0 ∈ A) : degree A ∈ A := by
  obtain ⟨a,ha,he⟩ := Finset.exists_mem_eq_sup A ⟨0,hA⟩ id
  change degree A = a at he
  rw [he]
  exact ha

theorem degree_eq_zero_iff {A : Finset ℕ} (hA : 0 ∈ A) : degree A=0 ↔ A=0 := by
  constructor
  · intro hDegree
    ext a
    constructor
    · intro ha
      apply Finset.mem_zero.mpr
      have hle := le_degree ha
      omega
    · intro ha
      have ha₀ := Finset.mem_zero.mp ha
      exact ha₀ ▸ hA
  · rintro rfl
    exact degree_zero

theorem degree_add {A B : Finset ℕ} (hA : 0 ∈ A) (hB : 0 ∈ B) :
    degree (A+B) = degree A + degree B := by
  apply Nat.le_antisymm
  · apply Finset.sup_le_iff.mpr
    intro z hz
    obtain ⟨a,ha,b,hb,rfl⟩ := Finset.mem_add.mp hz
    exact Nat.add_le_add (le_degree ha) (le_degree hb)
  · exact le_degree (Finset.add_mem_add (degree_mem hA) (degree_mem hB))

theorem atom_degree_pos {A : Finset ℕ} (hA : Atom A) : 0 < degree A := by
  have hne : degree A ≠ 0 := fun h => hA.2.1 ((degree_eq_zero_iff hA.1).mp h)
  omega

theorem atomic_length_le_degree (L : List (Finset ℕ)) (hAtom : ∀ A ∈ L, Atom A) :
    L.length ≤ degree L.sum := by
  induction L with
  | nil => simp
  | cons A L ih =>
    have hA := hAtom A List.mem_cons_self
    have hL : ∀ B ∈ L, Atom B := fun B hB => hAtom B (List.mem_cons_of_mem _ hB)
    have hL₀ := zero_mem_list_sum (fun B hB => (hL B hB).1)
    rw [List.length_cons, List.sum_cons, degree_add hA.1 hL₀]
    have hApos := atom_degree_pos hA
    have hIH := ih hL
    omega

theorem nat_lengths_finite (X : Finset ℕ) : (Lengths X).Finite := by
  apply (Finset.finite_toSet (Finset.range (degree X+1))).subset
  intro n hn
  obtain ⟨L,hAtom,hSum,hLen⟩ := hn
  have hBound := atomic_length_le_degree L hAtom
  rw [hSum,hLen] at hBound
  exact Finset.mem_range.mpr (by omega)

/-- Strong induction on the maximum proves atomicity; both proper nonzero
factors have strictly smaller maximum. -/
theorem nat_has_atomic_factorization (X : Finset ℕ) (hX : 0 ∈ X) :
    ∃ L : List (Finset ℕ), (∀ A ∈ L, Atom A) ∧ L.sum=X := by
  have hMain : ∀ d, ∀ Y : Finset ℕ, degree Y=d → 0 ∈ Y →
      ∃ L : List (Finset ℕ), (∀ A ∈ L, Atom A) ∧ L.sum=Y := by
    intro d
    induction d using Nat.strong_induction_on with
    | h d ih =>
      intro Y hDegree hY
      by_cases hZero : Y=0
      · exact ⟨[], by simp, by simpa only [List.sum_nil] using hZero.symm⟩
      · by_cases hAtom : Atom Y
        · refine ⟨[Y], ?_, by simp⟩
          intro A hA
          have hAY : A=Y := List.mem_singleton.mp hA
          exact hAY ▸ hAtom
        · have hFactor : ¬(∀ A B : Finset ℕ, 0 ∈ A → 0 ∈ B → A+B=Y → A=0 ∨ B=0) :=
            fun h => hAtom ⟨hY,hZero,h⟩
          simp only [not_forall, not_or] at hFactor
          obtain ⟨A,B,hA,hB,hAB,hAne,hBne⟩ := hFactor
          have hApos : 0 < degree A := by
            have hne := (degree_eq_zero_iff hA).not.mpr hAne
            omega
          have hBpos : 0 < degree B := by
            have hne := (degree_eq_zero_iff hB).not.mpr hBne
            omega
          have hDegrees : degree A + degree B = d := by rw [← degree_add hA hB,hAB,hDegree]
          obtain ⟨LA,hLA,hLASum⟩ := ih (degree A) (by omega) A rfl hA
          obtain ⟨LB,hLB,hLBSum⟩ := ih (degree B) (by omega) B rfl hB
          refine ⟨LA++LB, ?_, ?_⟩
          · intro C hC
            rcases List.mem_append.mp hC with hC | hC
            · exact hLA C hC
            · exact hLB C hC
          · rw [List.sum_append,hLASum,hLBSum,hAB]
  exact hMain (degree X) X rfl hX

theorem nat_lengths_nonempty (X : Finset ℕ) (hX : 0 ∈ X) : (Lengths X).Nonempty := by
  obtain ⟨L,hAtom,hSum⟩ := nat_has_atomic_factorization X hX
  exact ⟨L.length,L,hAtom,hSum,rfl⟩

@[simp] theorem zero_mem_lengths_iff (X : Finset ℕ) : 0 ∈ Lengths X ↔ X=0 := by
  constructor
  · rintro ⟨L,_,hSum,hLen⟩
    have hL : L=[] := List.length_eq_zero_iff.mp hLen
    simpa only [hL,List.sum_nil] using hSum.symm
  · rintro rfl
    exact ⟨[],by simp,rfl,rfl⟩

@[simp] theorem one_mem_lengths_iff (X : Finset ℕ) : 1 ∈ Lengths X ↔ Atom X := by
  constructor
  · rintro ⟨L,hAtom,hSum,hLen⟩
    obtain ⟨A,rfl⟩ := List.length_eq_one_iff.mp hLen
    have hAX : A=X := by simpa using hSum
    exact hAX ▸ hAtom A (by simp)
  · intro hAtom
    exact ⟨[X],by simpa,by simp,rfl⟩

@[simp] theorem nat_lengths_zero : Lengths (0 : Finset ℕ) = ({0} : Set ℕ) := by
  ext n
  constructor
  · rintro ⟨L,hAtom,hSum,hLen⟩
    have hBound := atomic_length_le_degree L hAtom
    rw [hSum,hLen,degree_zero] at hBound
    exact Set.mem_singleton_iff.mpr (by omega)
  · intro hn
    have hn₀ := Set.mem_singleton_iff.mp hn
    subst n
    exact (zero_mem_lengths_iff _).mpr rfl

theorem nat_lengths_atom {X : Finset ℕ} (hX : Atom X) : Lengths X = ({1} : Set ℕ) := by
  ext n
  constructor
  · rintro ⟨L,hAtom,hSum,hLen⟩
    cases L with
    | nil =>
      have hZero : X=0 := by simpa only [List.sum_nil] using hSum.symm
      exact False.elim (hX.2.1 hZero)
    | cons A L =>
      have hA := hAtom A List.mem_cons_self
      have hL : ∀ B ∈ L, Atom B := fun B hB => hAtom B (List.mem_cons_of_mem _ hB)
      have hL₀ := zero_mem_list_sum (fun B hB => (hL B hB).1)
      have hAL : A+L.sum=X := by simpa only [List.sum_cons] using hSum
      rcases hX.2.2 A L.sum hA.1 hL₀ hAL with hA₀ | hLZero
      · exact False.elim (hA.2.1 hA₀)
      · have hBound := atomic_length_le_degree L hL
        rw [hLZero,degree_zero] at hBound
        have hLen' : L.length+1=n := hLen
        exact Set.mem_singleton_iff.mpr (by omega)
  · intro hn
    have hn₁ := Set.mem_singleton_iff.mp hn
    subst n
    exact (one_mem_lengths_iff X).mpr hX

theorem degree_one_atom {X : Finset ℕ} (hX : 0 ∈ X) (hDegree : degree X=1) : Atom X := by
  refine ⟨hX, ?_, ?_⟩
  · intro hZero
    rw [hZero,degree_zero] at hDegree
    omega
  · intro A B hA hB hAB
    have hDegrees : degree A+degree B=1 := by rw [← degree_add hA hB,hAB,hDegree]
    have hCases : degree A=0 ∨ degree B=0 := by omega
    exact hCases.imp (degree_eq_zero_iff hA).mp (degree_eq_zero_iff hB).mp

/-- The exact system, with the two unit/atom exceptions displayed separately. -/
theorem natural_length_system :
    {L : Set ℕ | ∃ X : Finset ℕ, 0 ∈ X ∧ Lengths X=L} =
      {L : Set ℕ | L={0} ∨ L={1} ∨
        L.Finite ∧ L.Nonempty ∧ ∀ n ∈ L, 2 ≤ n} := by
  ext L
  constructor
  · rintro ⟨X,hX,rfl⟩
    by_cases hZero : X=0
    · exact Or.inl (by rw [hZero,nat_lengths_zero])
    · by_cases hAtom : Atom X
      · exact Or.inr (Or.inl (nat_lengths_atom hAtom))
      · right
        right
        refine ⟨nat_lengths_finite X,nat_lengths_nonempty X hX,?_⟩
        intro n hn
        have hn₀ : n≠0 := fun he => hZero ((zero_mem_lengths_iff X).mp (he ▸ hn))
        have hn₁ : n≠1 := fun he => hAtom ((one_mem_lengths_iff X).mp (he ▸ hn))
        omega
  · rintro (rfl | rfl | ⟨hFinite,hNonempty,hMin⟩)
    · exact ⟨0,Finset.zero_mem_zero,nat_lengths_zero⟩
    · have hAtom : Atom ({0,1} : Finset ℕ) := degree_one_atom (by simp) (by decide)
      exact ⟨{0,1},by simp,nat_lengths_atom hAtom⟩
    · classical
      let S := hFinite.toFinset
      have hS : S.Nonempty := by
        obtain ⟨n,hn⟩ := hNonempty
        exact ⟨n,by simpa only [S,Set.Finite.mem_toFinset] using hn⟩
      have hSmin : ∀ n ∈ S,2≤n := by
        intro n hn
        exact hMin n (by simpa only [S,Set.Finite.mem_toFinset] using hn)
      obtain ⟨X,hX,hLengths⟩ := finite_spectrum_nat S hS hSmin
      exact ⟨X,hX,hLengths.trans (by simp [S])⟩

end FanTringali
