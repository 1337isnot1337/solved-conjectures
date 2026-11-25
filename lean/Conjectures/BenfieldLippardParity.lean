module

public import Mathlib.Algebra.Ring.Parity
public import Mathlib.Data.Finset.Max
public import Mathlib.Tactic.ByContra
public import Mathlib.Tactic.NormNum
public import Mathlib.Tactic.Positivity
public import Mathlib.Tactic.Ring

/-!
# Benfield–Lippard's stable Waring-gap parity conjecture

The final theorem formalizes both assertions of Conjecture 10.4, with stable
representability expressed using exactly j positive powers for all large j.
-/

public section

namespace BenfieldLippardParity

def a (k : ℕ) : ℕ := 2 ^ k - 1

inductive Repr (k : ℕ) : ℕ → Prop
  | zero : Repr k 0
  | next {n m : ℕ} : Repr k n → 0 < m → Repr k (n + (m ^ k - 1))

def ExactPowers (k j n : ℕ) : Prop :=
  ∃ xs : List ℕ, xs.length = j ∧ (∀ m ∈ xs, 0 < m) ∧
    (xs.map (fun m => m ^ k)).sum = n

def Stable (k n : ℕ) : Prop :=
  ∃ j₀ : ℕ, ∀ j : ℕ, j₀ ≤ j → ExactPowers k j (j + n)

lemma repr_add {k x y : ℕ} (hx : Repr k x) (hy : Repr k y) : Repr k (x + y) := by
  induction hy with
  | zero => simpa using hx
  | @next n m _ hm ih =>
    simpa [Nat.add_assoc] using Repr.next ih hm (m := m)

lemma repr_mul {k x : ℕ} (hx : Repr k x) (c : ℕ) : Repr k (x * c) := by
  induction c with
  | zero => simpa using Repr.zero (k := k)
  | succ c ih => simpa [Nat.mul_succ] using repr_add ih hx

lemma repr_gen (k m : ℕ) (hm : 0 < m) : Repr k (m ^ k - 1) := by
  simpa using Repr.next (Repr.zero (k := k)) hm

lemma repr_a (k : ℕ) : Repr k (a k) := repr_gen k 2 (by omega)

lemma shifted_sum (k : ℕ) (xs : List ℕ) (h : ∀ m ∈ xs, 0 < m) :
    (xs.map (fun m => m ^ k)).sum =
      xs.length + (xs.map (fun m => m ^ k - 1)).sum := by
  induction xs with
  | nil => simp
  | cons m xs ih =>
    have hm : 0 < m := h m (by simp)
    have hp : 0 < m ^ k := pow_pos hm _
    have ht : ∀ n ∈ xs, 0 < n := fun n hn => h n (by simp [hn])
    simp only [List.map_cons, List.sum_cons, List.length_cons, ih ht]
    omega

lemma repr_iff_list (k n : ℕ) :
    Repr k n ↔ ∃ xs : List ℕ, (∀ m ∈ xs, 0 < m) ∧
      (xs.map (fun m => m ^ k - 1)).sum = n := by
  constructor
  · intro h
    induction h with
    | zero => exact ⟨[], by simp, by simp⟩
    | @next n m _ hm ih =>
      obtain ⟨xs, hp, hs⟩ := ih
      refine ⟨m :: xs, ?_, ?_⟩
      · intro v hv
        simp only [List.mem_cons] at hv
        rcases hv with rfl | hv
        · exact hm
        · exact hp v hv
      · simp [hs, Nat.add_comm]
  · rintro ⟨xs, hp, rfl⟩
    induction xs with
    | nil => exact Repr.zero
    | cons m xs ih =>
      have hm : 0 < m := hp m (by simp)
      have ht : ∀ n ∈ xs, 0 < n := fun n hn => hp n (by simp [hn])
      simpa [Nat.add_comm] using Repr.next (ih ht) hm

lemma stable_iff_repr (k n : ℕ) : Stable k n ↔ Repr k n := by
  rw [repr_iff_list]
  constructor
  · rintro ⟨j₀, hj⟩
    obtain ⟨xs, hxs, hp, hs⟩ := hj j₀ (Nat.le_refl _)
    refine ⟨xs, hp, ?_⟩
    have h := shifted_sum k xs hp
    omega
  · rintro ⟨xs, hp, hs⟩
    refine ⟨xs.length, ?_⟩
    intro j hj
    let rest := List.replicate (j - xs.length) 1
    refine ⟨xs ++ rest, ?_, ?_, ?_⟩
    · simp [rest]
      omega
    · intro m hm
      rw [List.mem_append] at hm
      rcases hm with hm | hm
      · exact hp m hm
      · have h : m = 1 := List.eq_of_mem_replicate hm
        omega
    · have base := shifted_sum k xs hp
      simp only [List.map_append, List.sum_append]
      have hrest : (List.map (fun m : ℕ => m ^ k) rest).sum = j - xs.length := by
        simp [rest]
      rw [hrest]
      omega

