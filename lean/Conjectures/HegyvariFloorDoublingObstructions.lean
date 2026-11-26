import Conjectures.HegyvariFloorDoublingReal
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Algebra.BigOperators.Ring.Finset

/-! The two excluded cases for strong completeness of the actual floor values. -/

namespace HegyvariFloorDoubling

def StrongCompleteValues (A : ℕ → Prop) : Prop :=
  ∀ F : Finset ℕ, ∃ M : ℕ, ∀ m : ℕ, M ≤ m →
    ∃ S : Finset ℕ, (∀ x ∈ S, A x ∧ x ∉ F) ∧ (∑ x ∈ S, x) = m

theorem StrongCompleteValues.mono {A B : ℕ → Prop} (h : ∀ x, A x → B x)
    (sc : StrongCompleteValues A) : StrongCompleteValues B := by
  intro F
  obtain ⟨M,hM⟩ := sc F
  refine ⟨M,fun m hm => ?_⟩
  obtain ⟨S,hs,sm⟩ := hM m hm
  exact ⟨S,fun x hx => ⟨h x (hs x hx).1,(hs x hx).2⟩,sm⟩

theorem dyadic_floor_even_tail {a : ℝ} (h : Dyadic a) :
    ∃ N : ℕ, ∀ n ≥ N, 2 ∣ floorRay a n := by
  obtain ⟨e,k,hk⟩ := h
  refine ⟨e+1,?_⟩
  intro n hn
  obtain ⟨j,rfl⟩ := Nat.exists_eq_add_of_le hn
  refine ⟨2^j*k,?_⟩
  unfold floorRay
  have hreal : (2:ℝ)^(e+1+j)*a = (2*(2^j*k) : ℕ) := by
    push_cast
    rw [pow_add,pow_succ]
    rw [← hk]; ring
  rw [hreal,Nat.floor_natCast]

theorem not_strongComplete_two_dyadics {a b : ℝ} (ha : Dyadic a) (hb : Dyadic b) :
    ¬ StrongCompleteValues (PositiveRayUnion (floorRay a) (floorRay b)) := by
  classical
  obtain ⟨A,hA⟩ := dyadic_floor_even_tail ha
  obtain ⟨B,hB⟩ := dyadic_floor_even_tail hb
  let F := (Finset.range A).image (floorRay a) ∪ (Finset.range B).image (floorRay b)
  intro sc
  obtain ⟨M,hM⟩ := sc F
  obtain ⟨S,hs,sm⟩ := hM (2*M+1) (by omega)
  have he : 2 ∣ ∑ x ∈ S, x := by
    apply Finset.dvd_sum
    intro x hx
    obtain ⟨⟨_,h⟩,hn⟩ := hs x hx
    rcases h with ⟨i,rfl⟩ | ⟨i,rfl⟩
    · apply hA
      by_contra! hi
      exact hn (Finset.mem_union_left _ (Finset.mem_image_of_mem _ (Finset.mem_range.mpr hi)))
    · apply hB
      by_contra! hi
      exact hn (Finset.mem_union_right _ (Finset.mem_image_of_mem _ (Finset.mem_range.mpr hi)))
  rw [sm] at he
  omega

private theorem rayDouble (a : ℝ) (ha : 0 ≤ a) (n : ℕ) :
    2*floorRay a n ≤ floorRay a (n+1) := by
  have h := floorRay_binaryStep ha n
  omega

private theorem prefix_gap {f : ℕ → ℕ} (h : ∀ i, 2*f i ≤ f (i+1)) (N : ℕ) (hN : 2 ≤ f N)
    (j : ℕ) : (∑ i ∈ Finset.range j, f (N+i)) + 2 ≤ f (N+j) := by
  induction j with
  | zero => simpa using hN
  | succ j ih =>
    rw [Finset.sum_range_succ]
    have hd : 2*f (N+j) ≤ f (N+(j+1)) := by simpa only [Nat.add_assoc] using h (N+j)
    omega

