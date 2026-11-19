import Conjectures.LonelinessModularDirections
import Conjectures.LonelinessCriticalScaling
import Conjectures.LonelinessPlaneProductFamily

/-! Semantic properties of the literal sorted, gcd-normalized absolute
coordinate list.  These bridges keep the final finite classification tied
to the original positive speed tuple. -/

namespace Loneliness.FiveSpeedCertificate

open Loneliness.CoordinateSubspace Loneliness.CriticalFamilies

theorem vector_of_list_length {α : Type*} {n : ℕ} (ds : List α)
    (hlen : ds.length = n) : ∃ v : Fin n → α, List.ofFn v = ds := by
  subst n
  exact ⟨ds.get, List.ofFn_get ds⟩

theorem normalization_critical_iff (ds : List ℕ) (hne : ds ≠ [])
    (hpositive : ∀ a ∈ ds, 0 < a) :
    ContainsCriticalQuadruple (Normalization.normalize ds) ↔ ContainsCriticalQuadruple ds := by
  have hscale := containsCriticalQuadruple_map_mul_iff (Normalization.normalize ds)
    (Normalization.gcd ds) (Normalization.gcd_pos hne hpositive)
  rw [Normalization.rescale_normalize] at hscale
  exact hscale.symm

theorem absoluteSpeeds_length {n : ℕ} (v : Fin n → ℤ) :
    (Modular.absoluteSpeeds v).length = n := by
  simp only [Modular.absoluteSpeeds, List.length_ofFn]

theorem absoluteSpeeds_nonempty {n : ℕ} (hn : 0 < n) (v : Fin n → ℤ) :
    Modular.absoluteSpeeds v ≠ [] := by
  intro h
  have hl := absoluteSpeeds_length v
  rw [h, List.length_nil] at hl
  omega

theorem absoluteSpeeds_positive {n : ℕ} (v : Fin n → ℤ)
    (hnonzero : ∀ i, v i ≠ 0) :
    ∀ a ∈ Modular.absoluteSpeeds v, 0 < a := by
  intro a ha
  obtain ⟨i, rfl⟩ := List.mem_ofFn.mp ha
  exact Int.natAbs_pos.mpr (hnonzero i)

theorem integerSpeeds_value_eq_absoluteSpeeds {n : ℕ} (v : Fin n → ℤ) :
    value (integerSpeeds v) = value (Modular.absoluteSpeeds v) := by
  apply value_eq_of_mem
  intro a
  simp only [mem_integerSpeeds, Modular.absoluteSpeeds, List.mem_ofFn]

theorem integerSpeeds_critical_iff_absoluteSpeeds {n : ℕ} (v : Fin n → ℤ) :
    ContainsCriticalQuadruple (integerSpeeds v) ↔
      ContainsCriticalQuadruple (Modular.absoluteSpeeds v) := by
  apply containsCriticalQuadruple_iff_of_mem
  intro a
  simp only [mem_integerSpeeds, Modular.absoluteSpeeds, List.mem_ofFn]

theorem integerSpeeds_mem_of_abs_reindex {n : ℕ} (v w : Fin n → ℤ)
    (σ : Equiv.Perm (Fin n)) (habs : ∀ i, (w i).natAbs = (v (σ i)).natAbs) (a : ℕ) :
    a ∈ integerSpeeds w ↔ a ∈ integerSpeeds v := by
  simp only [mem_integerSpeeds]
  constructor
  · rintro ⟨i, hi⟩
    exact ⟨σ i, (habs i).symm.trans hi⟩
  · rintro ⟨i, hi⟩
    refine ⟨σ.symm i, ?_⟩
    simpa only [habs, Equiv.apply_symm_apply] using hi

theorem integerSpeeds_value_of_abs_reindex {n : ℕ} (v w : Fin n → ℤ)
    (σ : Equiv.Perm (Fin n)) (habs : ∀ i, (w i).natAbs = (v (σ i)).natAbs) :
    value (integerSpeeds w) = value (integerSpeeds v) :=
  value_eq_of_mem (integerSpeeds_mem_of_abs_reindex v w σ habs)

theorem integerSpeeds_critical_iff_of_abs_reindex {n : ℕ} (v w : Fin n → ℤ)
    (σ : Equiv.Perm (Fin n)) (habs : ∀ i, (w i).natAbs = (v (σ i)).natAbs) :
    ContainsCriticalQuadruple (integerSpeeds w) ↔ ContainsCriticalQuadruple (integerSpeeds v) :=
  containsCriticalQuadruple_iff_of_mem (integerSpeeds_mem_of_abs_reindex v w σ habs)

theorem primitiveDirection_length {n : ℕ} (v : Fin n → ℤ) :
    (Modular.primitiveDirection v).length = n := by
  calc
    _ = (Normalization.normalize (Modular.absoluteSpeeds v)).length :=
      (List.mergeSort_perm _ (· ≤ ·)).length_eq
    _ = n := by rw [Normalization.normalize_length, absoluteSpeeds_length]

theorem primitiveDirection_ordered {n : ℕ} (v : Fin n → ℤ) :
    (Modular.primitiveDirection v).Pairwise (· ≤ ·) :=
  List.pairwise_mergeSort' (· ≤ ·) _