lemma stable_iff_once (k n : ℕ) : Stable k n ↔ ∃ j, ExactPowers k j (j+n) := by
  constructor
  · rintro ⟨j₀, hj⟩
    exact ⟨j₀, hj j₀ (Nat.le_refl _)⟩
  · rintro ⟨j, xs, hxs, hp, hs⟩
    apply (stable_iff_repr k n).mpr
    apply (repr_iff_list k n).mpr
    refine ⟨xs, hp, ?_⟩
    have h := shifted_sum k xs hp
    omega

lemma a_pos {k : ℕ} (hk : 2 ≤ k) : 0 < a k := by
  obtain ⟨l, rfl⟩ : ∃ l, k = l + 2 := ⟨k - 2, by omega⟩
  have h : 0 < (2:ℕ)^l := by positivity
  unfold a
  rw [pow_add]
  norm_num
  omega

lemma a_mod_four {k : ℕ} (hk : 2 ≤ k) : a k % 4 = 3 := by
  obtain ⟨l, rfl⟩ : ∃ l, k = l + 2 := ⟨k - 2, by omega⟩
  have h : 0 < (2:ℕ)^l := by positivity
  unfold a
  rw [pow_add]
  norm_num
  omega

lemma odd_power_sub_one_even (k m : ℕ) (hm : m % 2 = 1) :
    (m ^ k - 1) % 2 = 0 := by
  have hpow : m ^ k % 2 = 1 := by
    induction k with
    | zero => simp
    | succ k ih =>
      rw [pow_succ, Nat.mul_mod, ih, hm]
  omega

lemma double_shift (k m : ℕ) (hm : 0 < m) :
    (2 * m) ^ k - 1 = a k + 2 ^ k * (m ^ k - 1) := by
  have h₂ : 1 ≤ m^k := Nat.pow_pos hm
  have hmle : (2:ℕ)^k ≤ 2^k*m^k := by
    simpa using Nat.mul_le_mul_left ((2:ℕ)^k) h₂
  unfold a
  rw [mul_pow, Nat.mul_sub_left_distrib, Nat.mul_one]
  have hp : 1 ≤ (2:ℕ)^k := Nat.pow_pos (by omega)
  simpa only [Nat.add_comm] using (Nat.sub_add_sub_cancel hmle hp).symm

lemma gen_decomp (k m : ℕ) (hm : 0 < m) :
    ∃ j r : ℕ, m ^ k - 1 = a k * j + r ∧ r % 2 = 0 ∧ Repr k r := by
  induction m using Nat.strong_induction_on with
  | h m ih =>
    by_cases hd : m % 2 = 1
    · exact ⟨0, m^k - 1, by simp, odd_power_sub_one_even k m hd, repr_gen k m hm⟩
    · let q := m/2
      have hq : 0 < q := by omega
      have hqm : q < m := by omega
      have h2m : m = 2*q := by omega
      obtain ⟨j, r, hs, hr, rr⟩ := ih q hqm hq
      have hrepr := repr_mul rr (2^k)
      have hre : (2^k*r) % 2 = 0 := by rw [Nat.mul_mod, hr]; simp
      refine ⟨1+2^k*j, 2^k*r, ?_, hre, by simpa [Nat.mul_comm] using hrepr⟩
      calc
        m^k - 1 = (2*q)^k - 1 := by rw [← h2m]
        _ = a k + 2^k * (q^k - 1) := double_shift k q hq
        _ = a k * (1 + 2^k*j) + 2^k*r := by rw [hs]; ring

