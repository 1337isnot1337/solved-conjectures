import Conjectures.LonelinessModularInitialSupport
import Conjectures.LonelinessModularCoverBits

/-! Complete lists of initial modular survivors at arbitrary arity.

Rows are natural-number masks, not injective tuples of a prescribed length.
Thus a row may have fewer entries than the original list has coordinates.
The numerical search must cover every minimum pair and every support size
up to the requested bound. Its completeness and the validity of every row
are separate premises, checked by generated finite certificates.

These statements classify initial folded supports. They do not identify
integer directions or assume that later binary lifting has been checked. -/

namespace Loneliness.Modular.SupportLists

open FourSpeed

/-- A minimum-pair-normalized support with no witness on the modulus grid. -/
def Survivor (n den m : ℕ) (inv : ℕ → ℕ) (s : Finset ℕ) : Prop :=
  FoldedSupport m s ∧ 2 ≤ s.card ∧ s.card ≤ n ∧ 1 ∈ s ∧
    PairNormalized m inv s ∧
    InitialSupport.times m ⊆ s.biUnion (InitialSupport.badTimes den m)

instance (n den m : ℕ) (inv : ℕ → ℕ) (s : Finset ℕ) :
    Decidable (Survivor n den m inv s) :=
  inferInstanceAs (Decidable ((∀ a ∈ s, 0 < a ∧ 2*a ≤ m) ∧
    2 ≤ s.card ∧ s.card ≤ n ∧ 1 ∈ s ∧ PairNormalized m inv s ∧
    InitialSupport.times m ⊆ s.biUnion (InitialSupport.badTimes den m)))

def Retained {N : ℕ} (rows : Fin N → ℕ) (s : Finset ℕ) : Prop :=
  ∃ i, s = SupportSearch.Bits.decode (rows i)

def terminal {N : ℕ} (rows : Fin N → ℕ) (s : Finset ℕ) (index : ℕ) : Bool :=
  if h : index < N then decide (s = SupportSearch.Bits.decode (rows ⟨index,h⟩))
  else false

theorem terminal_sound {N : ℕ} (rows : Fin N → ℕ) :
    ∀ s index, terminal rows s index = true → Retained rows s := by
  intro s index hcheck
  by_cases hi : index < N
  · rw [terminal, dite_eq_left hi] at hcheck
    exact ⟨⟨index,hi⟩, of_decide_eq_true hcheck⟩
  · rw [terminal, dite_eq_right hi] at hcheck
    cases hcheck

/-- Covering the half grid excludes every natural-number grid time, including
times outside that half interval. Folding the time preserves all distances. -/
theorem covers_times_iff_no_rational_witness (den m : ℕ) (hm : 0 < m)
    (s : Finset ℕ) (hne : s.Nonempty) :
    InitialSupport.times m ⊆ s.biUnion (InitialSupport.badTimes den m) ↔
      ¬ HasRationalWitness 1 den m (s.sort (· ≤ ·)) := by
  constructor
  · intro hcover hw
    obtain ⟨t, ht⟩ := hw
    let q := folded m t
    have heq (a : ℕ) : folded m (q*a) = folded m (t*a) := by
      simpa only [q, Nat.mul_comm] using folded_mul_folded m t a hm
    by_cases hq : q = 0
    · obtain ⟨a, ha⟩ := hne
      have hw := ht a ((Finset.mem_sort (· ≤ ·)).mpr ha)
      have hz : folded m (t*a) = 0 := by
        rw [← heq, hq]
        simp [folded]
      change 1*m ≤ den*folded m (t*a) at hw
      rw [hz, Nat.mul_zero, Nat.one_mul] at hw
      omega
    · have hbound : 2*q ≤ m := folded_le_half m t
      have hqmem : q ∈ InitialSupport.times m := by
        apply Finset.mem_Icc.mpr
        constructor <;> omega
      obtain ⟨a, ha, hbad⟩ := Finset.mem_biUnion.mp (hcover hqmem)
      have hbad' : den*folded m (q*a) < m := (Finset.mem_filter.mp hbad).2
      rw [heq] at hbad'
      have hw := ht a ((Finset.mem_sort (· ≤ ·)).mpr ha)
      change 1*m ≤ den*folded m (t*a) at hw
      omega
  · intro hnow t ht
    by_contra hcover
    apply hnow
    refine ⟨t, ?_⟩
    intro a ha
    have has : a ∈ s := (Finset.mem_sort (· ≤ ·)).mp ha
    change 1*m ≤ den*folded m (t*a)
    by_contra h
    apply hcover
    exact Finset.mem_biUnion.mpr
      ⟨a, has, Finset.mem_filter.mpr ⟨ht, by omega⟩⟩

