import Conjectures.MaTangCoreGenerator

/-!
# Ma–Tang's random subset-sum threshold conjecture

An exact integer substitute for the exponential occupancy estimate.
For m=2^r and k=2*m*(4*r+16)+1 the bad occupancy fraction is at most
1/(16*m). The number of free bits r differs from log2 d only by the
logarithm of the linear factor in r, where d=k-r.
-/

namespace MaTangCoreDecay

open MaTangCoreOccupancy MaTangCoreGenerator

theorem gap_step (a n : Nat) :
    (a+2*(n+1))*a ≤ (a+2*n)*(a+2) := by
  simp [Nat.mul_add,Nat.add_mul,Nat.mul_comm,Nat.mul_left_comm]
  omega

/-- The first two terms of the binomial expansion, in an exact
integer form sufficient for the occupancy decay. -/
theorem gap_power (a n : Nat) :
    (a+2*n)*a^n ≤ (a+2)^(n+1) := by
  induction n with
  | zero => simp
  | succ n ih =>
    calc
      (a+2*(n+1))*a^(n+1)
          = ((a+2*(n+1))*a)*a^n := by
              rw [Nat.pow_succ]
              simp [Nat.mul_assoc,Nat.mul_comm,Nat.mul_left_comm]
      _ ≤ ((a+2*n)*(a+2))*a^n := Nat.mul_le_mul_right _ (gap_step a n)
      _ = ((a+2*n)*a^n)*(a+2) := by
            simp [Nat.mul_comm,Nat.mul_left_comm]
      _ ≤ (a+2)^(n+1)*(a+2) := Nat.mul_le_mul_right _ ih
      _ = (a+2)^(n+2) := (Nat.pow_succ (a+2) (n+1)).symm

/-- A block of 2m independent letters reduces the miss factor by at
least one half, without approximating the exponential. -/
theorem half_block (m : Nat) (hm : 0 < m) :
    2*(3*m-2)^(2*m) ≤ (3*m)^(2*m) := by
  let a := 3*m-2
  let n := 2*m-1
  have hna : n+1 = 2*m := by dsimp [n]; omega
  have haa : a+2 = 3*m := by dsimp [a]; omega
  have hstep : 2*a ≤ a+2*n := by dsimp [a,n]; omega
  change 2*a^(2*m) ≤ (3*m)^(2*m)
  rw [← hna,← haa,Nat.pow_succ a n]
  calc
    2*(a^n*a) = (2*a)*a^n := by
      simp [Nat.mul_assoc,Nat.mul_comm]
    _ ≤ (a+2*n)*a^n := Nat.mul_le_mul_right _ hstep
    _ ≤ (a+2)^(n+1) := gap_power a n

theorem block_decay (m q : Nat) (hm : 0 < m) :
    2^q*(3*m-2)^(2*m*q) ≤ (3*m)^(2*m*q) := by
  have h := Nat.pow_le_pow_left (half_block m hm) q
  rw [Nat.mul_pow,← Nat.pow_mul,← Nat.pow_mul] at h
  exact h

def labelCount (r : Nat) : Nat := 2^r
def blockCount (r : Nat) : Nat := 4*r+16
def sampleCount (r : Nat) : Nat := 2*labelCount r*blockCount r+1
def targetDimension (r : Nat) : Nat := sampleCount r-r

theorem r_succ_le_pow (r : Nat) : r+1 ≤ 2^r := by
  induction r with
  | zero => decide
  | succ r ih =>
    rw [Nat.pow_succ]
    omega

theorem labelCount_pos (r : Nat) : 0 < labelCount r := Nat.two_pow_pos r

theorem blockCount_bound (r : Nat) : blockCount r ≤ 16*labelCount r := by
  have h := r_succ_le_pow r
  unfold blockCount labelCount
  omega

theorem sampleCount_bound (r : Nat) :
    sampleCount r ≤ 33*(labelCount r)^2 := by
  let m := labelCount r
  have hm : 0 < m := labelCount_pos r
  have h := Nat.mul_le_mul_left (2*m) (blockCount_bound r)
  change 2*m*blockCount r ≤ 2*m*(16*m) at h
  have he : 2*m*(16*m) = 32*m^2 := by
    rw [Nat.pow_succ,Nat.pow_one]
    simp [Nat.mul_assoc,Nat.mul_comm,Nat.mul_left_comm]
  rw [he] at h
  have hm2 : 0 < m^2 := Nat.pow_pos hm
  change 2*m*blockCount r+1 ≤ 33*m^2
  omega

