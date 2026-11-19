import Mathlib.Data.Int.GCD
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Algebra.BigOperators.ModEq
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Mathlib.Tactic.NormNum

/-! A finite algebraic period argument for the three-difference problem.
Weighted sums of the closed square equations give the only compatibility
relation needed by the three pair cycles. No extension to an infinite lattice
or topological path-independence theorem is assumed. -/

namespace Haralambis

def prefixSum (f : ℕ → ℤ) (n : ℕ) : ℤ := ∑ t ∈ Finset.range n, f t

def weightedSum (f : ℕ → ℤ) (n : ℕ) : ℤ :=
  ∑ t ∈ Finset.range n, ((n : ℤ)-t)*f t

theorem prefixSum_add (f : ℕ → ℤ) (a b : ℕ) :
    prefixSum f (a+b) = prefixSum f a + prefixSum (fun t => f (a+t)) b := by
  exact Finset.sum_range_add f a b

theorem weightedSum_sub (f g : ℕ → ℤ) (n : ℕ) :
    weightedSum (fun t => f t-g t) n = weightedSum f n-weightedSum g n := by
  simp only [weightedSum, mul_sub, Finset.sum_sub_distrib]

theorem weightedSum_add (f : ℕ → ℤ) (a b : ℕ) :
    weightedSum f (a+b) = weightedSum f a + (b : ℤ)*prefixSum f a +
      weightedSum (fun t => f (a+t)) b := by
  unfold weightedSum prefixSum
  rw [Finset.sum_range_add]
  simp only [Nat.cast_add]
  rw [Finset.mul_sum, ← Finset.sum_add_distrib]
  congr 1
  · apply Finset.sum_congr rfl
    intro t ht
    ring
  · apply Finset.sum_congr rfl
    intro t ht
    ring

theorem weighted_rectangle (f : ℕ → ℤ) (a b : ℕ) :
    weightedSum (fun t => f (b+t)-f t) a +
      weightedSum (fun t => f t-f (a+t)) b =
        (b : ℤ)*prefixSum f a-(a : ℤ)*prefixSum f b := by
  rw [weightedSum_sub,weightedSum_sub]
  have hab := weightedSum_add f a b
  have hba := weightedSum_add f b a
  rw [Nat.add_comm b a] at hba
  linarith

def periodMinor (d : Fin 3 → ℕ) (F : Fin 3 → ℕ → ℤ) (i j : Fin 3) : ℤ :=
  prefixSum (F i) (d j)-prefixSum (F j) (d i)

theorem periodMinor_self (d : Fin 3 → ℕ) (F : Fin 3 → ℕ → ℤ) (i : Fin 3) :
    periodMinor d F i i = 0 := by simp [periodMinor]

theorem periodMinor_swap (d : Fin 3 → ℕ) (F : Fin 3 → ℕ → ℤ) (i j : Fin 3) :
    periodMinor d F i j = -periodMinor d F j i := by unfold periodMinor; ring

/-- A weighted finite Stokes identity. The three summands use only faces
inside the original window of length `d 0+d 1+d 2`. -/
theorem weighted_face_identity (d : Fin 3 → ℕ) (F : Fin 3 → ℕ → ℤ) :
    weightedSum (fun t => F 0 t+F 1 (t+d 0)-F 1 t-F 0 (t+d 1)) (d 2) +
      weightedSum (fun t => F 1 t+F 2 (t+d 1)-F 2 t-F 1 (t+d 2)) (d 0) +
      weightedSum (fun t => F 2 t+F 0 (t+d 2)-F 0 t-F 2 (t+d 0)) (d 1) =
        (d 2 : ℤ)*periodMinor d F 0 1 - (d 1 : ℤ)*periodMinor d F 0 2 +
          (d 0 : ℤ)*periodMinor d F 1 2 := by
  have h0 := weighted_rectangle (F 0) (d 1) (d 2)
  have h1 := weighted_rectangle (F 1) (d 2) (d 0)
  have h2 := weighted_rectangle (F 2) (d 0) (d 1)
  simp only [weightedSum, mul_add, mul_sub, Finset.sum_add_distrib,
    Finset.sum_sub_distrib, Nat.add_comm] at h0 h1 h2 ⊢
  dsimp [periodMinor]
  linarith

