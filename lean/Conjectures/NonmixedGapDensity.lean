import Mathlib.Data.Int.Interval
import Mathlib.Data.Int.ModEq
import Mathlib.Data.Finset.Sort
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Algebra.Ring.Periodic
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Topology.Order.LiminfLimsup
import Mathlib.Analysis.Normed.Group.Continuity
import Mathlib.Analysis.Normed.Group.Real
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.NormNum

/-! Integer interval counts, symmetric upper/lower densities, and periodic sets.
These definitions are shared by the packing formalizations. -/

open Filter
open scoped Topology

namespace NonmixedGap

noncomputable def occupied (A : Set ℤ) (u v : ℤ) : Finset ℤ := by
  classical
  exact (Finset.Ico u v).filter (· ∈ A)

@[simp] theorem mem_occupied {A : Set ℤ} {u v t : ℤ} :
    t ∈ occupied A u v ↔ u ≤ t ∧ t < v ∧ t ∈ A := by
  classical
  simp only [occupied,Finset.mem_filter,Finset.mem_Ico,and_assoc]

noncomputable def count (A : Set ℤ) (u v : ℤ) : ℕ := (occupied A u v).card

theorem count_le_length (A : Set ℤ) {u v : ℤ} (huv : u ≤ v) :
    (count A u v : ℤ) ≤ v-u := by
  classical
  have hh : count A u v ≤ (Finset.Ico u v).card := Finset.card_filter_le _ _
  have hh' : (count A u v : ℤ) ≤ ((Finset.Ico u v).card : ℤ) := by exact_mod_cast hh
  simpa only [Int.card_Ico_of_le u v huv] using hh'

theorem count_mono (A : Set ℤ) {u v w z : ℤ} (hwu : w ≤ u) (hvz : v ≤ z) :
    count A u v ≤ count A w z := by
  apply Finset.card_le_card
  intro t ht
  obtain ⟨hu,hv,htA⟩ := mem_occupied.mp ht
  exact mem_occupied.mpr ⟨by omega,by omega,htA⟩

theorem count_add (A : Set ℤ) {u v w : ℤ} (huv : u ≤ v) (hvw : v ≤ w) :
    count A u w = count A u v+count A v w := by
  classical
  have hset : occupied A u w = occupied A u v ∪ occupied A v w := by
    ext t
    simp only [Finset.mem_union,mem_occupied]
    constructor
    · rintro ⟨htu,htw,htA⟩
      by_cases htv : t < v
      · exact Or.inl ⟨htu,htv,htA⟩
      · exact Or.inr ⟨by omega,htw,htA⟩
    · rintro (⟨htu,htv,htA⟩ | ⟨htv,htw,htA⟩)
      · exact ⟨htu,lt_of_lt_of_le htv hvw,htA⟩
      · exact ⟨le_trans huv htv,htw,htA⟩
  have hdis : Disjoint (occupied A u v) (occupied A v w) := by
    rw [Finset.disjoint_left]
    intro t ht ht'
    have hh := mem_occupied.mp ht
    have hh' := mem_occupied.mp ht'
    omega
  unfold count
  rw [hset,Finset.card_union_of_disjoint hdis]

@[simp] theorem count_self (A : Set ℤ) (u : ℤ) : count A u u = 0 := by
  simp [count,occupied]

theorem count_unit (A : Set ℤ) [DecidablePred (· ∈ A)] (u : ℤ) :
    count A u (u+1) = if u ∈ A then 1 else 0 := by
  classical
  have hI : Finset.Ico u (u+1) = {u} := by
    ext t
    simp only [Finset.mem_Ico,Finset.mem_singleton]
    omega
  by_cases hu : u ∈ A
  · have hs : occupied A u (u+1) = {u} := by
      ext t
      simp only [mem_occupied,Finset.mem_singleton]
      constructor
      · intro hh; omega
      · intro hh; subst t; exact ⟨by omega,by omega,hu⟩
    simp only [count,hs,Finset.card_singleton,hu,ite_true]
  · have hs : occupied A u (u+1) = ∅ := by
      ext t
      simp only [mem_occupied,Finset.notMem_empty,iff_false]
      intro hh
      have ht : t=u := by omega
      subst t
      exact hu hh.2.2
    simp only [count,hs,Finset.card_empty,hu,ite_false]

