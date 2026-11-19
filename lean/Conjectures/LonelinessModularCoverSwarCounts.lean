import Conjectures.LonelinessModularCoverByteCounts

/-!
# Packed-field population count

Development proof prototype. The final evaluator will use fixed literal masks;
the recursive masks and lane sums below are specification functions only.
-/

namespace Loneliness.Modular.SupportSearch.Bits.Swar

set_option maxRecDepth 20000
set_option maxHeartbeats 4000000
set_option exponentiation.threshold 512

def stripe (b : ℕ) : ℕ → ℕ
  | 0 => 0
  | k + 1 => (2 ^ b - 1) + 2 ^ (b + b) * stripe b k

def step (b k n : ℕ) : ℕ :=
  (n &&& stripe b k) + ((n >>> b) &&& stripe b k)

def laneSum (base : ℕ) : ℕ → ℕ → ℕ
  | 0, _ => 0
  | k + 1, n => n % base + laneSum base k (n / base)

theorem masked_pair_chunk (b n tail : ℕ) :
    n &&& ((2 ^ b - 1) + 2 ^ (b + b) * tail) =
      n % 2 ^ b + 2 ^ (b + b) * ((n / 2 ^ (b + b)) &&& tail) := by
  have hb : 0 < 2 ^ b := Nat.two_pow_pos b
  have hc : 0 < 2 ^ (b + b) := Nat.two_pow_pos (b + b)
  have hsmall : 2 ^ b - 1 < 2 ^ (b + b) := by
    have hle : 2 ^ b ≤ 2 ^ (b + b) := Nat.pow_le_pow_right (by decide) (by omega)
    omega
  have hlow :
      (n &&& ((2 ^ b - 1) + 2 ^ (b + b) * tail)) % 2 ^ (b + b) =
        n % 2 ^ b := by
    rw [Nat.and_mod_two_pow, Nat.add_mul_mod_self_left,
      Nat.mod_eq_of_lt hsmall, Nat.and_two_pow_sub_one_eq_mod, Nat.pow_add,
      Nat.mod_mul_right_mod]
  have hhigh :
      (n &&& ((2 ^ b - 1) + 2 ^ (b + b) * tail)) / 2 ^ (b + b) =
        (n / 2 ^ (b + b)) &&& tail := by
    rw [Nat.and_div_two_pow, Nat.add_mul_div_left _ _ hc,
      Nat.div_eq_of_lt hsmall, Nat.zero_add]
  have hdecomp := Nat.mod_add_div
    (n &&& ((2 ^ b - 1) + 2 ^ (b + b) * tail)) (2 ^ (b + b))
  rw [hlow, hhigh] at hdecomp
  exact hdecomp.symm

theorem step_succ (b k n : ℕ) :
    step b (k + 1) n =
      (n % 2 ^ b + (n / 2 ^ b) % 2 ^ b) +
        2 ^ (b + b) * step b k (n / 2 ^ (b + b)) := by
  unfold step
  rw [stripe, masked_pair_chunk, Nat.shiftRight_eq_div_pow, masked_pair_chunk,
    Nat.shiftRight_eq_div_pow]
  rw [Nat.div_div_eq_div_mul, Nat.mul_comm (2 ^ b) (2 ^ (b + b)),
    ← Nat.div_div_eq_div_mul]
  rw [Nat.mul_add]
  omega

theorem pair_sum_lt (b n : ℕ) (hb : 0 < b) :
    n % 2 ^ b + (n / 2 ^ b) % 2 ^ b < 2 ^ (b + b) := by
  have hbase : 2 ≤ 2 ^ b := by
    have h := Nat.pow_le_pow_right (n := 2) (by decide) hb
    simpa using h
  calc
    n % 2 ^ b + (n / 2 ^ b) % 2 ^ b < 2 ^ b + 2 ^ b :=
      Nat.add_lt_add (Nat.mod_lt _ (Nat.two_pow_pos b))
        (Nat.mod_lt _ (Nat.two_pow_pos b))
    _ ≤ 2 ^ b * 2 ^ b := by
      simpa [Nat.mul_two] using Nat.mul_le_mul_left (2 ^ b) hbase
    _ = 2 ^ (b + b) := (Nat.pow_add 2 b b).symm

