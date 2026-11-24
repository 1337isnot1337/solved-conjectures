import Conjectures.MaTangCoreTranspose

/-!
# Ma–Tang's random subset-sum threshold conjecture

Transfer the iid mixed-group coverage bound to uniform ordered
sampling without replacement.
-/
namespace MaTangCoreDistinct
open MaTangCoreMatrix MaTangCoreIndexed MaTangCoreOccupancy MaTangCoreSubspace
open MaTangCoreRank MaTangCoreGenerator MaTangCoreQuotient MaTangCoreLinear
open MaTangCoreEncoding MaTangCoreFactor MaTangCoreMultiplicity MaTangCoreCoupling
open MaTangCoreDecay MaTangCoreLowerBound MaTangCoreBirthday MaTangCoreTranspose

def WordCovers (d : Nat) (w : List Raw) : Prop :=
  CoversMixed (sampleOfWord d w).1 (sampleOfWord d w).2

noncomputable def coveredWords (d k : Nat) : List (List Raw) := by
  classical
  exact (elementWords d k).filter fun w => decide (WordCovers d w)

theorem coveredWords_mem (d k : Nat) (w : List Raw) :
    w ∈ coveredWords d k ↔ w ∈ elementWords d k ∧ WordCovers d w := by
  classical
  simp [coveredWords]

theorem coveredWords_card (d k : Nat) :
    (coveredWords d k).length = (coveredSamples d k).length := by
  classical
  apply card_of_bijection _ _
    (List.filter_sublist.nodup (nodup_words _ _ (alphabet_nodup _)))
    (coveredSamples_nodup d k) (sampleOfWord d)
  · intro w hw
    obtain ⟨hm,hc⟩ := (coveredWords_mem d k w).mp hw
    exact (all_covered_iff _ _ _).mpr ⟨sampleOfWord_mem d k w hm,hc⟩
  · intro w hw v hv he
    have h1 := sample_word_inverse d k w ((coveredWords_mem _ _ _).mp hw).1
    have h2 := sample_word_inverse d k v ((coveredWords_mem _ _ _).mp hv).1
    rw [← h1,← h2,he]
  · intro s hs
    obtain ⟨hm,hc⟩ := (all_covered_iff _ _ _).mp hs
    refine ⟨wordOfSample k s,(coveredWords_mem _ _ _).mpr
      ⟨wordOfSample_mem d k s hm,?_⟩,word_sample_inverse d k s hm⟩
    unfold WordCovers
    rw [word_sample_inverse d k s hm]
    exact hc

noncomputable def coveredDistinctWords (d k : Nat) : List (List Raw) := by
  classical
  exact (distinctWords (alphabet (2^d)) k).filter fun w => decide (WordCovers d w)

theorem coveredDistinctWords_mem (d k : Nat) (w : List Raw) :
    w ∈ coveredDistinctWords d k ↔
      w ∈ distinctWords (alphabet (2^d)) k ∧ WordCovers d w := by
  classical
  simp [coveredDistinctWords]

theorem coveredDistinctWords_le (d k : Nat) :
    (coveredDistinctWords d k).length ≤ (coveredWords d k).length := by
  classical
  apply nodup_subset_length _ _
    (List.filter_sublist.nodup (List.filter_sublist.nodup (nodup_words _ _ (alphabet_nodup _))))
  intro w hw
  obtain ⟨hd,hc⟩ := (coveredDistinctWords_mem _ _ _).mp hw
  exact (coveredWords_mem _ _ _).mpr ⟨((distinctWords_mem _ _ _).mp hd).1,hc⟩

theorem eight_square_le_pow (d : Nat) (hd : 16 ≤ d) : 8*d*d ≤ 2^d := by
  induction d with
  | zero => omega
  | succ d ih =>
    by_cases h : d = 15
    · subst d; decide
    · have hd' : 16 ≤ d := by omega
      have hstep : (d+1)*(d+1) ≤ 2*(d*d) := by
        rw [Nat.add_mul,Nat.one_mul,Nat.mul_add]
        have hdd : 3*d ≤ d*d := by
          simpa using Nat.mul_le_mul_right d (show 3 ≤ d by omega)
        omega
      calc
        8*(d+1)*(d+1) = 8*((d+1)*(d+1)) := by ac_rfl
        _ ≤ 8*(2*(d*d)) := Nat.mul_le_mul_left 8 hstep
        _ = (8*d*d)*2 := by ac_rfl
        _ ≤ (2^d)*2 := Nat.mul_le_mul_right 2 (ih hd')
        _ = 2^(d+1) := by rw [Nat.pow_succ]

theorem mixed_birthday_condition (r : Nat) (hr : 4 ≤ r) :
    2*sampleCount r*sampleCount r ≤ (alphabet (2^(targetDimension r))).length := by
  let d := targetDimension r
  let k := sampleCount r
  have hkd : k = d+r := sampleCount_dimension r
  have hdr : r ≤ d := by
    have hrp := r_succ_le_pow r
    have hd := targetDimension_lower r
    unfold labelCount at hd
    omega
  have h16 : 16 ≤ d := by
    have h := targetDimension_lower r
    have hpow := Nat.pow_le_pow_right (by decide : 0 < 2) hr
    change 16 ≤ 2^r at hpow
    exact Nat.le_trans hpow h
  have hk2 : k ≤ 2*d := by omega
  have he : 2*k*k ≤ 8*d*d := by
    calc
      2*k*k ≤ 2*(2*d)*(2*d) := Nat.mul_le_mul (Nat.mul_le_mul_left 2 hk2) hk2
      _ = 8*d*d := by
        change 2*(2*d)*(2*d) = (2*2*2)*d*d
        ac_rfl
  rw [alphabet_length]
  exact Nat.le_trans he (Nat.le_trans (eight_square_le_pow d h16)
    (by change 2^d ≤ 3*2^d; omega))

/-- For all r≥4, the coverage fraction of uniform distinct ordered
samples is at most 1/(4*2^r). The sample universe has size 3*2^d. -/
theorem distinct_coverage_scaled (r : Nat) (hr : 4 ≤ r) :
    4*2^r*(coveredDistinctWords (targetDimension r) (sampleCount r)).length ≤
      (distinctWords (alphabet (2^(targetDimension r))) (sampleCount r)).length := by
  let d := targetDimension r
  let k := sampleCount r
  have hp : 0 < (alphabet (2^d)).length := by
    rw [alphabet_length]
    exact Nat.mul_pos (by decide) (Nat.two_pow_pos d)
  have hhalf := distinctWords_half (alphabet (2^d)) (alphabet_nodup _) k hp
    (mixed_birthday_condition r hr)
  have h := iid_coverage_scaled r (by omega)
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

end MaTangCoreDistinct
