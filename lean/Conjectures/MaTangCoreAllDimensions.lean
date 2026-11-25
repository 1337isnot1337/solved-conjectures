import Conjectures.MaTangCoreUniformSubset

/-!
# Ma–Tang's random subset-sum threshold conjecture
The finite lower estimate for arbitrary mixed-group dimensions, rather
than just the single sample size chosen for each kernel dimension.
-/
namespace MaTangCoreAllDimensions

open MaTangCoreMatrix MaTangCoreIndexed MaTangCoreOccupancy MaTangCoreSubspace
open MaTangCoreRank MaTangCoreGenerator MaTangCoreQuotient MaTangCoreLinear
open MaTangCoreEncoding MaTangCoreFactor MaTangCoreMultiplicity MaTangCoreCoupling
open MaTangCoreDecay MaTangCoreLowerBound MaTangCoreBirthday MaTangCoreTranspose
open MaTangCoreDistinct MaTangCoreSetCoverage MaTangCoreUniformSubset

def envelope (m k : Nat) : Nat := (m-1)*k*2*(3*m-2)^(k-1)

theorem envelope_at_start (r : Nat) :
    16*labelCount r*envelope (labelCount r) (sampleCount r) ≤
      (3*labelCount r)^sampleCount r := by
  let m := labelCount r
  let q := blockCount r
  let k := sampleCount r
  have hm : 0 < m := labelCount_pos r
  have hk : k-1 = 2*m*q := by dsimp [k,sampleCount,m,q]
  have hk' : 2*m*q+1 = k := rfl
  change 16*m*((m-1)*k*2*(3*m-2)^(k-1)) ≤ (3*m)^k
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



theorem envelope_succ (m k : Nat) (hm : 0 < m) (hk : 0 < k)
    (hlarge : 3*m ≤ 2*(k+1)) :
    k*envelope m (k+1) ≤ (3*m*k)*envelope m k := by
  have hs : k = (k-1)+1 := by omega
  have hz : 3*m-2+2 = 3*m := by omega
  have hA : 3*m-2 ≤ k*2 := by omega
  have hmul : (k+1)*(3*m-2) ≤ 3*m*k := by
    calc
      (k+1)*(3*m-2) = k*(3*m-2)+(3*m-2) := by simp [Nat.add_mul]
      _ ≤ k*(3*m-2)+k*2 := Nat.add_le_add_left hA _
      _ = 3*m*k := by rw [← Nat.mul_add, hz, Nat.mul_comm k]
  calc
    k*envelope m (k+1) = ((k+1)*(3*m-2))*envelope m k := by
      unfold envelope
      rw [Nat.add_sub_cancel]
      conv => lhs; rw [show (3*m-2)^k = (3*m-2)^(k-1)*(3*m-2) by
        conv => lhs; rw [hs]
        exact Nat.pow_succ ..]
      ac_rfl
    _ ≤ 3*m*k*envelope m k := Nat.mul_le_mul_right _ hmul

theorem start_large (r : Nat) : 3*labelCount r ≤ 2*(sampleCount r+1) := by
  have hq : 1 ≤ blockCount r := by unfold blockCount; omega
  have hp : 2*labelCount r ≤ 2*labelCount r*blockCount r := by
    simpa using Nat.mul_le_mul_left (2*labelCount r) hq
  unfold sampleCount
  omega

