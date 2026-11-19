import Conjectures.NonmixedGapDensity

namespace NonmixedGap

def residueSlice (A : Set ℤ) (g r : ℤ) : Set ℤ := {t | r+g*t ∈ A}

/-- Exact decomposition into the residue classes of a positive scale. -/
theorem count_residue_blocks (A : Set ℤ) {g : ℤ} (hg : 0 < g) (u v : ℤ) :
    count A (g*u) (g*v) =
      ∑ r ∈ Finset.Ico 0 g, count (residueSlice A g r) u v := by
  classical
  have hcard := Finset.card_eq_sum_card_fiberwise
    (s:=occupied A (g*u) (g*v)) (t:=Finset.Ico 0 g) (f:=fun x : ℤ => x%g)
    (by
      intro x hx
      exact Finset.mem_Ico.mpr ⟨Int.emod_nonneg _ (ne_of_gt hg),Int.emod_lt_of_pos _ hg⟩)
  change (occupied A (g*u) (g*v)).card = _
  rw [hcard]
  apply Finset.sum_congr rfl
  intro r hr
  obtain ⟨hr0,hrg⟩ := Finset.mem_Ico.mp hr
  symm
  unfold count
  apply Finset.card_bij (fun t _ => r+g*t)
  · intro t ht
    obtain ⟨htu,htv,htA⟩ := mem_occupied.mp ht
    apply Finset.mem_filter.mpr
    refine ⟨mem_occupied.mpr ⟨?_,?_,htA⟩,?_⟩
    · have hh := mul_le_mul_of_nonneg_left htu (le_of_lt hg)
      linarith only [hh,hr0]
    · have hh := mul_le_mul_of_nonneg_left (show t+1 ≤ v by omega) (le_of_lt hg)
      nlinarith only [hh,hrg]
    · simp only [Int.add_emod,Int.mul_emod,Int.emod_self,zero_mul,Int.zero_emod,add_zero,
        Int.emod_eq_of_lt hr0 hrg]
  · intro t ht t' ht' he
    have hh : g*t=g*t' := by omega
    exact mul_left_cancel₀ (ne_of_gt hg) hh
  · intro x hx
    obtain ⟨hx,hxr⟩ := Finset.mem_filter.mp hx
    obtain ⟨hxu,hxv,hxA⟩ := mem_occupied.mp hx
    have hxsplit := Int.emod_add_mul_ediv x g
    rw [hxr] at hxsplit
    refine ⟨x/g,mem_occupied.mpr ⟨?_,?_,?_⟩,by omega⟩
    · apply (Int.le_ediv_iff_mul_le hg).mpr
      nlinarith only [hxu]
    · apply (Int.ediv_lt_iff_lt_mul hg).mpr
      nlinarith only [hxv]
    · change r+g*(x/g) ∈ A
      rwa [hxsplit]

