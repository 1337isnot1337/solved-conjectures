import Conjectures.LonelinessRational
import Conjectures.LonelinessCriticalBase

/-! Sound modular witnesses for the actual real-time loneliness value.
All finite checks use natural-number residues. -/

namespace Loneliness.Modular

def folded (m a : ℕ) : ℕ := min (a % m) (m - a % m)

def Witness (k m t : ℕ) (ds : List ℕ) : Prop :=
  ∀ d ∈ ds, m ≤ k * folded m (t * d)

instance (k m t : ℕ) (ds : List ℕ) : Decidable (Witness k m t ds) :=
  inferInstanceAs (Decidable (∀ d ∈ ds, m ≤ k * folded m (t*d)))

def HasWitness (k m : ℕ) (ds : List ℕ) : Prop := ∃ t, Witness k m t ds

@[simp] theorem folded_mod (m a : ℕ) : folded m (a % m) = folded m a := by
  simp [folded]

theorem folded_eq_of_mod_eq {m a b : ℕ} (h : a % m = b % m) :
    folded m a = folded m b := by simp only [folded,h]

theorem folded_le_half (m a : ℕ) : 2 * folded m a ≤ m := by
  by_cases hm : m=0
  · subst m
    simp [folded]
  · have h := Nat.mod_lt a (Nat.pos_of_ne_zero hm)
    have h₁ := min_le_left (a%m) (m-a%m)
    have h₂ := min_le_right (a%m) (m-a%m)
    unfold folded
    omega

theorem distance_nat_div (a m : ℕ) (hm : 0 < m) :
    distance ((a : ℝ) / m) = (folded m a : ℝ) / m := by
  have h := distance_int_div (a : ℤ) (m : ℤ) (by exact_mod_cast hm)
  have hmod : a % m ≤ m := (Nat.mod_lt a hm).le
  simpa only [← Int.natCast_emod, Nat.cast_min, Nat.cast_sub hmod,
    Int.cast_natCast, Int.cast_min, Int.cast_sub, folded] using h

theorem witness_clearance_lower {k m t : ℕ} {ds : List ℕ}
    (hk : 2 ≤ k) (hm : 0 < m) (hw : Witness k m t ds) :
    (1 : ℝ) / k ≤ clearance ds ((t : ℝ) / m) := by
  have hkR : (0 : ℝ) < k := by exact_mod_cast (show 0<k by omega)
  have hmR : (0 : ℝ) < m := by exact_mod_cast hm
  apply le_clearance
  · exact one_div_le_one_div_of_le (by norm_num) (by exact_mod_cast hk)
  · intro d hd
    have h := hw d hd
    have hR : (m : ℝ) ≤ (k : ℝ) * (folded m (t*d) : ℝ) := by exact_mod_cast h
    have he : (d : ℝ) * ((t : ℝ) / m) = ((t*d : ℕ) : ℝ) / m := by
      push_cast
      ring
    rw [he,distance_nat_div _ _ hm]
    apply (div_le_div_iff₀ hkR hmR).mpr
    simpa only [one_mul,mul_one,mul_comm] using hR

/-- A modular witness proves the actual real supremum is at least `1/k`.
The multiplier need not be reduced and the speed list may have repeats. -/
theorem witness_value_lower {k m t : ℕ} {ds : List ℕ}
    (hk : 2 ≤ k) (hm : 0 < m) (hw : Witness k m t ds) :
    (1 : ℝ) / k ≤ value ds :=
  (witness_clearance_lower hk hm hw).trans
    (CriticalFamilies.le_value_any ds ((t : ℝ)/m))

theorem hasWitness_value_lower {k m : ℕ} {ds : List ℕ}
    (hk : 2 ≤ k) (hm : 0 < m) (hw : HasWitness k m ds) :
    (1 : ℝ) / k ≤ value ds := by
  obtain ⟨t,ht⟩ := hw
  exact witness_value_lower hk hm ht

theorem no_witness_of_value_lt {k m : ℕ} {ds : List ℕ}
    (hk : 2 ≤ k) (hm : 0 < m) (hv : value ds < (1 : ℝ)/k) :
    ¬ HasWitness k m ds :=
  fun hw => (not_le_of_gt hv) (hasWitness_value_lower hk hm hw)

theorem witness_mod_time (k m t : ℕ) (ds : List ℕ) :
    Witness k m (t % m) ds ↔ Witness k m t ds := by
  have he (d : ℕ) : folded m ((t%m)*d) = folded m (t*d) :=
    folded_eq_of_mod_eq (by simp [Nat.mul_mod])
  simp only [Witness,he]

theorem witness_mod_speeds (k m t : ℕ) (ds : List ℕ) :
    Witness k m t (ds.map (· % m)) ↔ Witness k m t ds := by
  have he (d : ℕ) : folded m (t*(d%m)) = folded m (t*d) :=
    folded_eq_of_mod_eq (by simp [Nat.mul_mod])
  simp only [Witness,List.forall_mem_map,he]

theorem witness_perm {k m t : ℕ} {ds es : List ℕ} (h : ds.Perm es) :
    Witness k m t ds ↔ Witness k m t es := by
  constructor
  · intro hw d hd
    exact hw d (h.mem_iff.mpr hd)
  · intro hw d hd
    exact hw d (h.mem_iff.mp hd)

