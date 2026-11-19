import Conjectures.HadamardQuotient133Enumeration

namespace HadamardQuotient133

open scoped BigOperators

def evenDigits : List ℤ := [-6, -4, -2, 0, 2, 4, 6]

def splits (values : List ℤ) (s : ℤ) : List Triple :=
  values.flatMap fun a => values.flatMap fun b =>
    let c := s - a - b
    if c ∈ values then [![a, b, c]] else []

theorem mem_splits (values : List ℤ) (s : ℤ) (t : Triple)
    (ht : ∀ k, t k ∈ values) (hs : t 0 + t 1 + t 2 = s) :
    t ∈ splits values s := by
  have hc : s - t 0 - t 1 = t 2 := by omega
  apply List.mem_flatMap.mpr
  refine ⟨t 0, ht 0, ?_⟩
  apply List.mem_flatMap.mpr
  refine ⟨t 1, ht 1, ?_⟩
  dsimp only
  rw [hc, ite_eq_left (ht 2)]
  exact List.mem_singleton.mpr (fin3_eta t).symm

theorem small_add_mem_even {a b : ℤ} (ha : a ∈ smallDigits) (hb : b ∈ smallDigits) :
    a + b ∈ evenDigits := by
  have ha' := (mem_smallDigits_iff a).1 ha
  have hb' := (mem_smallDigits_iff b).1 hb
  simp only [evenDigits, List.mem_cons, List.not_mem_nil, or_false]
  omega

def squareSum (t : Triple) : ℤ := t 0 ^ 2 + t 1 ^ 2 + t 2 ^ 2

theorem squareSum_nonneg (t : Triple) : 0 ≤ squareSum t := by
  unfold squareSum
  positivity

theorem odd_square_lower (x : ℤ) (hx : x % 2 = 1) : 1 ≤ x ^ 2 := by
  by_cases hsign : 0 ≤ x
  · have hbound : 1 ≤ x := by omega
    nlinarith [sq_nonneg (x - 1)]
  · have hbound : x ≤ -1 := by omega
    nlinarith [sq_nonneg (x + 1)]

theorem squareSum_lower (t : Triple) (ht : ∀ k, t k % 2 = 1) :
    3 ≤ squareSum t := by
  have h0 := odd_square_lower _ (ht 0)
  have h1 := odd_square_lower _ (ht 1)
  have h2 := odd_square_lower _ (ht 2)
  dsimp [squareSum]
  omega

theorem project21_parity (L : Fin 3 → Row)
    (hL : ∀ k i j, L k i j ∈ smallDigits) :
    ∀ i k, project21 L i k % 2 = 1 := by
  intro i k
  have h0 := (mem_smallDigits_iff _).1 (hL k i 0)
  have h1 := (mem_smallDigits_iff _).1 (hL k i 1)
  have h2 := (mem_smallDigits_iff _).1 (hL k i 2)
  dsimp [project21]
  omega

theorem energy21_lower (r : Row) (hr : ∀ i k, r i k % 2 = 1) :
    21 ≤ energy21 r := by
  have h0 := squareSum_lower (r 0) (hr 0)
  have h1 := squareSum_lower (r 1) (hr 1)
  have h2 := squareSum_lower (r 2) (hr 2)
  change squareSum (r 0) + 3 * squareSum (r 1) + 3 * squareSum (r 2) ≥ 21
  omega

theorem signatures21_of_correlations (a b : Row)
    (h : ∀ t, correlation21 a t + correlation21 b t =
      if t = 0 then 2282 else -114) :
    ∀ k, signature21 a k + signature21 b k = target21 k := by
  intro k
  rw [← correlation21_eq_signature a k, ← correlation21_eq_signature b k]
  rw [h]
  fin_cases k <;> norm_num [shifts21, target21]
  decide

theorem margin_energy_bound_of_pair (L R : Fin 3 → Row)
    (hL : ∀ k i j, L k i j ∈ smallDigits)
    (hR : ∀ k i j, R k i j ∈ smallDigits)
    (h : ∀ k, signature21 (project21 L) k + signature21 (project21 R) k =
      target21 k) :
    energy21 (project21 L) ≤ 2261 ∧ energy21 (project21 R) ≤ 2261 := by
  have he := h 0
  simp only [signature21_zero, target21, Matrix.cons_val_zero] at he
  have hleft := energy21_lower _ (project21_parity L hL)
  have hright := energy21_lower _ (project21_parity R hR)
  omega

