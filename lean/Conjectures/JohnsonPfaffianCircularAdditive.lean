import Conjectures.JohnsonPfaffianCircular

/-!
# Johnson's conjecture

The finite complement gauge and conversion of ordinary interval products to
nonnegative additive interval weights. This is the literal algebraic argument
in Sections 2.2--2.3 of the existing proof.
-/

namespace JohnsonPfaffian

noncomputable def CircularData.linearSupport (D : CircularData) (n : ℕ)
    (q : Fin D.count) (i : ℕ) : Bool := by
  classical
  exact if LinearSupport n (D.support q) then D.support q i else !(D.support q i)

noncomputable def CircularData.gauge (D : CircularData) (n : ℕ)
    (q : Fin D.count) (i : ℕ) : ℝ := by
  classical
  exact if LinearSupport n (D.support q) then 1
    else complementGauge (D.parameter q) (D.support q i)

noncomputable def CircularData.linearize (D : CircularData) (n : ℕ) : CircularData where
  count := D.count
  support := D.linearSupport n
  parameter := D.parameter
  diagonal i := D.diagonal i * ∏ q, D.gauge n q i

theorem CircularData.linearize_linear {D : CircularData} {n : ℕ}
    (hD : D.Valid n) (q : Fin D.count) : LinearSupport n ((D.linearize n).support q) := by
  classical
  change LinearSupport n (fun i => if LinearSupport n (D.support q)
    then D.support q i else !(D.support q i))
  by_cases h : LinearSupport n (D.support q)
  · simpa only [ite_eq_left h] using h
  · simpa only [ite_eq_right h] using (hD.1 q).resolve_left h

theorem CircularData.gauge_positive {D : CircularData} {n : ℕ}
    (hD : D.Valid n) (q : Fin D.count) (i : ℕ) : 0 < D.gauge n q i := by
  classical
  unfold gauge
  split_ifs
  · exact zero_lt_one
  · exact complementGauge_positive _ _ (lt_of_lt_of_le zero_lt_one (hD.2.1 q))

theorem CircularData.linearize_valid {D : CircularData} {n : ℕ}
    (hD : D.Valid n) : (D.linearize n).Valid n := by
  refine ⟨fun q => Or.inl (D.linearize_linear hD q), hD.2.1, ?_⟩
  intro i hi
  change 0 < D.diagonal i * ∏ q, D.gauge n q i
  exact mul_pos (hD.2.2 i hi) (Finset.prod_pos (fun q _ => D.gauge_positive hD q i))

theorem CircularData.gauge_factor {D : CircularData} {n : ℕ}
    (hD : D.Valid n) (q : Fin D.count) (i j : ℕ) :
    intervalFactor (D.parameter q) (D.support q i) (D.support q j) =
      D.gauge n q i * D.gauge n q j *
        intervalFactor (D.parameter q) (D.linearSupport n q i) (D.linearSupport n q j) := by
  classical
  by_cases h : LinearSupport n (D.support q)
  · simp [gauge, linearSupport, h]
  · simpa [gauge, linearSupport, h] using
      complement_gauge (D.parameter q) (D.support q i) (D.support q j)
        (lt_of_lt_of_le zero_lt_one (hD.2.1 q))

theorem CircularData.linearize_weight {D : CircularData} {n : ℕ}
    (hD : D.Valid n) (i j : ℕ) : D.weight i j = (D.linearize n).weight i j := by
  classical
  have hp : (∏ q, intervalFactor (D.parameter q) (D.support q i) (D.support q j)) =
      (∏ q, D.gauge n q i) * (∏ q, D.gauge n q j) *
        ∏ q, intervalFactor (D.parameter q) (D.linearSupport n q i) (D.linearSupport n q j) := by
    calc
      _ = ∏ q, D.gauge n q i * D.gauge n q j *
            intervalFactor (D.parameter q) (D.linearSupport n q i) (D.linearSupport n q j) := by
        apply Finset.prod_congr rfl
        intro q _
        exact D.gauge_factor hD q i j
      _ = _ := by simp only [Finset.prod_mul_distrib]
  unfold CircularData.weight linearize
  dsimp only
  rw [hp]
  ring

