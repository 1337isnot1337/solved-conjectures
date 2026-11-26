import Conjectures.ChernFuLinThreeStatisticSubword

/-! # Minimum decomposition as a literal membership equivalence

`m` is the position of the global minimum and `l` a minimum-value position to
its left. The low and high right blocks are defined by comparing with `π l`.
The core tests use the prefix together with zero or one high entry, so the
statement includes the case where no high entry exists.
-/

namespace Conjectures.ChernFuLinThreeStatistic

open BursteinA218225 Crossing

section

variable {n : ℕ} (π : Equiv.Perm (Fin n)) (m l : Fin n)

def low (i : Fin n) : Prop := m < i ∧ π i < π l
def high (i : Fin n) : Prop := m < i ∧ π l < π i

def Divided : Prop := ∀ i j q, high π m l i → high π m l j →
  π i < π q → π q < π j → m < q

def cutRole (i : Fin n) : Role :=
  if i=m then 0 else if i<m then
    if ∃ r : Fin n, m<r ∧ π l<π r ∧ π r<π i then 4 else 2
  else if π i<π l then 1 else 3

theorem role_left (i : Fin n) : leftRole (cutRole π m l i) = true ↔ i < m := by
  unfold cutRole; split_ifs <;> simp_all [leftRole]

private theorem role_zero (i : Fin n) : cutRole π m l i = 0 ↔ i=m := by
  unfold cutRole; split_ifs <;> simp_all

theorem role_low (i : Fin n) : cutRole π m l i = 1 ↔ low π m l i := by
  unfold cutRole low; split_ifs <;> simp_all <;> omega

