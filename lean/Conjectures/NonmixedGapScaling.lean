import Conjectures.NonmixedGapTheorem
import Conjectures.NonmixedGapResidues

namespace NonmixedGap

theorem packingDensity_swap (a b k m : ℤ) :
    packingDensity b a m k = packingDensity a b k m := by
  unfold packingDensity
  congr 1
  ext ρ
  constructor
  · rintro ⟨A,hA,hρ⟩
    exact ⟨A,avoids_swap hA,hρ⟩
  · rintro ⟨A,hA,hρ⟩
    exact ⟨A,avoids_swap hA,hρ⟩

theorem formula_swap {a b k m : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m) (hcop : IsCoprime a b) :
    formula b a m k = formula a b k m := by
  rw [←(nonmixed_gap_density b a m k hb ha hm hk hcop.symm).1,
    packingDensity_swap,(nonmixed_gap_density a b k m ha hb hk hm hcop).1]

theorem uniform_packing_bound_sorted {a b k m U V d r : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m) (hab : b ≤ a)
    (hbez : U*a+V*b=1) (heq : a-b=(k+m+1)*d+r)
    (hr0 : 0 ≤ r) (hrs : r < k+m+1) :
    ∃ C : ℝ, ∀ A : Set ℤ, Avoids A a b k m → ∀ u v : ℤ, u ≤ v →
      (count A u v : ℝ) ≤ densityValue a b k m d r*(v-u)+C := by
  let B := ((k+1)*a+m*b).toNat
  refine ⟨B,?_⟩
  intro A hA
  apply local_block_uniform_upper A _ (densityValue_nonneg ha hb hk hm heq hr0 hrs) B
  intro t ht
  have hAt : Avoids {x | t+x ∈ A} a b k m := avoids_translate hA
  have hzero : 0 ∈ {x | t+x ∈ A} := by simpa using ht
  obtain ⟨L,hL,hLB,hlocal⟩ := anchored_block ha hb hk hm hab hbez heq hr0 hrs hAt hzero
  have hcast : (L.toNat:ℤ) = L := Int.toNat_of_nonneg (le_of_lt hL)
  have hcastR : (L.toNat:ℝ) = (L:ℝ) := by exact_mod_cast hcast
  refine ⟨L.toNat,by omega,Int.toNat_le_toNat hLB,?_⟩
  rw [count_translate] at hlocal
  simpa only [add_zero,hcast,hcastR] using hlocal

theorem uniform_packing_bound {a b k m : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m) (hcop : IsCoprime a b) :
    ∃ C : ℝ, ∀ A : Set ℤ, Avoids A a b k m → ∀ u v : ℤ, u ≤ v →
      (count A u v : ℝ) ≤ formula a b k m*(v-u)+C := by
  have hsorted : ∀ {a b k m : ℤ}, 0 < a → 0 < b → 0 < k → 0 < m →
      IsCoprime a b → b ≤ a → ∃ C : ℝ, ∀ A : Set ℤ, Avoids A a b k m →
      ∀ u v : ℤ, u ≤ v → (count A u v : ℝ) ≤ formula a b k m*(v-u)+C := by
    intro a b k m ha hb hk hm hcop hab
    obtain ⟨U,V,hbez⟩ := hcop
    let s := k+m+1
    let d := (a-b)/s
    let r := (a-b)%s
    have hs : 0 < s := by dsimp [s]; omega
    have heq : a-b=(k+m+1)*d+r := by
      have hh := Int.emod_add_mul_ediv (a-b) s
      dsimp [s,d,r] at hh ⊢
      nlinarith only [hh]
    have hr0 : 0 ≤ r := Int.emod_nonneg _ (ne_of_gt hs)
    have hrs : r < k+m+1 := Int.emod_lt_of_pos _ hs
    rw [formula_eq_densityValue ha hb hk hm heq hr0 hrs]
    exact uniform_packing_bound_sorted ha hb hk hm hab hbez heq hr0 hrs
  by_cases hab : b ≤ a
  · exact hsorted ha hb hk hm hcop hab
  · obtain ⟨C,hC⟩ := hsorted hb ha hm hk hcop.symm (by omega)
    refine ⟨C,?_⟩
    intro A hA u v huv
    have hh := hC A (avoids_swap hA) u v huv
    rwa [formula_swap ha hb hk hm hcop] at hh

