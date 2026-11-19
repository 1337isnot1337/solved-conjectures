module

public import Conjectures.FranklLocalFibers
public import Mathlib.Basic.Real.Basic
public import Mathlib.Algebra.Order.BigOperators.Group.Finset
public import Mathlib.Algebra.BigOperators.Ring.Finset
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.NormNum
public import Mathlib.Tactic.Ring

/-! Nonnegative local weight certificates imply abundance in the actual
finite family of distinct unions. -/
@[expose] public section

namespace FranklLocal

open scoped BigOperators

variable {α : Type*} [DecidableEq α]

def frequency (F : Finset (Finset α)) (x : α) : ℕ :=
  (F.filter (fun U => x ∈ U)).card

def Abundant (F : Finset (Finset α)) (x : α) : Prop := F.card ≤ 2*frequency F x

def imbalance (W : Finset α) (w : α → ℝ) (U : Finset α) : ℝ :=
  ∑ x ∈ W, if x ∈ U then w x else -w x

theorem imbalance_interior (W : Finset α) (w : α → ℝ) (U : Finset α) :
    imbalance W w (interior W U)=imbalance W w U := by
  apply Finset.sum_congr rfl
  intro x hx
  simp [interior,hx]

theorem sum_fiber_imbalance (G : Finset (Finset α)) (W X : Finset α) (w : α → ℝ) :
    (∑ S ∈ fiber G W X, imbalance W w S)=
      ∑ U ∈ (family G).filter (fun U => exterior W U=X), imbalance W w U := by
  rw [fiber,Finset.sum_image]
  · exact Finset.sum_congr rfl (fun U _ => imbalance_interior W w U)
  · intro U hU V hV hi
    exact eq_of_traces_eq hi
      ((Finset.mem_filter.mp hU).2.trans (Finset.mem_filter.mp hV).2.symm)

theorem total_imbalance (F : Finset (Finset α)) (W : Finset α) (w : α → ℝ) :
    (∑ U ∈ F, imbalance W w U)=
      ∑ x ∈ W, w x * (2*(frequency F x:ℝ)-(F.card:ℝ)) := by
  unfold imbalance
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro x _
  calc
    (∑ U ∈ F, if x ∈ U then w x else -w x)=
        ∑ U ∈ F, (2*(if x ∈ U then w x else 0)-w x) := by
      apply Finset.sum_congr rfl
      intro U _
      split_ifs <;> ring
    _ = 2*(∑ U ∈ F, if x ∈ U then w x else 0)-(F.card:ℝ)*w x := by
      rw [Finset.sum_sub_distrib,Finset.mul_sum]
      simp
    _ = 2*((frequency F x:ℝ)*w x)-(F.card:ℝ)*w x := by
      congr 2
      rw [← Finset.sum_filter]
      simp [frequency]
    _ = w x*(2*(frequency F x:ℝ)-(F.card:ℝ)) := by ring

theorem abundant_of_total_imbalance {F : Finset (Finset α)} {W : Finset α}
    {w : α → ℝ} (hw : ∀ x ∈ W, 0 ≤ w x) (hpos : ∃ x ∈ W, 0 < w x)
    (hsum : 0 ≤ ∑ U ∈ F, imbalance W w U) : ∃ x ∈ W, Abundant F x := by
  by_contra hnone
  have hlt : ∀ x ∈ W, 2*frequency F x < F.card := by
    intro x hx
    exact Nat.lt_of_not_ge (fun h => hnone ⟨x,hx,h⟩)
  have hreal : ∀ x ∈ W, 2*(frequency F x:ℝ)-(F.card:ℝ) < 0 := by
    intro x hx
    have h : 2*(frequency F x:ℝ) < (F.card:ℝ) := by exact_mod_cast hlt x hx
    linarith
  have hnegative :
      (∑ x ∈ W, w x*(2*(frequency F x:ℝ)-(F.card:ℝ))) < 0 := by
    have h := Finset.sum_lt_sum
      (fun x hx => mul_nonpos_of_nonneg_of_nonpos (hw x hx) (hreal x hx).le)
      (by
        obtain ⟨x,hx,hwx⟩ := hpos
        exact ⟨x,hx,mul_neg_of_pos_of_neg hwx (hreal x hx)⟩)
    simpa using h
  rw [total_imbalance F W w] at hsum
  exact (not_lt_of_ge hsum) hnegative

/-- A certificate is tested on every pair M ⊆ E ⊆ B. This includes exterior
conditions not realized by the full family. -/
def WeightCertificate (G : Finset (Finset α)) (W : Finset α) (w : α → ℝ) : Prop :=
  ∀ E M : Finset α, M ⊆ E → E ⊆ boundary G W →
    0 ≤ ∑ S ∈ compatible G W E M, imbalance W w S

theorem weightCertificate_total {G : Finset (Finset α)} {W : Finset α} {w : α → ℝ}
    (hcert : WeightCertificate G W w) :
    0 ≤ ∑ U ∈ family G, imbalance W w U := by
  rw [← Finset.sum_fiberwise_of_maps_to
    (fun U (hU : U ∈ family G) => Finset.mem_image_of_mem (exterior W) hU)
    (fun U => imbalance W w U)]
  apply Finset.sum_nonneg
  intro X hX
  rw [← sum_fiber_imbalance G W X w]
  obtain ⟨U,hU,hUX⟩ := Finset.mem_image.mp hX
  rw [fiber_eq_compatible ⟨U,hU,hUX⟩]
  apply hcert
  · intro x hx
    obtain ⟨hxXZ,hxB⟩ := Finset.mem_inter.mp hx
    exact Finset.mem_inter.mpr ⟨(Finset.mem_sdiff.mp hxXZ).1,hxB⟩
  · exact Finset.inter_subset_right

/-- Local weighted inequalities force an abundant point of W in the family
of distinct generated unions, with the empty union included. -/
theorem weighted_local_certificate_abundance {G : Finset (Finset α)}
    {W : Finset α} {w : α → ℝ}
    (hw : ∀ x ∈ W, 0 ≤ w x) (hpos : ∃ x ∈ W, 0 < w x)
    (hcert : WeightCertificate G W w) :
    ∃ x ∈ W, (family G).card ≤ 2*((family G).filter (fun U => x ∈ U)).card :=
  abundant_of_total_imbalance hw hpos (weightCertificate_total hcert)

end FranklLocal