theorem envelope_all (r k : Nat) (hstart : sampleCount r ≤ k) :
    16*labelCount r*envelope (labelCount r) k ≤ (3*labelCount r)^k := by
  induction k with
  | zero =>
    have h := sampleCount_pos r
    omega
  | succ k ih =>
    by_cases he : k+1 = sampleCount r
    · change 16*labelCount r*envelope (labelCount r) (k+1) ≤ (3*labelCount r)^(k+1)
      rw [he]
      exact envelope_at_start r
    have hkStart : sampleCount r ≤ k := by omega
    have hi := ih hkStart
    let m := labelCount r
    have hk : 0 < k := Nat.lt_of_lt_of_le (sampleCount_pos r) hkStart
    have ha : 3*m ≤ 2*(k+1) := by
      have h := start_large r
      dsimp [m] at *
      omega
    have hm : 0 < m := labelCount_pos r
    apply Nat.le_of_mul_le_mul_left _ hk
    calc
      k*(16*m*envelope m (k+1)) = (16*m)*(k*envelope m (k+1)) := by ac_rfl
      _ ≤ (16*m)*(3*m*k*envelope m k) := Nat.mul_le_mul_left _ (envelope_succ m k hm hk ha)
      _ = (3*m*k)*(16*m*envelope m k) := by ac_rfl
      _ ≤ (3*m*k)*(3*m)^k := Nat.mul_le_mul_left _ hi
      _ = k*(3*m)^(k+1) := by rw [Nat.pow_succ]; ac_rfl

theorem occupancy_all (r k : Nat) (hstart : sampleCount r ≤ k) :
    16*2^r*tally (singletonEvent r) (words (alphabet (2^r)) k) ≤
      (words (alphabet (2^r)) k).length := by
  rw [total_word_count]
  exact Nat.le_trans (Nat.mul_le_mul_left _ (singleton_union_word_count_le _ _))
    (envelope_all r k hstart)

theorem birthday_all (d r k : Nat) (hd : 16 ≤ d) (hrd : r ≤ d)
    (hk : k = d+r) : 2*k*k ≤ (alphabet (2^d)).length := by
  have h : k ≤ 2*d := by omega
  have hc := Nat.mul_le_mul (Nat.mul_le_mul_left 2 h) h
  have he : 2*(2*d)*(2*d) = 8*d*d := by
    change 2*(2*d)*(2*d) = (2*2*2)*d*d
    ac_rfl
  rw [alphabet_length]
  calc
    2*k*k ≤ 2*(2*d)*(2*d) := hc
    _ = 8*d*d := he
    _ ≤ 2^d := eight_square_le_pow d hd
    _ ≤ 3*2^d := by omega

theorem iid_all (d r k : Nat) (hd : 0 < d) (hr : 0 < r)
    (hk : k = d+r) (hstart : sampleCount r ≤ k) :
    8*2^r*(coveredSamples d k).length ≤ (allSamples d k).length := by
  let g := (generatorSamples r k).length
  let b := (singletonGenerators r k).length
  let t := (words (alphabet (2^r)) k).length
  let c := (coveredSamples d k).length
  let a := (quotientSamples d k).length
  have hh : t ≤ 2*g := generatorSamples_half d r k hd hr hk
  have hs : 16*2^r*b ≤ t := by
    have he := occupancy_all r k hstart
    change 16*2^r*tally (singletonEvent r) (words (alphabet (2^r)) k) ≤ t at he
    exact Nat.le_trans (Nat.mul_le_mul_left _ (singletonGenerators_le r k)) he
  have hb : 8*2^r*b ≤ g := by
    have e : 16*2^r*b ≤ 2*g := Nat.le_trans hs hh
    have ee : 2*(8*2^r*b) ≤ 2*g := by
      calc
        2*(8*2^r*b) = 16*2^r*b := by
          change 2*(8*2^r*b) = (2*8)*2^r*b
          ac_rfl
        _ ≤ 2*g := e
    omega
  have hg : 0 < g := by
    have ht : 0 < t := by
      dsimp [t]
      rw [total_word_count]
      exact Nat.pow_pos (Nat.mul_pos (by decide) (Nat.two_pow_pos r))
    omega
  have htrans : c*g ≤ b*a := covered_transfer d r k hk
  have he : (8*2^r*c)*g ≤ a*g := by
    calc
      (8*2^r*c)*g = (8*2^r)*(c*g) := by ac_rfl
      _ ≤ (8*2^r)*(b*a) := Nat.mul_le_mul_left _ htrans
      _ = (8*2^r*b)*a := by ac_rfl
      _ ≤ g*a := Nat.mul_le_mul_right _ hb
      _ = a*g := by ac_rfl
  have hca : 8*2^r*c ≤ a := Nat.le_of_mul_le_mul_right he hg
  exact Nat.le_trans hca
    (nodup_subset_length _ _ (quotientSamples_nodup d k) (quotientSamples_subset d k))

