module

public import Conjectures.McNamaraSteingrimssonPolynomial
public import Mathlib.Algebra.Polynomial.CoeffList
public import Mathlib.Algebra.BigOperators.NatAntidiagonal

@[expose] public section
namespace McNamaraSteingrimsson

open Polynomial BigOperators

def addRows (p q : List ℤ) : List ℤ :=
  List.zipWithAll (fun a b => a.getD 0 + b.getD 0) p q

def subRows (p q : List ℤ) : List ℤ :=
  List.zipWithAll (fun a b => a.getD 0 - b.getD 0) p q

def mulRows : List ℤ → List ℤ → List ℤ
  | [], _ => []
  | a::p,q => addRows (q.map (a*·)) (0::mulRows p q)

theorem ofCoeffList_addRows (p q : List ℤ) :
    ofCoeffList (addRows p q) = ofCoeffList p + ofCoeffList q :=
  ofCoeffList_zipWithAll_add p q

theorem ofCoeffList_subRows (p q : List ℤ) :
    ofCoeffList (subRows p q) = ofCoeffList p - ofCoeffList q :=
  ofCoeffList_zipWithAll_sub p q

theorem ofCoeffList_mulRows (p q : List ℤ) :
    ofCoeffList (mulRows p q) = ofCoeffList p * ofCoeffList q := by
  induction p with
  | nil => simp [mulRows]
  | cons a p ih =>
    rw [mulRows,ofCoeffList_addRows,ofCoeffList_map_mul,ofCoeffList_zero_cons,
      ih,ofCoeffList_cons,add_mul,mul_assoc]

def rowState : List Bool → List ℤ × List ℤ
  | [] => ([1],[])
  | b::v =>
    let s := rowState v
    let t := if b then 0::0::s.1 else s.2
    (addRows (1::s.1) t,t)

theorem rowState_sound (v : List Bool) :
    ofCoeffList (rowState v).1 = layerPolynomial v ∧
      ofCoeffList (rowState v).2 = startsTwoPolynomial v := by
  induction v with
  | nil => simp [rowState,layerPolynomial_nil,startsTwoPolynomial_nil,ofCoeffList_cons]
  | cons b v ih =>
    have ht : ofCoeffList (rowState (b::v)).2 = startsTwoPolynomial (b::v) := by
      cases b
      · exact ih.2
      · rw [startsTwoPolynomial_true]
        change ofCoeffList (0::0::(rowState v).1)=_
        rw [ofCoeffList_zero_cons,ofCoeffList_zero_cons,ih.1,pow_two,mul_assoc]
    refine ⟨?_,ht⟩
    change ofCoeffList (addRows (1::(rowState v).1) (rowState (b::v)).2)=_
    rw [ofCoeffList_addRows,ofCoeffList_cons,C_1,ih.1,ht,layerPolynomial_cons]

def αWord : List Bool := (List.replicate 8 [false,false,false,true]).flatten ++ [false]
def πWord : List Bool := List.replicate 33 true

noncomputable def pointedLayerFormula (v : List Bool) : ℤ[X] :=
  (1+X)*layerPolynomial v-X-X^2

def pointedLayerRow (v : List Bool) : List ℤ :=
  subRows (mulRows [1,1] (rowState v).1) [0,1,1]

theorem ofCoeffList_pointedLayerRow (v : List Bool) :
    ofCoeffList (pointedLayerRow v)=pointedLayerFormula v := by
  rw [pointedLayerRow,ofCoeffList_subRows,ofCoeffList_mulRows,
    (rowState_sound v).1,pointedLayerFormula]
  simp [ofCoeffList_cons]
  ring

end McNamaraSteingrimsson
