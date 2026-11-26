import Conjectures.ChernFuLinThreeStatisticEnumerator
import Conjectures.ChernFuLinThreeStatisticFactor

/-! # Factored weighted sum on codes with prescribed minimum positions -/

namespace Conjectures.ChernFuLinThreeStatistic.Expansion

open Finset
noncomputable section
open Classical

abbrev Split (t : ℕ) := {p : ℕ × ℕ // p ∈ Finset.antidiagonal t}

def CoreSet (z : Bool) {m : ℕ} (U : Finset (Fin m)) (b : ℕ) :=
  {σ : Equiv.Perm (Fin (m+1)) // inClass z σ ∧ prefixMarks σ=U ∧ (b=0 ↔ (σ (Fin.last m)).val=0)}

def TailSet (z : Bool) (a b : ℕ) := {ν : Equiv.Perm (Fin (a+b)) // TailOK z a b ν}

instance {z m U b} : Finite (@CoreSet z m U b) := inferInstanceAs (Finite (Subtype _))
instance {z a b} : Finite (TailSet z a b) := inferInstanceAs (Finite (Subtype _))

instance {z m U b} : Fintype (@CoreSet z m U b) := Fintype.ofFinite _
instance {z a b} : Fintype (TailSet z a b) := Fintype.ofFinite _
local instance {m t} : Fintype (Code m t) := Fintype.ofFinite _

def tailWeight (a b : ℕ) (ν : Equiv.Perm (Fin (a+b))) : WeightField :=
  T^(internal (pos ν) 0 a + internal (pos ν) a b) * Z^rma ν

def coreSum {m : ℕ} (z : Bool) (U : Finset (Fin m)) (b : ℕ) : WeightField :=
  ∑ σ : CoreSet z U b, wt σ.val

def tailSum (z : Bool) (a b : ℕ) : WeightField := ∑ ν : TailSet z a b, tailWeight a b ν.val

def partsToCode {m t : ℕ} (hm : 0<m) (z : Bool) (U : Finset (Fin m))
    (p : Split t) (v : CoreSet z U p.val.2 × TailSet z p.val.1 p.val.2) :
    {c : Code m t // inClass z c.word ∧ prefixMarks c.core=U} := by
  rcases p with ⟨⟨a,b⟩,h⟩; have e : a+b=t := mem_antidiagonal.mp h; subst t
  rcases v with ⟨⟨σ,hσ,hU,hc⟩,⟨ν,hν⟩⟩
  exact ⟨⟨a,b,rfl,σ,ν,hc⟩,(inClass_expand_iff σ ν hm hc).mpr ⟨hσ,hν⟩,hU⟩

def partsEquiv {m t : ℕ} (hm : 0<m) (z : Bool) (U : Finset (Fin m)) :
    (Σ p : Split t, CoreSet z U p.val.2 × TailSet z p.val.1 p.val.2) ≃
      {c : Code m t // inClass z c.word ∧ prefixMarks c.core=U} where
  toFun x := partsToCode hm z U x.1 x.2
  invFun c := by
    rcases c with ⟨⟨a,b,rfl,σ,ν,hc⟩,h,hU⟩
    obtain ⟨hσ,hν⟩ := (inClass_expand_iff σ ν hm hc).mp h
    exact ⟨⟨(a,b),mem_antidiagonal.mpr rfl⟩,⟨σ,hσ,hU,hc⟩,⟨ν,hν⟩⟩
  left_inv x := by
    rcases x with ⟨⟨⟨a,b⟩,hp⟩,⟨σ,hσ,hU,hc⟩,⟨ν,hν⟩⟩
    have e : a+b=t := mem_antidiagonal.mp hp; subst t; rfl
  right_inv x := by rcases x with ⟨⟨a,b,rfl,σ,ν,hc⟩,h,hU⟩; rfl

private theorem parts_weight {m t : ℕ} (hm : 0<m) (z : Bool) (U : Finset (Fin m))
    (p : Split t) (v : CoreSet z U p.val.2 × TailSet z p.val.1 p.val.2) :
    wt (partsToCode hm z U p v).val.word = wt v.1.val * tailWeight p.val.1 p.val.2 v.2.val *
      (if p.val.2=0 then 1 else T) * (if t=0 then 1 else Z⁻¹) := by
  rcases p with ⟨⟨a,b⟩,hp⟩; have e : a+b=t := mem_antidiagonal.mp hp; subst t
  rcases v with ⟨⟨σ,hσ,hU,hc⟩,⟨ν,hν⟩⟩; exact wt_expand _ _ _ σ ν hc

/-- No assumptions about either generating series: the literal marked weight
is the sum of products indexed by all possible low/high tail sizes. -/
theorem weighted_minimum_split {m t : ℕ} (hm : 0<m) (z : Bool) (U : Finset (Fin m)) :
    markedWeight (inClass z) (marksAt t U) = ∑ p : Split t,
      coreSum z U p.val.2 * tailSum z p.val.1 p.val.2 * (if p.val.2=0 then 1 else T) *
      (if t=0 then 1 else Z⁻¹) := by
  rw [markedWeight_subtype,← sum_markedCodes hm z U wt,← (partsEquiv (t:=t) hm z U).sum_comp]
  rw [Fintype.sum_sigma]; apply sum_congr rfl; intro p _
  change (∑ v, wt (partsToCode hm z U p v).val.word) = _
  simp only [parts_weight,← sum_mul,Fintype.sum_prod_type,← mul_sum]
  rw [coreSum,tailSum,Finset.sum_mul]

end
end Conjectures.ChernFuLinThreeStatistic.Expansion