theorem sampleCount_pos (r : Nat) : 0 < sampleCount r := by
  unfold sampleCount
  omega

theorem sampleCount_dimension (r : Nat) :
    sampleCount r = targetDimension r+r := by
  have h := r_succ_le_pow r
  have hm : r ≤ labelCount r := by unfold labelCount; omega
  have hq : 0 < blockCount r := by unfold blockCount; omega
  have hk : labelCount r ≤ sampleCount r := by
    have hh := Nat.mul_le_mul (show 1 ≤ 2 by decide) (Nat.le_refl (labelCount r))
    have hh' := Nat.mul_le_mul hh (show 1 ≤ blockCount r by omega)
    simp only [Nat.one_mul,Nat.mul_one] at hh'
    unfold sampleCount
    omega
  unfold targetDimension
  omega

theorem pow_blockCount (r : Nat) :
    2^(blockCount r) = 65536*(labelCount r)^4 := by
  unfold blockCount labelCount
  rw [Nat.pow_add,Nat.pow_mul]
  have he : (2^4)^r = (2^r)^4 := by rw [← Nat.pow_mul,← Nat.pow_mul,Nat.mul_comm 4 r]
  rw [he]
  rw [Nat.mul_comm]

theorem occupancy_prefactor (r : Nat) :
    32*(labelCount r-1)*sampleCount r ≤ 3*2^(blockCount r) := by
  let m := labelCount r
  have hm : 0 < m := labelCount_pos r
  have hk : sampleCount r ≤ 33*m^2 := sampleCount_bound r
  have hsub : m-1 ≤ m := Nat.sub_le _ _
  calc
    32*(m-1)*sampleCount r ≤ 32*m*(33*m^2) :=
      Nat.mul_le_mul (Nat.mul_le_mul_left _ hsub) hk
    _ = 1056*m^3 := by
      rw [Nat.pow_succ m 2]
      simp [Nat.mul_assoc,Nat.mul_comm,Nat.mul_left_comm]
    _ ≤ 196608*m^4 :=
      Nat.mul_le_mul (by decide) (Nat.pow_le_pow_right hm (by decide))
    _ = 3*2^(blockCount r) := by
      rw [pow_blockCount,← Nat.mul_assoc]

