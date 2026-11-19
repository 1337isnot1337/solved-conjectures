import Conjectures.LonelinessPacking
import Mathlib.Data.Finset.Max
import Mathlib.Algebra.Order.BigOperators.Group.List

/-! A greedy lower bound for the density of sets avoiding finitely many
positive differences. Repeating finite blocks with a gap gives actual
periodic avoiding sets; an Archimedean argument removes the gap loss. -/

namespace Loneliness.Packing

def NatAvoids (ds : List ℕ) (A : Finset ℕ) : Prop :=
  ∀ d ∈ ds, ∀ t ∈ A, t+d ∉ A

/-- Choosing the least remaining point removes at most one point for each
forbidden difference, in addition to the chosen point itself. -/
theorem greedy_finite (ds : List ℕ) (hpos : ∀ d ∈ ds, 0 < d) (S : Finset ℕ) :
    ∃ A : Finset ℕ, A ⊆ S ∧ NatAvoids ds A ∧ S.card ≤ (ds.length+1)*A.card := by
  classical
  induction S using Finset.strongInductionOn
  rename_i S ih
  rcases S.eq_empty_or_nonempty with rfl | hS
  · refine ⟨∅,by simp,?_,by simp⟩
    intro d hd t ht
    simp at ht
  · let m := S.min' hS
    let T := insert m (ds.toFinset.image (fun d => m+d))
    let S' := S \ T
    have hm : m ∈ S := Finset.min'_mem S hS
    have hmT : m ∈ T := Finset.mem_insert_self _ _
    have hsub : S' ⊆ S := Finset.sdiff_subset
    have hmnot : m ∉ S' := by
      intro hh
      exact (Finset.mem_sdiff.mp hh).2 hmT
    have hss : S' ⊂ S := Finset.ssubset_iff_subset_ne.mpr ⟨hsub,by
      intro he
      apply hmnot
      rw [he]
      exact hm⟩
    obtain ⟨B,hB,havoid,hcard⟩ := ih S' hss
    have hmB : m ∉ B := fun hh => hmnot (hB hh)
    have hT : T.card ≤ ds.length+1 := by
      calc
        T.card ≤ (ds.toFinset.image (fun d => m+d)).card+1 := Finset.card_insert_le _ _
        _ ≤ ds.toFinset.card+1 := Nat.add_le_add_right Finset.card_image_le 1
        _ ≤ ds.length+1 := Nat.add_le_add_right ds.toFinset_card_le 1
    have hcover : S ⊆ S' ∪ T := by
      intro t ht
      by_cases h : t ∈ T
      · exact Finset.mem_union_right _ h
      · exact Finset.mem_union_left _ (Finset.mem_sdiff.mpr ⟨ht,h⟩)
    have htotal : S.card ≤ S'.card+T.card :=
      (Finset.card_le_card hcover).trans (Finset.card_union_le S' T)
    refine ⟨insert m B,?_,?_,?_⟩
    · intro t ht
      rcases Finset.mem_insert.mp ht with rfl | ht
      · exact hm
      · exact hsub (hB ht)
    · intro d hd t ht htd
      have hdpos := hpos d hd
      rcases Finset.mem_insert.mp ht with rfl | ht
      · have hne : m+d ≠ m := by omega
        have hh : m+d ∈ B := (Finset.mem_insert.mp htd).resolve_left hne
        have hmem : m+d ∈ T := Finset.mem_insert_of_mem
          (Finset.mem_image.mpr ⟨d,List.mem_toFinset.mpr hd,rfl⟩)
        exact (Finset.mem_sdiff.mp (hB hh)).2 hmem
      · rcases Finset.mem_insert.mp htd with he | htd
        · have hmin : m ≤ t := Finset.min'_le S t (hsub (hB ht))
          omega
        · exact havoid d hd t ht htd
    · rw [Finset.card_insert_of_notMem hmB]
      nlinarith only [htotal,hT,hcard]

def repeatBlock (A : Finset ℕ) (P : ℕ) : Set ℤ :=
  {t | (t % (P : ℤ)).toNat ∈ A}

theorem repeatBlock_periodic (A : Finset ℕ) (P : ℕ) :
    NonmixedGap.IsPeriodic (repeatBlock A P) P := by
  intro t
  change ((t+(P : ℤ)) % P).toNat ∈ A ↔ (t % (P : ℤ)).toNat ∈ A
  simp

theorem repeatBlock_count (A : Finset ℕ) (P : ℕ) (_hP : 0 < P)
    (hA : ∀ a ∈ A, a < P) : NonmixedGap.count (repeatBlock A P) 0 P = A.card := by
  classical
  symm
  unfold NonmixedGap.count
  apply Finset.card_bij (fun (a : ℕ) _ => (a : ℤ))
  · intro a ha
    have haP : (a : ℤ) < P := by exact_mod_cast hA a ha
    apply NonmixedGap.mem_occupied.mpr
    refine ⟨by omega,haP,?_⟩
    change ((a : ℤ) % P).toNat ∈ A
    simpa only [Int.emod_eq_of_lt (by omega : (0 : ℤ) ≤ a) haP,Int.toNat_natCast] using ha
  · intro a ha b hb he
    exact_mod_cast he
  · intro t ht
    obtain ⟨ht0,htP,htA⟩ := NonmixedGap.mem_occupied.mp ht
    change (t % (P : ℤ)).toNat ∈ A at htA
    rw [Int.emod_eq_of_lt ht0 htP] at htA
    exact ⟨t.toNat,htA,by omega⟩

theorem repeatBlock_upperDensity (A : Finset ℕ) (P : ℕ) (hP : 0 < P)
    (hA : ∀ a ∈ A, a < P) :
    NonmixedGap.upperDensity (repeatBlock A P) = (A.card : ℝ)/P := by
  rw [NonmixedGap.periodic_upperDensity (by exact_mod_cast hP) (repeatBlock_periodic A P),
    repeatBlock_count A P hP hA]
  simp

/-- A gap as long as every forbidden difference prevents conflicts between
adjacent repetitions of a finite avoiding block. -/
theorem repeatBlock_avoids (ds : List ℕ) (A : Finset ℕ) (N M : ℕ) (hN : 0 < N)
    (hA : A ⊆ Finset.range N) (havoid : NatAvoids ds A)
    (hM : ∀ d ∈ ds, d ≤ M) : Avoids ds (repeatBlock A (N+M)) := by
  intro d hd t ht htd
  have hP : (0 : ℤ) < (N+M : ℕ) := by exact_mod_cast (by omega : 0 < N+M)
  have hr0 : 0 ≤ t % (N+M : ℕ) := Int.emod_nonneg _ (ne_of_gt hP)
  have hrN : (t % (N+M : ℕ)).toNat < N := Finset.mem_range.mp (hA ht)
  have hrI : ((t % (N+M : ℕ)).toNat : ℤ) = t % (N+M : ℕ) := by omega
  have hdM := hM d hd
  have hd0 : (0 : ℤ) ≤ d := by omega
  have hdP : (d : ℤ) < (N+M : ℕ) := by omega
  have hsum0 : 0 ≤ t % (N+M : ℕ)+(d : ℤ) := by omega
  have hsumP : t % (N+M : ℕ)+(d : ℤ) < (N+M : ℕ) := by omega
  have hmod : (t+(d : ℤ)) % (N+M : ℕ) = t % (N+M : ℕ)+(d : ℤ) := by
    rw [Int.add_emod,Int.emod_eq_of_lt hd0 hdP,Int.emod_eq_of_lt hsum0 hsumP]
  have hnat : ((t+(d : ℤ)) % (N+M : ℕ)).toNat = (t % (N+M : ℕ)).toNat+d := by
    rw [hmod,←hrI,←Nat.cast_add]
    simp only [Int.toNat_natCast]
  apply havoid d hd _ ht
  change ((t+(d : ℤ)) % (N+M : ℕ)).toNat ∈ A at htd
  rwa [hnat] at htd

/-- Each block length yields a periodic witness and hence this inequality
for the supremal density. -/
theorem finite_block_density_bound (ds : List ℕ) (hpos : ∀ d ∈ ds, 0 < d)
    (N : ℕ) (hN : 0 < N) :
    (N : ℝ) ≤ ((ds.length : ℝ)+1)*((N : ℝ)+ds.sum)*density ds := by
  obtain ⟨A,hA,havoid,hcard⟩ := greedy_finite ds hpos (Finset.range N)
  simp only [Finset.card_range] at hcard
  have hP : 0 < N+ds.sum := by omega
  have hAP : ∀ a ∈ A, a < N+ds.sum := by
    intro a ha
    have hh := Finset.mem_range.mp (hA ha)
    omega
  have hperiod := repeatBlock_avoids ds A N ds.sum hN hA havoid
    (fun d hd => List.le_sum_of_mem hd)
  have hdensity := upperDensity_le_density hperiod
  rw [repeatBlock_upperDensity A (N+ds.sum) hP hAP] at hdensity
  have hPR : (0 : ℝ) < (N : ℝ)+ds.sum := by exact_mod_cast hP
  simp only [Nat.cast_add] at hdensity
  have hcount : (A.card : ℝ) ≤ density ds*((N : ℝ)+ds.sum) :=
    (div_le_iff₀ hPR).mp hdensity
  have hcardR : (N : ℝ) ≤ ((ds.length : ℝ)+1)*(A.card : ℝ) := by
    exact_mod_cast hcard
  calc
    (N : ℝ) ≤ ((ds.length : ℝ)+1)*(A.card : ℝ) := hcardR
    _ ≤ ((ds.length : ℝ)+1)*(density ds*((N : ℝ)+ds.sum)) :=
      mul_le_mul_of_nonneg_left hcount (by positivity)
    _ = _ := by ring

/-- Every finite list of positive differences has an avoiding set density
supremum at least `1/(length+1)`. Repetitions in the list are allowed. -/
theorem one_div_length_add_one_le_density (ds : List ℕ) (hpos : ∀ d ∈ ds, 0 < d) :
    (1 : ℝ)/((ds.length : ℝ)+1) ≤ density ds := by
  let k : ℝ := (ds.length : ℝ)+1
  have hk : 0 < k := by dsimp [k]; positivity
  change 1/k ≤ density ds
  by_contra h
  have hlt : density ds < 1/k := lt_of_not_ge h
  let ε : ℝ := 1-k*density ds
  have hε : 0 < ε := by
    have hh := (lt_div_iff₀ hk).mp hlt
    dsimp [ε]
    nlinarith only [hh]
  let B : ℝ := k*(ds.sum : ℝ)*density ds
  obtain ⟨N,hN⟩ := exists_nat_gt (B/ε)
  have hlarge : B < ε*((N : ℝ)+1) := by
    have hn : B/ε < (N : ℝ)+1 := by linarith only [hN]
    have hh := (div_lt_iff₀ hε).mp hn
    nlinarith only [hh]
  have hbound := finite_block_density_bound ds hpos (N+1) (by omega)
  simp only [Nat.cast_add,Nat.cast_one] at hbound
  change (N : ℝ)+1 ≤ k*((N : ℝ)+1+ds.sum)*density ds at hbound
  dsimp [B,ε] at hlarge
  nlinarith only [hlarge,hbound]

end Loneliness.Packing