theorem primitiveDirection_nodup {n : ℕ} (v : Fin n → ℤ)
    (hdistinct : Function.Injective (fun i => (v i).natAbs)) :
    (Modular.primitiveDirection v).Nodup := by
  apply (List.mergeSort_perm (Normalization.normalize (Modular.absoluteSpeeds v))
    (· ≤ ·)).nodup_iff.mpr
  apply Normalization.normalize_nodup
  exact List.nodup_ofFn_ofInjective hdistinct

theorem primitiveDirection_positive {n : ℕ} (v : Fin n → ℤ)
    (hnonzero : ∀ i, v i ≠ 0) :
    ∀ a ∈ Modular.primitiveDirection v, 0 < a := by
  intro a ha
  apply Normalization.normalize_positive (Modular.absoluteSpeeds v)
    (absoluteSpeeds_positive v hnonzero) a
  exact (List.mergeSort_perm (Normalization.normalize (Modular.absoluteSpeeds v))
    (· ≤ ·)).mem_iff.mp ha

theorem primitiveDirection_primitive {n : ℕ} (hn : 0 < n) (v : Fin n → ℤ)
    (hnonzero : ∀ i, v i ≠ 0) :
    Normalization.gcd (Modular.primitiveDirection v) = 1 := by
  unfold Modular.primitiveDirection
  rw [Modular.list_gcd_eq_of_perm
    (List.mergeSort_perm (Normalization.normalize (Modular.absoluteSpeeds v)) (· ≤ ·))]
  exact Normalization.normalize_primitive _ (absoluteSpeeds_nonempty hn v)
    (absoluteSpeeds_positive v hnonzero)

theorem primitiveDirection_value {n : ℕ} (hn : 0 < n) (v : Fin n → ℤ)
    (hnonzero : ∀ i, v i ≠ 0) :
    value (Modular.primitiveDirection v) = value (integerSpeeds v) := by
  calc
    _ = value (Normalization.normalize (Modular.absoluteSpeeds v)) :=
      value_perm (List.mergeSort_perm _ (· ≤ ·))
    _ = value (Modular.absoluteSpeeds v) :=
      Normalization.value_normalize _ (absoluteSpeeds_nonempty hn v)
        (absoluteSpeeds_positive v hnonzero)
    _ = _ := (integerSpeeds_value_eq_absoluteSpeeds v).symm

theorem primitiveDirection_critical_iff {n : ℕ} (hn : 0 < n) (v : Fin n → ℤ)
    (hnonzero : ∀ i, v i ≠ 0) :
    ContainsCriticalQuadruple (Modular.primitiveDirection v) ↔
      ContainsCriticalQuadruple (integerSpeeds v) := by
  have hsort : ContainsCriticalQuadruple (Modular.primitiveDirection v) ↔
      ContainsCriticalQuadruple (Normalization.normalize (Modular.absoluteSpeeds v)) :=
    containsCriticalQuadruple_iff_of_mem
      (fun a => (List.mergeSort_perm (Normalization.normalize (Modular.absoluteSpeeds v))
        (· ≤ ·)).mem_iff)
  exact hsort.trans ((normalization_critical_iff _ (absoluteSpeeds_nonempty hn v)
    (absoluteSpeeds_positive v hnonzero)).trans
      (integerSpeeds_critical_iff_absoluteSpeeds v).symm)

theorem primitiveDirection_nat {n : ℕ} (v : Fin n → ℕ) :
    Modular.primitiveDirection (fun i => (v i : ℤ)) =
      (Normalization.normalize (List.ofFn v)).mergeSort (· ≤ ·) := by
  simp only [Modular.primitiveDirection, Modular.absoluteSpeeds, Int.natAbs_natCast]

theorem primitiveDirection_nat_primitive {n : ℕ} (v : Fin n → ℕ)
    (hprimitive : Normalization.gcd (List.ofFn v) = 1) :
    Modular.primitiveDirection (fun i => (v i : ℤ)) =
      (List.ofFn v).mergeSort (· ≤ ·) := by
  rw [primitiveDirection_nat]
  simp [Normalization.normalize, hprimitive, Function.comp_def]

theorem primitiveDirection_ordered_recovery {n : ℕ} (v : Fin n → ℕ)
    (hprimitive : Normalization.gcd (List.ofFn v) = 1)
    (hordered : (List.ofFn v).Pairwise (· ≤ ·)) :
    Modular.primitiveDirection (fun i => (v i : ℤ)) = List.ofFn v := by
  rw [primitiveDirection_nat_primitive v hprimitive]
  exact List.mergeSort_eq_self (r := (· ≤ ·)) hordered

theorem primitiveDirection_recovery_of_eq {n : ℕ} (v : Fin n → ℕ) (w : Fin n → ℤ)
    (hprimitive : Normalization.gcd (List.ofFn v) = 1)
    (hordered : (List.ofFn v).Pairwise (· ≤ ·))
    (hdirection : Modular.primitiveDirection w =
      Modular.primitiveDirection (fun i => (v i : ℤ))) :
    Modular.primitiveDirection w = List.ofFn v :=
  hdirection.trans (primitiveDirection_ordered_recovery v hprimitive hordered)

theorem primitiveDirection_spectrum_iff {n : ℕ} (hn : 0 < n) (v : Fin n → ℤ)
    (hnonzero : ∀ i, v i ≠ 0) :
    SpectrumForm (Modular.primitiveDirection v) ↔ SpectrumForm (integerSpeeds v) := by
  simp only [SpectrumForm, primitiveDirection_value hn v hnonzero]

end Loneliness.FiveSpeedCertificate
