module

public import Conjectures.HKMEhrhartGeometry
import all Conjectures.HKMEhrhartGeometry

public section
namespace HKMEhrhart
open Set Finset
open scoped BigOperators Pointwise

variable {ι κ : Type*} [Fintype ι] [DecidableEq ι]

omit [Fintype ι] in
theorem multipartiteEdgePolytope_add_dilates (part : ι → κ)
    {a b : ℝ} (ha : 0 ≤ a) (hb : 0 ≤ b) {x y : ι → ℝ}
    (hx : x ∈ a • multipartiteEdgePolytope part)
    (hy : y ∈ b • multipartiteEdgePolytope part) :
    x+y ∈ (a+b) • multipartiteEdgePolytope part := by
  have hconv : Convex ℝ (multipartiteEdgePolytope part) := convex_convexHull ℝ _
  rw [hconv.add_smul ha hb]
  exact Set.add_mem_add hx hy

omit [Fintype ι] in
theorem multipartiteEdgePolytope_dilate_mono (part : ι → κ)
    (hpart : ∃ i j, part i ≠ part j) {a b : ℝ} (ha : 0 ≤ a) (hab : a ≤ b)
    {x : ι → ℝ} (hx : x ∈ a • multipartiteEdgePolytope part) :
    x ∈ b • multipartiteEdgePolytope part := by
  have hz : (0:ι → ℝ) ∈ (b-a) • multipartiteEdgePolytope part :=
    ⟨0,multipartiteEdgePolytope_zero_mem part hpart,smul_zero _⟩
  have he := multipartiteEdgePolytope_add_dilates part ha (sub_nonneg.mpr hab) hx hz
  simpa only [add_zero, add_sub_cancel] using he

omit [Fintype ι] in
theorem multipartiteEdgePolytope_weighted_sum_dilate {α : Type*} (s : Finset α)
    (part : ι → κ) (hpart : ∃ i j, part i ≠ part j)
    (w : α → ℝ) (v : α → ι → ℝ)
    (hw : ∀ i ∈ s, 0 ≤ w i) (hv : ∀ i ∈ s, v i ∈ multipartiteEdgePolytope part) :
    (∑ i ∈ s, w i • v i) ∈ (∑ i ∈ s, w i) • multipartiteEdgePolytope part := by
  classical
  induction s using Finset.induction_on with
  | empty =>
    simp only [Finset.sum_empty]
    exact ⟨0,multipartiteEdgePolytope_zero_mem part hpart,smul_zero _⟩
  | insert i s hi ih =>
    simp only [Finset.sum_insert hi]
    have hsum : 0 ≤ ∑ j ∈ s, w j := sum_nonneg fun j hj => hw j (Finset.mem_insert_of_mem hj)
    have ha : w i • v i ∈ w i • multipartiteEdgePolytope part :=
      ⟨v i,hv i (Finset.mem_insert_self i s),rfl⟩
    exact multipartiteEdgePolytope_add_dilates part (hw i (Finset.mem_insert_self i s)) hsum ha
      (ih (fun j hj => hw j (Finset.mem_insert_of_mem hj))
        (fun j hj => hv j (Finset.mem_insert_of_mem hj)))

