import Conjectures.HaralambisCounting
import Conjectures.LonelinessNormalization
import Conjectures.NonmixedGapResidues

/-! Uniform interval bounds and common-divisor reduction. The primitive local
inequality is an explicit input here, to be supplied by the finite defect and
period certificates in the final theorem module. -/

namespace Haralambis

def lengthBound (d : Fin 3 → ℕ) : ℕ := d 0 + d 1 + d 2

theorem pair_le_lengthBound (d : Fin 3 → ℕ) (i j : Fin 3) (hij : i ≠ j) :
    d i + d j ≤ lengthBound d := by
  fin_cases i <;> fin_cases j <;> simp_all [lengthBound] <;> omega

theorem uniform_count_of_local (d : Fin 3 → ℕ) (hd : ∀ i, 0 < d i)
    (δ : ℝ) (hδ : 0 ≤ δ)
    (hlocal : ∀ A : Set ℤ, Loneliness.Packing.Avoids (speeds d) A →
      ∃ i j : Fin 3, i ≠ j ∧
        (pairCount d A i j : ℝ) ≤ δ * (d i + d j : ℕ))
    (A : Set ℤ) (hA : Loneliness.Packing.Avoids (speeds d) A) :
    ∀ u v : ℤ, u ≤ v →
      (NonmixedGap.count A u v : ℝ) ≤ δ * (v-u) + (lengthBound d : ℝ) := by
  apply NonmixedGap.local_block_uniform_upper A δ hδ (lengthBound d)
  intro t _
  obtain ⟨i, j, hij, hcount⟩ := hlocal {x : ℤ | t+x ∈ A}
    (Loneliness.Packing.avoids_translate hA t)
  refine ⟨d i+d j, by have hi := hd i; omega, pair_le_lengthBound d i j hij, ?_⟩
  dsimp [pairCount] at hcount
  rw [NonmixedGap.count_translate, add_zero] at hcount
  exact hcount

theorem positive_speeds (d : Fin 3 → ℕ) (hd : ∀ i, 0 < d i) :
    ∀ a ∈ speeds d, 0 < a := by
  intro a ha
  simp only [speeds, List.mem_cons, List.not_mem_nil, or_false] at ha
  rcases ha with rfl | rfl | rfl
  · exact hd 0
  · exact hd 1
  · exact hd 2

def commonDivisor (d : Fin 3 → ℕ) : ℕ := Nat.gcd (Nat.gcd (d 0) (d 1)) (d 2)

def reduced (d : Fin 3 → ℕ) (i : Fin 3) : ℕ := d i / commonDivisor d

theorem commonDivisor_eq_gcd (d : Fin 3 → ℕ) :
    commonDivisor d = Loneliness.Normalization.gcd (speeds d) := by
  simp [commonDivisor, Loneliness.Normalization.gcd, speeds, Nat.gcd_assoc]

theorem commonDivisor_pos (d : Fin 3 → ℕ) (hd : ∀ i, 0 < d i) :
    0 < commonDivisor d := by
  rw [commonDivisor_eq_gcd]
  exact Loneliness.Normalization.gcd_pos (by simp [speeds]) (positive_speeds d hd)

theorem normalize_speeds (d : Fin 3 → ℕ) :
    Loneliness.Normalization.normalize (speeds d) = speeds (reduced d) := by
  simp [Loneliness.Normalization.normalize, Loneliness.Normalization.gcd,
    speeds, reduced, commonDivisor, Nat.gcd_assoc]

theorem reduced_positive (d : Fin 3 → ℕ) (hd : ∀ i, 0 < d i) :
    ∀ i, 0 < reduced d i := by
  intro i
  apply Loneliness.Normalization.normalize_positive (speeds d) (positive_speeds d hd)
  rw [normalize_speeds]
  exact mem_speeds (reduced d) i

theorem reduced_primitive (d : Fin 3 → ℕ) (hd : ∀ i, 0 < d i) :
    commonDivisor (reduced d) = 1 := by
  rw [commonDivisor_eq_gcd, ←normalize_speeds]
  exact Loneliness.Normalization.normalize_primitive (speeds d) (by simp [speeds])
    (positive_speeds d hd)

