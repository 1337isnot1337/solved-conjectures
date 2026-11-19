import Conjectures.NonmixedGapCharacter
import Conjectures.LonelinessRational

namespace NonmixedGap

def differences (a b k m : ℤ) : Finset ℤ :=
  (((Finset.Icc 0 k).product (Finset.Icc 0 m)).filter
    (fun ij => 0 < ij.1+ij.2)).image (fun ij => ij.1*a+ij.2*b)

noncomputable def speeds (a b k m : ℤ) : List ℕ := (differences a b k m).toList.map Int.toNat

theorem mem_differences {a b k m w : ℤ} :
    w ∈ differences a b k m ↔ ∃ i j : ℤ,
      0 ≤ i ∧ i ≤ k ∧ 0 ≤ j ∧ j ≤ m ∧ 0 < i+j ∧ w=i*a+j*b := by
  constructor
  · intro hw
    obtain ⟨⟨i,j⟩,hij,hw⟩ := Finset.mem_image.mp hw
    obtain ⟨hpair,hij⟩ := Finset.mem_filter.mp hij
    obtain ⟨hi,hj⟩ := Finset.mem_product.mp hpair
    obtain ⟨hi,hik⟩ := Finset.mem_Icc.mp hi
    obtain ⟨hj,hjm⟩ := Finset.mem_Icc.mp hj
    exact ⟨i,j,hi,hik,hj,hjm,hij,hw.symm⟩
  · rintro ⟨i,j,hi,hik,hj,hjm,hij,hw⟩
    apply Finset.mem_image.mpr
    refine ⟨(i,j),Finset.mem_filter.mpr ⟨?_,hij⟩,hw.symm⟩
    exact Finset.mem_product.mpr ⟨Finset.mem_Icc.mpr ⟨hi,hik⟩,
      Finset.mem_Icc.mpr ⟨hj,hjm⟩⟩

theorem difference_pos {a b i j : ℤ} (ha : 0 < a) (hb : 0 < b)
    (hi : 0 ≤ i) (hj : 0 ≤ j) (hij : 0 < i+j) : 0 < i*a+j*b := by
  by_cases hi0 : i=0
  · subst i
    have hjp : 0 < j := by omega
    simpa using mul_pos hjp hb
  · have hip : 0 < i := by omega
    have h1 := mul_pos hip ha
    have h2 := mul_nonneg hj (le_of_lt hb)
    omega

theorem mem_speeds {a b k m : ℤ} {d : ℕ} (ha : 0 < a) (hb : 0 < b) :
    d ∈ speeds a b k m ↔ ∃ i j : ℤ,
      0 ≤ i ∧ i ≤ k ∧ 0 ≤ j ∧ j ≤ m ∧ 0 < i+j ∧ (d:ℤ)=i*a+j*b := by
  constructor
  · intro hd
    obtain ⟨w,hw,hwd⟩ := List.mem_map.mp hd
    have hw' : w ∈ differences a b k m := Finset.mem_toList.mp hw
    obtain ⟨i,j,hi,hik,hj,hjm,hij,rfl⟩ := mem_differences.mp hw'
    refine ⟨i,j,hi,hik,hj,hjm,hij,?_⟩
    have hpos := difference_pos ha hb hi hj hij
    rw [←hwd,Int.toNat_of_nonneg (le_of_lt hpos)]
  · rintro ⟨i,j,hi,hik,hj,hjm,hij,hd⟩
    apply List.mem_map.mpr
    refine ⟨i*a+j*b,?_,?_⟩
    · exact Finset.mem_toList.mpr (mem_differences.mpr ⟨i,j,hi,hik,hj,hjm,hij,rfl⟩)
    · omega

theorem speeds_nonempty {a b k m : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m) : speeds a b k m ≠ [] := by
  have hd : b.toNat ∈ speeds a b k m := by
    apply (mem_speeds ha hb).mpr
    exact ⟨0,1,by omega,by omega,by omega,by omega,by omega,by simp [Int.toNat_of_nonneg (le_of_lt hb)]⟩
  intro hn
  rw [hn] at hd
  exact List.not_mem_nil hd

noncomputable def circleValue (a b k m : ℤ) : ℝ := Loneliness.value (speeds a b k m)

