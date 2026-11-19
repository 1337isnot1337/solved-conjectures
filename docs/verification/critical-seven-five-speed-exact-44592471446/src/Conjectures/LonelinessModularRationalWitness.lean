import Conjectures.LonelinessModularWitness

/-! Integer residue certificates for an arbitrary nonnegative rational
threshold at most one half, including the four-speed gap `2/9`. -/

namespace Loneliness.Modular

def RationalWitness (num den m t : ℕ) (ds : List ℕ) : Prop :=
  ∀ d ∈ ds, num*m ≤ den*folded m (t*d)

instance (num den m t : ℕ) (ds : List ℕ) :
    Decidable (RationalWitness num den m t ds) :=
  inferInstanceAs (Decidable (∀ d ∈ ds, num*m ≤ den*folded m (t*d)))

def HasRationalWitness (num den m : ℕ) (ds : List ℕ) : Prop :=
  ∃ t, RationalWitness num den m t ds

theorem rationalWitness_clearance_lower {num den m t : ℕ} {ds : List ℕ}
    (hden : 0<den) (hhalf : 2*num≤den) (hm : 0<m)
    (hw : RationalWitness num den m t ds) :
    (num : ℝ)/den ≤ clearance ds ((t : ℝ)/m) := by
  have hdR : (0 : ℝ)<den := by exact_mod_cast hden
  have hmR : (0 : ℝ)<m := by exact_mod_cast hm
  apply le_clearance
  · apply (div_le_div_iff₀ hdR (by norm_num : (0 : ℝ)<2)).mpr
    have hh : (2 : ℝ)*(num : ℝ)≤(den : ℝ) := by exact_mod_cast hhalf
    nlinarith
  · intro d hd
    have h := hw d hd
    have hR : (num : ℝ)*m ≤ (den : ℝ)*folded m (t*d) := by exact_mod_cast h
    have he : (d : ℝ)*((t : ℝ)/m)=((t*d : ℕ) : ℝ)/m := by
      push_cast
      ring
    rw [he,distance_nat_div _ _ hm]
    apply (div_le_div_iff₀ hdR hmR).mpr
    simpa only [mul_comm] using hR

theorem rationalWitness_value_lower {num den m t : ℕ} {ds : List ℕ}
    (hden : 0<den) (hhalf : 2*num≤den) (hm : 0<m)
    (hw : RationalWitness num den m t ds) : (num : ℝ)/den ≤ value ds :=
  (rationalWitness_clearance_lower hden hhalf hm hw).trans
    (CriticalFamilies.le_value_any ds ((t : ℝ)/m))

theorem hasRationalWitness_value_lower {num den m : ℕ} {ds : List ℕ}
    (hden : 0<den) (hhalf : 2*num≤den) (hm : 0<m)
    (hw : HasRationalWitness num den m ds) : (num : ℝ)/den ≤ value ds := by
  obtain ⟨t,ht⟩ := hw
  exact rationalWitness_value_lower hden hhalf hm ht

theorem rationalWitness_mod_speeds (num den m t : ℕ) (ds : List ℕ) :
    RationalWitness num den m t (ds.map (·%m)) ↔ RationalWitness num den m t ds := by
  have he (d : ℕ) : folded m (t*(d%m))=folded m (t*d) :=
    folded_eq_of_mod_eq (by simp [Nat.mul_mod])
  simp only [RationalWitness,List.forall_mem_map,he]

theorem rationalWitness_folded_speeds (num den m t : ℕ) (ds : List ℕ) (hm : 0<m) :
    RationalWitness num den m t (ds.map (folded m)) ↔
      RationalWitness num den m t ds := by
  simp only [RationalWitness,List.forall_mem_map,folded_mul_folded m _ t hm]

theorem rationalWitness_perm {num den m t : ℕ} {ds es : List ℕ} (h : ds.Perm es) :
    RationalWitness num den m t ds ↔ RationalWitness num den m t es := by
  constructor
  · intro hw d hd
    exact hw d (h.mem_iff.mpr hd)
  · intro hw d hd
    exact hw d (h.mem_iff.mp hd)

theorem hasRationalWitness_unit {num den m u v : ℕ}
    (h : (u*v)%m=1%m) (ds : List ℕ) :
    HasRationalWitness num den m (ds.map (u*·)) ↔ HasRationalWitness num den m ds := by
  constructor
  · rintro ⟨t,ht⟩
    refine ⟨t*u,?_⟩
    intro d hd
    simpa only [Nat.mul_assoc] using ht (u*d) (List.mem_map.mpr ⟨d,hd,rfl⟩)
  · rintro ⟨t,ht⟩
    refine ⟨t*v,?_⟩
    intro d hd
    obtain ⟨a,ha,rfl⟩ := List.mem_map.mp hd
    have he : (t*v)*(u*a)=v*(u*(t*a)) := by ring
    rw [he,folded_unit_cancel h]
    exact ht a ha

theorem hasRationalWitness_folded_unit {num den m u v : ℕ} (hm : 0<m)
    (h : (u*v)%m=1%m) (ds : List ℕ) :
    HasRationalWitness num den m (ds.map (fun d => folded m (u*d))) ↔
      HasRationalWitness num den m ds := by
  have hh : ds.map (fun d => folded m (u*d))=(ds.map (u*·)).map (folded m) := by
    simp only [List.map_map,Function.comp_def]
  rw [hh]
  exact (exists_congr (fun t => rationalWitness_folded_speeds num den m t _ hm)).trans
    (hasRationalWitness_unit h ds)

theorem rationalWitness_of_mem_equiv {num den m t : ℕ} {ds es : List ℕ}
    (h : ∀ d, d∈ds ↔ d∈es) :
    RationalWitness num den m t ds ↔ RationalWitness num den m t es := by
  constructor
  · intro hw d hd
    exact hw d ((h d).mpr hd)
  · intro hw d hd
    exact hw d ((h d).mp hd)

end Loneliness.Modular