/-- In the case of support in one part, the whole signed vector can be routed
through any vertex outside the part. -/
theorem multipartiteEdgePolytope_mem_dilate_single_part [DecidableEq κ]
    (part : ι → κ) (hpart : ∃ i j, part i ≠ part j) (c : κ) (p : ι) (hp : part p ≠ c)
    {m : ℝ} {z : ι → ℝ} (hzero : ∑ i, z i = 0)
    (hsupp : ∀ i, z i ≠ 0 → part i = c) (hM : ∑ i, |z i| ≤ m) :
    z ∈ m • multipartiteEdgePolytope part := by
  let e : ι → ι → ℝ := fun i => Pi.single i 1 - Pi.single p 1
  let v : ι → ι → ℝ := fun i => if z i=0 then 0 else if 0 ≤ z i then e i else -e i
  have hv (i : ι) : v i ∈ multipartiteEdgePolytope part := by
    by_cases h : z i = 0
    · simpa only [v,ite_eq_left h] using multipartiteEdgePolytope_zero_mem part hpart
    · have hp' : part i ≠ part p := fun hn => hp (hn.symm.trans (hsupp i h))
      have hp₁ : e i ∈ multipartiteEdgePolytope part := multipartiteEdgePolytope_edge_mem part hp'
      have hp₂ : -e i ∈ multipartiteEdgePolytope part := by
        have hrev : -e i = Pi.single p 1 - Pi.single i 1 := by unfold e; abel
        rw [hrev]
        exact multipartiteEdgePolytope_edge_mem part hp'.symm
      unfold v
      rw [ite_eq_right h]
      split <;> assumption
  have he (i : ι) : |z i| • v i = z i • e i := by
    by_cases h : z i = 0
    · simp [v,h]
    · by_cases h' : 0 ≤ z i
      · simp [v,h,h',abs_of_nonneg h']
      · simp [v,h,h',abs_of_neg (lt_of_not_ge h')]
  have hsum : (∑ i, |z i| • v i) = z := by
    simp_rw [he, e, smul_sub, Finset.sum_sub_distrib, ← Finset.sum_smul, hzero, zero_smul, sub_zero]
    ext k
    rw [Finset.sum_apply, Finset.sum_eq_single k]
    · simp
    · intro j _ hj
      have hkj : k ≠ j := Ne.symm hj
      simp [hkj]
    · simp
  have hmem := multipartiteEdgePolytope_weighted_sum_dilate Finset.univ part hpart
    (fun i => |z i|) v (fun i _ => abs_nonneg _) (fun i _ => hv i)
  rw [hsum] at hmem
  exact multipartiteEdgePolytope_dilate_mono part hpart
    (sum_nonneg (fun i _ => abs_nonneg (z i))) hM hmem


section IntegerMass
variable [DecidableEq κ]

def hkmPositiveSum (z : ι → ℤ) : ℤ := ∑ i, max (z i) 0

def hkmPartAbsSum (part : ι → κ) (z : ι → ℤ) (c : κ) : ℤ :=
  ∑ i ∈ (Finset.univ.filter fun i => part i = c), |z i|

def hkmCrossPair (part : ι → κ) (z : ι → ℤ) (i j : ι) : Prop :=
  0 < z i ∧ z j < 0 ∧ part i ≠ part j

omit [DecidableEq ι] in
theorem hkm_sum_abs_eq_twice_positive {z : ι → ℤ} (h : ∑ i, z i = 0) :
    ∑ i, |z i| = 2*hkmPositiveSum z := by
  have hi (i : ι) : |z i| = 2*max (z i) 0-z i := by
    by_cases hz : 0 ≤ z i
    · rw [abs_of_nonneg hz,max_eq_left hz]; ring
    · rw [abs_of_neg (lt_of_not_ge hz),max_eq_right (le_of_lt (lt_of_not_ge hz))]; ring
  simp_rw [hi]
  rw [sum_sub_distrib, ← mul_sum, h, sub_zero]
  rfl

omit [DecidableEq ι] in
theorem hkm_exists_inside_nonzero (part : ι → κ) (z : ι → ℤ) {c : κ}
    (h : 0 < hkmPartAbsSum part z c) : ∃ i, part i = c ∧ z i ≠ 0 := by
  unfold hkmPartAbsSum at h
  have hh := (Finset.sum_pos_iff_of_nonneg (fun i _ => abs_nonneg (z i))).mp h
  obtain ⟨i,hi,hi'⟩ := hh
  exact ⟨i,(Finset.mem_filter.mp hi).2,fun hz => by simp [hz] at hi'⟩

