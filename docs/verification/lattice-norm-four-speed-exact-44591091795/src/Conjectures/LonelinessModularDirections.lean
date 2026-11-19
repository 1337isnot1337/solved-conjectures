import Conjectures.LonelinessNormalization
import Conjectures.LonelinessModularShortVector
import Mathlib.Data.List.FinRange
import Mathlib.Data.List.Sort

/-! Recovering primitive integer directions from a nonzero parallel vector.
The recovery is literal gcd normalization of absolute coordinates. It is
invariant under real parallelism, signs, and coordinate permutations. -/

namespace Loneliness.Modular

open Loneliness.SubspaceDensity Loneliness.Normalization

theorem normalize_nat_scale (ds : List ℕ) (a : ℕ) (ha : 0 < a) :
    normalize (ds.map (fun d => a*d)) = normalize ds := by
  unfold normalize
  rw [gcd_scale, List.map_map]
  apply List.map_congr_left
  intro d hd
  exact Nat.mul_div_mul_left d (gcd ds) ha

/-- Equal positive integer dilations have the same primitive list. Zeros
and repeated coordinates are allowed in this algebraic statement. -/
theorem normalize_eq_of_cross_scale {ds es : List ℕ} {a b : ℕ}
    (ha : 0 < a) (hb : 0 < b)
    (hscale : ds.map (fun d => a*d) = es.map (fun d => b*d)) :
    normalize ds = normalize es := by
  have h := congrArg normalize hscale
  simpa only [normalize_nat_scale ds a ha, normalize_nat_scale es b hb] using h

theorem normalize_ofFn_eq_of_real_scale {n : ℕ} (v w : Fin n → ℕ) (c : ℝ)
    (hc : c ≠ 0) (hv : ∃ i, v i ≠ 0)
    (hscale : ∀ i, (w i : ℝ) = c*(v i : ℝ)) :
    normalize (List.ofFn w) = normalize (List.ofFn v) := by
  obtain ⟨i, hi⟩ := hv
  have hiR : (v i : ℝ) ≠ 0 := by exact_mod_cast hi
  have hwiR : (w i : ℝ) ≠ 0 := by rw [hscale]; exact mul_ne_zero hc hiR
  have hwi : w i ≠ 0 := by exact_mod_cast hwiR
  have hcross (j : Fin n) : v i*w j = w i*v j := by
    have h : (v i : ℝ)*(w j : ℝ) = (w i : ℝ)*(v j : ℝ) := by
      rw [hscale i, hscale j]
      ring
    exact_mod_cast h
  apply normalize_eq_of_cross_scale (a := v i) (b := w i)
    (Nat.pos_of_ne_zero hi) (Nat.pos_of_ne_zero hwi)
  simp only [List.map_ofFn]
  congr 1
  funext j
  exact hcross j

def absoluteSpeeds {n : ℕ} (v : Fin n → ℤ) : List ℕ :=
  List.ofFn (fun i => (v i).natAbs)

def primitiveDirection {n : ℕ} (v : Fin n → ℤ) : List ℕ :=
  (normalize (absoluteSpeeds v)).mergeSort (· ≤ ·)

theorem normalize_absoluteSpeeds_eq_of_mem_line {n : ℕ} (v w : Fin n → ℤ)
    (hw : w ≠ 0) (hline : integerVector w ∈ integerLine v) :
    normalize (absoluteSpeeds w) = normalize (absoluteSpeeds v) := by
  obtain ⟨c, hc⟩ := Submodule.mem_span_singleton.mp hline
  have hcoord (i : Fin n) : (w i : ℝ) = c*(v i : ℝ) := by
    have h := congrFun hc i
    simpa only [Pi.smul_apply, smul_eq_mul, integerVector] using h.symm
  have hex : ∃ i, w i ≠ 0 := by
    by_contra h
    apply hw
    funext i
    exact not_not.mp (fun hi => h ⟨i,hi⟩)
  obtain ⟨i, hi⟩ := hex
  have hiR : (w i : ℝ) ≠ 0 := by exact_mod_cast hi
  have hc0 : c ≠ 0 := by
    intro h
    have hh := hcoord i
    rw [h, zero_mul] at hh
    exact hiR hh
  have hvi : v i ≠ 0 := by
    intro h
    have hh := hcoord i
    rw [h, Int.cast_zero, mul_zero] at hh
    exact hiR hh
  apply normalize_ofFn_eq_of_real_scale (fun j => (v j).natAbs)
    (fun j => (w j).natAbs) |c| (abs_ne_zero.mpr hc0)
    ⟨i, Int.natAbs_ne_zero.mpr hvi⟩
  intro j
  have habs := congrArg abs (hcoord j)
  simpa only [abs_mul, Nat.cast_natAbs, Int.cast_abs] using habs