/-- Uniform estimates on every residue class give a uniform estimate on the
whole set. The error is independent of the interval's location and length. -/
theorem uniform_count_from_residues (A : Set ℤ) {g : ℤ} (hg : 0 < g)
    (δ C : ℝ) (hδ : 0 ≤ δ)
    (h : ∀ r : ℤ, 0 ≤ r → r < g → ∀ u v : ℤ, u ≤ v →
      (count (residueSlice A g r) u v : ℝ) ≤ δ*(v-u)+C) :
    ∀ u v : ℤ, u ≤ v →
      (count A u v : ℝ) ≤ δ*(v-u)+(g:ℝ)*(2*δ+C) := by
  intro u v huv
  have hum := Int.emod_nonneg u (ne_of_gt hg)
  have hvm := Int.emod_lt_of_pos v hg
  have hug := Int.emod_lt_of_pos u hg
  have hvg := Int.emod_nonneg v (ne_of_gt hg)
  have huq := Int.emod_add_mul_ediv u g
  have hvq := Int.emod_add_mul_ediv v g
  have hulo : g*(u/g) ≤ u := by omega
  have hvhi : v ≤ g*(v/g+1) := by nlinarith only [hvq,hvm]
  have hqq : u/g ≤ v/g+1 := by
    have hh := Int.ediv_le_ediv hg huv
    omega
  have hlen : g*(v/g+1-u/g) ≤ v-u+2*g := by nlinarith only [huq,hvq,hug,hvg]
  have hmono : (count A u v : ℝ) ≤ (count A (g*(u/g)) (g*(v/g+1)) : ℝ) := by
    exact_mod_cast count_mono A hulo hvhi
  have hc : ((Finset.Ico 0 g).card : ℝ) = (g:ℝ) := by
    have hh := Int.card_Ico_of_le 0 g (le_of_lt hg)
    simp only [sub_zero] at hh
    exact_mod_cast hh
  have hsum : (count A (g*(u/g)) (g*(v/g+1)) : ℝ) ≤
      (g:ℝ)*(δ*((v/g+1-u/g:ℤ):ℝ)+C) := by
    rw [count_residue_blocks A hg]
    rw [Nat.cast_sum]
    calc
      _ ≤ ∑ r ∈ Finset.Ico 0 g, (δ*((v/g+1-u/g:ℤ):ℝ)+C) := by
        apply Finset.sum_le_sum
        intro r hr
        obtain ⟨hr0,hrg⟩ := Finset.mem_Ico.mp hr
        simpa only [Int.cast_sub] using h r hr0 hrg _ _ hqq
      _ = _ := by rw [Finset.sum_const,nsmul_eq_mul,hc]
  have hlenR : (g:ℝ)*((v/g+1-u/g:ℤ):ℝ) ≤ (v:ℝ)-(u:ℝ)+2*(g:ℝ) := by
    exact_mod_cast hlen
  have hm := mul_le_mul_of_nonneg_left hlenR hδ
  nlinarith only [hmono,hsum,hm]

def blowUp (A : Set ℤ) (g : ℤ) : Set ℤ := {x | x/g ∈ A}

theorem residueSlice_blowUp (A : Set ℤ) {g r : ℤ} (hg : 0 < g)
    (hr0 : 0 ≤ r) (hrg : r < g) : residueSlice (blowUp A g) g r = A := by
  ext t
  change (r+g*t)/g ∈ A ↔ t ∈ A
  rw [Int.add_mul_ediv_left _ _ (ne_of_gt hg),Int.ediv_eq_zero_of_lt hr0 hrg,zero_add]

theorem blowUp_periodic {A : Set ℤ} {P g : ℤ} (hg : 0 < g)
    (hA : IsPeriodic A P) : IsPeriodic (blowUp A g) (g*P) := by
  intro x
  change (x+g*P)/g ∈ A ↔ x/g ∈ A
  rw [Int.add_mul_ediv_left _ _ (ne_of_gt hg)]
  exact hA (x/g)

theorem count_blowUp (A : Set ℤ) {g : ℤ} (hg : 0 < g) (u v : ℤ) :
    count (blowUp A g) (g*u) (g*v) = g.toNat*count A u v := by
  rw [count_residue_blocks _ hg]
  calc
    _ = ∑ r ∈ Finset.Ico 0 g, count A u v := by
      apply Finset.sum_congr rfl
      intro r hr
      obtain ⟨hr0,hrg⟩ := Finset.mem_Ico.mp hr
      rw [residueSlice_blowUp A hg hr0 hrg]
    _ = _ := by simp only [Finset.sum_const,nsmul_eq_mul,Int.card_Ico,sub_zero,Nat.cast_id]