/-- At the explicitly chosen sample size, the probability of any
singleton occupied nonzero type is at most 1/(16*2^r), expressed as
an exact comparison of natural-number counts. -/
theorem occupancy_scaled_decay (r : Nat) :
    16*labelCount r *
      tally (fun w => (nonzeroTypes (labelCount r)).any
        (fun d => MaTangCoreIndexed.countType w d == 1))
        (words (alphabet (labelCount r)) (sampleCount r)) ≤
      (words (alphabet (labelCount r)) (sampleCount r)).length := by
  let m := labelCount r
  let q := blockCount r
  let k := sampleCount r
  have hm : 0 < m := labelCount_pos r
  have hk : k-1 = 2*m*q := by dsimp [k,sampleCount,m,q]
  have hk' : 2*m*q+1 = k := rfl
  have hbound := Nat.mul_le_mul_left (16*m) (singleton_union_word_count_le m k)
  change 16*m * tally (fun w => (nonzeroTypes m).any
    (fun d => MaTangCoreIndexed.countType w d == 1)) (words (alphabet m) k) ≤ _
  rw [total_word_count]
  apply Nat.le_trans hbound
  have hp := Nat.mul_le_mul_left m (occupancy_prefactor r)
  change m*(32*(m-1)*k) ≤ m*(3*2^q) at hp
  have hdec := block_decay m q hm
  rw [hk]
  calc
    16*m*((m-1)*k*2*(3*m-2)^(2*m*q))
        = (m*(32*(m-1)*k))*(3*m-2)^(2*m*q) := by
            change 16*m*((m-1)*k*2*(3*m-2)^(2*m*q)) =
              (m*((16*2)*(m-1)*k))*(3*m-2)^(2*m*q)
            ac_rfl
    _ ≤ (m*(3*2^q))*(3*m-2)^(2*m*q) := Nat.mul_le_mul_right _ hp
    _ = (3*m)*(2^q*(3*m-2)^(2*m*q)) := by
          simp [Nat.mul_assoc,Nat.mul_comm,Nat.mul_left_comm]
    _ ≤ (3*m)*(3*m)^(2*m*q) := Nat.mul_le_mul_left _ hdec
    _ = (3*m)^k := by
          rw [← hk',Nat.pow_succ,Nat.mul_comm]


theorem targetDimension_lower (r : Nat) :
    labelCount r ≤ targetDimension r := by
  let m := labelCount r
  have hm : r ≤ m := by
    have h := r_succ_le_pow r
    unfold m labelCount
    omega
  have hq : 1 ≤ blockCount r := by unfold blockCount; omega
  have he := Nat.mul_le_mul_left (2*m) hq
  simp only [Nat.mul_one] at he
  change m ≤ 2*m*blockCount r+1-r
  omega

theorem targetDimension_upper (r : Nat) :
    targetDimension r ≤ (8*r+33)*labelCount r := by
  let m := labelCount r
  have hm : 0 < m := labelCount_pos r
  have h : sampleCount r = (8*r+32)*m+1 := by
    change 2*m*(4*r+16)+1 = (8*r+32)*m+1
    simp [Nat.mul_add,Nat.mul_assoc,Nat.mul_comm,Nat.mul_left_comm]
  have hh : (8*r+33)*m = (8*r+32)*m+m := by
    change ((8*r+32)+1)*m = _
    rw [Nat.add_mul,Nat.one_mul]
  unfold targetDimension
  rw [h,hh]
  omega

/-- Along r=2^j, d lies between 2^r and 2^(r+j+6). This is an
exact integer form of log2 d = r + O(log r) for the chosen sample sizes. -/
theorem targetDimension_dyadic (j : Nat) :
    2^(2^j) ≤ targetDimension (2^j) ∧
      targetDimension (2^j) ≤ 2^(2^j+j+6) := by
  let r := 2^j
  have hr : 0 < r := Nat.two_pow_pos j
  refine ⟨targetDimension_lower r,?_⟩
  have h := targetDimension_upper r
  have hcoef : 8*r+33 ≤ 64*r := by omega
  calc
    targetDimension r ≤ (8*r+33)*labelCount r := h
    _ ≤ (64*r)*labelCount r := Nat.mul_le_mul_right _ hcoef
    _ = 2^(r+j+6) := by
      change (2^6*2^j)*2^r = _
      rw [← Nat.pow_add,← Nat.pow_add]
      congr 1
      omega

theorem square_step (n : Nat) (hn : 4 ≤ n) :
    (n+1)*(n+1) ≤ 2*(n*n) := by
  have h := Nat.mul_le_mul_right n hn
  rw [Nat.add_mul,Nat.mul_add,Nat.one_mul,Nat.mul_one]
  omega

theorem square_le_pow_two (n : Nat) (hn : 4 ≤ n) :
    n*n ≤ 2^n := by
  induction n with
  | zero => omega
  | succ n ih =>
    by_cases h : n = 3
    · subst n
      decide
    · have h4 : 4 ≤ n := by omega
      calc
        (n+1)*(n+1) ≤ 2*(n*n) := square_step n h4
        _ ≤ 2*2^n := Nat.mul_le_mul_left _ (ih h4)
        _ = 2^(n+1) := by rw [Nat.pow_succ,Nat.mul_comm]

/-- The additive logarithmic error is negligible against r=2^j:
for every fixed integer factor C, eventually C(j+6) ≤ 2^j. -/
theorem dyadic_error_small (C j : Nat) (hj : C+6 ≤ j) :
    C*(j+6) ≤ 2^j := by
  have h4 : 4 ≤ j := by omega
  have hc : C ≤ j := by omega
  calc
    C*(j+6) = C*j+C*6 := Nat.mul_add _ _ _
    _ ≤ C*j+j*6 := Nat.add_le_add_left (Nat.mul_le_mul_right _ hc) _
    _ = (C+6)*j := by rw [Nat.add_mul,Nat.mul_comm 6 j]
    _ ≤ j*j := Nat.mul_le_mul_right _ hj
    _ ≤ 2^j := square_le_pow_two j h4

end MaTangCoreDecay