theorem reconstruct (d : Fin 3 → ℕ) (i : Fin 3) :
    commonDivisor d * reduced d i = d i := by
  have hdiv := Loneliness.Normalization.gcd_dvd_mem (mem_speeds d i)
  rw [←commonDivisor_eq_gcd] at hdiv
  exact Nat.mul_div_cancel' hdiv

theorem scaled_reduced_speeds (d : Fin 3 → ℕ) :
    (speeds (reduced d)).map (fun a => commonDivisor d * a) = speeds d := by
  change [commonDivisor d * reduced d 0, commonDivisor d * reduced d 1,
    commonDivisor d * reduced d 2] = [d 0, d 1, d 2]
  rw [reconstruct, reconstruct, reconstruct]

theorem value_reduced (d : Fin 3 → ℕ) (hd : ∀ i, 0 < d i) :
    Loneliness.value (speeds (reduced d)) = Loneliness.value (speeds d) := by
  rw [←normalize_speeds]
  exact Loneliness.Normalization.value_normalize (speeds d) (by simp [speeds])
    (positive_speeds d hd)

theorem avoids_residueSlice {ds : List ℕ} {A : Set ℤ} (g : ℕ)
    (hA : Loneliness.Packing.Avoids (ds.map (fun a => g*a)) A) (r : ℤ) :
    Loneliness.Packing.Avoids ds (NonmixedGap.residueSlice A g r) := by
  intro a ha t ht hn
  apply hA (g*a) (List.mem_map.mpr ⟨a, ha, rfl⟩) (r+(g:ℤ)*t) ht
  change r+(g:ℤ)*(t+(a:ℤ)) ∈ A at hn
  convert hn using 1
  push_cast
  ring

theorem scaled_upperDensity (ds : List ℕ) (g : ℕ) (hg : 0 < g) (C : ℝ)
    (hcount : ∀ B : Set ℤ, Loneliness.Packing.Avoids ds B →
      ∀ u v : ℤ, u ≤ v → (NonmixedGap.count B u v : ℝ) ≤
        Loneliness.value ds * (v-u) + C)
    (A : Set ℤ) (hA : Loneliness.Packing.Avoids (ds.map (fun a => g*a)) A) :
    NonmixedGap.upperDensity A ≤ Loneliness.value ds := by
  apply NonmixedGap.uniform_count_upper A _ ((g:ℝ)*(2*Loneliness.value ds+C))
  apply NonmixedGap.uniform_count_from_residues A (by exact_mod_cast hg) _ C
    (Loneliness.value_nonneg ds)
  intro r hr0 hrg u v huv
  exact hcount _ (avoids_residueSlice g hA r) u v huv

theorem upperDensity_of_primitive_local
    (hprimitive : ∀ d : Fin 3 → ℕ, (∀ i, 0 < d i) → commonDivisor d = 1 →
      ∀ A : Set ℤ, Loneliness.Packing.Avoids (speeds d) A →
        minRatio d A ≤ Loneliness.value (speeds d))
    (d : Fin 3 → ℕ) (hd : ∀ i, 0 < d i)
    (A : Set ℤ) (hA : Loneliness.Packing.Avoids (speeds d) A) :
    NonmixedGap.upperDensity A ≤ Loneliness.value (speeds d) := by
  let e := reduced d
  have hepos := reduced_positive d hd
  have heprim := reduced_primitive d hd
  have hlocal : ∀ B : Set ℤ, Loneliness.Packing.Avoids (speeds e) B →
      ∃ i j : Fin 3, i ≠ j ∧ (pairCount e B i j : ℝ) ≤
        Loneliness.value (speeds e) * (e i + e j : ℕ) := by
    intro B hB
    exact short_interval_of_minRatio e B _ hepos (hprimitive e hepos heprim B hB)
  have hcount := uniform_count_of_local e hepos _
    (Loneliness.value_nonneg (speeds e)) hlocal
  have hscaled : Loneliness.Packing.Avoids
      ((speeds e).map (fun a => commonDivisor d * a)) A := by
    simpa only [e, scaled_reduced_speeds] using hA
  have hu := scaled_upperDensity (speeds e) (commonDivisor d) (commonDivisor_pos d hd)
    (lengthBound e) hcount A hscaled
  rwa [value_reduced d hd] at hu

end Haralambis
