import Conjectures.HajduSarkozyAsymptotics
import Mathlib.Algebra.BigOperators.Group.Finset.Sigma
import Mathlib.Algebra.Order.BigOperators.Group.Finset

/-!
# Hajdu–Sárközy's shifted-power perturbation conjecture

The full triangular sum of the finite geometric-bin incidence estimates.
The two injections `(i,j) ↦ (i+j,2i)` and `(i,j) ↦ (i+j,j)` place the
quadratic and linear contributions inside double prefix sums.  This is the
discrete form of the no-logarithmic-loss summation in the recorded proof.
-/

open Filter Finset Asymptotics

namespace Conjectures.HajduSarkozy

def triangle (L : ℕ) : Finset (ℕ × ℕ) :=
  (range (L+1) ×ˢ range (L+1)).filter fun p => p.1+p.2 ≤ L

def upperTriangle (L : ℕ) : Finset (ℕ × ℕ) :=
  (triangle L).filter fun p => p.1 ≤ p.2

@[simp] theorem mem_triangle {L : ℕ} {p : ℕ × ℕ} :
    p ∈ triangle L ↔ p.1+p.2 ≤ L := by
  simp only [triangle, mem_filter, mem_product, mem_range]
  omega

@[simp] theorem mem_upperTriangle {L : ℕ} {p : ℕ × ℕ} :
    p ∈ upperTriangle L ↔ p.1+p.2 ≤ L ∧ p.1 ≤ p.2 := by
  simp only [upperTriangle, mem_filter, mem_triangle]

def triangleSum (E : ℕ → ℕ → ℝ) (L : ℕ) : ℝ :=
  ∑ p ∈ triangle L, E p.1 p.2

def upperSum (E : ℕ → ℕ → ℝ) (L : ℕ) : ℝ :=
  ∑ p ∈ upperTriangle L, E p.1 p.2

theorem upper_square_le_doublePrefix (m : ℕ → ℝ) (L : ℕ) :
    (∑ p ∈ upperTriangle L, (m p.1)^2) ≤ doublePrefix (fun n => (m (n/2))^2) L := by
  unfold doublePrefix
  rw [← sum_sigma (range (L+1)) (fun t => range (t+1))
    (fun x : Σ _ : ℕ, ℕ => (m (x.2/2))^2)]
  apply sum_le_sum_of_injOn (fun p : ℕ × ℕ => (⟨p.1+p.2, 2*p.1⟩ : Σ _ : ℕ, ℕ))
  · intro p _ r _ he
    have h₁ := congrArg Sigma.fst he
    have h₂ := congrArg (fun x : Σ _ : ℕ, ℕ => x.2) he
    apply Prod.ext <;> dsimp at h₁ h₂ ⊢ <;> omega
  · intro x hx
    obtain ⟨p, hp, rfl⟩ := mem_image.mp hx
    obtain ⟨hL, hle⟩ := mem_upperTriangle.mp hp
    exact mem_sigma.mpr ⟨mem_range.mpr (by change p.1+p.2 < L+1; omega),
      mem_range.mpr (by change 2*p.1 < p.1+p.2+1; omega)⟩
  · intro p _
    dsimp
    rw [show 2*p.1/2 = p.1 by omega]
  · intro x _ _
    exact sq_nonneg _

theorem upper_linear_le_doublePrefix (m : ℕ → ℝ) (hm : ∀ n, 0 ≤ m n) (L : ℕ) :
    (∑ p ∈ upperTriangle L, m p.2) ≤ doublePrefix m L := by
  unfold doublePrefix
  rw [← sum_sigma (range (L+1)) (fun t => range (t+1))
    (fun x : Σ _ : ℕ, ℕ => m x.2)]
  apply sum_le_sum_of_injOn (fun p : ℕ × ℕ => (⟨p.1+p.2, p.2⟩ : Σ _ : ℕ, ℕ))
  · intro p _ r _ he
    have h₁ := congrArg Sigma.fst he
    have h₂ := congrArg (fun x : Σ _ : ℕ, ℕ => x.2) he
    apply Prod.ext <;> dsimp at h₁ h₂ ⊢ <;> omega
  · intro x hx
    obtain ⟨p, hp, rfl⟩ := mem_image.mp hx
    have hL := (mem_upperTriangle.mp hp).1
    exact mem_sigma.mpr ⟨mem_range.mpr (by change p.1+p.2 < L+1; omega),
      mem_range.mpr (by change p.2 < p.1+p.2+1; omega)⟩
  · intro p _
    exact le_rfl
  · intro x _ _
    exact hm _