theorem period_relation_of_closed (d : Fin 3 → ℕ) (F : Fin 3 → ℕ → ℤ)
    (h01 : ∀ t, t < d 2 → F 0 t+F 1 (t+d 0) = F 1 t+F 0 (t+d 1))
    (h12 : ∀ t, t < d 0 → F 1 t+F 2 (t+d 1) = F 2 t+F 1 (t+d 2))
    (h20 : ∀ t, t < d 1 → F 2 t+F 0 (t+d 2) = F 0 t+F 2 (t+d 0)) :
    (d 2 : ℤ)*periodMinor d F 0 1 - (d 1 : ℤ)*periodMinor d F 0 2 +
      (d 0 : ℤ)*periodMinor d F 1 2 = 0 := by
  have hz01 : weightedSum
      (fun t => F 0 t+F 1 (t+d 0)-F 1 t-F 0 (t+d 1)) (d 2) = 0 := by
    apply Finset.sum_eq_zero
    intro t ht
    have hh := h01 t (Finset.mem_range.mp ht)
    have he : F 0 t+F 1 (t+d 0)-F 1 t-F 0 (t+d 1) = 0 := by omega
    simp only [he,mul_zero]
  have hz12 : weightedSum
      (fun t => F 1 t+F 2 (t+d 1)-F 2 t-F 1 (t+d 2)) (d 0) = 0 := by
    apply Finset.sum_eq_zero
    intro t ht
    have hh := h12 t (Finset.mem_range.mp ht)
    have he : F 1 t+F 2 (t+d 1)-F 2 t-F 1 (t+d 2) = 0 := by omega
    simp only [he,mul_zero]
  have hz20 : weightedSum
      (fun t => F 2 t+F 0 (t+d 2)-F 0 t-F 2 (t+d 0)) (d 1) = 0 := by
    apply Finset.sum_eq_zero
    intro t ht
    have hh := h20 t (Finset.mem_range.mp ht)
    have he : F 2 t+F 0 (t+d 2)-F 0 t-F 2 (t+d 0) = 0 := by omega
    simp only [he,mul_zero]
  have hh := weighted_face_identity d F
  rw [hz01,hz12,hz20] at hh
  omega

theorem prefixSum_sub (f g : ℕ → ℤ) (n : ℕ) :
    prefixSum (fun t => f t-g t) n = prefixSum f n-prefixSum g n := by
  simp only [prefixSum,Finset.sum_sub_distrib]

theorem prefixSum_one (n : ℕ) : prefixSum (fun _ => 1) n = (n : ℤ) := by
  simp [prefixSum]

theorem prefixSum_abs_mod_two (f : ℕ → ℤ) (n : ℕ) :
    prefixSum (fun t => |f t|) n % 2 = prefixSum f n % 2 := by
  calc
    _ = (∑ t ∈ Finset.range n, |f t| % 2) % 2 := Finset.sum_int_mod _ _ _
    _ = (∑ t ∈ Finset.range n, f t % 2) % 2 := by
      congr 1
      apply Finset.sum_congr rfl
      intro t ht
      by_cases h : 0 ≤ f t
      · rw [abs_of_nonneg h]
      · rw [abs_of_neg (by omega : f t < 0)]
        omega
    _ = _ := (Finset.sum_int_mod _ _ _).symm

/-- The two arcs of a pair cycle count each occupied site exactly twice. -/
theorem pair_defect_sum (occ : ℕ → ℤ) (a b : ℕ) :
    prefixSum (fun t => 1-occ t-occ (t+a)) b +
      prefixSum (fun t => 1-occ t-occ (t+b)) a =
        (a : ℤ)+b-2*prefixSum occ (a+b) := by
  have hab := prefixSum_add occ a b
  have hba := prefixSum_add occ b a
  simp only [Nat.add_comm] at hab hba ⊢
  simp only [prefixSum_sub,prefixSum_one]
  linarith

/-- The finite signed cycle has the prescribed defect bound and parity. -/
theorem pair_cycle_data (occ f g : ℕ → ℤ) (a b : ℕ)
    (hf : ∀ t, t < b → |f t| = 1-occ t-occ (t+a))
    (hg : ∀ t, t < a → |g t| = 1-occ t-occ (t+b)) :
    |prefixSum f b-prefixSum g a| ≤ (a : ℤ)+b-2*prefixSum occ (a+b) ∧
      (prefixSum f b-prefixSum g a) % 2 = ((a : ℤ)+b) % 2 := by
  have hfa : prefixSum (fun t => |f t|) b =
      prefixSum (fun t => 1-occ t-occ (t+a)) b := by
    apply Finset.sum_congr rfl
    intro t ht
    exact hf t (Finset.mem_range.mp ht)
  have hga : prefixSum (fun t => |g t|) a =
      prefixSum (fun t => 1-occ t-occ (t+b)) a := by
    apply Finset.sum_congr rfl
    intro t ht
    exact hg t (Finset.mem_range.mp ht)
  have hsum : prefixSum (fun t => |f t|) b + prefixSum (fun t => |g t|) a =
      (a : ℤ)+b-2*prefixSum occ (a+b) := by
    rw [hfa,hga,pair_defect_sum]
  constructor
  · calc
      |prefixSum f b-prefixSum g a| ≤ |prefixSum f b|+|prefixSum g a| := by
        simpa only [sub_eq_add_neg,abs_neg] using abs_add_le (prefixSum f b) (-prefixSum g a)
      _ ≤ prefixSum (fun t => |f t|) b+prefixSum (fun t => |g t|) a :=
        add_le_add (Finset.abs_sum_le_sum_abs f _) (Finset.abs_sum_le_sum_abs g _)
      _ = _ := hsum
  · have hfm := prefixSum_abs_mod_two f b
    have hgm := prefixSum_abs_mod_two g a
    omega