theorem not_strongComplete_single_ray {a : ℝ} (ha : 0 < a) :
    ¬ StrongCompleteValues (fun x => ∃ i, floorRay a i = x) := by
  classical
  let f := floorRay a
  obtain ⟨j,hj⟩ := floorRay_positive ha
  have habove := binaryStep_eventuallyAbove (floorRay_binaryStep ha.le) j hj
  obtain ⟨N,hN⟩ := habove 2
  have hd : ∀ i, 2*f i ≤ f (i+1) := rayDouble a ha.le
  have hm : Monotone f := monotone_nat_of_le_succ (fun i => by have := hd i; omega)
  let F := (Finset.range N).image f
  intro sc
  obtain ⟨L,hL⟩ := sc F
  obtain ⟨K,hK⟩ := habove (L+2)
  have far : L+2 ≤ f (N+K) := hK (N+K) (by omega)
  obtain ⟨S,hs,sm⟩ := hL (f (N+K)-1) (by omega)
  have sub : S ⊆ (Finset.range K).image (fun i => f (N+i)) := by
    intro x hx
    obtain ⟨⟨i,hi⟩,hf⟩ := hs x hx
    have hi' : f i = x := hi
    have nle : N ≤ i := by
      by_contra! no
      exact hf (Finset.mem_image.mpr ⟨i,Finset.mem_range.mpr no,hi'⟩)
    have bound : x ≤ ∑ v ∈ S, v :=
      Finset.single_le_sum (f:=fun v : ℕ => v) (fun v _ => Nat.zero_le v) hx
    rw [sm,← hi'] at bound
    have up : i < N+K := by
      by_contra! h
      have := hm h
      omega
    exact Finset.mem_image.mpr ⟨i-N,Finset.mem_range.mpr (by omega),by rwa [Nat.add_sub_of_le nle]⟩
  have ub : (∑ x ∈ S, x) ≤ ∑ i ∈ Finset.range K, f (N+i) := calc
    _ ≤ ∑ x ∈ (Finset.range K).image (fun i => f (N+i)), x :=
      Finset.sum_le_sum_of_subset_of_nonneg sub (fun v _ _ => Nat.zero_le v)
    _ ≤ _ := Finset.sum_image_le_of_nonneg (fun v _ => Nat.zero_le v)
  have gap := prefix_gap hd N (hN N (le_refl _)) K
  omega

theorem floorRay_shift (a : ℝ) (e i : ℕ) :
    floorRay ((2:ℝ)^e*a) i = floorRay a (i+e) := by
  simp [floorRay,pow_add,mul_assoc]

theorem not_strongComplete_power_ratio {a b : ℝ} (ha : 0 < a) (hb : 0 < b)
    (z : ℤ) (hz : a/b = (2:ℝ)^z) :
    ¬ StrongCompleteValues (PositiveRayUnion (floorRay a) (floorRay b)) := by
  intro sc
  cases z with
  | ofNat e =>
    have he : a = (2:ℝ)^e*b := (div_eq_iff hb.ne').mp (by simpa using hz)
    apply not_strongComplete_single_ray hb
    apply StrongCompleteValues.mono _ sc
    rintro x ⟨_,⟨i,hi⟩ | h⟩
    · exact ⟨i+e,by rwa [he,floorRay_shift] at hi⟩
    · exact h
  | negSucc e =>
    have hpow : (2:ℝ)^(e+1) ≠ 0 := by positivity
    have h := (div_eq_iff hb.ne').mp hz
    rw [zpow_negSucc] at h
    have he : b = (2:ℝ)^(e+1)*a := by rw [h]; field_simp
    apply not_strongComplete_single_ray ha
    apply StrongCompleteValues.mono _ sc
    rintro x ⟨_,h | ⟨i,hi⟩⟩
    · exact h
    · exact ⟨i+(e+1),by rwa [he,floorRay_shift] at hi⟩

end HegyvariFloorDoubling