/-- Each rational-time clearance is the density of an actual periodic packing.
The minimum is attained by one of the forbidden differences, so its numerator
is integral and divisible by the character's kernel size. -/
theorem rational_character {a b k m : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m) (q : ℚ) :
    ∃ P p H : ℤ, CharacterCertificate a b k m P p H ∧
      Loneliness.clearance (speeds a b k m) (q:ℝ) = (H:ℝ)/(P:ℝ) := by
  let P : ℤ := q.den
  let p : ℤ := q.num
  have hP : 0 < P := by dsimp [P]; exact_mod_cast q.den_pos
  have hPR : (0:ℝ) < P := by exact_mod_cast hP
  have hq : (q:ℝ) = (p:ℝ)/(P:ℝ) := by simp only [Rat.cast_def,p,P,Int.cast_natCast]
  have hdistance : ∀ d : ℕ, Loneliness.distance ((d:ℝ)*(q:ℝ)) =
      ((min ((p*(d:ℤ))%P) (P-(p*(d:ℤ))%P) : ℤ):ℝ)/(P:ℝ) := by
    intro d
    have he : (d:ℝ)*(q:ℝ) = ((p*(d:ℤ):ℤ):ℝ)/(P:ℝ) := by rw [hq]; push_cast; ring
    rw [he,Loneliness.distance_int_div _ _ hP]
  obtain ⟨d,hd,heq⟩ := Loneliness.clearance_eq_member (speeds_nonempty ha hb hk hm) (q:ℝ)
  let H : ℤ := min ((p*(d:ℤ))%P) (P-(p*(d:ℤ))%P)
  have hratio : Loneliness.clearance (speeds a b k m) (q:ℝ) = (H:ℝ)/(P:ℝ) := by
    rw [heq,hdistance]
  have hr0 := Int.emod_nonneg (p*(d:ℤ)) (ne_of_gt hP)
  have hrP := Int.emod_lt_of_pos (p*(d:ℤ)) hP
  have hH : 0 ≤ H := le_min hr0 (by omega)
  have hhalf : 2*H ≤ P := by
    have h1 : H ≤ (p*(d:ℤ))%P := min_le_left _ _
    have h2 : H ≤ P-(p*(d:ℤ))%P := min_le_right _ _
    omega
  refine ⟨P,p,H,⟨hP,hH,hhalf,gcd_dvd_distance_numerator P p d,?_⟩,hratio⟩
  intro i j hi hik hj hjm hij
  have hwpos := difference_pos ha hb hi hj hij
  have hwcast : ((i*a+j*b).toNat:ℤ) = i*a+j*b := Int.toNat_of_nonneg (le_of_lt hwpos)
  have hwmem : (i*a+j*b).toNat ∈ speeds a b k m :=
    (mem_speeds ha hb).mpr ⟨i,j,hi,hik,hj,hjm,hij,hwcast⟩
  have hclear := Loneliness.clearance_le_of_mem hwmem (q:ℝ)
  rw [hratio,hdistance,hwcast] at hclear
  have hmin : H ≤ min ((p*(i*a+j*b))%P) (P-(p*(i*a+j*b))%P) := by
    exact_mod_cast (div_le_div_iff_of_pos_right hPR).mp hclear
  exact ⟨hmin.trans (min_le_left _ _),by have := hmin.trans (min_le_right _ _); omega⟩

theorem circleValue_le {a b k m U V d r : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m)
    (hbez : U*a+V*b=1) (heq : a-b=(k+m+1)*d+r)
    (hr0 : 0 ≤ r) (hrs : r < k+m+1) :
    circleValue a b k m ≤ densityValue a b k m d r := by
  apply Loneliness.value_le_of_rat
  intro q
  obtain ⟨P,p,H,hcert,hratio⟩ := rational_character ha hb hk hm q
  obtain ⟨hA,hdensity⟩ := hcert.packing
  have hbound := upperDensity_le ha hb hk hm hbez heq hr0 hrs hA
  rw [hdensity] at hbound
  rwa [hratio]

/-- A modular separation certificate gives a real unit-interval time with the
same clearance; the time numerator is reduced modulo the period. -/
theorem CharacterCertificate.le_circleValue {a b k m P p H : ℤ}
    (ha : 0 < a) (hb : 0 < b) (h : CharacterCertificate a b k m P p H) :
    (H:ℝ)/(P:ℝ) ≤ circleValue a b k m := by
  have hPR : (0:ℝ) < P := by exact_mod_cast h.period_pos
  let t : ℝ := ((p%P:ℤ):ℝ)/(P:ℝ)
  have ht : t ∈ Set.Icc (0:ℝ) 1 := by
    have hp0 := Int.emod_nonneg p (ne_of_gt h.period_pos)
    have hpP := Int.emod_lt_of_pos p h.period_pos
    constructor
    · dsimp [t]; positivity
    · dsimp [t]
      apply (div_le_one hPR).mpr
      exact_mod_cast le_of_lt hpP
  have hhalf : (H:ℝ)/(P:ℝ) ≤ 1/2 := by
    have hh : (2:ℝ)*(H:ℝ) ≤ (P:ℝ) := by exact_mod_cast h.window_half
    rw [div_le_iff₀ hPR]
    nlinarith only [hh]
  apply le_trans (Loneliness.le_clearance (ds:=speeds a b k m) (t:=t) hhalf ?_)
    (Loneliness.le_value ht)
  intro d hd
  obtain ⟨i,j,hi,hik,hj,hjm,hij,hdij⟩ := (mem_speeds ha hb).mp hd
  obtain ⟨hlo,hhi⟩ := h.separated i j hi hik hj hjm hij
  have hmod : (((p%P)*(d:ℤ))%P) = (p*(i*a+j*b))%P := by
    rw [hdij]
    simp only [Int.mul_emod,Int.emod_emod]
  have hmin : H ≤ min ((((p%P)*(d:ℤ))%P)) (P-(((p%P)*(d:ℤ))%P)) := by
    rw [hmod]
    exact le_min hlo (by omega)
  have he : (d:ℝ)*t = (((p%P)*(d:ℤ):ℤ):ℝ)/(P:ℝ) := by dsimp [t]; push_cast; ring
  rw [he,Loneliness.distance_int_div _ _ h.period_pos]
  apply (div_le_div_iff_of_pos_right hPR).mpr
  exact_mod_cast hmin

theorem circleValue_eq {a b k m U V d r : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m)
    (hbez : U*a+V*b=1) (heq : a-b=(k+m+1)*d+r)
    (hr0 : 0 ≤ r) (hrs : r < k+m+1) :
    circleValue a b k m = densityValue a b k m d r := by
  apply le_antisymm (circleValue_le ha hb hk hm hbez heq hr0 hrs)
  obtain ⟨P,p,H,hcert,hratio⟩ := optimal_character ha hb hk hm hbez heq hr0 hrs
  rw [←hratio]
  exact hcert.le_circleValue ha hb

end NonmixedGap