theorem role_high (hlm : l<m) (i : Fin n) : cutRole π m l i = 3 ↔ high π m l i := by
  rcases lt_trichotomy i m with hi | rfl | hi
  · simp [cutRole,high,hi,hi.ne,hi.not_gt]; split <;> decide
  · simp [cutRole,high]
  · have he : π i ≠ π l := fun e => (hlm.trans hi).ne (π.injective e).symm
    rcases lt_or_gt_of_ne he with hv | hv <;> simp [cutRole,high,hi,hi.ne',hi.not_gt,hv,hv.not_gt]

private theorem role_side (i : Fin n) : side (cutRole π m l i) =
    if i<m then 0 else if i=m then 1 else 2 := by
  unfold cutRole; split_ifs <;> simp_all [side,leftRole]

variable {π m l}

private theorem layout_of_divided (hm : ∀ i, i ≠ m → π m < π i) (hlm : l<m)
    (hl : ∀ i, i<m → π l ≤ π i) (hd : Divided π m l) :
    ∃ L : Layout π, L.role = cutRole π m l := by
  refine ⟨⟨cutRole π m l, ?_, ?_, ?_⟩,rfl⟩
  · intro i j hij
    simp only [Function.comp_apply,role_side]
    split_ifs <;> first | decide | omega
  · intro i j hij
    have hne : i ≠ j := fun e => hij.ne (congrArg π e)
    have upper (i j : Fin n) (hi : i<m) (hj : m<j) (hij : π i<π j)
        (hu : ∃ r, m<r ∧ π l<π r ∧ π r<π i) : False := by
      obtain ⟨r,hmr,hlr,hri⟩ := hu
      exact (lt_asymm hi) (hd r j i ⟨hmr,hlr⟩ ⟨hj,(hlr.trans hri).trans hij⟩ hri hij)
    have step : (∃ r, m<r ∧ π l<π r ∧ π r<π i) → ∃ r, m<r ∧ π l<π r ∧ π r<π j :=
      fun ⟨r,a,b,c⟩ => ⟨r,a,b,c.trans hij⟩
    have lowRight : m < i → π l < π i → ∃ r, m < r ∧ π l < π r ∧ π r < π j :=
      fun a b => ⟨i,a,b,hij⟩
    have eqi : π i = π l → i=l := fun e => π.injective e
    have hmi := hm i
    have hli := hl i
    unfold cutRole
    split_ifs <;> first | decide | omega | grind
  · intro i j hi hj
    exact ((role_zero π m l i).mp hi).trans ((role_zero π m l j).mp hj).symm

private theorem tail_of_mem {z : Bool} (hm : ∀ i, i ≠ m → π m < π i) (hlm : l<m)
    (h : inClass z π) : tailRules z (fun i => (π i).val) (cutRole π m l) := by
  cases z
  · constructor
    · intro i j hij hi _
      obtain ⟨hmi,hli⟩ := (role_high π m l hlm i).mp hi
      exact highBlock_decreasing h hlm hmi hij (hm l hlm.ne) hli
    · intro i j q b hij hjq hjb hi _ hq hb hji hiq
      obtain ⟨hmi,_⟩ := (role_low π m l i).mp hi
      exact (lt_asymm hjb) (middle_after_high h hlm hmi hij hjq hji hiq
        ((role_low π m l q).mp hq).2 ((role_high π m l hlm b).mp hb).2)
  · intro a b hab ha hb
    obtain ⟨hma,hal⟩ := (role_low π m l a).mp ha
    exact (lt_asymm hab) (lowBlock_trails h hlm hma (hm a hma.ne') hal
      ((role_high π m l hlm b).mp hb).2)

/-- Exact test for `u 1 v` with nonempty `u`, stated on standardized literal
permutations of their actual lengths. -/
theorem minimum_iff {z : Bool} (hm : ∀ i, i ≠ m → π m < π i) (hlm : l<m)
    (hl : ∀ i, i<m → π l ≤ π i) : inClass z π ↔
    Divided π m l ∧ tailRules z (fun i => (π i).val) (cutRole π m l) ∧
    inClass z (standardize π (Finset.univ.filter fun i => m < i ∧ π i < π l)) ∧
    inClass z (standardize π (Finset.univ.filter fun i => m < i ∧ π l < π i)) ∧
    (∀ b : Option (Fin n), inClass z (standardize π (Finset.univ.filter fun i =>
      i < m ∨ (m < i ∧ π l < π i) ∧ some i=b))) := by
  constructor
  · intro h
    have hxz : InX π ∨ InZ π := by cases z; exact Or.inl h; exact Or.inr h
    refine ⟨?_,tail_of_mem hm hlm h,inClass_standardize h _,inClass_standardize h _,
      fun _ => inClass_standardize h _⟩
    intro i j q hi hj hiq hqj
    exact highBlock_convex hxz hlm hi.1 hj.1 (hm l hlm.ne) hi.2 hiq hqj
  · rintro ⟨hd,ht,ha,hb,hcore⟩
    obtain ⟨L,hL⟩ := layout_of_divided hm hlm hl hd
    have aux (S : Finset (Fin n)) (h : inClass z (standardize π S)) : AvoidOn π z (· ∈ S) :=
      (inClass_standardize_iff z π S).mp h
    have hA : AvoidOn π z (fun i => L.role i=1) := by
      intro k τ hτ f hf ho hP
      exact aux _ ha hτ f hf ho (fun i => Finset.mem_filter.mpr ⟨Finset.mem_univ _,
        (role_low π m l _).mp (hL ▸ hP i)⟩)
    have hB : AvoidOn π z (fun i => L.role i=3) := by
      intro k τ hτ f hf ho hP
      exact aux _ hb hτ f hf ho (fun i => Finset.mem_filter.mpr ⟨Finset.mem_univ _,
        (role_high π m l hlm _).mp (hL ▸ hP i)⟩)
    have hC (b : Option (Fin n)) : AvoidOn π z (fun i => leftRole (L.role i) = true ∨
        (L.role i=3 ∧ some i=b)) := by
      intro k τ hτ f hf ho hP
      apply aux _ (hcore b) hτ f hf ho
      intro i; apply Finset.mem_filter.mpr; refine ⟨Finset.mem_univ _,?_⟩
      rcases hP i with hi | ⟨hi,he⟩
      · exact Or.inl ((role_left π m l _).mp (hL ▸ hi))
      · exact Or.inr ⟨(role_high π m l hlm _).mp (hL ▸ hi),he⟩
    have h : AvoidOn π z (fun _ => True) := avoid_of_layout L (hL ▸ ht) hA hB hC
    apply (inClass_iff π z).2
    rintro k τ hτ ⟨f,hf,ho⟩
    exact h hτ f hf ho (fun _ => trivial)

end
end Conjectures.ChernFuLinThreeStatistic