/-- An adaptive bounded-length block estimate controls every interval. Empty
sites use singleton blocks, so no positive-density assumption is needed. -/
theorem local_block_upper (A : Set ℤ) (δ : ℝ) (hδ : 0 ≤ δ) (B : ℕ)
    (hblocks : ∀ t ∈ A, ∃ L : ℕ, 0 < L ∧ L ≤ B ∧
      (count A t (t+(L:ℤ)) : ℝ) ≤ δ*(L:ℝ)) :
    ∀ (N : ℕ) (u : ℤ), (count A u (u+(N:ℤ)) : ℝ) ≤ δ*(N:ℝ)+(B:ℝ) := by
  classical
  intro N
  induction N using Nat.strong_induction_on with
  | h N ih =>
    intro u
    by_cases hN : N=0
    · subst N
      simp only [Nat.cast_zero,add_zero,count_self,mul_zero]
      positivity
    have hNp : 0 < N := by omega
    by_cases hu : u ∈ A
    · obtain ⟨L,hL,hLB,hlocal⟩ := hblocks u hu
      by_cases hLN : L ≤ N
      · have hshort : N-L < N := by omega
        have htail := ih (N-L) hshort (u+(L:ℤ))
        have hjoin : (u+(L:ℤ))+((N-L:ℕ):ℤ) = u+(N:ℤ) := by omega
        have hcount := count_add A (show u ≤ u+(L:ℤ) by omega)
          (show u+(L:ℤ) ≤ u+(N:ℤ) by omega)
        rw [hjoin] at htail
        have hcountR : (count A u (u+(N:ℤ)) : ℝ) =
            (count A u (u+(L:ℤ)) : ℝ)+(count A (u+(L:ℤ)) (u+(N:ℤ)) : ℝ) := by
          exact_mod_cast hcount
        have hsplit : ((N-L:ℕ):ℝ)+(L:ℝ) = N := by exact_mod_cast Nat.sub_add_cancel hLN
        have hδsplit := congrArg (fun x : ℝ => δ*x) hsplit
        nlinarith only [hlocal,htail,hcountR,hδsplit]
      · have hlen := count_le_length A (show u ≤ u+(N:ℤ) by omega)
        have hlen' : (count A u (u+(N:ℤ)) : ℤ) ≤ N := by omega
        have hlenR : (count A u (u+(N:ℤ)) : ℝ) ≤ N := by exact_mod_cast hlen'
        have hNB : (N:ℝ) ≤ B := by exact_mod_cast (show N ≤ B by omega)
        have hmul : 0 ≤ δ*(N:ℝ) := mul_nonneg hδ (Nat.cast_nonneg N)
        linarith only [hlenR,hNB,hmul]
    · have htail := ih (N-1) (by omega) (u+1)
      have hjoin : (u+1)+((N-1:ℕ):ℤ) = u+(N:ℤ) := by omega
      rw [hjoin] at htail
      have hcount := count_add A (show u ≤ u+1 by omega)
        (show u+1 ≤ u+(N:ℤ) by omega)
      rw [count_unit,ite_eq_right hu,zero_add] at hcount
      have hsplit : ((N-1:ℕ):ℝ)+1 = N := by exact_mod_cast Nat.sub_add_cancel (show 1 ≤ N by omega)
      rw [hcount]
      nlinarith only [htail,hsplit,hδ]

