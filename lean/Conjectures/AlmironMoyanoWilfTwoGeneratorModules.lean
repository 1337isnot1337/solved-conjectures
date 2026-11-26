import Conjectures.AlmironMoyanoWilfTwoGeneratorGaps

/-! The conductor and left count after adjoining one gap to a two-generated semigroup. -/

namespace AlmironMoyanoWilf.TwoGenerator

variable {a b g u v : ℕ}

abbrev moduleSet (a b g : ℕ) : Set ℕ := {x | gapModule (fun n => n ∈ semigroup a b) g x}

private theorem shifted_coordinates (h : Coordinates a b g u v) {i j : ℕ}
    (hi : i < u) (hj : j < v) :
    Coordinates a b (g + i*a + j*b) (u-i) (v-j) := by
  refine ⟨by omega, by omega, ?_⟩
  rw [Nat.sub_mul, Nat.sub_mul]
  have := Nat.mul_le_mul_right a hi.le
  have := Nat.mul_le_mul_right b hj.le
  have := h.eq
  omega

private theorem above_rectangle (ha : 0 < a) (hb : 0 < b)
    (h : Coordinates a b g u v) (i j : ℕ) (hout : u ≤ i ∨ v ≤ j) :
    g + i*a + j*b ∈ semigroup a b := by
  obtain ⟨hu,hv⟩ := h.bounds ha hb
  have he := h.eq
  apply mem_iff.mpr
  rcases hout with hi | hj
  · refine ⟨i-u,a-v+j,?_⟩
    have hia := Nat.mul_le_mul_right a hi
    have hvb := Nat.mul_le_mul_right b hv.le
    rw [Nat.sub_mul, Nat.add_mul, Nat.sub_mul]
    omega
  · refine ⟨b-u+i,j-v,?_⟩
    have hjb := Nat.mul_le_mul_right b hj
    have hua := Nat.mul_le_mul_right a hu.le
    rw [Nat.mul_comm b a] at hua
    rw [Nat.add_mul, Nat.sub_mul, Nat.sub_mul, Nat.mul_comm b a]
    omega

private theorem shifted_eq {x s t : ℕ} (h : Coordinates a b g u v)
    (hx : Coordinates a b x s t) (hs : s ≤ u) (ht : t ≤ v) :
    g + (u-s)*a + (v-t)*b = x := by
  rw [Nat.sub_mul, Nat.sub_mul]
  have := Nat.mul_le_mul_right a hs
  have := Nat.mul_le_mul_right b ht
  have := h.eq
  have := hx.eq
  omega

theorem module_iff {x s t : ℕ} (ha : 0 < a) (hb : 0 < b) (cop : a.Coprime b)
    (h : Coordinates a b g u v) (hx : Coordinates a b x s t) :
    x ∈ moduleSet a b g ↔ s ≤ u ∧ t ≤ v := by
  change gapModule _ _ _ ↔ _
  rw [gapModule_iff]
  constructor
  · rintro (hin | ⟨y, hy, hxy⟩)
    · exact (hx.not_mem cop hin).elim
    · obtain ⟨i,j,rfl⟩ := mem_iff.mp hy
      have he : x = g + i*a + j*b := by omega
      have hout : ¬(u ≤ i ∨ v ≤ j) := fun hh => hx.not_mem cop (he ▸ above_rectangle ha hb h i j hh)
      have shifted := shifted_coordinates h (i := i) (j := j) (by omega) (by omega)
      rw [← he] at shifted
      obtain ⟨hs,ht⟩ := hx.unique ha hb cop shifted
      omega
  · rintro ⟨hs, ht⟩
    refine Or.inr ⟨(u-s)*a + (v-t)*b, mem_iff.mpr ⟨_,_,rfl⟩, ?_⟩
    have := shifted_eq h hx hs ht
    omega

theorem conductor (ha : 1 < a) (hb : 1 < b) (cop : a.Coprime b)
    (h : Coordinates a b g u v) :
    IsConductor (fun x => x ∈ moduleSet a b g) (frobenius a b + 1 - min (u*a) (v*b)) := by
  have hab := Nat.add_le_mul ha hb
  have hF : frobenius a b + a + b = a*b := by unfold frobenius; omega
  constructor
  · intro x hbound
    by_contra hnot
    have hx : x ∉ semigroup a b := fun hm => hnot (Or.inl hm)
    obtain ⟨s,t,coords⟩ := coordinates_of_gap ha hb cop hx
    have hout := mt (module_iff (by omega) (by omega) cop h coords).mpr hnot
    have he := coords.eq
    have hsa := Nat.mul_le_mul_right a coords.left_pos
    have htb := Nat.mul_le_mul_right b coords.right_pos
    simp only [Nat.one_mul] at hsa htb
    by_cases hsu : u < s
    · have hh := Nat.mul_le_mul_right a (Nat.succ_le_of_lt hsu)
      rw [Nat.succ_mul] at hh
      omega
    · have hh := Nat.mul_le_mul_right b (show v+1 ≤ t by omega)
      rw [Nat.succ_mul] at hh
      omega
  · intro k hk
    let d := min (u*a) (v*b)
    have hd : d ≤ frobenius a b := by dsimp [d]; omega
    refine ⟨frobenius a b - d, by change k ≤ frobenius a b - min _ _; omega, ?_⟩
    rcases le_total (u*a) (v*b) with hmin | hmin
    · have heq : d = u*a := min_eq_left hmin
      have coords : Coordinates a b (frobenius a b - d) (u+1) 1 := by
        refine ⟨by omega, by decide, ?_⟩
        simp only [Nat.add_mul, Nat.one_mul]
        omega
      change frobenius a b - d ∉ moduleSet a b g
      rw [module_iff (by omega) (by omega) cop h coords]
      omega
    · have heq : d = v*b := min_eq_right hmin
      have coords : Coordinates a b (frobenius a b - d) 1 (v+1) := by
        refine ⟨by decide, by omega, ?_⟩
        simp only [Nat.add_mul, Nat.one_mul]
        omega
      change frobenius a b - d ∉ moduleSet a b g
      rw [module_iff (by omega) (by omega) cop h coords]
      omega

