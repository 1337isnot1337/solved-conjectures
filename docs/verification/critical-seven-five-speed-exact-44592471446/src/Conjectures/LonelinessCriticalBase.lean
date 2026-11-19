import Conjectures.LonelinessFiveFamily
import Mathlib.Data.Int.GCD
import Mathlib.Data.List.Perm.Subperm

/-! Periodicity, permutation invariance, and modular witnesses used to classify
five-speed lists containing a dilation of a critical four-speed list. -/

namespace Loneliness.CriticalFamilies

theorem distance_neg (x : ℝ) : distance (-x) = distance x := by
  simpa using distance_int_sub 0 x

theorem distance_add_int (x : ℝ) (n : ℤ) : distance (x + n) = distance x := by
  calc
    distance (x + n) = distance ((n : ℝ) - (-x)) := by congr 1; ring
    _ = distance (-x) := distance_int_sub n (-x)
    _ = distance x := distance_neg x

theorem clearance_add_int (ds : List ℕ) (t : ℝ) (n : ℤ) :
    clearance ds (t + n) = clearance ds t := by
  induction ds with
  | nil => rfl
  | cons d ds ih =>
    simp only [clearance, ih]
    congr 1
    have heq : (d : ℝ) * (t + n) = (d : ℝ) * t + ((d : ℤ) * n : ℤ) := by
      push_cast
      ring
    rw [heq, distance_add_int]

