import Conjectures.HadamardBorderVarianceNormalization
import Conjectures.HadamardBorderPatterns

/-!
# The fourteen patterns from actual correlated sign rows

The odd baselines are derived by evaluating actual quotient compression
at zero. The constant baseline is replaced only in the classification by
its absolute value, and the three remaining baselines are sorted with an
explicit list-permutation witness. The actual row operations and all
preserved correlations remain in the final conclusion.
-/

namespace HadamardBorderConstruction

open scoped BigOperators
open HadamardBorderNormalizationTransport
open HadamardBorderPatterns

theorem exists_pattern_of_odd_equation (d a b c : ℤ)
    (hd : d % 2 = 1) (ha : a % 2 = 1) (hb : b % 2 = 1) (hc : c % 2 = 1)
    (heq : (4*d) ^ 2 + (4*a+2) ^ 2 + (4*b+2) ^ 2 + (4*c+2) ^ 2 = 2396) :
    ∃ p : Pattern, p ∈ patterns ∧ p.d = |d| ∧
      [p.a,p.b,p.c].Perm [a,b,c] := by
  have hdne : d ≠ 0 := by omega
  have hdpos : 0 < |d| := abs_pos.mpr hdne
  have hdabs : |d| % 2 = 1 := by
    rcases le_total 0 d with hnonneg | hnonpos
    · simpa only [abs_of_nonneg hnonneg] using hd
    · rw [abs_of_nonpos hnonpos]
      omega
  have heqabs :
      (4*|d|) ^ 2 + (4*a+2) ^ 2 + (4*b+2) ^ 2 + (4*c+2) ^ 2 = 2396 := by
    simpa only [mul_pow, sq_abs] using heq
  have build (x y z : ℤ) (hx : x % 2 = 1) (hy : y % 2 = 1) (hz : z % 2 = 1)
      (hxy : x ≤ y) (hyz : y ≤ z) (hp : [x,y,z].Perm [a,b,c]) :
      ∃ p : Pattern, p ∈ patterns ∧ p.d = |d| ∧
        [p.a,p.b,p.c].Perm [a,b,c] := by
    refine ⟨⟨|d|,x,y,z⟩, ?_, rfl, hp⟩
    apply admissible_mem_patterns
    refine ⟨hdpos,hdabs,hx,hy,hz,hxy,hyz,?_⟩
    have hsum := (List.Perm.map (fun v : ℤ => (4*v+2) ^ 2) hp).sum_eq
    simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, add_zero] at hsum
    linarith only [heqabs, hsum]
  by_cases hab : a ≤ b
  · by_cases hbc : b ≤ c
    · exact build a b c ha hb hc hab hbc (List.Perm.refl _)
    · have hcb : c ≤ b := by omega
      by_cases hac : a ≤ c
      · exact build a c b ha hc hb hac hcb ((List.Perm.swap b c []).cons a)
      · exact build c a b hc ha hb (by omega) hab
          (List.perm_append_singleton c [a,b]).symm
  · have hba : b ≤ a := by omega
    by_cases hac : a ≤ c
    · exact build b a c hb ha hc hba hac (List.Perm.swap a b [c])
    · have hca : c ≤ a := by omega
      by_cases hbc : b ≤ c
      · exact build b c a hb hc ha hbc hca (List.perm_append_singleton a [b,c])
      · exact build c b a hc hb ha (by omega) hba (List.reverse_perm [a,b,c])

variable {G Q : Type*} [Fintype G] [Fintype Q]
  [AddCommGroup G] [AddCommGroup Q] [DecidableEq Q]

/-- The original sign rows and raw correlations yield actual normalized rows
and one of the fourteen listed patterns, with the sorting permutation explicit. -/
theorem exists_normalized_sign_rows_with_pattern
    (π : G →+ Q) (hπ : Function.Surjective π) (f : Rows G)
    (hQ : Fintype.card Q = 4) (hkernel : Nat.card π.ker = 149)
    (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ u : G, u ≠ 0 → combinedCorrelation f u =
      if π u = 0 then -12 else 4) :
    ∃ (k : Fin 4) (d : ℤ) (σ : Equiv.Perm (Fin 4))
        (ε : Fin 4 → ℤ) (t : Fin 4 → G) (a b c : ℤ) (p : Pattern),
      σ 0 = k ∧ ε 0 = 1 ∧ t 0 = 0 ∧ SignValued ε ∧
        (∀ i, SignValued (transformRows f σ ε t i)) ∧
        (∀ u, combinedCorrelation (transformRows f σ ε t) u =
          combinedCorrelation f u) ∧
        (∀ q, compress π (transformRows f σ ε t 0) q = d) ∧
        (∀ q, compress π (transformRows f σ ε t 1) q =
          a + if q = 0 then 2 else 0) ∧
        (∀ q, compress π (transformRows f σ ε t 2) q =
          b + if q = 0 then 2 else 0) ∧
        (∀ q, compress π (transformRows f σ ε t 3) q =
          c + if q = 0 then 2 else 0) ∧
        (4*d) ^ 2 + (4*a+2) ^ 2 + (4*b+2) ^ 2 + (4*c+2) ^ 2 = 2396 ∧
        p ∈ patterns ∧ p.d = |d| ∧ [p.a,p.b,p.c].Perm [a,b,c] := by
  obtain ⟨k,d,σ,ε,t,a,b,c,hσ,hεzero,ht0,hε,hf',hpreserve,h0,h1,h2,h3,heq⟩ :=
    exists_normalized_sign_rows_with_equation π hπ f hQ hf hcorr
  have hd : d % 2 = 1 := by
    have h := compressed_parity π hπ (transformRows f σ ε t) hf' 0 0
    rw [h0, hkernel] at h
    norm_num at h
    exact h
  have ha : a % 2 = 1 := by
    have h := compressed_parity π hπ (transformRows f σ ε t) hf' 1 0
    rw [h1, hkernel] at h
    norm_num at h
    omega
  have hb : b % 2 = 1 := by
    have h := compressed_parity π hπ (transformRows f σ ε t) hf' 2 0
    rw [h2, hkernel] at h
    norm_num at h
    omega
  have hc : c % 2 = 1 := by
    have h := compressed_parity π hπ (transformRows f σ ε t) hf' 3 0
    rw [h3, hkernel] at h
    norm_num at h
    omega
  rw [hkernel] at heq
  norm_num at heq
  obtain ⟨p,hp,hpd,hperm⟩ := exists_pattern_of_odd_equation d a b c hd ha hb hc heq
  exact ⟨k,d,σ,ε,t,a,b,c,p,hσ,hεzero,ht0,hε,hf',hpreserve,h0,h1,h2,h3,
    heq,hp,hpd,hperm⟩

end HadamardBorderConstruction