/-- This list intentionally contains a necessary-condition relaxation: the
second triple records the sum of the two nonzero 19-classes. Every actual
three-layer lift is included, whether or not this relaxation adds candidates. -/
def marginTriples (source : Triple) (weight : ℤ) : List Triple :=
  (splits smallDigits (source 0)).flatMap fun a =>
    (splits evenDigits (source 1 + source 2)).flatMap fun z =>
      let m : Triple := fun k => a k + 9 * z k
      if weight * squareSum m ≤ 2261 then [m] else []

theorem mem_marginTriples (source a z : Triple) (weight : ℤ)
    (ha : ∀ k, a k ∈ smallDigits) (hz : ∀ k, z k ∈ evenDigits)
    (hsa : a 0 + a 1 + a 2 = source 0)
    (hsz : z 0 + z 1 + z 2 = source 1 + source 2)
    (he : weight * squareSum (fun k => a k + 9 * z k) ≤ 2261) :
    (fun k => a k + 9 * z k) ∈ marginTriples source weight := by
  apply List.mem_flatMap.mpr
  refine ⟨a, mem_splits _ _ a ha hsa, ?_⟩
  apply List.mem_flatMap.mpr
  refine ⟨z, mem_splits _ _ z hz hsz, ?_⟩
  dsimp only
  rw [ite_eq_left he]
  exact List.mem_singleton.mpr rfl

theorem project_mem_marginTriples (L : Fin 3 → Row) (source : Row)
    (hL : ∀ k i j, L k i j ∈ smallDigits)
    (hs : ∀ i j, (∑ k, L k i j) = source i j)
    (i : Fin 3) (weight : ℤ)
    (he : weight * squareSum (project21 L i) ≤ 2261) :
    project21 L i ∈ marginTriples (source i) weight := by
  apply mem_marginTriples (source i)
    (fun k => L k i 0) (fun k => L k i 1 + L k i 2) weight
  · exact fun k => hL k i 0
  · exact fun k => small_add_mem_even (hL k i 1) (hL k i 2)
  · simpa only [Fin.sum_univ_three] using hs i 0
  · have h1 := hs i 1
    have h2 := hs i 2
    simp only [Fin.sum_univ_three] at h1 h2
    omega
  · exact he

def marginBlock (source : Row) (a b : Triple) : List Row :=
  (marginTriples (source 2) 3).flatMap fun c =>
    let m : Row := ![a, b, c]
    if energy21 m ≤ 2261 then [m] else []

def marginsFor (source : Row) : List Row :=
  (marginTriples (source 0) 1).flatMap fun a =>
    (marginTriples (source 1) 3).flatMap (marginBlock source a)

theorem marginsFor_complete (L : Fin 3 → Row) (source : Row)
    (hL : ∀ k i j, L k i j ∈ smallDigits)
    (hs : ∀ i j, (∑ k, L k i j) = source i j)
    (he : energy21 (project21 L) ≤ 2261) :
    project21 L ∈ marginsFor source := by
  let m := project21 L
  have h0 := squareSum_nonneg (m 0)
  have h1 := squareSum_nonneg (m 1)
  have h2 := squareSum_nonneg (m 2)
  have he' : squareSum (m 0) + 3 * squareSum (m 1) + 3 * squareSum (m 2) ≤ 2261 := he
  dsimp only [m] at h0 h1 h2 he'
  have hm0 : m 0 ∈ marginTriples (source 0) 1 :=
    project_mem_marginTriples L source hL hs 0 1 (by omega)
  have hm1 : m 1 ∈ marginTriples (source 1) 3 :=
    project_mem_marginTriples L source hL hs 1 3 (by omega)
  have hm2 : m 2 ∈ marginTriples (source 2) 3 :=
    project_mem_marginTriples L source hL hs 2 3 (by omega)
  apply List.mem_flatMap.mpr
  refine ⟨m 0, hm0, ?_⟩
  apply List.mem_flatMap.mpr
  refine ⟨m 1, hm1, ?_⟩
  apply List.mem_flatMap.mpr
  refine ⟨m 2, hm2, ?_⟩
  dsimp only
  rw [fin3_eta m, ite_eq_left he]
  exact List.mem_singleton.mpr rfl

end HadamardQuotient133
