module

public import Conjectures.SobolewskiUlasExceptionPowerTwoFalse
public import Conjectures.SobolewskiUlasExceptionGaps
public import Mathlib.RingTheory.Finiteness.Basic

@[expose] public section
namespace SobolewskiUlasException

def zeroHead : (ℕ→ℤ) →ₗ[ℤ] (ℕ→ℤ) where
  toFun g n := match n with
    | 0 => 0
    | n+1 => g n
  map_add' _ _ := by funext n; cases n <;> simp
  map_smul' _ _ := by funext n; cases n <;> simp

def headUnit (n : ℕ) : ℤ := if n=0 then 1 else 0

/-- Restoring a single initial term preserves regularity. A residue
zero can use the previous-index section with a zero prefixed. -/
theorem regular_of_tail {b : ℕ} (hb : 0<b) {f : ℕ→ℤ}
    (h : IsRegular b (fun n => f (n+1))) : IsRegular b f := by
  let g := fun n => f (n+1)
  let K := kernelSpan b g
  let J := Submodule.span ℤ {headUnit}
  let P := (K ⊔ K.map zeroHead) ⊔ J
  have hK : K.FG := h
  have hP : P.FG := (hK.sup (hK.map zeroHead)).sup (Submodule.fg_span_singleton headUnit)
  apply Submodule.FG.of_le hP
  apply Submodule.span_le.mpr
  rintro u ⟨e,r,hr,rfl⟩
  let q := b^e
  have hq : 0<q := pow_pos hb _
  by_cases h0 : r=0
  · subst r
    let v := sectionMap q (q-1) g
    have hv : v∈K := Submodule.subset_span ⟨e,q-1,by omega,rfl⟩
    have h1 : zeroHead v∈K.map zeroHead := ⟨v,hv,rfl⟩
    have h2 : f 0 • headUnit∈J := Submodule.smul_mem _ _ (Submodule.subset_span (by simp))
    have hp1 : zeroHead v∈P :=
      ((show K.map zeroHead≤K⊔K.map zeroHead from le_sup_right).trans
        (show K⊔K.map zeroHead≤P from le_sup_left)) h1
    have hp2 : f 0 • headUnit∈P := (show J≤P from le_sup_right) h2
    have he : sectionMap q 0 f=zeroHead v+f 0 • headUnit := by
      funext n
      cases n with
      | zero => simp [sectionMap,zeroHead,headUnit]
      | succ n =>
        change f (q*(n+1)+0)=f (q*n+(q-1)+1)+f 0*headUnit (n+1)
        rw [show headUnit (n+1)=0 by simp [headUnit],mul_zero,add_zero,add_zero,Nat.mul_succ]
        congr 1
        omega
    change sectionMap q 0 f∈P
    rw [he]
    exact P.add_mem hp1 hp2
  · have hlt : r-1<q := lt_of_le_of_lt (Nat.sub_le _ _) hr
    have hk : sectionMap q (r-1) g∈K := Submodule.subset_span ⟨e,r-1,hlt,rfl⟩
    have he : sectionMap q r f=sectionMap q (r-1) g := by
      funext n
      change f (q*n+r)=f (q*n+(r-1)+1)
      congr 1
      omega
    change sectionMap q r f ∈ P
    rw [he]
    exact ((show K≤K⊔K.map zeroHead from le_sup_left).trans
      (show K⊔K.map zeroHead≤P from le_sup_left)) hk

def scaleSequence (c : ℤ) : (ℕ→ℤ) →ₗ[ℤ] (ℕ→ℤ) where
  toFun f n := c*f n
  map_add' _ _ := by funext n; exact mul_add ..
  map_smul' _ _ := by
    funext n
    change _*(_*_) = (RingHom.id ℤ _) * (_*_)
    simp only [RingHom.id_apply]
    ring

theorem scaleSequence_injective {c : ℤ} (hc : c≠0) : Function.Injective (scaleSequence c) := by
  intro f g h
  funext n
  have he := congrFun h n
  change c*f n=c*g n at he
  exact mul_left_cancel₀ hc he

theorem scaleSequence_kernelSpan (b : ℕ) (c : ℤ) (f : ℕ→ℤ) :
    (kernelSpan b f).map (scaleSequence c)=kernelSpan b (scaleSequence c f) := by
  unfold kernelSpan
  rw [Submodule.map_span]
  congr 1
  ext g
  constructor
  · rintro ⟨u,⟨e,r,hr,rfl⟩,rfl⟩
    exact ⟨e,r,hr,rfl⟩
  · rintro ⟨e,r,hr,rfl⟩
    exact ⟨sectionMap (b^e) r f,⟨e,r,hr,rfl⟩,rfl⟩

theorem regular_scale_iff {b : ℕ} {c : ℤ} {f : ℕ→ℤ} (hc : c≠0) :
    IsRegular b (scaleSequence c f) ↔ IsRegular b f := by
  unfold IsRegular
  rw [← scaleSequence_kernelSpan]
  exact Submodule.fg_map_iff (scaleSequence c) (scaleSequence_injective hc)

/-- Indexing the written source-layered sequence from its first
positive element and multiplying by two do not hide regularity. -/
theorem scaled_positive_enumeration_not_regular_power_two (a : ℕ) (ha : 0<a) :
    ¬IsRegular (2^a) (fun k => 2*(nthException (k+1) : ℤ)) := by
  intro h
  let g : ℕ→ℤ := fun k => (nthException (k+1) : ℤ)
  have hs : IsRegular (2^a) (scaleSequence 2 g) := h
  have hr := (regular_scale_iff (b := 2^a) (c := 2) (f := g) (by decide)).mp hs
  have ht := regular_of_tail (f := fun k => (nthException k : ℤ)) (show 0<(2:ℕ)^a by positivity) hr
  exact normalized_exceptions_not_regular_power_two a ha ht

end SobolewskiUlasException