theorem laneSum_step (b k n : ℕ) (hb : 0 < b) :
    laneSum (2 ^ (b + b)) k (step b k n) = laneSum (2 ^ b) (k + k) n := by
  induction k generalizing n with
  | zero => rfl
  | succ k ih =>
    rw [step_succ, laneSum, Nat.add_mul_mod_self_left,
      Nat.mod_eq_of_lt (pair_sum_lt b n hb),
      Nat.add_mul_div_left _ _ (Nat.two_pow_pos (b + b)),
      Nat.div_eq_of_lt (pair_sum_lt b n hb), Nat.zero_add, ih]
    have hk : k + 1 + (k + 1) = (k + k) + 1 + 1 := by omega
    rw [hk, laneSum, laneSum, Nat.div_div_eq_div_mul, ← Nat.pow_add]
    omega

theorem step_lt (b k n : ℕ) (hb : 0 < b) :
    step b k n < 2 ^ ((b + b) * k) := by
  induction k generalizing n with
  | zero => simp [step, stripe]
  | succ k ih =>
    rw [step_succ, Nat.mul_succ, Nat.pow_add 2 ((b + b) * k) (b + b)]
    have hlow := pair_sum_lt b n hb
    have htail := ih (n / 2 ^ (b + b))
    have hmul := Nat.mul_le_mul_left (2 ^ (b + b)) (Nat.succ_le_of_lt htail)
    rw [Nat.mul_succ] at hmul
    rw [Nat.mul_comm (2 ^ ((b + b) * k)) (2 ^ (b + b))]
    omega

theorem fast_count_mod_two (n : ℕ) : Fast.count (n % 2) = n % 2 := by
  have hlt : n % 2 < 2 := Nat.mod_lt _ (by decide)
  by_cases hz : n % 2 = 0
  · rw [hz]
    rfl
  · have ho : n % 2 = 1 := by omega
    rw [ho]
    rfl