open Classical in
theorem filled_card (ha : 1 < a) (hb : 1 < b) (cop : a.Coprime b)
    (h : Coordinates a b g u v) :
    ((gaps (semigroup a b : Set ℕ) (frobenius a b + 1)).filter
      (fun x => x ∈ moduleSet a b g)).card = u*v := by
  classical
  let box := (Finset.range u) ×ˢ (Finset.range v)
  let val (p : ℕ × ℕ) := g + p.1*a + p.2*b
  have bounds {p : ℕ × ℕ} : p ∈ box ↔ p.1 < u ∧ p.2 < v := by simp [box]
  have he : (gaps (semigroup a b : Set ℕ) (frobenius a b + 1)).filter
        (fun x => x ∈ moduleSet a b g) = box.image val := by
    ext x
    constructor
    · intro hx
      obtain ⟨hxold, hxm⟩ := Finset.mem_filter.mp hx
      have hgap : x ∉ semigroup a b := (Finset.mem_filter.mp hxold).2
      obtain ⟨s,t,hxcoords⟩ := coordinates_of_gap ha hb cop hgap
      obtain ⟨hs,ht⟩ := (module_iff (by omega) (by omega) cop h hxcoords).mp hxm
      have hsp := hxcoords.left_pos
      have htp := hxcoords.right_pos
      exact Finset.mem_image.mpr ⟨(u-s,v-t), bounds.mpr ⟨by dsimp; omega, by dsimp; omega⟩,
        shifted_eq h hxcoords hs ht⟩
    · intro hx
      obtain ⟨p,hp,rfl⟩ := Finset.mem_image.mp hx
      obtain ⟨hi,hj⟩ := bounds.mp hp
      have hh := shifted_coordinates h hi hj
      have hnot := hh.not_mem cop
      have hF := (frobeniusNumber_pair cop ha hb).2 hnot
      exact Finset.mem_filter.mpr ⟨Finset.mem_filter.mpr ⟨Finset.mem_range.mpr
        (Nat.lt_succ_of_le hF), hnot⟩, (module_iff (by omega) (by omega) cop h hh).mpr
          ⟨Nat.sub_le .., Nat.sub_le ..⟩⟩
  rw [he, Finset.card_image_of_injOn]
  · simp [box]
  · intro p hp p' hp' heq
    obtain ⟨hi,hj⟩ := bounds.mp hp
    obtain ⟨hi',hj'⟩ := bounds.mp hp'
    have h1 := shifted_coordinates h hi hj
    have h2 := shifted_coordinates h hi' hj'
    change val p = val p' at heq
    change Coordinates a b (val p) _ _ at h1
    change Coordinates a b (val p') _ _ at h2
    rw [heq] at h1
    obtain ⟨hs,ht⟩ := h1.unique (by omega) (by omega) cop h2
    exact Prod.ext (by omega) (by omega)

open Classical in
theorem module_counts (ha : 1 < a) (hb : 1 < b) (cop : a.Coprime b)
    (h : Coordinates a b g u v) :
    let C := frobenius a b + 1
    let c := C - min (u*a) (v*b)
    2 * leftCount (fun x => x ∈ moduleSet a b g) c + C = 2*c + 2*(u*v) := by
  classical
  let C := frobenius a b + 1
  let c := C - min (u*a) (v*b)
  let original := gaps (semigroup a b : Set ℕ) C
  let D := moduleSet a b g
  have hc := conductor ha hb cop h
  have hbnd : c ≤ C := Nat.sub_le ..
  have he : gaps D c = original.filter (fun x => x ∉ D) := by
    ext x
    simp only [gaps, original, Finset.mem_filter, Finset.mem_range]
    constructor
    · rintro ⟨hxc, hx⟩
      exact ⟨⟨hxc.trans_le hbnd, fun hS => hx (Or.inl hS)⟩, hx⟩
    · rintro ⟨⟨hxC,_⟩,hx⟩
      exact ⟨lt_of_not_ge (fun hxc => hx (hc.1 x hxc)), hx⟩
  have hpart := Finset.card_filter_add_card_filter_not (s := original) (fun x => x ∈ D)
  have hfill := filled_card ha hb cop h
  change (original.filter (fun x => x ∈ D)).card = u*v at hfill
  rw [← he,hfill] at hpart
  have hgen := genus ha hb cop
  change 2 * original.card = C at hgen
  have hleft := leftCount_add_gaps D c
  change 2 * leftCount (fun x => x ∈ D) c + C = 2*c + 2*(u*v)
  omega

end AlmironMoyanoWilf.TwoGenerator