theorem le_value_any (ds : List ℕ) (t : ℝ) : clearance ds t ≤ value ds := by
  have ht₀ := Int.floor_le t
  have ht₁ := Int.lt_floor_add_one t
  have ht : t - (⌊t⌋ : ℝ) ∈ Set.Icc (0 : ℝ) 1 := by
    constructor <;> linarith
  have heq := clearance_add_int ds (t - (⌊t⌋ : ℝ)) ⌊t⌋
  have ht' : t - (⌊t⌋ : ℝ) + (⌊t⌋ : ℝ) = t := by ring
  rw [ht'] at heq
  rw [heq]
  exact le_value ht

theorem clearance_eq_of_mem {ds es : List ℕ}
    (hmem : ∀ d, d ∈ ds ↔ d ∈ es) (t : ℝ) : clearance ds t = clearance es t := by
  apply le_antisymm
  · exact le_clearance (clearance_le_half ds t)
      (fun d hd => clearance_le_of_mem ((hmem d).mpr hd) t)
  · exact le_clearance (clearance_le_half es t)
      (fun d hd => clearance_le_of_mem ((hmem d).mp hd) t)

theorem value_eq_of_mem {ds es : List ℕ}
    (hmem : ∀ d, d ∈ ds ↔ d ∈ es) : value ds = value es := by
  unfold value
  congr 2
  funext t
  exact clearance_eq_of_mem hmem t

theorem value_perm {ds es : List ℕ} (h : ds.Perm es) : value ds = value es :=
  value_eq_of_mem (fun _ => h.mem_iff)

theorem fifth_distance (m : ℕ) (hm : m % 5 ≠ 0) (j : ℤ) :
    (1 / 5 : ℝ) ≤ distance ((m : ℝ) * ((j : ℝ) + 1 / 5)) := by
  have hmodlt : m % 5 < 5 := Nat.mod_lt m (by decide)
  have hmodlo : 1 ≤ m % 5 := by omega
  have hdecomp : (m : ℝ) = (m % 5 : ℕ) + 5 * (m / 5 : ℕ) := by
    exact_mod_cast (Nat.mod_add_div m 5).symm
  have hmodlo' : (1 : ℝ) ≤ (m % 5 : ℕ) := by exact_mod_cast hmodlo
  have hmodhi' : ((m % 5 : ℕ) : ℝ) ≤ 4 := by exact_mod_cast (show m % 5 ≤ 4 by omega)
  have hcell : (m : ℝ) * ((j : ℝ) + 1 / 5) -
      (((m : ℤ) * j + (m / 5 : ℕ) : ℤ) : ℝ) = (m % 5 : ℕ) / 5 := by
    norm_num only [Int.cast_add, Int.cast_mul, Int.cast_natCast]
    nlinarith
  apply distance_lower_of_cell (k := (m : ℤ) * j + (m / 5 : ℕ))
  · rw [hcell]; linarith
  · rw [hcell]; linarith

theorem fifth_of_all_nonzero_residues (ds : List ℕ)
    (hres : ∀ m ∈ ds, m % 5 ≠ 0) : (1 / 5 : ℝ) ≤ value ds := by
  apply le_trans (b := clearance ds (1 / 5))
  · apply le_clearance (by norm_num)
    intro m hm
    simpa using fifth_distance m (hres m hm) 0
  · exact le_value (by norm_num)

theorem modular_witness (a d : ℕ) (hd : 2 ≤ d) (hcop : Nat.Coprime a d) :
    ∃ (t : ℝ) (j : ℤ), (d : ℝ) * t = (j : ℝ) + 1 / 5 ∧
      (1 / 5 : ℝ) ≤ distance ((a : ℝ) * t) := by
  let δ : ℤ := ((d : ℤ) - (a : ℤ) + 4) / 5
  let n : ℤ := (a : ℤ) + 5 * δ
  let j : ℤ := δ * Nat.gcdA a d
  let k : ℤ := -δ * Nat.gcdB a d
  have hd' : (2 : ℤ) ≤ d := by exact_mod_cast hd
  have hnlo : (d : ℤ) ≤ n := by dsimp [n, δ]; omega
  have hnhi : n ≤ 4 * (d : ℤ) := by dsimp [n, δ]; omega
  have hbezout : (1 : ℤ) = (a : ℤ) * Nat.gcdA a d + (d : ℤ) * Nat.gcdB a d := by
    simpa [hcop.gcd_eq_one] using Nat.gcd_eq_gcd_ab a d
  have hmul : (a : ℤ) * j = δ + (d : ℤ) * k := by
    dsimp [j, k]
    nlinarith [congrArg (fun z : ℤ => δ * z) hbezout]
  have hmul' : (a : ℝ) * (j : ℝ) = (δ : ℝ) + (d : ℝ) * (k : ℝ) := by
    exact_mod_cast hmul
  have hn' : (n : ℝ) = (a : ℝ) + 5 * (δ : ℝ) := by dsimp [n]; push_cast; rfl
  have hnlo' : (d : ℝ) ≤ n := by exact_mod_cast hnlo
  have hnhi' : (n : ℝ) ≤ 4 * (d : ℝ) := by exact_mod_cast hnhi
  have hdpos : (0 : ℝ) < d := by exact_mod_cast (show 0 < d by omega)
  let t : ℝ := (5 * (j : ℝ) + 1) / (5 * (d : ℝ))
  have hdt : (d : ℝ) * t = (j : ℝ) + 1 / 5 := by
    dsimp [t]
    field_simp
  have hat : (a : ℝ) * t - (k : ℝ) = (n : ℝ) / (5 * (d : ℝ)) := by
    dsimp [t]
    apply (eq_div_iff (by positivity : (5 * (d : ℝ)) ≠ 0)).mpr
    field_simp
    nlinarith
  refine ⟨t, j, hdt, ?_⟩
  apply distance_lower_of_cell (k := k)
  · rw [hat]
    apply (le_div_iff₀ (by positivity)).mpr
    nlinarith
  · rw [hat]
    apply (div_le_iff₀ (by positivity)).mpr
    nlinarith

theorem fifth_of_dilation (base : List ℕ)
    (hbase : ∀ m ∈ base, m % 5 ≠ 0)
    (a d : ℕ) (hd : 2 ≤ d) (hcop : Nat.Coprime a d) :
    (1 / 5 : ℝ) ≤ value ((base.map (fun m => d * m)) ++ [a]) := by
  obtain ⟨t, j, hdt, hat⟩ := modular_witness a d hd hcop
  apply le_trans (b := clearance ((base.map (fun m => d * m)) ++ [a]) t)
  · apply le_clearance (by norm_num)
    intro m hm
    rcases List.mem_append.mp hm with hm | hm
    · obtain ⟨b, hb, rfl⟩ := List.mem_map.mp hm
      have heq : ((d * b : ℕ) : ℝ) * t = (b : ℝ) * ((j : ℝ) + 1 / 5) := by
        push_cast
        rw [mul_comm (d : ℝ), mul_assoc, hdt]
      rw [heq]
      exact fifth_distance b (hbase b hb) j
    · have hma : m = a := List.mem_singleton.mp hm
      subst m
      exact hat
  · exact le_value_any _ t

theorem subset_four_completion {base ds : List ℕ}
    (hbase : base.Nodup) (hlen : base.length = 4)
    (hds : ds.length = 5) (hsub : base ⊆ ds) :
    ∃ a : ℕ, ds.Perm (base ++ [a]) := by
  obtain ⟨xs, hperm, hlist⟩ := List.subperm_iff.mp (hbase.subperm hsub)
  obtain ⟨rest, hr⟩ := hlist.exists_perm_append
  have hp := hperm.symm.trans hr
  have hrl : rest.length = 1 := by
    have hl := hp.length_eq
    simp only [List.length_append] at hl
    omega
  obtain ⟨a, rfl⟩ := List.length_eq_one_iff.mp hrl
  exact ⟨a, hp⟩

theorem dvd_gcd_fold {g : ℕ} (ds : List ℕ) (hdiv : ∀ m ∈ ds, g ∣ m) :
    g ∣ ds.foldr Nat.gcd 0 := by
  induction ds with
  | nil => simp
  | cons m ds ih =>
    apply Nat.dvd_gcd (hdiv m (by simp))
    exact ih (fun n hn => hdiv n (by simp [hn]))

theorem primitive_coprime {ds base : List ℕ} {a d : ℕ}
    (hperm : ds.Perm ((base.map (fun m => d * m)) ++ [a]))
    (hprim : ds.foldr Nat.gcd 0 = 1) : Nat.Coprime a d := by
  apply Nat.coprime_iff_gcd_eq_one.mpr
  apply Nat.dvd_one.mp
  rw [← hprim]
  apply dvd_gcd_fold
  intro m hm
  have hm' := hperm.mem_iff.mp hm
  rcases List.mem_append.mp hm' with hm' | hm'
  · obtain ⟨b, hb, rfl⟩ := List.mem_map.mp hm'
    exact dvd_mul_of_dvd_left (Nat.gcd_dvd_right a d) b
  · have hma : m = a := List.mem_singleton.mp hm'
    subst m
    exact Nat.gcd_dvd_left a d

end Loneliness.CriticalFamilies