theorem survivor_no_rational_witness (n den m : ℕ) (hm : 0 < m)
    (inv : ℕ → ℕ) (s : Finset ℕ) (hs : Survivor n den m inv s) :
    ¬ HasRationalWitness 1 den m (s.sort (· ≤ ·)) :=
  (covers_times_iff_no_rational_witness den m hm s ⟨1, hs.2.2.2.1⟩).mp
    hs.2.2.2.2.2

/-- Every normalized bad support occurs in a checked list. No row-cardinality
or injectivity assumption is used: all support sizes from two to n remain. -/
theorem checked_survivor_mem {N : ℕ} (n den m : ℕ) (hn : 2 ≤ n)
    (inv : ℕ → ℕ) (rows : Fin N → ℕ) (trees : ℕ → SupportSearch.Tree)
    (hcheck : ∀ b, 2 ≤ b → 2*b ≤ m →
      SupportSearch.check (InitialSupport.badTimes den m)
        (InitialSupport.pairCompatible m inv b) (terminal rows) (trees b)
        (InitialSupport.selected b) (InitialSupport.available m inv b)
        (InitialSupport.uncovered den m b) (n-2) = true)
    (s : Finset ℕ) (hs : Survivor n den m inv s) : Retained rows s := by
  obtain ⟨hfold, _hcardtwo, hcard, hone, hpair, hcover⟩ := hs
  obtain ⟨b, hb, hb2, hmin, hpair⟩ := hpair
  exact InitialSupport.checked_normalized_support n den m hn inv b
    (terminal rows) (Retained rows) (terminal_sound rows) (trees b)
    (hcheck b hb2 (hfold b hb).2) s hfold hcard hone hb hb2 hmin hpair hcover

/-- Coverage plus separately checked row validity gives an exact survivor
list, rather than merely an over-approximation. -/
theorem checked_survivor_iff {N : ℕ} (n den m : ℕ) (hn : 2 ≤ n)
    (inv : ℕ → ℕ) (rows : Fin N → ℕ)
    (hrows : ∀ i, Survivor n den m inv (SupportSearch.Bits.decode (rows i)))
    (trees : ℕ → SupportSearch.Tree)
    (hcheck : ∀ b, 2 ≤ b → 2*b ≤ m →
      SupportSearch.check (InitialSupport.badTimes den m)
        (InitialSupport.pairCompatible m inv b) (terminal rows) (trees b)
        (InitialSupport.selected b) (InitialSupport.available m inv b)
        (InitialSupport.uncovered den m b) (n-2) = true)
    (s : Finset ℕ) : Survivor n den m inv s ↔ Retained rows s := by
  constructor
  · exact checked_survivor_mem n den m hn inv rows trees hcheck s
  · rintro ⟨i, rfl⟩
    exact hrows i

/-- An arbitrary low-value list of at most n speeds has a unit-normalized
folded support in the checked list. Repeated speeds and folded collisions are
allowed. Prime avoidance and the checked inverse table remain explicit. -/
theorem checked_list_cover {N : ℕ} (n den m : ℕ) (hn : 2 ≤ n)
    (hden : 3 ≤ den) (hm : 2 ≤ m) (hgrid : ¬ den ∣ m)
    (inv : ℕ → ℕ)
    (hinv : ∀ a, 0 < a → 2*a ≤ m → (a*inv a)%m = 1%m)
    (rows : Fin N → ℕ) (trees : ℕ → SupportSearch.Tree)
    (hcheck : ∀ b, 2 ≤ b → 2*b ≤ m →
      SupportSearch.check (InitialSupport.badTimes den m)
        (InitialSupport.pairCompatible m inv b) (terminal rows) (trees b)
        (InitialSupport.selected b) (InitialSupport.available m inv b)
        (InitialSupport.uncovered den m b) (n-2) = true)
    (ds : List ℕ) (hne : ds ≠ []) (hlen : ds.length ≤ n)
    (hmod : ∀ d ∈ ds, d%m ≠ 0) (hlow : value ds ≤ (1 : ℝ)/den) :
    ∃ u v : ℕ, (u*v)%m = 1%m ∧
      Retained rows (foldedSupport m u (residueSupport m ds)) := by
  obtain ⟨u, v, hunit, hfold, hcardtwo, hcard, hone, hpair, hcover⟩ :=
    InitialSupport.closed_support_normalization den m hden hm hgrid inv hinv
      ds hne hmod hlow
  refine ⟨u, v, hunit, checked_survivor_mem n den m hn inv rows trees hcheck _ ?_⟩
  exact ⟨hfold, hcardtwo, hcard.trans hlen, hone, hpair, hcover⟩

end Loneliness.Modular.SupportLists
