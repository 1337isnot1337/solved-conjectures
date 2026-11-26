module
public import Mathlib.Algebra.Group.Submonoid.Basic
public import Mathlib.Order.Interval.Finset.Nat
import Mathlib.Data.Finset.Card

@[expose] public section
namespace CyrusianKaplan

open Finset

/-- Actual carrier encoded by its positive low members and high gaps. -/
def EncodedMember (g : ℕ) (A B : Finset ℕ) (n : ℕ) : Prop :=
  n=0 ∨ (n≤g ∧ n∈B) ∨ (g<n ∧ n∉A)

def encodedGaps (g : ℕ) (A B : Finset ℕ) : Finset ℕ :=
  (Finset.Icc 1 g\B)∪A

/-- The two finite membership tests in the written proof, without
a finite screen or an eventual-g assumption. -/
def EncodingTests (g : ℕ) (A B : Finset ℕ) : Prop :=
  (∀ b∈B,∀ c∈B,EncodedMember g A B (b+c)) ∧
  (∀ a∈A,∀ b∈B,¬EncodedMember g A B (a-b))

theorem encodedMember_zero (g : ℕ) (A B : Finset ℕ) : EncodedMember g A B 0 :=
  Or.inl rfl

theorem encodedMember_of_low_mem {g : ℕ} {A B : Finset ℕ}
    (hB : B⊆Finset.Icc 1 g) {b : ℕ} (hb : b∈B) : EncodedMember g A B b :=
  Or.inr (Or.inl ⟨(Finset.mem_Icc.mp (hB hb)).2,hb⟩)

theorem encodedMember_not_of_high_gap {g : ℕ} {A B : Finset ℕ}
    (hA : A⊆Finset.Ioo g (2*g)) {a : ℕ} (ha : a∈A) : ¬EncodedMember g A B a := by
  have hA' := (Finset.mem_Ioo.mp (hA ha)).1
  rintro (h0|⟨hle,_⟩|⟨_,hnot⟩)
  · omega
  · omega
  · exact hnot ha

/-- The encoded set is an additive monoid exactly when all low
sums are present and every corresponding high-gap difference is
absent. Two high positive summands cannot hit a high gap. -/
theorem encodedMember_add_closed_iff (g : ℕ) (A B : Finset ℕ)
    (hA : A⊆Finset.Ioo g (2*g)) (hB : B⊆Finset.Icc 1 g) :
    (∀ b c,EncodedMember g A B b→EncodedMember g A B c→EncodedMember g A B (b+c))
      ↔ EncodingTests g A B := by
  constructor
  · intro h
    refine ⟨fun b hb c hc=>h b c (encodedMember_of_low_mem hB hb)
      (encodedMember_of_low_mem hB hc),?_⟩
    intro a ha b hb hab
    have hle : b≤a := (Finset.mem_Icc.mp (hB hb)).2.trans
      (Finset.mem_Ioo.mp (hA ha)).1.le
    have hbad := h (a-b) b hab (encodedMember_of_low_mem hB hb)
    rw [Nat.sub_add_cancel hle] at hbad
    exact encodedMember_not_of_high_gap hA ha hbad
  · rintro ⟨hbb,hab⟩ x y hx hy
    rcases hx with h0|⟨hxle,hxB⟩|⟨hxlt,hxA⟩
    · simpa only [h0,zero_add] using hy
    · rcases hy with h0|⟨_,hyB⟩|⟨hylt,hyA⟩
      · simpa only [h0,add_zero] using encodedMember_of_low_mem hB hxB
      · exact hbb x hxB y hyB
      · refine Or.inr (Or.inr ⟨by omega,?_⟩)
        intro hSum
        apply hab (x+y) hSum x hxB
        simpa only [Nat.add_sub_cancel_left] using
          (show EncodedMember g A B y from Or.inr (Or.inr ⟨hylt,hyA⟩))
    · rcases hy with h0|⟨hyle,hyB⟩|⟨hylt,_⟩
      · simpa only [h0,add_zero] using
          (show EncodedMember g A B x from Or.inr (Or.inr ⟨hxlt,hxA⟩))
      · refine Or.inr (Or.inr ⟨by omega,?_⟩)
        intro hSum
        apply hab (x+y) hSum y hyB
        simpa only [Nat.add_sub_cancel] using
          (show EncodedMember g A B x from Or.inr (Or.inr ⟨hxlt,hxA⟩))
      · refine Or.inr (Or.inr ⟨by omega,?_⟩)
        intro hSum
        have hu := (Finset.mem_Ioo.mp (hA hSum)).2
        omega

/-- The total encoded gap finset matches the positive complement of
the actual carrier, at every natural argument. -/
theorem mem_encodedGaps_iff (g : ℕ) (A B : Finset ℕ)
    (hA : A⊆Finset.Ioo g (2*g)) (n : ℕ) :
    n∈encodedGaps g A B ↔ 0<n ∧ ¬EncodedMember g A B n := by
  by_cases hn : n=0
  · subst n
    have ha : 0∉A := fun h=>by
      have z := (Finset.mem_Ioo.mp (hA h)).1
      omega
    simp [encodedGaps,EncodedMember,ha]
  · have hp : 0<n := Nat.pos_of_ne_zero hn
    have h1 : 1≤n := hp
    by_cases hl : n≤g
    · have ha : n∉A := fun h=>(not_lt_of_ge hl) (Finset.mem_Ioo.mp (hA h)).1
      simp [encodedGaps,EncodedMember,hn,hp,h1,hl,ha,not_lt_of_ge hl]
    · have ht : g<n := lt_of_not_ge hl
      simp [encodedGaps,EncodedMember,hn,hp,hl,ht]

/-- Balanced low and high lists of equal size encode exactly genus
g; the bound is valid on all positive (and degenerate zero) genera. -/
theorem encodedGaps_card (g : ℕ) (A B : Finset ℕ)
    (hA : A⊆Finset.Ioo g (2*g)) (hB : B⊆Finset.Icc 1 g)
    (hcard : A.card=B.card) : (encodedGaps g A B).card=g := by
  have hD : Disjoint (Finset.Icc 1 g\B) A := by
    refine Finset.disjoint_left.mpr (fun n hLow hHigh=>?_ )
    exact (not_lt_of_ge (Finset.mem_Icc.mp (Finset.mem_sdiff.mp hLow).1).2)
      (Finset.mem_Ioo.mp (hA hHigh)).1
  rw [encodedGaps,Finset.card_union_of_disjoint hD,hcard,
    Finset.card_sdiff_add_card_eq_card hB,Nat.card_Icc]
  omega

/-- The literal additive submonoid attached to an admissible pair. -/
def encodedSubmonoid (g : ℕ) (A B : Finset ℕ)
    (hA : A⊆Finset.Ioo g (2*g)) (hB : B⊆Finset.Icc 1 g)
    (ht : EncodingTests g A B) : AddSubmonoid ℕ where
  carrier := {n | EncodedMember g A B n}
  zero_mem' := encodedMember_zero g A B
  add_mem' := fun hx hy=>(encodedMember_add_closed_iff g A B hA hB).mpr ht _ _ hx hy

end CyrusianKaplan
