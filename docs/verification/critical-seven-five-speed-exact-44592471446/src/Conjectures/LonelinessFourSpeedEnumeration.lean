import Conjectures.LonelinessModularNormalize
import Mathlib.Data.Finset.Powerset
import Mathlib.Order.Interval.Finset.Nat

/-! Exhaustive finite supports after minimum-pair normalization.
The support cardinality is a parameter; in the four-speed application it
ranges from one to four because folding can identify coordinates. -/

namespace Loneliness.Modular.FourSpeed

def boundedSupports (m r : ℕ) : Finset (Finset ℕ) :=
  ((Finset.Icc 1 (m/2)).powersetCard r).filter (fun s => 1∈s)

def PairNormalized (m : ℕ) (inv : ℕ → ℕ) (s : Finset ℕ) : Prop :=
  ∃ b∈s, 2≤b ∧ (∀ x∈s, x≠1 → b≤x) ∧
    (∀ x∈s, ∀ y∈s, x≠y → b≤folded m (inv x*y))

instance (m : ℕ) (inv : ℕ → ℕ) (s : Finset ℕ) :
    Decidable (PairNormalized m inv s) :=
  inferInstanceAs (Decidable (∃ b∈s, 2≤b ∧ (∀ x∈s, x≠1 → b≤x) ∧
    (∀ x∈s, ∀ y∈s, x≠y → b≤folded m (inv x*y))))

def normalizedSupports (m r : ℕ) (inv : ℕ → ℕ) : Finset (Finset ℕ) :=
  (boundedSupports m r).filter (PairNormalized m inv)

theorem foldedSupport_subset_interval {m : ℕ} {s : Finset ℕ}
    (hs : FoldedSupport m s) : s⊆Finset.Icc 1 (m/2) := by
  intro x hx
  obtain ⟨hpos,hbound⟩ := hs x hx
  apply Finset.mem_Icc.mpr
  constructor <;> omega

theorem mem_boundedSupports_iff {m r : ℕ} {s : Finset ℕ} :
    s∈boundedSupports m r ↔ FoldedSupport m s ∧ s.card=r ∧ 1∈s := by
  simp only [boundedSupports,Finset.mem_filter,Finset.mem_powersetCard]
  constructor
  · rintro ⟨⟨hsub,hcard⟩,hone⟩
    refine ⟨?_,hcard,hone⟩
    intro x hx
    have hh := Finset.mem_Icc.mp (hsub hx)
    constructor <;> omega
  · rintro ⟨hs,hcard,hone⟩
    exact ⟨⟨foldedSupport_subset_interval hs,hcard⟩,hone⟩

theorem mem_normalizedSupports_iff {m r : ℕ} {inv : ℕ → ℕ} {s : Finset ℕ} :
    s∈normalizedSupports m r inv ↔
      FoldedSupport m s ∧ s.card=r ∧ 1∈s ∧ PairNormalized m inv s := by
  simp only [normalizedSupports,Finset.mem_filter,mem_boundedSupports_iff]
  tauto

/-- The executable support list contains a unit-equivalent representative
of every folded support of the given cardinality, without any range search
assumption. The only arithmetic input is a checked inverse table. -/
theorem normalizedSupports_complete {m r : ℕ} (hm : 2≤m) (hr : 2≤r)
    (inv : ℕ → ℕ) (hinv : ∀ a, 0<a → 2*a≤m → (a*inv a)%m=1%m)
    (s : Finset ℕ) (hs : FoldedSupport m s) (hcard : s.card=r) :
    ∃ u v : ℕ, (u*v)%m=1%m ∧ foldedSupport m u s∈normalizedSupports m r inv := by
  obtain ⟨u,v,b,hunit,htcard,htvalid,hone,hb,hb2,hmin,hpair⟩ :=
    minimum_pair_normalization m hm inv hinv s hs (by omega)
  refine ⟨u,v,hunit,mem_normalizedSupports_iff.mpr ?_⟩
  exact ⟨htvalid,htcard.trans hcard,hone,b,hb,hb2,hmin,hpair⟩

def checkSupports (m r : ℕ) (inv : ℕ → ℕ) (rowCheck : Finset ℕ → Bool) : Bool :=
  decide (∀ s∈normalizedSupports m r inv, rowCheck s=true)

theorem checkSupports_sound {m r : ℕ} {inv : ℕ → ℕ}
    {rowCheck : Finset ℕ → Bool} (hcheck : checkSupports m r inv rowCheck=true)
    {s : Finset ℕ} (hs : s∈normalizedSupports m r inv) : rowCheck s=true :=
  (of_decide_eq_true hcheck) s hs

theorem checked_normalization {m r : ℕ} (hm : 2≤m) (hr : 2≤r)
    (inv : ℕ → ℕ) (hinv : ∀ a, 0<a → 2*a≤m → (a*inv a)%m=1%m)
    (rowCheck : Finset ℕ → Bool) (hcheck : checkSupports m r inv rowCheck=true)
    (s : Finset ℕ) (hs : FoldedSupport m s) (hcard : s.card=r) :
    ∃ u v : ℕ, (u*v)%m=1%m ∧ rowCheck (foldedSupport m u s)=true := by
  obtain ⟨u,v,hunit,hmem⟩ := normalizedSupports_complete hm hr inv hinv s hs hcard
  exact ⟨u,v,hunit,checkSupports_sound hcheck hmem⟩

end Loneliness.Modular.FourSpeed