theorem primitiveDirection_eq_of_mem_line {n : ℕ} (v w : Fin n → ℤ)
    (hw : w ≠ 0) (hline : integerVector w ∈ integerLine v) :
    primitiveDirection w = primitiveDirection v := by
  unfold primitiveDirection
  rw [normalize_absoluteSpeeds_eq_of_mem_line v w hw hline]

/-- Gcd normalization of a nonzero parallel vector recovers the original
primitive natural tuple in its original coordinate order. -/
theorem recover_primitive_direction {n : ℕ} (v : Fin n → ℕ) (w : Fin n → ℤ)
    (hprimitive : gcd (List.ofFn v) = 1) (hw : w ≠ 0)
    (hline : integerVector w ∈ integerLine (fun i => (v i : ℤ))) :
    normalize (absoluteSpeeds w) = List.ofFn v := by
  have h := normalize_absoluteSpeeds_eq_of_mem_line (fun i => (v i : ℤ)) w hw hline
  have habs : absoluteSpeeds (fun i => (v i : ℤ)) = List.ofFn v := by
    simp only [absoluteSpeeds, Int.natAbs_natCast]
  rw [habs] at h
  have hn : normalize (List.ofFn v) = List.ofFn v := by
    simp [normalize,hprimitive,Function.comp_def]
  exact h.trans hn

theorem recovered_coordinate {n : ℕ} (v : Fin n → ℕ) (w : Fin n → ℤ)
    (hprimitive : gcd (List.ofFn v) = 1) (hw : w ≠ 0)
    (hline : integerVector w ∈ integerLine (fun i => (v i : ℤ))) (i : Fin n) :
    (w i).natAbs / gcd (absoluteSpeeds w) = v i := by
  have h := recover_primitive_direction v w hprimitive hw hline
  unfold normalize absoluteSpeeds at h
  rw [List.map_ofFn] at h
  exact congrFun (List.ofFn_injective h) i

/-- A zero coordinate cannot represent a positive primitive tuple. -/
theorem recovered_coordinates_nonzero {n : ℕ} (v : Fin n → ℕ) (w : Fin n → ℤ)
    (hprimitive : gcd (List.ofFn v) = 1) (hpositive : ∀ i, 0 < v i) (hw : w ≠ 0)
    (hline : integerVector w ∈ integerLine (fun i => (v i : ℤ))) :
    ∀ i, w i ≠ 0 := by
  intro i hi
  have h := recovered_coordinate v w hprimitive hw hline i
  simp only [hi, Int.natAbs_zero, Nat.zero_div] at h
  have hp := hpositive i
  omega

/-- Repeated absolute coordinates cannot represent a tuple with distinct
positive speeds. The conclusion does not require positivity separately. -/
theorem recovered_absolute_coordinates_injective {n : ℕ}
    (v : Fin n → ℕ) (w : Fin n → ℤ)
    (hprimitive : gcd (List.ofFn v) = 1) (hinjective : Function.Injective v) (hw : w ≠ 0)
    (hline : integerVector w ∈ integerLine (fun i => (v i : ℤ))) :
    Function.Injective (fun i => (w i).natAbs) := by
  intro i j hij
  change (w i).natAbs = (w j).natAbs at hij
  apply hinjective
  rw [← recovered_coordinate v w hprimitive hw hline i,
    ← recovered_coordinate v w hprimitive hw hline j, hij]

theorem dvd_list_gcd_iff (a : ℕ) (ds : List ℕ) :
    a ∣ gcd ds ↔ ∀ d ∈ ds, a ∣ d := by
  induction ds with
  | nil => simp [gcd]
  | cons d ds ih =>
    change a ∣ Nat.gcd d (gcd ds) ↔ _
    simp only [Nat.dvd_gcd_iff, ih, List.forall_mem_cons]

theorem list_gcd_eq_of_perm {ds es : List ℕ} (h : ds.Perm es) : gcd ds = gcd es := by
  apply Nat.dvd_antisymm
  · apply (dvd_list_gcd_iff _ _).mpr
    intro d hd
    exact gcd_dvd_mem (h.mem_iff.mpr hd)
  · apply (dvd_list_gcd_iff _ _).mpr
    intro d hd
    exact gcd_dvd_mem (h.mem_iff.mp hd)

/-- Primitivity makes the order of an integer residue tuple equal to the
modulus: a common divisor of every multiplied coordinate divides the multiplier. -/
theorem primitive_divides_multiplier {n : ℕ} (v : Fin n → ℕ) (a m : ℕ)
    (hprimitive : gcd (List.ofFn v) = 1) (hdiv : ∀ i, m ∣ a*v i) : m ∣ a := by
  have h : m ∣ gcd ((List.ofFn v).map (fun d => a*d)) := by
    apply (dvd_list_gcd_iff _ _).mpr
    intro d hd
    obtain ⟨e,he,rfl⟩ := List.mem_map.mp hd
    obtain ⟨i,rfl⟩ := List.mem_ofFn.mp he
    exact hdiv i
  rwa [gcd_scale,hprimitive,mul_one] at h