theorem local_block_uniform_upper (A : Set ℤ) (δ : ℝ) (hδ : 0 ≤ δ) (B : ℕ)
    (hblocks : ∀ t ∈ A, ∃ L : ℕ, 0 < L ∧ L ≤ B ∧
      (count A t (t+(L:ℤ)) : ℝ) ≤ δ*(L:ℝ)) :
    ∀ u v : ℤ, u ≤ v → (count A u v : ℝ) ≤ δ*(v-u)+(B:ℝ) := by
  intro u v huv
  have hh := local_block_upper A δ hδ B hblocks (v-u).toNat u
  have hcast : ((v-u).toNat:ℤ) = v-u := Int.toNat_of_nonneg (by omega)
  have hcastR : ((v-u).toNat:ℝ) = (v:ℝ)-(u:ℝ) := by exact_mod_cast hcast
  simpa only [hcast,hcastR,add_sub_cancel] using hh

noncomputable def densitySeq (A : Set ℤ) (N : ℕ) : ℝ :=
  (count A (-(N:ℤ)) ((N:ℤ)+1) : ℝ)/(2*(N:ℝ)+1)

noncomputable def upperDensity (A : Set ℤ) : ℝ := limsup (densitySeq A) atTop

noncomputable def lowerDensity (A : Set ℤ) : ℝ := liminf (densitySeq A) atTop

theorem densitySeq_nonneg (A : Set ℤ) (N : ℕ) : 0 ≤ densitySeq A N := by
  unfold densitySeq
  positivity

theorem densitySeq_le_one (A : Set ℤ) (N : ℕ) : densitySeq A N ≤ 1 := by
  have hh := count_le_length A (show -(N:ℤ) ≤ (N:ℤ)+1 by omega)
  have hh' : (count A (-(N:ℤ)) ((N:ℤ)+1) : ℝ) ≤ 2*(N:ℝ)+1 := by
    have hh'' : (count A (-(N:ℤ)) ((N:ℤ)+1) : ℝ) ≤ ((N:ℝ)+1)-(-(N:ℝ)) := by
      exact_mod_cast hh
    linarith only [hh'']
  unfold densitySeq
  apply (div_le_one (by positivity : 0 < 2*(N:ℝ)+1)).mpr
  exact hh'

theorem densitySeq_bounded_below (A : Set ℤ) :
    atTop.IsBoundedUnder (· ≥ ·) (densitySeq A) := by
  refine ⟨0,?_⟩
  change ∀ᶠ N : ℕ in atTop, 0 ≤ densitySeq A N
  exact Eventually.of_forall (densitySeq_nonneg A)

theorem densitySeq_bounded_above (A : Set ℤ) :
    atTop.IsBoundedUnder (· ≤ ·) (densitySeq A) := by
  refine ⟨1,?_⟩
  change ∀ᶠ N : ℕ in atTop, densitySeq A N ≤ 1
  exact Eventually.of_forall (densitySeq_le_one A)

theorem density_error_tendsto (C : ℝ) :
    Tendsto (fun N : ℕ => C/(2*(N:ℝ)+1)) atTop (𝓝 0) := by
  have ht : Tendsto (fun N : ℕ => 2*N+1) atTop atTop :=
    tendsto_atTop_mono (fun N => by omega : ∀ N : ℕ, N ≤ 2*N+1) tendsto_id
  simpa only [Function.comp_def,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one] using
    (tendsto_const_div_atTop_nhds_zero_nat C).comp ht

/-- A uniform finite-interval upper bound implies the asserted upper density. -/
theorem uniform_count_upper (A : Set ℤ) (δ C : ℝ)
    (h : ∀ u v : ℤ, u ≤ v → (count A u v : ℝ) ≤ δ*(v-u)+C) :
    upperDensity A ≤ δ := by
  apply le_of_forall_pos_le_add
  intro ε hε
  apply Filter.limsup_le_of_le (densitySeq_bounded_below A).isCoboundedUnder_le
  have he := (density_error_tendsto C).eventually (gt_mem_nhds hε)
  filter_upwards [he] with N hN
  have hn : 0 < 2*(N:ℝ)+1 := by positivity
  have hh := h (-(N:ℤ)) ((N:ℤ)+1) (by omega)
  have hh' : (count A (-(N:ℤ)) ((N:ℤ)+1) : ℝ) ≤ δ*(2*(N:ℝ)+1)+C := by
    push_cast at hh
    nlinarith only [hh]
  change (count A (-(N:ℤ)) ((N:ℤ)+1) : ℝ)/(2*(N:ℝ)+1) ≤ δ+ε
  rw [div_le_iff₀ hn]
  have he' := (div_lt_iff₀ hn).mp hN
  nlinarith only [hh',he']