omit [DecidableEq ι] in
theorem hkm_cross_touches_part (part : ι → κ) (z : ι → ℤ) (hzero : ∑ i,z i=0)
    {c : κ} {i j : ι} (hi : part i = c) (hj : part j ≠ c) (hzi : z i ≠ 0) (hzj : z j ≠ 0) :
    ∃ a b, hkmCrossPair part z a b ∧ (part a=c ∨ part b=c) := by
  have hnon : ∃ k ∈ (Finset.univ : Finset ι), z k ≠ 0 := ⟨i,Finset.mem_univ _,hzi⟩
  have hpart_diff : part i ≠ part j := fun h => hj (h.symm.trans hi)
  by_cases ip : 0 < z i
  · by_cases jn : z j < 0
    · exact ⟨i,j,⟨ip,jn,hpart_diff⟩,Or.inl hi⟩
    · have jp : 0 < z j := by omega
      obtain ⟨k,_,kn⟩ := Finset.exists_neg_of_sum_zero_of_exists_nonzero z hzero hnon
      by_cases hk : part k=c
      · exact ⟨j,k,⟨jp,kn,fun h => hj (h.trans hk)⟩,Or.inr hk⟩
      · exact ⟨i,k,⟨ip,kn,fun h => hk (h.symm.trans hi)⟩,Or.inl hi⟩
  · have ineg : z i < 0 := by omega
    by_cases jp : 0 < z j
    · exact ⟨j,i,⟨jp,ineg,hpart_diff.symm⟩,Or.inr hi⟩
    · have jneg : z j < 0 := by omega
      obtain ⟨k,_,kp⟩ := Finset.exists_pos_of_sum_zero_of_exists_nonzero z hzero hnon
      by_cases hk : part k=c
      · exact ⟨k,j,⟨kp,jneg,fun h => hj (h.symm.trans hk)⟩,Or.inl hk⟩
      · exact ⟨k,i,⟨kp,ineg,fun h => hk (h.trans hi)⟩,Or.inr hi⟩

omit [DecidableEq ι] in
theorem hkm_support_single_of_no_cross (part : ι → κ) (z : ι → ℤ) (hzero : ∑ i,z i=0)
    (hnon : ∃ i, z i ≠ 0) (hcross : ¬∃ a b, hkmCrossPair part z a b) :
    ∃ c, ∀ i, z i ≠ 0 → part i=c := by
  obtain ⟨i,hi⟩ := hnon
  refine ⟨part i,fun j hj => ?_⟩
  by_contra hp
  obtain ⟨a,b,h,_⟩ := hkm_cross_touches_part part z hzero rfl hp hi hj
  exact hcross ⟨a,b,h⟩