theorem distinct_all (d r k : Nat) (hd : 16 ≤ d) (hr : 0 < r) (hrd : r ≤ d)
    (hk : k = d+r) (hstart : sampleCount r ≤ k) :
    4*2^r*(coveredDistinctWords d k).length ≤
      (distinctWords (alphabet (2^d)) k).length := by
  have hp : 0 < (alphabet (2^d)).length := by
    rw [alphabet_length]
    exact Nat.mul_pos (by decide) (Nat.two_pow_pos d)
  have hhalf := distinctWords_half (alphabet (2^d)) (alphabet_nodup _) k hp
    (birthday_all d r k hd hrd hk)
  have h := iid_all d r k (by omega) hr hk hstart
  rw [← coveredWords_card,← elementWords_card] at h
  change 8*2^r*(coveredWords d k).length ≤
    (words (alphabet (2^d)) k).length at h
  have he : 8*2^r*(coveredDistinctWords d k).length ≤
      2*(distinctWords (alphabet (2^d)) k).length :=
    Nat.le_trans (Nat.mul_le_mul_left _ (coveredDistinctWords_le d k)) (Nat.le_trans h hhalf)
  have hh : 2*(4*2^r*(coveredDistinctWords d k).length) ≤
      2*(distinctWords (alphabet (2^d)) k).length := by
    calc
      2*(4*2^r*(coveredDistinctWords d k).length)
          = 8*2^r*(coveredDistinctWords d k).length := by
        change 2*(4*2^r*(coveredDistinctWords d k).length) =
          (2*4)*2^r*(coveredDistinctWords d k).length
        ac_rfl
      _ ≤ _ := he
  exact Nat.le_of_mul_le_mul_left hh (by decide)

theorem uniform_subset_coverage_scaled_all (d r k : Nat) (hd : 16 ≤ d) (hr : 0 < r)
    (hrd : r ≤ d) (hk : k = d+r) (hstart : sampleCount r ≤ k) :
    4*2^r*(coveredSubsets d k).length ≤ (kSubsets (alphabet (2^d)) k).length := by
  have h := distinct_all d r k hd hr hrd hk hstart
  rw [ordered_covered_subset_count,ordered_subset_count _ _ (alphabet_nodup _)] at h
  have he : (4*2^r*(coveredSubsets d k).length)*falling k k ≤
      (kSubsets (alphabet (2^d)) k).length*falling k k := by
    rw [Nat.mul_assoc]
    exact h
  exact Nat.le_of_mul_le_mul_right he (falling_pos k k (Nat.le_refl k))

theorem mixed_uniform_subset_nonempty_all (d r k : Nat) (hd : 16 ≤ d) (hrd : r ≤ d)
    (hk : k = d+r) : 0 < (kSubsets (alphabet (2^d)) k).length := by
  let A := alphabet (2^d)
  have hA : 0 < A.length := by
    dsimp [A]
    rw [alphabet_length]
    exact Nat.mul_pos (by decide) (Nat.two_pow_pos _)
  have hhalf := distinctWords_half A (alphabet_nodup _) k hA (birthday_all d r k hd hrd hk)
  have hp : 0 < (words A k).length := by
    rw [words_length]
    exact Nat.pow_pos hA
  have hd : 0 < (distinctWords A k).length := by omega
  rw [ordered_subset_count A k (alphabet_nodup _)] at hd
  exact Nat.pos_of_mul_pos_right hd