theorem pair_lt_total (d : Fin 3 → ℕ) (hd : ∀ i, 0 < d i)
    (i j : Fin 3) (hij : i ≠ j) : d i+d j < d 0+d 1+d 2 := by
  have h0 := hd 0
  have h1 := hd 1
  have h2 := hd 2
  have htwo (h : 2 < 3) : (⟨2,h⟩ : Fin 3) = 2 := rfl
  fin_cases i <;> fin_cases j <;> norm_num at hij <;>
    simp only [Fin.mk_zero,Fin.mk_one,htwo] <;> omega

theorem periodMinor_data (d : Fin 3 → ℕ) (hd : ∀ i, 0 < d i)
    (occ : ℕ → ℤ) (F : Fin 3 → ℕ → ℤ)
    (hF : ∀ i t, t+d i < d 0+d 1+d 2 → |F i t| = 1-occ t-occ (t+d i))
    (i j : Fin 3) (hij : i ≠ j) :
    |periodMinor d F i j| ≤ (d i : ℤ)+d j-2*prefixSum occ (d i+d j) ∧
      periodMinor d F i j % 2 = ((d i : ℤ)+d j) % 2 := by
  have hp := pair_lt_total d hd i j hij
  apply pair_cycle_data occ (F i) (F j) (d i) (d j)
  · intro t ht
    exact hF i t (by omega)
  · intro t ht
    exact hF j t (by omega)

theorem bezout_three (d : Fin 3 → ℕ)
    (hprim : Nat.gcd (Nat.gcd (d 0) (d 1)) (d 2) = 1) :
    ∃ c : Fin 3 → ℤ, ∑ i, c i*(d i : ℤ) = 1 := by
  let u := Nat.gcdA (Nat.gcd (d 0) (d 1)) (d 2)
  let v := Nat.gcdB (Nat.gcd (d 0) (d 1)) (d 2)
  have hh := Nat.gcd_eq_gcd_ab (Nat.gcd (d 0) (d 1)) (d 2)
  rw [hprim,Nat.cast_one,Nat.gcd_eq_gcd_ab] at hh
  refine ⟨![Nat.gcdA (d 0) (d 1)*u,Nat.gcdB (d 0) (d 1)*u,v],?_⟩
  simp only [Fin.sum_univ_three,Matrix.cons_val_zero,Matrix.cons_val_one,Matrix.cons_val_two,
    Matrix.tail_cons,Matrix.head_cons]
  dsimp [u,v]
  nlinarith only [hh]

theorem minor_compatibility (d : Fin 3 → ℕ) (F : Fin 3 → ℕ → ℤ)
    (hrel : (d 2 : ℤ)*periodMinor d F 0 1 - (d 1 : ℤ)*periodMinor d F 0 2 +
      (d 0 : ℤ)*periodMinor d F 1 2 = 0) (i j k : Fin 3) :
    (d j : ℤ)*periodMinor d F i k-(d i : ℤ)*periodMinor d F j k =
      (d k : ℤ)*periodMinor d F i j := by
  fin_cases i <;> fin_cases j <;> fin_cases k <;>
    dsimp [periodMinor] at * <;> nlinarith only [hrel]