/-- The finite realization of a Boolean interval predicate. -/
def supportFinset (n : ℕ) (S : ℕ → Bool) : Finset ℕ :=
  (Finset.range n).filter (fun i => S i)

theorem mem_supportFinset (n : ℕ) (S : ℕ → Bool) (i : ℕ) :
    i ∈ supportFinset n S ↔ i < n ∧ S i = true := by
  simp [supportFinset]

noncomputable def supportBounds (n : ℕ) (S : ℕ → Bool) : ℕ × ℕ :=
  if h : (supportFinset n S).Nonempty then
    ((supportFinset n S).min' h, (supportFinset n S).max' h)
  else (0, 0)

theorem supportBounds_valid (n : ℕ) (hn : 0 < n) (S : ℕ → Bool) :
    supportBounds n S ∈ intervalUniverse n := by
  classical
  apply (mem_intervalUniverse n _).mpr
  by_cases h : (supportFinset n S).Nonempty
  · simp only [supportBounds, dite_eq_left h]
    exact ⟨Finset.min'_le _ _ (Finset.max'_mem _ h),
      ((mem_supportFinset _ _ _).mp (Finset.max'_mem _ h)).1⟩
  · simp [supportBounds, h, hn]

theorem supportBounds_pair {n : ℕ} {S : ℕ → Bool}
    (hS : LinearSupport n S) (i j : ℕ) (hij : i < j) (hj : j < n) :
    (S i = true ∧ S j = true) ↔
      ((supportBounds n S).1 ≤ i ∧ i ≤ (supportBounds n S).2 ∧
       (supportBounds n S).1 ≤ j ∧ j ≤ (supportBounds n S).2) := by
  classical
  by_cases h : (supportFinset n S).Nonempty
  · simp only [supportBounds, dite_eq_left h]
    have hmin := (mem_supportFinset n S _).mp (Finset.min'_mem _ h)
    have hmax := (mem_supportFinset n S _).mp (Finset.max'_mem _ h)
    constructor
    · rintro ⟨hiS, hjS⟩
      have hi' : i ∈ supportFinset n S := (mem_supportFinset _ _ _).mpr ⟨by omega, hiS⟩
      have hj' : j ∈ supportFinset n S := (mem_supportFinset _ _ _).mpr ⟨hj, hjS⟩
      exact ⟨Finset.min'_le _ _ hi', Finset.le_max' _ _ hi',
        Finset.min'_le _ _ hj', Finset.le_max' _ _ hj'⟩
    · rintro ⟨h1, h2, h3, h4⟩
      exact ⟨hS _ i _ h1 h2 hmax.1 hmin.2 hmax.2,
        hS _ j _ h3 h4 hmax.1 hmin.2 hmax.2⟩
  · have he : supportFinset n S = ∅ := Finset.not_nonempty_iff_eq_empty.mp h
    have hiS : S i = false := by
      cases hi : S i with
      | false => rfl
      | true =>
        have hm : i ∈ supportFinset n S := (mem_supportFinset _ _ _).mpr ⟨by omega, hi⟩
        simp [he] at hm
    simp [supportBounds, h, hiS]
    omega

noncomputable def intersectionSupport {ι : Type*} (K : Finset ι) (S : ι → ℕ → Bool)
    (i : ℕ) : Bool := by
  classical
  exact decide (∀ q ∈ K, S q i = true)

theorem intersectionSupport_linear {ι : Type*} (n : ℕ) (K : Finset ι)
    (S : ι → ℕ → Bool) (hS : ∀ q ∈ K, LinearSupport n (S q)) :
    LinearSupport n (intersectionSupport K S) := by
  classical
  intro a b c hab hbc hc ha hd
  simp only [intersectionSupport, decide_eq_true_eq] at ha hd ⊢
  intro q hq
  exact hS q hq a b c hab hbc hc (ha q hq) (hd q hq)

noncomputable def productIntervalCoefficients {ι : Type*} [Fintype ι]
    (n : ℕ) (S : ι → ℕ → Bool) (t : ι → ℝ) (J : ℕ × ℕ) : ℝ := by
  classical
  exact ∑ K ∈ (Finset.univ : Finset ι).powerset.filter
    (fun K => supportBounds n (intersectionSupport K S) = J), ∏ q ∈ K, (t q - 1)

theorem productIntervalCoefficients_nonnegative {ι : Type*} [Fintype ι]
    (n : ℕ) (S : ι → ℕ → Bool) (t : ι → ℝ) (ht : ∀ q, 1 ≤ t q)
    (J : ℕ × ℕ) : 0 ≤ productIntervalCoefficients n S t J := by
  classical
  unfold productIntervalCoefficients
  apply Finset.sum_nonneg
  intro K _
  exact intersection_coefficient_nonnegative K t (fun q _ => ht q)

theorem product_intervalWeight {ι : Type*} [Fintype ι]
    (n : ℕ) (S : ι → ℕ → Bool) (t : ι → ℝ)
    (hS : ∀ q, LinearSupport n (S q)) (i j : ℕ) (hij : i < j) (hj : j < n) :
    (∏ q, intervalFactor (t q) (S q i) (S q j)) =
      intervalWeight (intervalUniverse n) (productIntervalCoefficients n S t) i j := by
  classical
  have hi : i < n := lt_trans hij hj
  let B : Finset ι → ℕ × ℕ := fun K => supportBounds n (intersectionSupport K S)
  let c : Finset ι → ℝ := fun K => ∏ q ∈ K, (t q - 1)
  have hcover (K : Finset ι) :
      (∀ q ∈ K, i ∈ supportFinset n (S q) ∧ j ∈ supportFinset n (S q)) ↔
        ((B K).1 ≤ i ∧ i ≤ (B K).2 ∧ (B K).1 ≤ j ∧ j ≤ (B K).2) := by
    rw [← supportBounds_pair (intersectionSupport_linear n K S (fun q _ => hS q)) i j hij hj]
    simp [intersectionSupport, mem_supportFinset, hi, hj, forall_and]
  have hprod := product_intersection_expansion (Finset.univ : Finset ι)
    (fun q => supportFinset n (S q)) t i j
  have he : (∏ q, intervalFactor (t q) (S q i) (S q j)) =
      ∑ K ∈ (Finset.univ : Finset ι).powerset,
        if (B K).1 ≤ i ∧ i ≤ (B K).2 ∧ (B K).1 ≤ j ∧ j ≤ (B K).2 then c K else 0 := by
    calc
      _ = ∏ q, if i ∈ supportFinset n (S q) ∧ j ∈ supportFinset n (S q)
            then t q else 1 := by
        apply Finset.prod_congr rfl
        intro q _
        simp [intervalFactor, mem_supportFinset, hi, hj, Bool.and_eq_true]
      _ = _ := by
        rw [hprod]
        apply Finset.sum_congr rfl
        intro K _
        simp only [hcover K]
        split_ifs <;> simp [c]
  rw [he]
  unfold intervalWeight productIntervalCoefficients
  have hfiber := Finset.sum_fiberwise_of_maps_to
    (s := (Finset.univ : Finset ι).powerset) (t := intervalUniverse n) (g := B)
    (fun K _ => supportBounds_valid n (by omega) (intersectionSupport K S))
    (fun K => if (B K).1 ≤ i ∧ i ≤ (B K).2 ∧ (B K).1 ≤ j ∧ j ≤ (B K).2
      then c K else 0)
  rw [← hfiber]
  apply Finset.sum_congr rfl
  intro J _
  by_cases hJ : J.1 ≤ i ∧ i ≤ J.2 ∧ J.1 ≤ j ∧ j ≤ J.2
  · rw [ite_eq_left hJ]
    apply Finset.sum_congr rfl
    intro K hK
    have hB := (Finset.mem_filter.mp hK).2
    simp only [hB, ite_eq_left hJ]
    rfl
  · rw [ite_eq_right hJ]
    apply Finset.sum_eq_zero
    intro K hK
    have hB := (Finset.mem_filter.mp hK).2
    simp only [hB, ite_eq_right hJ]

theorem CircularData.additive_representation {D : CircularData} {n : ℕ}
    (hD : D.Valid n) :
    ∃ (d : ℕ → ℝ) (t : ℕ × ℕ → ℝ),
      (∀ i < n, 0 < d i) ∧ (∀ J, 0 ≤ t J) ∧
      ∀ i j, i < j → j < n →
        D.weight i j = d i * d j * intervalWeight (intervalUniverse n) t i j := by
  let E := D.linearize n
  refine ⟨E.diagonal, productIntervalCoefficients n E.support E.parameter,
    (D.linearize_valid hD).2.2, ?_, ?_⟩
  · intro J
    exact productIntervalCoefficients_nonnegative n E.support E.parameter hD.2.1 J
  · intro i j hij hj
    rw [D.linearize_weight hD]
    unfold CircularData.weight
    rw [product_intervalWeight n E.support E.parameter (D.linearize_linear hD) i j hij hj]

theorem CircularData.endpoint_bound {D : CircularData} (u : ℕ)
    (hD : D.Valid (2*(u+1))) :
    D.weight 0 (2*u+1) * matchingPfaffian u (fun a b => D.weight (a+1) (b+1)) ≤
      matchingPfaffian (u+1) D.weight := by
  classical
  obtain ⟨d, t, hd, ht, hw⟩ := D.additive_representation hD
  let w := intervalWeight (intervalUniverse (2*(u+1))) t
  have hfull : matchingPfaffian (u+1) D.weight =
      ((List.range (2*(u+1))).map d).prod * matchingPfaffian (u+1) w := by
    rw [matchingPfaffian_congr_on (u+1) D.weight (fun i j => d i*d j*w i j) hw]
    exact matchingPfaffian_diagonal_scale (u+1) d w
  have hinner : matchingPfaffian u (fun a b => D.weight (a+1) (b+1)) =
      ((List.range (2*u)).map (fun a => d (a+1))).prod *
        matchingPfaffian u (fun a b => w (a+1) (b+1)) := by
    rw [matchingPfaffian_congr_on u (fun a b => D.weight (a+1) (b+1))
      (fun a b => d (a+1) * d (b+1) * w (a+1) (b+1))
      (fun a b hab hb => hw (a+1) (b+1) (by omega) (by omega))]
    exact matchingPfaffian_diagonal_scale u (fun a => d (a+1)) (fun a b => w (a+1) (b+1))
  have hdiag : ((List.range (2*(u+1))).map d).prod =
      d 0 * d (2*u+1) * ((List.range (2*u)).map (fun a => d (a+1))).prod := by
    have hp := ((outer_range_perm u).map d).prod_eq
    simpa [List.map_map, Function.comp_def, Nat.succ_eq_add_one, mul_assoc] using hp.symm
  have hpos : 0 ≤ ((List.range (2*(u+1))).map d).prod := by
    apply List.prod_nonneg
    intro x hx
    obtain ⟨i, hi, rfl⟩ := List.mem_map.mp hx
    exact (hd i (List.mem_range.mp hi)).le
  have he := mul_le_mul_of_nonneg_left
    (interval_endpoint_all u t (fun J _ => ht J)) hpos
  rw [hfull, hinner, hw 0 (2*u+1) (by omega) (by omega)]
  convert he using 1
  rw [hdiag]
  ring

end JohnsonPfaffian
