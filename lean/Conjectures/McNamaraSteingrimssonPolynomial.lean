module

public import Conjectures.McNamaraSteingrimssonSubwords
public import Mathlib.Algebra.Polynomial.Basic
public import Mathlib.Algebra.Polynomial.Coeff

@[expose] public section
namespace McNamaraSteingrimsson
open Polynomial BigOperators

def layerWeight (w : List Bool) : ℕ := (w.map layerSize).sum

noncomputable def generatingPolynomial (S : Finset (List Bool)) : ℤ[X] :=
  ∑ w∈S, X^layerWeight w

noncomputable def layerPolynomial (v : List Bool) : ℤ[X] := generatingPolynomial (layerWords v)
noncomputable def startsTwoPolynomial (v : List Bool) : ℤ[X] :=
  generatingPolynomial (layerWordsState v).2

theorem generatingPolynomial_prefix (b : Bool) (S : Finset (List Bool)) :
    generatingPolynomial (S.map (prefixEmbed b)) = X^layerSize b * generatingPolynomial S := by
  rw [generatingPolynomial,Finset.sum_map,generatingPolynomial,Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro w _
  change X^(layerSize b + layerWeight w) = _
  exact pow_add _ _ _

theorem startsTwoPolynomial_true (v : List Bool) :
    startsTwoPolynomial (true::v)=X^2*layerPolynomial v := by
  simp [startsTwoPolynomial,layerPolynomial,layerWords,layerWordsState,generatingPolynomial_prefix,
    layerSize]

theorem startsTwoPolynomial_false (v : List Bool) :
    startsTwoPolynomial (false::v)=startsTwoPolynomial v := rfl

theorem layerPolynomial_nil : layerPolynomial []=1 := by
  simp [layerPolynomial,layerWords,layerWordsState,generatingPolynomial,layerWeight]

theorem startsTwoPolynomial_nil : startsTwoPolynomial []=0 := by
  simp [startsTwoPolynomial,layerWordsState,generatingPolynomial]

theorem layerPolynomial_cons (b : Bool) (v : List Bool) :
    layerPolynomial (b::v)=1+X*layerPolynomial v+startsTwoPolynomial (b::v) := by
  let A := (layerWords v).map (prefixEmbed false)
  let B := (layerWordsState (b::v)).2
  have hB {w} (hw : w∈B) : ∃ u, w=true::u :=
    ((mem_layerWordsState (b::v)).2 w |>.mp hw).imp fun _ h => h.1
  have h₀ : []∉A∪B := by
    rw [Finset.mem_union]
    rintro (h | h)
    · obtain ⟨w,_,e⟩ := Finset.mem_map.mp h
      change false::w=[] at e
      cases e
    · obtain ⟨w,e⟩ := hB h
      cases e
  have hdis : Disjoint A B := by
    apply Finset.disjoint_left.mpr
    intro z ha hb
    obtain ⟨u,_,hu⟩ := Finset.mem_map.mp ha
    obtain ⟨w,hw⟩ := hB hb
    change false::u=z at hu
    rw [hw] at hu
    cases hu
  change generatingPolynomial (insert [] (A∪B)) = _
  rw [generatingPolynomial, Finset.sum_insert h₀, Finset.sum_union hdis]
  change X^layerWeight [] + (generatingPolynomial A + generatingPolynomial B) = _
  simp [A,B,layerPolynomial,startsTwoPolynomial,generatingPolynomial_prefix,layerWeight,layerSize,add_assoc]

theorem layerPolynomial_true (v : List Bool) :
    layerPolynomial (true::v)=1+(X+X^2)*layerPolynomial v := by
  rw [layerPolynomial_cons,startsTwoPolynomial_true]
  ring

theorem layerPolynomial_ones_then_two (v : List Bool) :
    layerPolynomial (false::false::false::true::v) =
      (1+X+X^2+X^3)+(X^2+X^3+2*X^4+X^5)*layerPolynomial v := by
  rw [layerPolynomial_cons,layerPolynomial_cons,layerPolynomial_cons,layerPolynomial_true]
  repeat' rw [startsTwoPolynomial_false]
  rw [startsTwoPolynomial_true]
  ring

end McNamaraSteingrimsson
