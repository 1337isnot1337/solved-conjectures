import Conjectures.NonmixedGapBounds
import Conjectures.NonmixedGapPeriodic
import Mathlib.Tactic.FieldSimp

namespace NonmixedGap

theorem upperDensity_le_sorted {A : Set ℤ} {a b k m U V d r : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m) (hab : b ≤ a)
    (hbez : U*a+V*b=1) (heq : a-b=(k+m+1)*d+r)
    (hr0 : 0 ≤ r) (hrs : r < k+m+1) (hA : Avoids A a b k m) :
    upperDensity A ≤ densityValue a b k m d r := by
  let B := ((k+1)*a+m*b).toNat
  have hδ := densityValue_nonneg ha hb hk hm heq hr0 hrs
  apply uniform_count_upper A (densityValue a b k m d r) (B:ℝ)
  apply local_block_uniform_upper A _ hδ B
  intro t ht
  have hAt : Avoids {x | t+x ∈ A} a b k m := avoids_translate hA
  have hzero : 0 ∈ {x | t+x ∈ A} := by simpa using ht
  obtain ⟨L,hL,hLB,hlocal⟩ := anchored_block ha hb hk hm hab hbez heq hr0 hrs hAt hzero
  have hcast : (L.toNat:ℤ) = L := Int.toNat_of_nonneg (le_of_lt hL)
  have hcastR : (L.toNat:ℝ) = (L:ℝ) := by exact_mod_cast hcast
  refine ⟨L.toNat,by omega,Int.toNat_le_toNat hLB,?_⟩
  rw [count_translate] at hlocal
  simpa only [add_zero,hcast,hcastR] using hlocal

theorem densityValue_swap {a b k m d r : ℤ} (hr0 : 0 < r) (hrs : r < k+m+1) :
    densityValue b a m k (-d-1) (k+m+1-r) = densityValue a b k m d r := by
  by_cases hrm : r ≤ m
  · have hr' : ¬k+m+1-r ≤ k := by omega
    simp only [densityValue,numerator,denominator,hr',hrm,ite_false,ite_true]
    congr 1 <;> norm_cast <;> ring
  · have hr' : k+m+1-r ≤ k := by omega
    simp only [densityValue,numerator,denominator,hr',hrm,ite_false,ite_true]
    congr 1 <;> norm_cast <;> ring

theorem densityValue_zero {a b k m d : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m)
    (heq : a-b=(k+m+1)*d+0) :
    densityValue a b k m d 0 = 1/((k+m+1:ℤ):ℝ) := by
  have hs : 0 < k+m+1 := by omega
  have hh := numerator_pos ha hb hk hm heq (le_refl 0) hs
  have hh' : 0 < b+k*d := by simpa only [numerator,show 0 ≤ m by omega,ite_true] using hh
  have hn := (branch_identities a b k m d 0 heq).1
  have hn' : k*a+(m+1)*b = (k+m+1)*(b+k*d) := by nlinarith only [hn]
  unfold densityValue numerator denominator
  rw [if_pos (le_of_lt hm),if_pos (le_of_lt hm),hn']
  push_cast
  have hhR : (0:ℝ) < (b:ℝ)+(k:ℝ)*(d:ℝ) := by exact_mod_cast hh'
  have hsR : (0:ℝ) < (k:ℝ)+(m:ℝ)+1 := by exact_mod_cast hs
  field_simp
  <;> ring

/-- Upper bound for arbitrary positive coprime gap lengths, with no assumption
on their order, no bound on the two gap counts, and no periodicity assumption. -/
theorem upperDensity_le {A : Set ℤ} {a b k m U V d r : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m)
    (hbez : U*a+V*b=1) (heq : a-b=(k+m+1)*d+r)
    (hr0 : 0 ≤ r) (hrs : r < k+m+1) (hA : Avoids A a b k m) :
    upperDensity A ≤ densityValue a b k m d r := by
  by_cases hab : b ≤ a
  · exact upperDensity_le_sorted ha hb hk hm hab hbez heq hr0 hrs hA
  · have hab' : a ≤ b := by omega
    have hbez' : V*b+U*a=1 := by nlinarith only [hbez]
    have hAs := avoids_swap hA
    by_cases hr : r=0
    · subst r
      have heq' : b-a=(m+k+1)*(-d)+0 := by nlinarith only [heq]
      have hs : 0 < m+k+1 := by omega
      have hbound := upperDensity_le_sorted hb ha hm hk hab' hbez' heq' (le_refl 0) hs hAs
      rw [densityValue_zero hb ha hm hk heq'] at hbound
      rw [densityValue_zero ha hb hk hm heq]
      convert hbound using 1 <;> congr 2 <;> ring
    · have hrp : 0 < r := by omega
      have heq' := swap_remainder a b k m d r heq
      have hr' : 0 ≤ m+k+1-r := by omega
      have hrs' : m+k+1-r < m+k+1 := by omega
      have hbound := upperDensity_le_sorted hb ha hm hk hab' hbez' heq' hr' hrs' hAs
      have hswap := densityValue_swap (a:=a) (b:=b) (d:=d) hrp hrs
      have hrema : m+k+1-r = k+m+1-r := by ring
      rw [hrema,hswap] at hbound
      exact hbound

noncomputable def packingDensity (a b k m : ℤ) : ℝ :=
  sSup {ρ : ℝ | ∃ A : Set ℤ, Avoids A a b k m ∧ ρ = upperDensity A}

theorem avoids_empty (a b k m : ℤ) : Avoids ∅ a b k m := by
  intro t ht
  exact ht.elim

theorem packingDensity_le {a b k m U V d r : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m)
    (hbez : U*a+V*b=1) (heq : a-b=(k+m+1)*d+r)
    (hr0 : 0 ≤ r) (hrs : r < k+m+1) :
    packingDensity a b k m ≤ densityValue a b k m d r := by
  apply csSup_le (show {ρ : ℝ | ∃ A : Set ℤ, Avoids A a b k m ∧ ρ = upperDensity A}.Nonempty from
    ⟨upperDensity ∅,∅,avoids_empty a b k m,rfl⟩)
  rintro ρ ⟨A,hA,rfl⟩
  exact upperDensity_le ha hb hk hm hbez heq hr0 hrs hA

theorem le_packingDensity {A : Set ℤ} {a b k m U V d r : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m)
    (hbez : U*a+V*b=1) (heq : a-b=(k+m+1)*d+r)
    (hr0 : 0 ≤ r) (hrs : r < k+m+1) (hA : Avoids A a b k m) :
    upperDensity A ≤ packingDensity a b k m := by
  apply le_csSup
  · refine ⟨densityValue a b k m d r,?_⟩
    rintro ρ ⟨B,hB,rfl⟩
    exact upperDensity_le ha hb hk hm hbez heq hr0 hrs hB
  · exact ⟨A,hA,rfl⟩

end NonmixedGap