theorem upperSum_le {E : ℕ → ℕ → ℝ} {m n : ℕ → ℝ}
    (hn : ∀ i, 0 ≤ n i) (hE : ∀ i j, E i j ≤ (m i)^2+n j) (L : ℕ) :
    upperSum E L ≤ doublePrefix (fun i => (m (i/2))^2) L + doublePrefix n L := by
  calc
    upperSum E L ≤ ∑ p ∈ upperTriangle L, ((m p.1)^2 + n p.2) :=
      sum_le_sum fun p _ => hE p.1 p.2
    _ = (∑ p ∈ upperTriangle L, (m p.1)^2) + ∑ p ∈ upperTriangle L, n p.2 := sum_add_distrib
    _ ≤ doublePrefix (fun i => (m (i/2))^2) L + doublePrefix n L :=
      add_le_add (upper_square_le_doublePrefix m L) (upper_linear_le_doublePrefix n hn L)

theorem triangleSum_le_upper {E : ℕ → ℕ → ℝ} (hE : ∀ i j, 0 ≤ E i j) (L : ℕ) :
    triangleSum E L ≤ upperSum E L + upperSum (fun i j => E j i) L := by
  unfold triangleSum
  rw [← sum_filter_add_sum_filter_not (triangle L) (fun p => p.1 ≤ p.2)]
  apply add_le_add le_rfl
  unfold upperSum
  apply sum_le_sum_of_injOn Prod.swap Prod.swap_injective.injOn
  · intro x hx
    obtain ⟨p, hp, rfl⟩ := mem_image.mp hx
    obtain ⟨htri, hle⟩ := mem_filter.mp hp
    have hsum := mem_triangle.mp htri
    apply mem_upperTriangle.mpr
    dsimp
    constructor <;> omega
  · intro p _
    exact le_rfl
  · intro p _ _
    exact hE _ _

theorem triangleSum_isLittleO {q : ℝ} (hq : 1 < q)
    {E : ℕ → ℕ → ℝ} {m n : ℕ → ℝ}
    (hm0 : ∀ i, 0 ≤ m i) (hn0 : ∀ i, 0 ≤ n i) (hE0 : ∀ i j, 0 ≤ E i j)
    (hE₁ : ∀ i j, E i j ≤ (m i)^2+n j)
    (hE₂ : ∀ i j, E i j ≤ (n j)^2+m i)
    (hm : m =o[atTop] fun i => q^i) (hn : n =o[atTop] fun i => q^i) :
    triangleSum E =o[atTop] fun i => q^i := by
  have hm₂ := doublePrefix_isLittleO hq (half_square_isLittleO hq hm)
  have hn₂ := doublePrefix_isLittleO hq (half_square_isLittleO hq hn)
  have hm₁ := doublePrefix_isLittleO hq hm
  have hn₁ := doublePrefix_isLittleO hq hn
  have hmajor := (hm₂.add hn₁).add (hn₂.add hm₁)
  apply (IsBigO.of_bound 1 ?_).trans_isLittleO hmajor
  filter_upwards [] with L
  have hpos : 0 ≤ triangleSum E L := sum_nonneg fun p _ => hE0 _ _
  rw [one_mul, Real.norm_of_nonneg hpos, Real.norm_of_nonneg (by
    exact add_nonneg
      (add_nonneg (doublePrefix_nonneg (fun _ => sq_nonneg _) L) (doublePrefix_nonneg hn0 L))
      (add_nonneg (doublePrefix_nonneg (fun _ => sq_nonneg _) L) (doublePrefix_nonneg hm0 L)))]
  exact (triangleSum_le_upper hE0 L).trans (add_le_add
    (upperSum_le hn0 hE₁ L) (upperSum_le hm0 (fun i j => hE₂ j i) L))

end Conjectures.HajduSarkozy