/-- The corresponding lower bound is used for coverings. -/
theorem uniform_count_lower (A : Set ℤ) (δ C : ℝ)
    (h : ∀ u v : ℤ, u ≤ v → δ*(v-u)-C ≤ (count A u v : ℝ)) :
    δ ≤ lowerDensity A := by
  apply le_of_forall_lt_imp_le_of_dense
  intro y hy
  have hε : 0 < δ-y := by linarith
  apply Filter.le_liminf_of_le (densitySeq_bounded_above A).isCoboundedUnder_ge
  have he := (density_error_tendsto C).eventually (gt_mem_nhds hε)
  filter_upwards [he] with N hN
  have hn : 0 < 2*(N:ℝ)+1 := by positivity
  have hh := h (-(N:ℤ)) ((N:ℤ)+1) (by omega)
  have hh' : δ*(2*(N:ℝ)+1)-C ≤ (count A (-(N:ℤ)) ((N:ℤ)+1) : ℝ) := by
    push_cast at hh
    nlinarith only [hh]
  change y ≤ (count A (-(N:ℤ)) ((N:ℤ)+1) : ℝ)/(2*(N:ℝ)+1)
  rw [le_div_iff₀ hn]
  have he' := (div_lt_iff₀ hn).mp hN
  nlinarith only [hh',he']

def IsPeriodic (A : Set ℤ) (P : ℤ) : Prop := ∀ t, t+P ∈ A ↔ t ∈ A