theorem hasWitness_perm {k m : ℕ} {ds es : List ℕ} (h : ds.Perm es) :
    HasWitness k m ds ↔ HasWitness k m es :=
  exists_congr (fun _ => witness_perm h)

theorem folded_eq_of_add_mod_zero {m a b : ℕ} (hm : 0<m)
    (h : (a+b)%m=0) : folded m a = folded m b := by
  have ha := Nat.mod_lt a hm
  have hb := Nat.mod_lt b hm
  have hab : (a%m+b%m)%m=0 := (Nat.add_mod a b m).symm.trans h
  have hs : a%m+b%m=0 ∨ a%m+b%m=m := by
    by_cases hlt : a%m+b%m<m
    · left
      simpa only [Nat.mod_eq_of_lt hlt] using hab
    · right
      have hsub : a%m+b%m-m<m := by omega
      rw [Nat.mod_eq_sub_mod (by omega), Nat.mod_eq_of_lt hsub] at hab
      omega
  unfold folded
  rcases hs with hs | hs
  · have haz : a%m=0 := by omega
    have hbz : b%m=0 := by omega
    simp [haz,hbz]
  · have h₁ : m-a%m=b%m := by omega
    have h₂ : m-b%m=a%m := by omega
    simp only [h₁,h₂,min_comm]

theorem folded_mul_negResidue (m a t : ℕ) (hm : 0<m) :
    folded m (t*(m-a%m)) = folded m (t*a) := by
  have ham : a%m≤m := (Nat.mod_lt a hm).le
  have hsum : a%m+(m-a%m)=m := by omega
  have hz : (a+(m-a%m))%m=0 := by
    calc
      (a+(m-a%m))%m = (a%m+(m-a%m))%m := by simp [Nat.add_mod]
      _ = 0 := by rw [hsum]; simp
  apply (folded_eq_of_add_mod_zero hm ?_).symm
  rw [←Nat.mul_add,Nat.mul_mod,hz]
  simp

/-- Folding each residue chooses one of its two signs. It leaves every
modular witness unchanged, even when the coordinates are folded independently. -/
theorem folded_mul_folded (m a t : ℕ) (hm : 0<m) :
    folded m (t*folded m a) = folded m (t*a) := by
  by_cases ha : a%m≤m-a%m
  · have he : folded m a = a%m := min_eq_left ha
    rw [he]
    exact folded_eq_of_mod_eq (by simp [Nat.mul_mod])
  · have he : folded m a = m-a%m := min_eq_right (by omega)
    rw [he]
    exact folded_mul_negResidue m a t hm

theorem witness_folded_speeds (k m t : ℕ) (ds : List ℕ) (hm : 0<m) :
    Witness k m t (ds.map (folded m)) ↔ Witness k m t ds := by
  simp only [Witness,List.forall_mem_map,folded_mul_folded m _ t hm]

theorem witness_negated_speeds (k m t : ℕ) (ds : List ℕ) (hm : 0<m) :
    Witness k m t (ds.map (fun d => m-d%m)) ↔ Witness k m t ds := by
  simp only [Witness,List.forall_mem_map,folded_mul_negResidue m _ t hm]

theorem witness_scaled_speeds (k m t u : ℕ) (ds : List ℕ) :
    Witness k m t (ds.map (u*·)) ↔ Witness k m (t*u) ds := by
  simp only [Witness,List.forall_mem_map,Nat.mul_assoc]

theorem folded_unit_cancel {m u v : ℕ} (h : (u*v)%m=1%m) (a : ℕ) :
    folded m (v*(u*a)) = folded m a := by
  apply folded_eq_of_mod_eq
  calc
    (v*(u*a))%m = ((u*v)*a)%m := by congr 1; ring
    _ = ((u*v)%m*(a%m))%m := Nat.mul_mod _ _ _
    _ = ((1%m)*(a%m))%m := by rw [h]
    _ = a%m := by rw [←Nat.mul_mod]; simp

/-- Common multiplication by a unit preserves existence of a witness. The
inverse is supplied as a finite modular equation, which is directly decidable. -/
theorem hasWitness_unit {k m u v : ℕ} (h : (u*v)%m=1%m) (ds : List ℕ) :
    HasWitness k m (ds.map (u*·)) ↔ HasWitness k m ds := by
  constructor
  · rintro ⟨t,ht⟩
    exact ⟨t*u,(witness_scaled_speeds k m t u ds).mp ht⟩
  · rintro ⟨t,ht⟩
    refine ⟨t*v,?_⟩
    intro d hd
    obtain ⟨a,ha,rfl⟩ := List.mem_map.mp hd
    have he : (t*v)*(u*a)=v*(u*(t*a)) := by ring
    rw [he,folded_unit_cancel h]
    exact ht a ha

theorem hasWitness_folded_unit {k m u v : ℕ} (hm : 0<m)
    (h : (u*v)%m=1%m) (ds : List ℕ) :
    HasWitness k m (ds.map (fun d => folded m (u*d))) ↔ HasWitness k m ds := by
  have hh : ds.map (fun d => folded m (u*d)) = (ds.map (u*·)).map (folded m) := by
    simp only [List.map_map,Function.comp_def]
  rw [hh]
  exact (exists_congr (fun t => witness_folded_speeds k m t _ hm)).trans
    (hasWitness_unit h ds)

end Loneliness.Modular