lemma repr_decomp {k n : ℕ} (hn : Repr k n) :
    ∃ j r : ℕ, n = a k * j + r ∧ r%2=0 ∧ Repr k r := by
  induction hn with
  | zero => exact ⟨0, 0, by simp, by decide, Repr.zero⟩
  | @next n m _ hm ih =>
    obtain ⟨j, r, hj, hr, rr⟩ := ih
    obtain ⟨j', r', hj', hr', rr'⟩ := gen_decomp k m hm
    refine ⟨j+j', r+r', ?_, by omega, repr_add rr rr'⟩
    rw [hj, hj']
    ring

lemma odd_repr_sub_a {k n : ℕ} (hn : Repr k n) (hodd : n%2=1) :
    a k ≤ n ∧ Repr k (n-a k) := by
  obtain ⟨j, r, hs, hr, rr⟩ := repr_decomp hn
  have hj : j ≠ 0 := by intro h; simp [h] at hs; omega
  have heq : n = a k * (j-1) + r + a k := by
    have hh : a k * j = a k * (j-1) + a k := by
      calc
        a k * j = a k * ((j-1)+1) := congrArg (fun i => a k*i) (by omega)
        _ = _ := by rw [Nat.mul_add, Nat.mul_one]
    omega
  have heq' : n-a k = a k*(j-1)+r := by omega
  refine ⟨by omega, ?_⟩
  rw [heq']
  exact repr_add (repr_mul (repr_a k) (j-1)) rr

lemma repr_small {k n : ℕ} (hn : Repr k n) : n = 0 ∨ a k ≤ n := by
  induction hn with
  | zero => exact Or.inl rfl
  | @next n m _ hm ih =>
    by_cases he : m = 1
    · simpa [he] using ih
    · have hm₂ : 2 ≤ m := by omega
      have hp : (2:ℕ)^k ≤ m^k := Nat.pow_le_pow_left hm₂ _
      unfold a at *
      omega


def b (k : ℕ) : ℕ := (a k) ^ k - 1
def cap (k : ℕ) : ℕ := a k * b k

lemma repr_cofinite {k n : ℕ} (hk : 2 ≤ k) (hn : cap k ≤ n) : Repr k n := by
  let A := a k
  let B := b k
  let c := A - n % A
  let x := B*c
  have ha : 0 < A := a_pos hk
  have hb : B + 1 = A^k := Nat.sub_add_cancel (Nat.pow_pos ha)
  have hd : A ∣ B+1 := by
    rw [hb]
    calc
      A ∣ A^(k-1)*A := Nat.dvd_mul_left A _
      _ = A^k := by
        rw [← pow_succ]
        exact congrArg (fun j : ℕ => A^j) (by omega)
  have hxc : A ∣ x+c := by
    have he : x+c = (B+1)*c := by dsimp [x]; rw [Nat.add_mul, Nat.one_mul]
    rw [he]
    exact dvd_mul_of_dvd_left hd c
  have hnc : A ∣ n+c := by
    refine ⟨n/A+1, ?_⟩
    have hmod := Nat.mod_lt n ha
    have hdiv := Nat.mod_add_div n A
    dsimp [c]
    rw [Nat.mul_add, Nat.mul_one]
    omega
  have hdiff : A ∣ n-x := by
    simpa [Nat.add_sub_add_right] using Nat.dvd_sub hnc hxc
  have hxc_le : x ≤ n := by
    calc
      x ≤ B*A := Nat.mul_le_mul_left _ (Nat.sub_le _ _)
      _ = cap k := by simp [A, B, cap, Nat.mul_comm]
      _ ≤ n := hn
  obtain ⟨d, hd⟩ := hdiff
  have rx : Repr k x := repr_mul (repr_gen k A ha) c
  have rd : Repr k (n-x) := by rw [hd]; exact repr_mul (repr_a k) d
  have hsum := Nat.add_sub_of_le hxc_le
  simpa only [hsum] using repr_add rx rd

def Gap (k n : ℕ) : Prop := 0 < n ∧ ¬ Repr k n

noncomputable def gaps (k : ℕ) : Finset ℕ := by
  classical
  exact (Finset.range (cap k)).filter (Gap k)

lemma mem_gaps {k n : ℕ} (hk : 2 ≤ k) : n ∈ gaps k ↔ Gap k n := by
  classical
  simp only [gaps, Finset.mem_filter, Finset.mem_range]
  exact ⟨And.right, fun h => ⟨by
    by_contra! hn
    exact h.2 (repr_cofinite hk hn), h⟩⟩

lemma mem_gaps_iff_never {k n : ℕ} (hk : 2 ≤ k) :
    n ∈ gaps k ↔ 0 < n ∧ ∀ j, ¬ ExactPowers k j (j+n) := by
  simp only [mem_gaps hk, Gap, ← stable_iff_repr, stable_iff_once, not_exists]

lemma gap_below {k n : ℕ} (hn : 0 < n) (ha : n < a k) : Gap k n := by
  refine ⟨hn, ?_⟩
  intro h
  rcases repr_small h with h0 | ha0 <;> omega

lemma gap_one {k : ℕ} (hk : 2 ≤ k) : Gap k 1 := by
  have h := a_mod_four hk
  exact gap_below (by omega) (by omega)

lemma gap_even_to_odd {k n : ℕ} (hk : 2 ≤ k) (hn : Gap k n) (he : n%2=0) :
    Gap k (n+a k) := by
  have ha := a_mod_four hk
  have hp := hn.1
  refine ⟨by omega, ?_⟩
  intro hr
  have hod : (n+a k)%2=1 := by omega
  have hneg := (odd_repr_sub_a hr hod).2
  exact hn.2 (by simpa using hneg)

lemma gap_odd_to_even {k n : ℕ} (hk : 2 ≤ k)
    (hn : Gap k n) (ho : n%2=1) (ha : a k ≤ n) :
    Gap k (n-a k) ∧ (n-a k)%2=0 := by
  have hamod := a_mod_four hk
  have hna : n ≠ a k := by
    intro he
    exact hn.2 (by rw [he]; exact repr_a k)
  refine ⟨⟨by omega, ?_⟩, by omega⟩
  intro hr
  exact hn.2 (by simpa [Nat.sub_add_cancel ha] using repr_add hr (repr_a k))

def plusEmb (c : ℕ) : ℕ ↪ ℕ :=
  ⟨fun n => n+c, by intro u v h; change u+c=v+c at h; omega⟩

def oddEmb : ℕ ↪ ℕ :=
  ⟨fun n => 2*n+1, by intro u v h; change 2*u+1=2*v+1 at h; omega⟩

lemma gaps_card_mod_two {k : ℕ} (hk : 2 ≤ k) : (gaps k).card % 2 = 1 := by
  classical
  let E := (gaps k).filter (fun n => n%2=0)
  let O := E.map (plusEmb (a k))
  let S := (Finset.range (a k/2)).map oddEmb
  have hamod := a_mod_four hk
  have e_mem (n : ℕ) : n ∈ E ↔ Gap k n ∧ n%2=0 := by
    simp [E, mem_gaps hk]
  have o_mem (n : ℕ) : n ∈ O ↔ ∃ j, (Gap k j ∧ j%2=0) ∧ j+a k=n := by
    simp only [O, Finset.mem_map, e_mem]
    rfl
  have s_mem (n : ℕ) : n ∈ S ↔ ∃ j, j<a k/2 ∧ 2*j+1=n := by
    simp only [S, Finset.mem_map, Finset.mem_range]
    rfl
  have hset : gaps k = E ∪ O ∪ S := by
    ext n
    simp only [mem_gaps hk, Finset.mem_union, e_mem, o_mem, s_mem]
    constructor
    · intro hn
      by_cases hE : n%2=0
      · exact Or.inl (Or.inl ⟨hn,hE⟩)
      · have ho : n%2=1 := by omega
        by_cases ha : n<a k
        · exact Or.inr ⟨n/2, by omega, by omega⟩
        · have hh := gap_odd_to_even hk hn ho (by omega)
          exact Or.inl (Or.inr ⟨n-a k, hh, by omega⟩)
    · rintro ((⟨hn,_⟩ | ⟨j,⟨hj,he⟩,rfl⟩) | ⟨j,hj,rfl⟩)
      · exact hn
      · exact gap_even_to_odd hk hj he
      · exact gap_below (by omega) (by omega)
  have hEO : Disjoint E O := by
    apply Finset.disjoint_left.mpr
    intro n he ho
    have hp := (e_mem n).mp he
    obtain ⟨j,⟨_,hje⟩,rfl⟩ := (o_mem n).mp ho
    omega
  have hEOS : Disjoint (E ∪ O) S := by
    apply Finset.disjoint_left.mpr
    intro n he hs
    obtain ⟨j,hj,rfl⟩ := (s_mem n).mp hs
    rcases Finset.mem_union.mp he with hE | hO
    · have hp := (e_mem _).mp hE
      omega
    · obtain ⟨i,_,hi⟩ := (o_mem _).mp hO
      omega
  rw [hset, Finset.card_union_of_disjoint hEOS, Finset.card_union_of_disjoint hEO]
  simp only [O, S, Finset.card_map, Finset.card_range]
  omega

theorem benfieldLippard_conj10_4 (k : ℕ) (hk : 2 ≤ k) :
    ∃ F : Finset ℕ,
      (∀ n, n ∈ F ↔ 0 < n ∧ ¬ Stable k n) ∧
      ∃ g ∈ F, (∀ n ∈ F, n ≤ g) ∧ Odd g ∧ Odd F.card := by
  classical
  have h1 : 1 ∈ gaps k := (mem_gaps hk).mpr (gap_one hk)
  let g := (gaps k).max' ⟨1,h1⟩
  have hg : g ∈ gaps k := Finset.max'_mem _ _
  have hmax : ∀ n ∈ gaps k, n ≤ g := by
    intro n hn
    exact Finset.le_max' _ _ hn
  have hgo : g%2=1 := by
    by_contra! he
    have hge : g%2=0 := by omega
    have hnew := gap_even_to_odd hk ((mem_gaps hk).mp hg) hge
    have hb := hmax _ ((mem_gaps hk).mpr hnew)
    have ha := a_pos hk
    omega
  have hcard := gaps_card_mod_two hk
  refine ⟨gaps k, ?_, g, hg, hmax, ?_, ?_⟩
  · intro n
    simp only [mem_gaps hk, Gap, stable_iff_repr]
  · exact ⟨g/2, by omega⟩
  · exact ⟨(gaps k).card/2, by omega⟩

#print axioms benfieldLippard_conj10_4

end BenfieldLippardParity
