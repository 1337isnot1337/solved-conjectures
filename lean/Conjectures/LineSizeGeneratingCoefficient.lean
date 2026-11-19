import Conjectures.LineSizeGeneratingCodes
import Conjectures.LineSizeGeneratingCumulative
import Conjectures.LineSizeTuplesExceptional
import Mathlib.Logic.Equiv.Fin.Basic

/-! Fixed-core coefficients. The geometric-series codes are put in an
explicit cost-preserving bijection with the actual finite size tuples. -/
noncomputable section
namespace LineSize.Generating

open Finset PowerSeries TupleEncoding

def exactCoreSizes (r n : ℕ) : Finset (Finset ℕ) :=
  (exactSizes n).filter (fun S => tupleCoreLength S=r)

@[simp] theorem mem_exactCoreSizes (r n : ℕ) (S : Finset ℕ) :
    S ∈ exactCoreSizes r n ↔
      (∀ s ∈ S, 3 ≤ s) ∧ tupleCost S=n ∧ tupleCoreLength S=r := by
  simp only [exactCoreSizes,mem_filter,mem_exactSizes,and_assoc]

theorem exactCoreSizes_eq_empty_of_gt (r n : ℕ) (h : n < r) :
    exactCoreSizes r n=∅ := by
  apply eq_empty_iff_forall_notMem.mpr
  intro S hS
  obtain ⟨_hlarge,hcost,hcore⟩ := (mem_exactCoreSizes r n S).mp hS
  have hbound := tupleCoreLength_le_cost S
  omega

theorem exactCount_eq_sum_coreCounts (n : ℕ) :
    exactCount n=∑ r ∈ range (n+1), (exactCoreSizes r n).card := by
  have hmap : Set.MapsTo tupleCoreLength (↑(exactSizes n) : Set (Finset ℕ))
      (↑(range (n+1)) : Set ℕ) := by
    intro S hS
    have hcost := ((mem_exactSizes n S).mp hS).2
    have hbound := tupleCoreLength_le_cost S
    exact mem_range.mpr (by omega)
  exact card_eq_sum_card_fiberwise hmap

theorem card_exactCore_of_equiv {α : Type*} [Fintype α]
    (r n : ℕ) (base : α → ℕ) (e : (α × (Fin r → ℕ)) ≃ CoreTuple r)
    (hcost : ∀ c, tupleCost (e c).val=codeWeight r base c) :
    (exactCoreSizes r n).card=(exactCodes r base n).card := by
  classical
  symm
  apply card_bij (fun c _hc => (e c).val)
  · intro c hc
    apply (mem_exactCoreSizes r n (e c).val).mpr
    exact ⟨(e c).property.1,(hcost c).trans ((mem_exactCodes r base n c).mp hc),
      (e c).property.2⟩
  · intro c _hc d _hd heq
    exact e.injective (Subtype.ext heq)
  · intro S hS
    obtain ⟨hlarge,hweight,hcore⟩ := (mem_exactCoreSizes r n S).mp hS
    let t : CoreTuple r := ⟨S,hlarge,hcore⟩
    let c := e.symm t
    have he : e c=t := e.apply_symm_apply t
    have hc : c ∈ exactCodes r base n := by
      apply (mem_exactCodes r base n c).mpr
      rw [← hcost c,he]
      exact hweight
    exact ⟨c,hc,congrArg Subtype.val he⟩

def unitGapEquiv (r : ℕ) : (Unit × (Fin r → ℕ)) ≃ (Fin r → ℕ) where
  toFun := Prod.snd
  invFun := fun z => ((),z)
  left_inv := by rintro ⟨u,z⟩; cases u; rfl
  right_inv := fun _ => rfl

def zeroGapCode (_c : Unit × (Fin 0 → ℕ)) : CoreTuple 0 := zeroCode ()

def zeroGapEquiv : (Unit × (Fin 0 → ℕ)) ≃ CoreTuple 0 :=
  Equiv.ofBijective zeroGapCode ⟨
    fun a b _ => Subsingleton.elim a b,
    by
      intro S
      obtain ⟨u,hu⟩ := zeroCode_surjective S
      cases u
      exact ⟨((),Fin.elim0),hu⟩⟩

theorem zeroGapEquiv_cost (c : Unit × (Fin 0 → ℕ)) :
    tupleCost (zeroGapEquiv c).val=codeWeight 0 (fun _ : Unit => 0) c := by
  change tupleCost (zeroCode ()).val=0+gapWeight 0 c.2
  simp [zeroCode,gapWeight]

def oneGapEquiv : (Unit × (Fin 1 → ℕ)) ≃ CoreTuple 1 :=
  (unitGapEquiv 1).trans ((Equiv.funUnique (Fin 1) ℕ).trans oneCodeEquiv)

theorem oneGapEquiv_cost (c : Unit × (Fin 1 → ℕ)) :
    tupleCost (oneGapEquiv c).val=codeWeight 1 (fun _ : Unit => 3) c := by
  change tupleCost (oneCodeEquiv (c.2 0)).val=3+gapWeight 1 c.2
  rw [oneCodeEquiv_cost]
  simp only [gapWeight,Fin.sum_univ_one,Fin.val_zero,zero_add,one_mul]

def twoGapEquiv : (Unit × (Fin 2 → ℕ)) ≃ CoreTuple 2 :=
  (unitGapEquiv 2).trans ((finTwoArrowEquiv ℕ).trans twoCodeEquiv)