theorem primitive_integer_divides_multiplier {n : ℕ} (v : Fin n → ℤ) (a m : ℤ)
    (hprimitive : gcd (absoluteSpeeds v) = 1) (hdiv : ∀ i, m ∣ a*v i) : m ∣ a := by
  apply Int.natAbs_dvd_natAbs.mp
  apply primitive_divides_multiplier (fun i => (v i).natAbs) a.natAbs m.natAbs hprimitive
  intro i
  simpa only [Int.natAbs_mul] using Int.natAbs_dvd_natAbs.mpr (hdiv i)

/-- The nonzero short-vector requirement follows directly from literal gcd
primitivity. No Bezout coefficient certificate is required. -/
theorem congruent_primitive_vector_ne_zero {n : ℕ} (v w : Fin n → ℤ) (a m : ℤ)
    (ha : 0 < a) (ham : a < m) (hprimitive : gcd (absoluteSpeeds v) = 1)
    (hcong : ∀ i, m ∣ w i-a*v i) : w ≠ 0 := by
  intro hw
  have hdiv : ∀ i, m ∣ a*v i := by
    intro i
    have h := hcong i
    rw [hw, Pi.zero_apply, zero_sub] at h
    exact dvd_neg.mp h
  have hma := primitive_integer_divides_multiplier v a m hprimitive hdiv
  exact (not_le_of_gt ham) (Int.le_of_dvd ha hma)

theorem normalize_perm {ds es : List ℕ} (h : ds.Perm es) :
    (normalize ds).Perm (normalize es) := by
  unfold normalize
  rw [list_gcd_eq_of_perm h]
  exact h.map _

theorem sorted_eq_of_perm {ds es : List ℕ} (h : ds.Perm es) :
    ds.mergeSort (· ≤ ·) = es.mergeSort (· ≤ ·) := by
  have hp := (List.mergeSort_perm ds (· ≤ ·)).trans
    (h.trans (List.mergeSort_perm es (· ≤ ·)).symm)
  exact hp.eq_of_pairwise' (List.pairwise_mergeSort' (· ≤ ·) ds)
    (List.pairwise_mergeSort' (· ≤ ·) es)

theorem primitiveDirection_eq_of_abs_reindex {n : ℕ} (v w : Fin n → ℤ)
    (σ : Equiv.Perm (Fin n)) (h : ∀ i, (w i).natAbs = (v (σ i)).natAbs) :
    primitiveDirection w = primitiveDirection v := by
  unfold primitiveDirection
  apply sorted_eq_of_perm
  apply normalize_perm
  have he : absoluteSpeeds w = List.ofFn ((fun i => (v i).natAbs) ∘ σ) := by
    unfold absoluteSpeeds
    congr 1
    funext i
    exact h i
  rw [he]
  exact σ.ofFn_comp_perm (fun i => (v i).natAbs)

theorem primitiveDirection_sign_perm {n : ℕ} (v : Fin n → ℤ)
    (ε : Fin n → ℤ) (hε : ∀ i, (ε i).natAbs = 1) (σ : Equiv.Perm (Fin n)) :
    primitiveDirection (fun i => ε i * v (σ i)) = primitiveDirection v := by
  apply primitiveDirection_eq_of_abs_reindex v _ σ
  intro i
  simp only [Int.natAbs_mul, hε, one_mul]

theorem recover_sorted_primitive_direction {n : ℕ} (v : Fin n → ℕ) (w : Fin n → ℤ)
    (hprimitive : gcd (List.ofFn v) = 1) (hw : w ≠ 0)
    (hline : integerVector w ∈ integerLine (fun i => (v i : ℤ))) :
    primitiveDirection w = (List.ofFn v).mergeSort (· ≤ ·) := by
  unfold primitiveDirection
  rw [recover_primitive_direction v w hprimitive hw hline]

theorem recover_ordered_primitive_direction {n : ℕ} (v : Fin n → ℕ) (w : Fin n → ℤ)
    (hprimitive : gcd (List.ofFn v) = 1) (hw : w ≠ 0)
    (hline : integerVector w ∈ integerLine (fun i => (v i : ℤ)))
    (hordered : (List.ofFn v).Pairwise (· ≤ ·)) :
    primitiveDirection w = List.ofFn v := by
  rw [recover_sorted_primitive_direction v w hprimitive hw hline]
  exact List.mergeSort_eq_self (r := (· ≤ ·)) hordered

end Loneliness.Modular