theorem formula_nonneg {a b k m : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m) (hcop : IsCoprime a b) :
    0 ≤ formula a b k m := by
  rw [←(nonmixed_gap_density a b k m ha hb hk hm hcop).2]
  exact Loneliness.value_nonneg (speeds a b k m)

theorem avoids_residueSlice {A : Set ℤ} {g a b k m : ℤ}
    (hA : Avoids A (g*a) (g*b) k m) (r : ℤ) :
    Avoids (residueSlice A g r) a b k m := by
  intro t ht i j hi hik hj hjm hij hnext
  apply hA (r+g*t) ht i j hi hik hj hjm hij
  change r+g*(t+(i*a+j*b)) ∈ A at hnext
  convert hnext using 1
  ring

theorem avoids_blowUp {A : Set ℤ} {g a b k m : ℤ} (hg : 0 < g)
    (hA : Avoids A a b k m) : Avoids (blowUp A g) (g*a) (g*b) k m := by
  intro x hx i j hi hik hj hjm hij hnext
  apply hA (x/g) hx i j hi hik hj hjm hij
  change (x+(i*(g*a)+j*(g*b)))/g ∈ A at hnext
  have he : x+(i*(g*a)+j*(g*b)) = x+g*(i*a+j*b) := by ring
  rw [he,Int.add_mul_ediv_left _ _ (ne_of_gt hg)] at hnext
  exact hnext

theorem scaled_upperDensity_le {A : Set ℤ} {g a b k m : ℤ}
    (hg : 0 < g) (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m)
    (hcop : IsCoprime a b) (hA : Avoids A (g*a) (g*b) k m) :
    upperDensity A ≤ formula a b k m := by
  obtain ⟨C,hC⟩ := uniform_packing_bound ha hb hk hm hcop
  apply uniform_count_upper A _ ((g:ℝ)*(2*formula a b k m+C))
  apply uniform_count_from_residues A hg _ C (formula_nonneg ha hb hk hm hcop)
  intro r hr0 hrg u v huv
  exact hC _ (avoids_residueSlice hA r) u v huv

theorem scaled_packingDensity {g a b k m : ℤ}
    (hg : 0 < g) (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m)
    (hcop : IsCoprime a b) : packingDensity (g*a) (g*b) k m = formula a b k m := by
  have hbound : BddAbove {ρ : ℝ | ∃ A : Set ℤ,
      Avoids A (g*a) (g*b) k m ∧ ρ=upperDensity A} := by
    refine ⟨formula a b k m,?_⟩
    rintro ρ ⟨A,hA,rfl⟩
    exact scaled_upperDensity_le hg ha hb hk hm hcop hA
  apply le_antisymm
  · apply csSup_le (show {ρ : ℝ | ∃ A : Set ℤ,
        Avoids A (g*a) (g*b) k m ∧ ρ=upperDensity A}.Nonempty from
      ⟨upperDensity ∅,∅,avoids_empty _ _ _ _,rfl⟩)
    rintro ρ ⟨A,hA,rfl⟩
    exact scaled_upperDensity_le hg ha hb hk hm hcop hA
  · obtain ⟨A,P,hP,hperiod,hpack,hvalue⟩ := nonmixed_gap_periodic_optimum a b k m ha hb hk hm hcop
    have hA := (packs_iff_avoids ha hb (le_of_lt hk) (le_of_lt hm)).mp hpack
    have hscale : upperDensity (blowUp A g) = formula a b k m :=
      (blowUp_upperDensity hg hP hperiod).trans hvalue
    rw [←hscale]
    exact le_csSup hbound ⟨blowUp A g,avoids_blowUp hg hA,rfl⟩

end NonmixedGap