theorem periodic_mod_iff {A : Set ℤ} {P : ℤ} (h : IsPeriodic A P) (t : ℤ) :
    t%P ∈ A ↔ t ∈ A := by
  have hf : Function.Periodic (fun t => t ∈ A) P := fun t => propext (h t)
  have hh : (t-(t/P)*P ∈ A) = (t ∈ A) := by
    simpa using hf.sub_int_mul_eq (x := t) (t/P)
  have he : t-(t/P)*P = t%P := by
    have he' := Int.emod_add_mul_ediv t P
    nlinarith only [he']
  rw [he] at hh
  exact iff_of_eq hh

/-- Every full period has exactly the same number of centers, including periods
beginning at negative integers. -/
theorem count_period {A : Set ℤ} {P : ℤ} (hP : 0 < P) (hA : IsPeriodic A P) (u : ℤ) :
    count A u (u+P) = count A 0 P := by
  classical
  have himage0 := Int.image_Ico_emod u P (le_of_lt hP)
  have hinj : Set.InjOn (fun t : ℤ => t%P) (Finset.Ico u (u+P) : Set ℤ) := by
    apply Finset.card_image_iff.mp
    rw [himage0,Int.card_Ico,Int.card_Ico]
    congr 1
    ring
  have himage : (occupied A u (u+P)).image (fun t => t%P) = occupied A 0 P := by
    ext t
    constructor
    · intro ht
      obtain ⟨v,hv,rfl⟩ := Finset.mem_image.mp ht
      obtain ⟨_,_,hvA⟩ := mem_occupied.mp hv
      exact mem_occupied.mpr ⟨Int.emod_nonneg _ (by omega),Int.emod_lt_of_pos _ hP,
        (periodic_mod_iff hA v).mpr hvA⟩
    · intro ht
      obtain ⟨ht0,htP,htA⟩ := mem_occupied.mp ht
      have htI : t ∈ (Finset.Ico u (u+P)).image (fun t => t%P) := by
        rw [himage0]
        exact Finset.mem_Ico.mpr ⟨ht0,htP⟩
      obtain ⟨v,hv,hvt⟩ := Finset.mem_image.mp htI
      refine Finset.mem_image.mpr ⟨v,?_,hvt⟩
      obtain ⟨hvu,hvP⟩ := Finset.mem_Ico.mp hv
      refine mem_occupied.mpr ⟨hvu,hvP,?_⟩
      apply (periodic_mod_iff hA v).mp
      rwa [hvt]
  unfold count
  rw [←himage]
  symm
  apply Finset.card_image_of_injOn
  intro x hx y hy he
  exact hinj (Finset.mem_Ico.mpr ⟨(mem_occupied.mp hx).1,(mem_occupied.mp hx).2.1⟩)
    (Finset.mem_Ico.mpr ⟨(mem_occupied.mp hy).1,(mem_occupied.mp hy).2.1⟩) he

theorem count_periods {A : Set ℤ} {P : ℤ} (hP : 0 < P) (hA : IsPeriodic A P)
    (u : ℤ) (q : ℕ) : count A u (u+(q:ℤ)*P) = q*count A 0 P := by
  induction q with
  | zero => simp
  | succ q ih =>
    have he : u+((q+1:ℕ):ℤ)*P = (u+(q:ℤ)*P)+P := by push_cast; ring
    have huq : u ≤ u+(q:ℤ)*P := by
      have hh : 0 ≤ (q:ℤ)*P := mul_nonneg (Int.natCast_nonneg q) (le_of_lt hP)
      omega
    rw [he,count_add A huq (by omega),ih,count_period hP hA]
    ring

/-- A periodic set differs from its period average by at most one period in
every finite integer interval. -/
theorem periodic_interval_bounds {A : Set ℤ} {P : ℤ}
    (hP : 0 < P) (hA : IsPeriodic A P) (u v : ℤ) (huv : u ≤ v) :
    (count A 0 P : ℝ)/(P:ℝ)*(v-u)-(P:ℝ) ≤ (count A u v : ℝ) ∧
    (count A u v : ℝ) ≤ (count A 0 P : ℝ)/(P:ℝ)*(v-u)+(P:ℝ) := by
  let q : ℕ := ((v-u)/P).toNat
  have hq0 : 0 ≤ (v-u)/P := Int.ediv_nonneg (by omega) (le_of_lt hP)
  have hq : (q:ℤ) = (v-u)/P := Int.toNat_of_nonneg hq0
  have hrem := Int.emod_nonneg (v-u) (ne_of_gt hP)
  have hremP := Int.emod_lt_of_pos (v-u) hP
  have hdiv := Int.emod_add_mul_ediv (v-u) P
  have hlo : u+(q:ℤ)*P ≤ v := by rw [hq]; nlinarith only [hrem,hdiv]
  have hhi : v ≤ u+((q+1:ℕ):ℤ)*P := by
    push_cast
    rw [hq]
    nlinarith only [hremP,hdiv]
  have hclo := count_mono A (le_refl u) hlo
  have hchi := count_mono A (le_refl u) hhi
  rw [count_periods hP hA u q] at hclo
  rw [count_periods hP hA u (q+1)] at hchi
  have hcloR : (q:ℝ)*(count A 0 P : ℝ) ≤ (count A u v : ℝ) := by exact_mod_cast hclo
  have hchiR : ((q:ℝ)+1)*(count A 0 P : ℝ) ≥ (count A u v : ℝ) := by exact_mod_cast hchi
  have hloInt : (q:ℤ)*P ≤ v-u := by omega
  have hhiInt : v-u ≤ ((q:ℤ)+1)*P := by push_cast at hhi; omega
  have hloR : (q:ℝ)*(P:ℝ) ≤ (v:ℝ)-(u:ℝ) := by exact_mod_cast hloInt
  have hhiR : (v:ℝ)-(u:ℝ) ≤ ((q:ℝ)+1)*(P:ℝ) := by exact_mod_cast hhiInt
  have hPR : (0:ℝ) < P := by exact_mod_cast hP
  have hCP : (count A 0 P : ℝ) ≤ P := by
    have hCP' : (count A 0 P : ℤ) ≤ P := by simpa only [sub_zero] using count_le_length A (le_of_lt hP)
    exact_mod_cast hCP'
  let δ : ℝ := (count A 0 P : ℝ)/(P:ℝ)
  have hδ : 0 ≤ δ := by dsimp [δ]; positivity
  have hδP : δ*(P:ℝ) = (count A 0 P : ℝ) := by
    dsimp [δ]
    exact div_mul_cancel₀ _ (ne_of_gt hPR)
  have hδq := congrArg (fun x : ℝ => (q:ℝ)*x) hδP
  have hlow := mul_le_mul_of_nonneg_left hloR hδ
  have hhigh := mul_le_mul_of_nonneg_left hhiR hδ
  constructor <;> nlinarith only [hcloR,hchiR,hCP,hδq,hδP,hlow,hhigh]

/-- Matching interval bounds give an actual density limit. -/
theorem uniform_count_tendsto (A : Set ℤ) (δ C : ℝ)
    (h : ∀ u v : ℤ, u ≤ v →
      δ*(v-u)-C ≤ (count A u v : ℝ) ∧ (count A u v : ℝ) ≤ δ*(v-u)+C) :
    Tendsto (densitySeq A) atTop (𝓝 δ) := by
  apply (tendsto_iff_norm_sub_tendsto_zero (f := densitySeq A) (b := δ)).mpr
  apply squeeze_zero (g := fun N : ℕ => C/(2*(N:ℝ)+1)) (fun N => norm_nonneg _)
  · intro N
    have hn : 0 < 2*(N:ℝ)+1 := by positivity
    obtain ⟨hlo,hhi⟩ := h (-(N:ℤ)) ((N:ℤ)+1) (by omega)
    have hlo' : δ*(2*(N:ℝ)+1)-C ≤ (count A (-(N:ℤ)) ((N:ℤ)+1) : ℝ) := by
      push_cast at hlo
      nlinarith only [hlo]
    have hhi' : (count A (-(N:ℤ)) ((N:ℤ)+1) : ℝ) ≤ δ*(2*(N:ℝ)+1)+C := by
      push_cast at hhi
      nlinarith only [hhi]
    rw [Real.norm_eq_abs,abs_le]
    unfold densitySeq
    have hlo'' : δ-C/(2*(N:ℝ)+1) ≤
        (count A (-(N:ℤ)) ((N:ℤ)+1) : ℝ)/(2*(N:ℝ)+1) := by
      simpa only [sub_div,mul_div_cancel_right₀ _ (ne_of_gt hn)] using
        (div_le_div_iff_of_pos_right hn).mpr hlo'
    have hhi'' : (count A (-(N:ℤ)) ((N:ℤ)+1) : ℝ)/(2*(N:ℝ)+1) ≤
        δ+C/(2*(N:ℝ)+1) := by
      simpa only [add_div,mul_div_cancel_right₀ _ (ne_of_gt hn)] using
        (div_le_div_iff_of_pos_right hn).mpr hhi'
    constructor <;> linarith only [hlo'',hhi'']
  · exact density_error_tendsto C

theorem periodic_density {A : Set ℤ} {P : ℤ} (hP : 0 < P) (hA : IsPeriodic A P) :
    Tendsto (densitySeq A) atTop (𝓝 ((count A 0 P : ℝ)/(P:ℝ))) := by
  exact uniform_count_tendsto A _ P (periodic_interval_bounds hP hA)

theorem periodic_upperDensity {A : Set ℤ} {P : ℤ} (hP : 0 < P) (hA : IsPeriodic A P) :
    upperDensity A = (count A 0 P : ℝ)/(P:ℝ) :=
  (periodic_density hP hA).limsup_eq

theorem periodic_lowerDensity {A : Set ℤ} {P : ℤ} (hP : 0 < P) (hA : IsPeriodic A P) :
    lowerDensity A = (count A 0 P : ℝ)/(P:ℝ) :=
  (periodic_density hP hA).liminf_eq

end NonmixedGap