theorem twoGapEquiv_cost (c : Unit × (Fin 2 → ℕ)) :
    tupleCost (twoGapEquiv c).val=codeWeight 2 (fun _ : Unit => 6) c := by
  change tupleCost (twoCodeEquiv (c.2 0,c.2 1)).val=6+gapWeight 2 c.2
  rw [twoCodeEquiv_cost]
  simp only [gapWeight,Fin.sum_univ_two,Fin.val_zero,Fin.val_one,zero_add,one_mul]
  omega

instance tailChoiceFintype (r : ℕ) : Fintype (TailChoice r) :=
  Fintype.ofFinset (Ico 3 r).powerset (fun _ => mem_powerset)

theorem card_tailChoice (r : ℕ) : Fintype.card (TailChoice r)=2^(r-3) := by
  let : Fintype {T : Finset ℕ // T ⊆ Ico 3 r} := tailChoiceFintype r
  calc
    Fintype.card (TailChoice r)=((Ico 3 r).powerset).card :=
      Fintype.card_of_subtype (Ico 3 r).powerset (fun _ => mem_powerset)
    _ = 2^(r-3) := by rw [card_powerset,Nat.card_Ico]

def largeGapEquiv (r : ℕ) (hr : 3 ≤ r) :
    ((Fin 2 × TailChoice r) × (Fin r → ℕ)) ≃ CoreTuple r :=
  (Equiv.prodAssoc (Fin 2) (TailChoice r) (Fin r → ℕ)).trans (coreCodeEquiv r hr)

theorem largeGapEquiv_cost (r : ℕ) (hr : 3 ≤ r)
    (c : (Fin 2 × TailChoice r) × (Fin r → ℕ)) :
    tupleCost (largeGapEquiv r hr c).val=
      codeWeight r (fun a : Fin 2 × TailChoice r => r^2+r*a.1.val) c :=
  coreCodeEquiv_cost r hr (c.1.1,c.1.2,c.2)

def largeCoreTerm (r : ℕ) : PowerSeries ℚ :=
  (2^(r-3)) • ((PowerSeries.X : PowerSeries ℚ)^(r^2)*
    (1+(PowerSeries.X : PowerSeries ℚ)^r)*gapSeries r)

theorem largeCoreTerm_eq_codeSeries (r : ℕ) :
    largeCoreTerm r=codeSeries r (fun a : Fin 2 × TailChoice r => r^2+r*a.1.val) := by
  unfold codeSeries
  rw [Fintype.sum_prod_type]
  simp only [sum_const,card_univ,card_tailChoice]
  rw [Fin.sum_univ_two]
  simp only [Fin.val_zero,Fin.val_one,Nat.mul_zero,Nat.mul_one,add_zero]
  rw [← smul_add]
  unfold largeCoreTerm
  congr 1
  rw [pow_add]
  ring

def coreTerm (r : ℕ) : PowerSeries ℚ :=
  if r=0 then 1 else if r=1 then (PowerSeries.X : PowerSeries ℚ)^3*gapSeries 1
  else if r=2 then (PowerSeries.X : PowerSeries ℚ)^6*gapSeries 2 else largeCoreTerm r

@[simp] theorem coreTerm_zero : coreTerm 0=(1 : PowerSeries ℚ) := by simp [coreTerm]
@[simp] theorem coreTerm_one : coreTerm 1=(PowerSeries.X : PowerSeries ℚ)^3*gapSeries 1 := by
  simp [coreTerm]
@[simp] theorem coreTerm_two : coreTerm 2=(PowerSeries.X : PowerSeries ℚ)^6*gapSeries 2 := by
  simp [coreTerm]

theorem coreTerm_of_ge_three (r : ℕ) (hr : 3 ≤ r) : coreTerm r=largeCoreTerm r := by
  rw [coreTerm,ite_eq_right (by omega),ite_eq_right (by omega),ite_eq_right (by omega)]

theorem coeff_coreTerm (r n : ℕ) :
    coeff n (coreTerm r)=((exactCoreSizes r n).card : ℚ) := by
  rcases r with _ | _ | _ | r
  · have hseries : codeSeries 0 (fun _ : Unit => 0)=(1 : PowerSeries ℚ) := by
      simp [codeSeries,gapSeries]
    rw [coreTerm_zero,← hseries,coeff_codeSeries,
      card_exactCore_of_equiv 0 n (fun _ : Unit => 0) zeroGapEquiv zeroGapEquiv_cost]
  · have hseries : codeSeries 1 (fun _ : Unit => 3)=
        (PowerSeries.X : PowerSeries ℚ)^3*gapSeries 1 := by simp [codeSeries]
    rw [coreTerm_one,← hseries,coeff_codeSeries,
      card_exactCore_of_equiv 1 n (fun _ : Unit => 3) oneGapEquiv oneGapEquiv_cost]
  · have hseries : codeSeries 2 (fun _ : Unit => 6)=
        (PowerSeries.X : PowerSeries ℚ)^6*gapSeries 2 := by simp [codeSeries]
    rw [coreTerm_two,← hseries,coeff_codeSeries,
      card_exactCore_of_equiv 2 n (fun _ : Unit => 6) twoGapEquiv twoGapEquiv_cost]
  · rw [coreTerm_of_ge_three (r+3) (by omega),largeCoreTerm_eq_codeSeries,coeff_codeSeries,
      card_exactCore_of_equiv (r+3) n (fun a : Fin 2 × TailChoice (r+3) =>
        (r+3)^2+(r+3)*a.1.val) (largeGapEquiv (r+3) (by omega))
        (largeGapEquiv_cost (r+3) (by omega))]

end LineSize.Generating