/-- The primitive height vector splits integrally. The parity correction
uses its Bezout coefficients and produces three odd integers simultaneously. -/
theorem odd_vector_of_minors (d : Fin 3 → ℕ) (F : Fin 3 → ℕ → ℤ)
    (hprim : Nat.gcd (Nat.gcd (d 0) (d 1)) (d 2) = 1)
    (hrel : (d 2 : ℤ)*periodMinor d F 0 1 - (d 1 : ℤ)*periodMinor d F 0 2 +
      (d 0 : ℤ)*periodMinor d F 1 2 = 0)
    (hpar : ∀ i j, periodMinor d F i j % 2 = ((d i : ℤ)+d j) % 2) :
    ∃ w : Fin 3 → ℤ, (∀ i, w i % 2 = 1) ∧
      ∀ i j, (d j : ℤ)*w i-(d i : ℤ)*w j = periodMinor d F i j := by
  obtain ⟨c,hc⟩ := bezout_three d hprim
  let S : ℤ := ∑ j, c j
  let w : Fin 3 → ℤ := fun i => (∑ j, c j*periodMinor d F i j)+(d i : ℤ)*S
  refine ⟨w,?_,?_⟩
  · intro i
    have hm : Int.ModEq 2 (∑ j, c j*periodMinor d F i j)
        (∑ j, c j*((d i : ℤ)+d j)) := by
      apply Int.ModEq.sum
      intro j hj
      exact (show Int.ModEq 2 (periodMinor d F i j) ((d i : ℤ)+d j) from hpar i j).mul_left (c j)
    have he : (∑ j, c j*((d i : ℤ)+d j))+(d i : ℤ)*S = 1+2*((d i : ℤ)*S) := by
      simp only [mul_add,Finset.sum_add_distrib]
      rw [← Finset.sum_mul,hc]
      dsimp [S]
      ring
    have hm' := hm.add_right ((d i : ℤ)*S)
    rw [he] at hm'
    change w i % 2 = (1+2*((d i : ℤ)*S)) % 2 at hm'
    omega
  · intro i j
    have hrewrite : (∑ k, c k*((d j : ℤ)*periodMinor d F i k-
        (d i : ℤ)*periodMinor d F j k)) =
        (d j : ℤ)*(∑ k, c k*periodMinor d F i k)-
          (d i : ℤ)*(∑ k, c k*periodMinor d F j k) := by
      simp only [mul_sub,Finset.sum_sub_distrib,Finset.mul_sum]
      congr 1
      · apply Finset.sum_congr rfl
        intro k hk
        ring
      · apply Finset.sum_congr rfl
        intro k hk
        ring
    calc
      (d j : ℤ)*w i-(d i : ℤ)*w j =
          ∑ k, c k*((d j : ℤ)*periodMinor d F i k-(d i : ℤ)*periodMinor d F j k) := by
        rw [hrewrite]
        dsimp [w]
        ring
      _ = ∑ k, c k*((d k : ℤ)*periodMinor d F i j) := by
        apply Finset.sum_congr rfl
        intro k hk
        rw [minor_compatibility d F hrel i j k]
      _ = (∑ k, c k*(d k : ℤ))*periodMinor d F i j := by
        rw [Finset.sum_mul]
        apply Finset.sum_congr rfl
        intro k hk
        ring
      _ = periodMinor d F i j := by rw [hc,one_mul]

/-- The complete finite odd-period certificate. Every hypothesis refers
only to the finite window, and its three determinant bounds hold together. -/
theorem odd_period_certificate (d : Fin 3 → ℕ) (hd : ∀ i, 0 < d i)
    (hprim : Nat.gcd (Nat.gcd (d 0) (d 1)) (d 2) = 1)
    (occ : ℕ → ℤ) (F : Fin 3 → ℕ → ℤ)
    (hF : ∀ i t, t+d i < d 0+d 1+d 2 → |F i t| = 1-occ t-occ (t+d i))
    (h01 : ∀ t, t < d 2 → F 0 t+F 1 (t+d 0) = F 1 t+F 0 (t+d 1))
    (h12 : ∀ t, t < d 0 → F 1 t+F 2 (t+d 1) = F 2 t+F 1 (t+d 2))
    (h20 : ∀ t, t < d 1 → F 2 t+F 0 (t+d 2) = F 0 t+F 2 (t+d 0)) :
    ∃ w : Fin 3 → ℤ, (∀ i, w i % 2 = 1) ∧
      ∀ i j, i ≠ j → |(d j : ℤ)*w i-(d i : ℤ)*w j| ≤
        (d i : ℤ)+d j-2*prefixSum occ (d i+d j) := by
  have hrel := period_relation_of_closed d F h01 h12 h20
  have hpar : ∀ i j, periodMinor d F i j % 2 = ((d i : ℤ)+d j) % 2 := by
    intro i j
    by_cases hij : i=j
    · subst j
      rw [periodMinor_self]
      omega
    · exact (periodMinor_data d hd occ F hF i j hij).2
  obtain ⟨w,hw,hperiod⟩ := odd_vector_of_minors d F hprim hrel hpar
  refine ⟨w,hw,?_⟩
  intro i j hij
  rw [hperiod]
  exact (periodMinor_data d hd occ F hF i j hij).1

end Haralambis