/-- Strict failure of the one-half success threshold for actual
uniform subsets on every sufficiently large member of the sequence. -/
theorem uniform_subset_below_half_all (d r k : Nat) (hd : 16 ≤ d) (hr : 0 < r)
    (hrd : r ≤ d) (hk : k = d+r) (hstart : sampleCount r ≤ k) :
    2*(coveredSubsets d k).length < (kSubsets (alphabet (2^d)) k).length := by
  have he := uniform_subset_coverage_scaled_all d r k hd hr hrd hk hstart
  have hp := mixed_uniform_subset_nonempty_all d r k hd hrd hk
  let C := (coveredSubsets d k).length
  let T := (kSubsets (alphabet (2^d)) k).length
  have hh : 4*C ≤ T := by
    have h1 : 4 ≤ 4*2^r := by
      have h := Nat.two_pow_pos r
      omega
    exact Nat.le_trans (Nat.mul_le_mul_right C h1) he
  omega


theorem log_gap (L : Nat) (hL : 16 ≤ L) : L+1 < 2^(L-9) := by
  obtain ⟨n, hn⟩ := Nat.exists_eq_add_of_le hL
  subst L
  induction n with
  | zero => decide
  | succ n ih =>
    have he : 16+(n+1)-9 = (16+n-9)+1 := by omega
    change 16+(n+1)+1 < 2^(16+(n+1)-9)
    rw [he, Nat.pow_succ]
    omega

def dimensionParameter (d : Nat) : Nat := d.log2 - (d.log2+1).log2 - 6

theorem sampleCount_factor (r : Nat) :
    sampleCount r = 2^(r+3)*(r+4)+1 := by
  unfold sampleCount labelCount blockCount
  rw [Nat.pow_add]
  change 2*2^r*(4*r+16)+1 = (2^r*(2*4))*(r+4)+1
  rw [show 4*r+16 = 4*(r+4) by omega]
  ac_rfl

theorem dimensionParameter_bounds (d : Nat) (hd : 2^16 ≤ d) :
    4 ≤ dimensionParameter d ∧ dimensionParameter d ≤ d ∧
      sampleCount (dimensionParameter d) ≤ d := by
  let L := d.log2
  let u := (L+1).log2
  let r := dimensionParameter d
  have hdpos : d ≠ 0 := by omega
  have hL : 16 ≤ L := (Nat.le_log2 hdpos).mpr hd
  have hu : u < L-9 := (Nat.log2_lt (show L+1 ≠ 0 by omega)).mpr (log_gap L hL)
  have hrEq : r = L-u-6 := rfl
  have hr : 4 ≤ r := by omega
  have hrd : r ≤ d := by
    have h := Nat.log2_le_self d
    change L ≤ d at h
    omega
  refine ⟨hr, hrd, ?_⟩
  have huPow : L+1 < 2^(u+1) :=
    ((Nat.log2_eq_iff (show L+1 ≠ 0 by omega)).mp (show (L+1).log2=u from rfl)).2
  have hGap : r+4 < 2^(u+1) := by omega
  have hProd : 2^(r+3)*(r+4) < 2^(r+3)*2^(u+1) :=
    Nat.mul_lt_mul_of_pos_left hGap (Nat.two_pow_pos _)
  calc
    sampleCount r = 2^(r+3)*(r+4)+1 := sampleCount_factor r
    _ ≤ 2^(r+3)*2^(u+1) := hProd
    _ = 2^(L-2) := by
      rw [← Nat.pow_add, show r+3+(u+1)=L-2 by omega]
    _ ≤ 2^L := Nat.pow_le_pow_right (by decide) (by omega)
    _ ≤ d := (Nat.le_log2 hdpos).mp (Nat.le_refl L)

/-- Strict failure of the one-half threshold at the explicit sample
size for every sufficiently large mixed-group dimension. -/
theorem all_large_dimensions_below_half (d : Nat) (hd : 2^16 ≤ d) :
    2*(coveredSubsets d (d+dimensionParameter d)).length <
      (kSubsets (alphabet (2^d)) (d+dimensionParameter d)).length := by
  obtain ⟨hr, hrd, hs⟩ := dimensionParameter_bounds d hd
  exact uniform_subset_below_half_all d (dimensionParameter d) (d+dimensionParameter d)
    (by omega) (by omega) hrd rfl (by omega)

end MaTangCoreAllDimensions