theorem blowUp_upperDensity {A : Set ℤ} {P g : ℤ}
    (hg : 0 < g) (hP : 0 < P) (hA : IsPeriodic A P) :
    upperDensity (blowUp A g) = upperDensity A := by
  have hcount : (count (blowUp A g) 0 (g*P) : ℝ) = (g:ℝ)*(count A 0 P : ℝ) := by
    have hh := count_residue_blocks (blowUp A g) hg 0 P
    simp only [mul_zero] at hh
    rw [hh]
    push_cast
    have hs : ∑ r ∈ Finset.Ico 0 g, (count (residueSlice (blowUp A g) g r) 0 P : ℝ) =
        ∑ r ∈ Finset.Ico 0 g, (count A 0 P : ℝ) := by
      apply Finset.sum_congr rfl
      intro r hr
      obtain ⟨hr0,hrg⟩ := Finset.mem_Ico.mp hr
      rw [residueSlice_blowUp A hg hr0 hrg]
    rw [hs,Finset.sum_const,nsmul_eq_mul]
    congr 1
    have hh := Int.card_Ico_of_le 0 g (le_of_lt hg)
    simp only [sub_zero] at hh
    exact_mod_cast hh
  rw [periodic_upperDensity (mul_pos hg hP) (blowUp_periodic hg hA),
    periodic_upperDensity hP hA,hcount]
  push_cast
  have hgR : (g:ℝ) ≠ 0 := by exact_mod_cast ne_of_gt hg
  exact mul_div_mul_left _ _ hgR

theorem blowUp_lowerDensity {A : Set ℤ} {P g : ℤ}
    (hg : 0 < g) (hP : 0 < P) (hA : IsPeriodic A P) :
    lowerDensity (blowUp A g) = lowerDensity A := by
  rw [periodic_lowerDensity (mul_pos hg hP) (blowUp_periodic hg hA),
    periodic_lowerDensity hP hA]
  rw [←periodic_upperDensity (mul_pos hg hP) (blowUp_periodic hg hA),
    ←periodic_upperDensity hP hA]
  exact blowUp_upperDensity hg hP hA

theorem count_compl (A : Set ℤ) {u v : ℤ} (huv : u ≤ v) :
    (count A u v : ℝ)+(count Aᶜ u v : ℝ) = (v:ℝ)-(u:ℝ) := by
  classical
  have hh : count A u v+count Aᶜ u v = (Finset.Ico u v).card := by
    simpa only [count,occupied,Set.mem_compl_iff] using
      (Finset.card_filter_add_card_filter_not (s:=Finset.Ico u v) (fun x : ℤ => x ∈ A))
  have hlen := Int.card_Ico_of_le u v huv
  have hhI : (count A u v : ℤ)+(count Aᶜ u v : ℤ) = v-u := by
    have hh' : (count A u v : ℤ)+(count Aᶜ u v : ℤ) = ((Finset.Ico u v).card:ℤ) := by
      exact_mod_cast hh
    exact hh'.trans hlen
  exact_mod_cast hhI

theorem uniform_count_from_residues_lower (A : Set ℤ) {g : ℤ} (hg : 0 < g)
    (δ C : ℝ) (hδ : δ ≤ 1)
    (h : ∀ r : ℤ, 0 ≤ r → r < g → ∀ u v : ℤ, u ≤ v →
      δ*(v-u)-C ≤ (count (residueSlice A g r) u v : ℝ)) :
    ∀ u v : ℤ, u ≤ v →
      δ*(v-u)-(g:ℝ)*(2*(1-δ)+C) ≤ (count A u v : ℝ) := by
  have hcompl : ∀ r : ℤ, 0 ≤ r → r < g → ∀ u v : ℤ, u ≤ v →
      (count (residueSlice Aᶜ g r) u v : ℝ) ≤ (1-δ)*(v-u)+C := by
    intro r hr0 hrg u v huv
    have hlo := h r hr0 hrg u v huv
    have hh := count_compl (residueSlice A g r) huv
    have he : residueSlice Aᶜ g r = (residueSlice A g r)ᶜ := rfl
    rw [he]
    nlinarith only [hh,hlo]
  have hup := uniform_count_from_residues Aᶜ hg (1-δ) C (by linarith) hcompl
  intro u v huv
  have hh := count_compl A huv
  have hb := hup u v huv
  nlinarith only [hh,hb]

end NonmixedGap