theorem laneSum_two_eq_count_mod (k n : ℕ) :
    laneSum 2 k n = Fast.count (n % 2 ^ k) := by
  induction k generalizing n with
  | zero => simp only [laneSum, Nat.pow_zero, Nat.mod_one, Fast.count_zero]
  | succ k ih =>
    rw [laneSum, ih]
    have hsplit := Byte.fast_count_split_pow 1 (n % 2 ^ (k + 1))
    simp only [Nat.pow_succ', Nat.mod_mul_right_mod,
      Nat.mod_mul_right_div_self, fast_count_mod_two] at hsplit
    simpa only [Nat.pow_succ'] using hsplit.symm

def swarSpec (n : ℕ) : ℕ :=
  let x1 := step 1 256 n
  let x2 := step 2 128 x1
  let x3 := step 4 64 x2
  let x4 := step 8 32 x3
  let x5 := step 16 16 x4
  let x6 := step 32 8 x5
  let x7 := step 64 4 x6
  let x8 := step 128 2 x7
  let x9 := step 256 1 x8
  x9

theorem swarSpec_eq_count_mod (n : ℕ) :
    swarSpec n = Fast.count (n % 2 ^ 512) := by
  let x1 := step 1 256 n
  let x2 := step 2 128 x1
  let x3 := step 4 64 x2
  let x4 := step 8 32 x3
  let x5 := step 16 16 x4
  let x6 := step 32 8 x5
  let x7 := step 64 4 x6
  let x8 := step 128 2 x7
  change step 256 1 x8 = Fast.count (n % 2 ^ 512)
  calc
    step 256 1 x8 = laneSum (2 ^ 512) 1 (step 256 1 x8) := by
      simp only [laneSum, Nat.add_zero]
      exact (Nat.mod_eq_of_lt (step_lt 256 1 x8 (by decide))).symm
    _ = laneSum (2 ^ 256) 2 x8 := laneSum_step 256 1 x8 (by decide)
    _ = laneSum (2 ^ 128) 4 x7 := laneSum_step 128 2 x7 (by decide)
    _ = laneSum (2 ^ 64) 8 x6 := laneSum_step 64 4 x6 (by decide)
    _ = laneSum (2 ^ 32) 16 x5 := laneSum_step 32 8 x5 (by decide)
    _ = laneSum (2 ^ 16) 32 x4 := laneSum_step 16 16 x4 (by decide)
    _ = laneSum (2 ^ 8) 64 x3 := laneSum_step 8 32 x3 (by decide)
    _ = laneSum (2 ^ 4) 128 x2 := laneSum_step 4 64 x2 (by decide)
    _ = laneSum (2 ^ 2) 256 x1 := laneSum_step 2 128 x1 (by decide)
    _ = laneSum (2 ^ 1) 512 n := laneSum_step 1 256 n (by decide)
    _ = Fast.count (n % 2 ^ 512) := laneSum_two_eq_count_mod 512 n

private theorem mask1_checked : stripe 1 256 = 4469269309980865699858008332735282042493121940197464459241187147907254676691182325600624766055634475896677286062162016951251294270648856648811216335361365 := by
  decide +kernel

private theorem mask2_checked : stripe 2 128 = 2681561585988519419914804999641169225495873164118478675544712288744352806014709395360374859633380685538006371637297210170750776562389313989286729801216819 := by
  decide +kernel

private theorem mask4_checked : stripe 4 64 = 788694584114270417622001470482696831028197989446611375160209496689515531180796880988345546950994319275884226952146238285514934283055680585084332294475535 := by
  decide +kernel

private theorem mask8_checked : stripe 8 32 = 52170458871371973150093482483291230068013096578180518979469110675960171323243373450590950576524916061050707619402669458574917831953099493954994743214335 := by
  decide +kernel

private theorem mask16_checked : stripe 16 16 = 204583791292591926691396081575382549208529011407180575518006033900266475884974090617542369930984076593222635430161375266700549045759594884514604711935 := by
  decide +kernel

private theorem mask32_checked : stripe 32 8 = 3121748549589153507255220667214744133005063442417264435278786581112765113115492710770662312255297115872319494912905282327171554901817584187867135 := by
  decide +kernel

private theorem mask64_checked : stripe 64 4 = 726838724295606890509921801691610055143498307623095356558689689527106077364635040561028680485123622079561121241075102686324128571457535 := by
  decide +kernel

private theorem mask128_checked : stripe 128 2 = 39402006196394479212279040100143613804963947181228130472524722419237033863644280909115546629308921431406146628878335 := by
  decide +kernel

private theorem mask256_checked : stripe 256 1 = 115792089237316195423570985008687907853269984665640564039457584007913129639935 := by
  decide +kernel

def swar512 (n : ℕ) : ℕ :=
  let x1 := (n &&& 4469269309980865699858008332735282042493121940197464459241187147907254676691182325600624766055634475896677286062162016951251294270648856648811216335361365) + ((n >>> 1) &&& 4469269309980865699858008332735282042493121940197464459241187147907254676691182325600624766055634475896677286062162016951251294270648856648811216335361365)
  let x2 := (x1 &&& 2681561585988519419914804999641169225495873164118478675544712288744352806014709395360374859633380685538006371637297210170750776562389313989286729801216819) + ((x1 >>> 2) &&& 2681561585988519419914804999641169225495873164118478675544712288744352806014709395360374859633380685538006371637297210170750776562389313989286729801216819)
  let x3 := (x2 &&& 788694584114270417622001470482696831028197989446611375160209496689515531180796880988345546950994319275884226952146238285514934283055680585084332294475535) + ((x2 >>> 4) &&& 788694584114270417622001470482696831028197989446611375160209496689515531180796880988345546950994319275884226952146238285514934283055680585084332294475535)
  let x4 := (x3 &&& 52170458871371973150093482483291230068013096578180518979469110675960171323243373450590950576524916061050707619402669458574917831953099493954994743214335) + ((x3 >>> 8) &&& 52170458871371973150093482483291230068013096578180518979469110675960171323243373450590950576524916061050707619402669458574917831953099493954994743214335)
  let x5 := (x4 &&& 204583791292591926691396081575382549208529011407180575518006033900266475884974090617542369930984076593222635430161375266700549045759594884514604711935) + ((x4 >>> 16) &&& 204583791292591926691396081575382549208529011407180575518006033900266475884974090617542369930984076593222635430161375266700549045759594884514604711935)
  let x6 := (x5 &&& 3121748549589153507255220667214744133005063442417264435278786581112765113115492710770662312255297115872319494912905282327171554901817584187867135) + ((x5 >>> 32) &&& 3121748549589153507255220667214744133005063442417264435278786581112765113115492710770662312255297115872319494912905282327171554901817584187867135)
  let x7 := (x6 &&& 726838724295606890509921801691610055143498307623095356558689689527106077364635040561028680485123622079561121241075102686324128571457535) + ((x6 >>> 64) &&& 726838724295606890509921801691610055143498307623095356558689689527106077364635040561028680485123622079561121241075102686324128571457535)
  let x8 := (x7 &&& 39402006196394479212279040100143613804963947181228130472524722419237033863644280909115546629308921431406146628878335) + ((x7 >>> 128) &&& 39402006196394479212279040100143613804963947181228130472524722419237033863644280909115546629308921431406146628878335)
  let x9 := (x8 &&& 115792089237316195423570985008687907853269984665640564039457584007913129639935) + ((x8 >>> 256) &&& 115792089237316195423570985008687907853269984665640564039457584007913129639935)
  x9

theorem swar512_eq_spec (n : ℕ) : swar512 n = swarSpec n := by
  simp only [swar512, swarSpec, step, mask1_checked, mask2_checked,
    mask4_checked, mask8_checked, mask16_checked, mask32_checked,
    mask64_checked, mask128_checked, mask256_checked]

theorem swar512_eq_count_mod (n : ℕ) :
    swar512 n = Fast.count (n % 2 ^ 512) :=
  (swar512_eq_spec n).trans (swarSpec_eq_count_mod n)

def countWithFuel (fuel n : ℕ) : ℕ :=
  if n ≤ fuel ∧ n < 2 ^ 512 then swar512 n else Byte.countWithFuel fuel n

theorem countWithFuel_eq (fuel n : ℕ) :
    countWithFuel fuel n = Byte.countWithFuel fuel n := by
  by_cases h : n ≤ fuel ∧ n < 2 ^ 512
  · rw [countWithFuel, ite_eq_left h, swar512_eq_count_mod,
      Nat.mod_eq_of_lt h.2, Byte.countWithFuel_eq fuel n h.1]
  · rw [countWithFuel, ite_eq_right h]

def count (n : ℕ) : ℕ := countWithFuel n n

theorem count_eq_byte (n : ℕ) : count n = Byte.count n :=
  countWithFuel_eq n n

theorem count_eq_fast (n : ℕ) : count n = Fast.count n :=
  (count_eq_byte n).trans (Byte.count_eq_fast n)

theorem count_eq (n : ℕ) : count n = n.bitIndices.length :=
  (count_eq_byte n).trans (Byte.count_eq n)

theorem count_eq_swar512 (n : ℕ) (hn : n < 2 ^ 512) : count n = swar512 n := by
  exact ite_eq_left ⟨Nat.le_refl n, hn⟩

end Loneliness.Modular.SupportSearch.Bits.Swar