omit [DecidableEq ι] in
theorem hkm_support_two_of_saturated (part : ι → κ) (z : ι → ℤ)
    {c d : κ} (hcd : c ≠ d) {m : ℤ}
    (habs : ∑ i, |z i| ≤ 2*m)
    (hc : hkmPartAbsSum part z c=m) (hd : hkmPartAbsSum part z d=m) :
    ∀ i, z i ≠ 0 → part i=c ∨ part i=d := by
  let R : ι → ℤ := fun i => if part i=c ∨ part i=d then 0 else |z i|
  have hR (i : ι) : 0 ≤ R i := by unfold R; split_ifs <;> simp
  have he : (∑ i, |z i|) = hkmPartAbsSum part z c+hkmPartAbsSum part z d+(∑ i,R i) := by
    unfold hkmPartAbsSum
    rw [Finset.sum_filter, Finset.sum_filter, ← sum_add_distrib, ← sum_add_distrib]
    apply sum_congr rfl
    intro i _
    by_cases hi : part i=c
    · simp [R,hi,hcd]
    · by_cases hi' : part i=d
      · simp [R,hi',hcd.symm]
      · simp [R,hi,hi']
  rw [he,hc,hd] at habs
  intro i hi
  by_contra hh
  have h := Finset.single_le_sum (fun j _ => hR j) (Finset.mem_univ i)
  have hh' : R i = |z i| := by simp [R,hh]
  rw [hh'] at h
  have := abs_pos.mpr hi
  omega

omit [DecidableEq ι] in
theorem hkm_cross_cover_saturated (part : ι → κ) (z : ι → ℤ)
    (hzero : ∑ i,z i=0) {m : ℤ} (hm : 0 < m) (habs : ∑ i, |z i| ≤ 2*m)
    (hcross : ∃ a b, hkmCrossPair part z a b) :
    ∃ a b, hkmCrossPair part z a b ∧ ∀ c, hkmPartAbsSum part z c=m → part a=c ∨ part b=c := by
  classical
  obtain ⟨a,b,ha,hb,hab⟩ := hcross
  by_cases hex : ∃ c, hkmPartAbsSum part z c=m
  · obtain ⟨c,hc⟩ := hex
    by_cases hex' : ∃ d, c≠d ∧ hkmPartAbsSum part z d=m
    · obtain ⟨d,hcd,hd⟩ := hex'
      have hs := hkm_support_two_of_saturated part z hcd habs hc hd
      have has := hs a ha.ne'
      have hbs := hs b hb.ne
      refine ⟨a,b,⟨ha,hb,hab⟩,fun q hq => ?_⟩
      obtain ⟨i,hiq,hi⟩ := hkm_exists_inside_nonzero part z (hq.symm ▸ hm)
      rcases hs i hi with hc' | hd'
      · have he : q=c := hiq.symm.trans hc'
        rw [he]
        rcases has with h | h
        · exact Or.inl h
        · exact Or.inr (hbs.resolve_right (fun hb' => hab (h.trans hb'.symm)))
      · have he : q=d := hiq.symm.trans hd'
        rw [he]
        rcases has with h | h
        · exact Or.inr (hbs.resolve_left (fun hb' => hab (h.trans hb'.symm)))
        · exact Or.inl h
    · obtain ⟨i,hi,hzi⟩ := hkm_exists_inside_nonzero part z (hc.symm ▸ hm)
      have hj : ∃ j, part j≠c ∧ z j≠0 := by
        by_cases ha' : part a=c
        · exact ⟨b,fun hb' => hab (ha'.trans hb'.symm),hb.ne⟩
        · exact ⟨a,ha',ha.ne'⟩
      obtain ⟨j,hj,hzj⟩ := hj
      obtain ⟨a',b',h,hs⟩ := hkm_cross_touches_part part z hzero hi hj hzi hzj
      refine ⟨a',b',h,fun q hq => ?_⟩
      have he : c=q := by by_contra hne; exact hex' ⟨q,hne,hq⟩
      simpa only [← he] using hs
  · exact ⟨a,b,⟨ha,hb,hab⟩,fun c hc => (hex ⟨c,hc⟩).elim⟩

def hkmRemovePair (z : ι → ℤ) (i j : ι) : ι → ℤ :=
  z - Pi.single i 1 + Pi.single j 1

omit [Fintype ι] in
theorem hkmRemovePair_apply (z : ι → ℤ) (i j k : ι) :
    hkmRemovePair z i j k = z k - (if k=i then 1 else 0) + (if k=j then 1 else 0) := by
  simp [hkmRemovePair,Pi.single_apply]

theorem hkmRemovePair_sum (z : ι → ℤ) (i j : ι) :
    (∑ k, hkmRemovePair z i j k) = ∑ k, z k := by
  simp only [hkmRemovePair_apply,sum_add_distrib,sum_sub_distrib,Finset.sum_ite_eq',
    Finset.mem_univ,ite_true,sub_add_cancel]

omit [DecidableEq κ] in
theorem hkmRemovePair_positiveSum (part : ι → κ) (z : ι → ℤ) {i j : ι}
    (h : hkmCrossPair part z i j) :
    hkmPositiveSum (hkmRemovePair z i j) = hkmPositiveSum z - 1 := by
  obtain ⟨hi,hj,hp⟩ := h
  have hij : i ≠ j := fun he => hp (congrArg part he)
  have hterm (k : ι) : max (hkmRemovePair z i j k) 0 = max (z k) 0 - (if k=i then 1 else 0) := by
    by_cases hk : k=i
    · subst k
      rw [hkmRemovePair_apply]
      simp only [hij,eq_self,ite_true,ite_false,add_zero]
      omega
    · by_cases hk' : k=j
      · subst k
        rw [hkmRemovePair_apply]
        simp only [hij.symm,eq_self,ite_true,ite_false,sub_zero]
        omega
      · simp [hkmRemovePair_apply,hk,hk']
  unfold hkmPositiveSum
  simp_rw [hterm]
  simp only [sum_sub_distrib,Finset.sum_ite_eq',Finset.mem_univ,ite_true]

theorem hkmRemovePair_partAbsSum (part : ι → κ) (z : ι → ℤ) {i j : ι}
    (h : hkmCrossPair part z i j) (c : κ) :
    hkmPartAbsSum part (hkmRemovePair z i j) c = hkmPartAbsSum part z c -
      (if part i=c then 1 else 0) - (if part j=c then 1 else 0) := by
  obtain ⟨hi,hj,hp⟩ := h
  have hij : i ≠ j := fun he => hp (congrArg part he)
  have hterm (k : ι) : |hkmRemovePair z i j k| =
      |z k| - (if k=i then 1 else 0) - (if k=j then 1 else 0) := by
    by_cases hk : k=i
    · subst k
      rw [hkmRemovePair_apply]
      simp only [hij,eq_self,ite_true,ite_false,add_zero,sub_zero]
      have hh : 0 ≤ z i - 1 := by omega
      rw [abs_of_nonneg hh,abs_of_pos hi]
    · by_cases hk' : k=j
      · subst k
        rw [hkmRemovePair_apply]
        simp only [hij.symm,eq_self,ite_true,ite_false,sub_zero]
        have hz : z j + 1 ≤ 0 := by omega
        rw [abs_of_nonpos hz,abs_of_neg hj]
        ring
      · simp [hkmRemovePair_apply,hk,hk']
  unfold hkmPartAbsSum
  simp_rw [hterm]
  simp [sum_sub_distrib, Finset.sum_ite_eq']

theorem hkm_lattice_mass_sufficient (part : ι → κ) (hpart : ∃ i j, part i ≠ part j)
    (m : ℕ) (z : ι → ℤ) (hzero : ∑ i,z i=0)
    (hpos : hkmPositiveSum z ≤ (m:ℤ))
    (habs : ∀ c, hkmPartAbsSum part z c ≤ (m:ℤ)) :
    z ∈ multipartiteLatticePoints part m := by
  induction m generalizing z with
  | zero =>
    have h := hkm_sum_abs_eq_twice_positive hzero
    have he (i : ι) : z i=0 := by
      have hi := Finset.single_le_sum (fun j _ => abs_nonneg (z j)) (Finset.mem_univ i)
      have hp : hkmPositiveSum z ≤ 0 := by simpa using hpos
      have ha : |z i| ≤ 0 := by omega
      exact abs_eq_zero.mp (le_antisymm ha (abs_nonneg _))
    change (fun i => (z i:ℝ)) ∈ ((0:ℕ):ℝ) • multipartiteEdgePolytope part
    rw [Nat.cast_zero]
    have hh : (fun i => (z i:ℝ)) = 0 := by funext i; simp [he i]
    rw [hh]
    exact ⟨0,multipartiteEdgePolytope_zero_mem part hpart,smul_zero _⟩
  | succ m ih =>
    by_cases hc : ∃ i j, hkmCrossPair part z i j
    · have habsTotal : ∑ i, |z i| ≤ 2*((m+1:ℕ):ℤ) :=
        (hkm_sum_abs_eq_twice_positive hzero).le.trans (by omega)
      have hm : 0 < ((m+1:ℕ):ℤ) := by positivity
      obtain ⟨i,j,hc,hcover⟩ := hkm_cross_cover_saturated part z hzero hm habsTotal hc
      let z' := hkmRemovePair z i j
      have h0 : ∑ k,z' k=0 := (hkmRemovePair_sum z i j).trans hzero
      have h1 : hkmPositiveSum z' ≤ (m:ℤ) := by
        change hkmPositiveSum (hkmRemovePair z i j) ≤ (m:ℤ)
        rw [hkmRemovePair_positiveSum part z hc]
        omega
      have h2 (c : κ) : hkmPartAbsSum part z' c ≤ (m:ℤ) := by
        change hkmPartAbsSum part (hkmRemovePair z i j) c ≤ (m:ℤ)
        rw [hkmRemovePair_partAbsSum part z hc]
        have hle := habs c
        by_cases hEq : hkmPartAbsSum part z c=((m+1:ℕ):ℤ)
        · rcases hcover c hEq with h | h
          · rw [ite_eq_left h]; split_ifs <;> omega
          · rw [ite_eq_left h]; split_ifs <;> omega
        · split_ifs <;> omega
      have hmem := ih z' h0 h1 h2
      let e : ι → ℝ := Pi.single i 1-Pi.single j 1
      have he : e ∈ (1:ℝ) • multipartiteEdgePolytope part := by
        rw [one_smul]
        exact multipartiteEdgePolytope_edge_mem part hc.2.2
      have hs := multipartiteEdgePolytope_add_dilates part (Nat.cast_nonneg m) zero_le_one hmem he
      have hz : (fun k => (z' k:ℝ))+e = fun k => (z k:ℝ) := by
        ext k
        simp only [Pi.add_apply,Pi.sub_apply,e,Pi.single_apply,z',hkmRemovePair_apply]
        push_cast
        split_ifs <;> ring
      rw [hz,← Nat.cast_succ] at hs
      exact hs
    · by_cases hn : ∃ i, z i≠0
      · obtain ⟨c,hc'⟩ := hkm_support_single_of_no_cross part z hzero hn hc
        obtain ⟨i,j,hij⟩ := hpart
        have hP : ∃ p, part p≠c := by
          by_cases h : part i=c
          · exact ⟨j,fun h' => hij (h.trans h'.symm)⟩
          · exact ⟨i,h⟩
        obtain ⟨p,hp⟩ := hP
        have hA : ∑ i, |z i| = hkmPartAbsSum part z c := by
          unfold hkmPartAbsSum
          rw [Finset.sum_filter]
          apply Finset.sum_congr rfl
          intro k _
          by_cases h : part k=c
          · simp [h]
          · have hz : z k=0 := by by_contra hn; exact h (hc' k hn)
            simp [h,hz]
        have hReal : ∑ i, |(z i:ℝ)| ≤ ((m+1:ℕ):ℝ) := by exact_mod_cast hA.le.trans (habs c)
        have hSum : ∑ i, (z i:ℝ)=0 := by exact_mod_cast hzero
        have hSupp (i : ι) (h : (z i:ℝ) ≠ 0) : part i=c :=
          hc' i (fun hz => h (by simp [hz]))
        exact multipartiteEdgePolytope_mem_dilate_single_part part ⟨i,j,hij⟩ c p hp hSum hSupp hReal
      · have hz (i : ι) : z i=0 := by by_contra h; exact hn ⟨i,h⟩
        change (fun i => (z i:ℝ)) ∈ ((m+1:ℕ):ℝ) • multipartiteEdgePolytope part
        have h : (fun i => (z i:ℝ))=0 := by funext i; simp [hz i]
        rw [h]
        exact ⟨0,multipartiteEdgePolytope_zero_mem part hpart,smul_zero _⟩

/-- The exact all-dilation lattice-point characterization, including zero
budget. The forward bound comes from the literal convex hull; the reverse
direction sends a saturated-part-crossing edge at each induction step. -/
theorem hkm_lattice_mass_iff (part : ι → κ) (hpart : ∃ i j, part i ≠ part j)
    (m : ℕ) (z : ι → ℤ) :
    z ∈ multipartiteLatticePoints part m ↔
    (∑ i,z i=0) ∧ hkmPositiveSum z ≤ (m:ℤ) ∧
      ∀ c, hkmPartAbsSum part z c ≤ (m:ℤ) := by
  constructor
  · exact multipartiteLatticePoints_signed_mass_necessary part m
  · rintro ⟨h0,h1,h2⟩
    exact hkm_lattice_mass_sufficient part hpart m z h0 h1 h2

end IntegerMass
end HKMEhrhart
