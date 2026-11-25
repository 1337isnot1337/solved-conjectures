module

public import Conjectures.HKMEhrhartSupportShells
import all Conjectures.HKMEhrhartSupportShells

public section
namespace HKMEhrhart
open Finset Polynomial
open scoped BigOperators Polynomial

variable {α : Type*} [Fintype α] [DecidableEq α]

abbrev UnclippedCocktail (α : Type*) [Fintype α] (m : ℕ) :=
  {z : α → ℤ // (∑ i,natPositiveMass (z i))=(∑ i,natNegativeMass (z i)) ∧
    (∑ i,natPositiveMass (z i))≤m}

def unclippedSigmaEquiv (m : ℕ) :
    UnclippedCocktail α m ≃ Σ p : Fin (m+1), UnclippedMassShell α p.val where
  toFun z := ⟨⟨_,Nat.lt_succ_of_le z.property.2⟩,⟨z.val,rfl,z.property.1.symm⟩⟩
  invFun z := ⟨z.2.val,z.2.property.1.trans z.2.property.2.symm,
    z.2.property.1.trans_le (Nat.le_of_lt_succ z.1.isLt)⟩
  left_inv _ := rfl
  right_inv z := by
    rcases z with ⟨p,z⟩
    have h := z.property.1
    refine Sigma.ext (Fin.ext h) ?_
    have shell_heq {u v : ℕ} (huv : u = v)
        (x : UnclippedMassShell α u) (y : UnclippedMassShell α v)
        (hx : x.val = y.val) : HEq x y := by
      subst v
      exact heq_of_eq (Subtype.ext hx)
    exact shell_heq h _ _ rfl

noncomputable instance (m : ℕ) : Fintype (UnclippedCocktail α m) :=
  Fintype.ofEquiv _ (unclippedSigmaEquiv (α:=α) m).symm

theorem massShell_zero_card : Fintype.card (UnclippedMassShell α 0) = 1 := by
  have h (z : UnclippedMassShell α 0) : z.val = 0 := by
    funext i
    have hP := Finset.single_le_sum (fun j _ => Nat.zero_le (natPositiveMass (z.val j))) (Finset.mem_univ i)
    have hN := Finset.single_le_sum (fun j _ => Nat.zero_le (natNegativeMass (z.val j))) (Finset.mem_univ i)
    rw [z.property.1] at hP
    rw [z.property.2] at hN
    have he := natPosNegMass_cast_difference (z.val i)
    change z.val i = 0
    omega
  have : Subsingleton (UnclippedMassShell α 0) := ⟨fun a b => Subtype.ext ((h a).trans (h b).symm)⟩
  have : Nonempty (UnclippedMassShell α 0) :=
    ⟨⟨0,by simp [natPositiveMass,natNegativeMass]⟩⟩
  let : Unique (UnclippedMassShell α 0) := uniqueOfSubsingleton (Classical.choice ‹Nonempty _›)
  exact Fintype.card_unique

noncomputable def massShellPolynomial : ℚ[X] :=
  ∑ a : OppositeSupports α,
    integerChoosePolynomial (a.val.1.card-1) * integerChoosePolynomial (a.val.2.card-1)

theorem massShellPolynomial_eval (p : ℕ) :
    (massShellPolynomial (α:=α)).eval (p:ℚ) = (Fintype.card (UnclippedMassShell α (p+1)):ℚ) := by
  rw [← Nat.card_eq_fintype_card,massShell_card_succ]
  simp [massShellPolynomial,eval_finsetSum,eval_mul,integerChoosePolynomial_eval]

theorem massShellPolynomial_degree (hα : 2 ≤ Fintype.card α) :
    (massShellPolynomial (α:=α)).natDegree ≤ Fintype.card α - 2 := by
  unfold massShellPolynomial
  apply natDegree_sum_le_of_forall_le
  intro a _
  have hA := a.property.2.1.card_pos
  have hB := a.property.2.2.card_pos
  have hAB : a.val.1.card + a.val.2.card ≤ Fintype.card α := by
    rw [← Finset.card_union_of_disjoint a.property.1]
    exact Finset.card_le_univ _
  exact natDegree_mul_le.trans
    ((Nat.add_le_add (integerChoosePolynomial_degree _) (integerChoosePolynomial_degree _)).trans (by omega))

noncomputable def unclippedPolynomial : ℚ[X] := 1 + prefixSumPolynomial (massShellPolynomial (α:=α))

theorem unclippedPolynomial_eval (m : ℕ) :
    (unclippedPolynomial (α:=α)).eval (m:ℚ) = (Fintype.card (UnclippedCocktail α m):ℚ) := by
  have hcount : Fintype.card (UnclippedCocktail α m) =
      1 + ∑ j ∈ Finset.range m, Fintype.card (UnclippedMassShell α (j+1)) := by
    rw [Fintype.card_congr (unclippedSigmaEquiv m), Fintype.card_sigma, Fin.sum_univ_succ]
    change Fintype.card (UnclippedMassShell α 0) +
      (∑ i : Fin m, Fintype.card (UnclippedMassShell α (i.val+1))) = _
    rw [massShell_zero_card]
    exact congrArg (fun x : ℕ => 1+x)
      (Fin.sum_univ_eq_sum_range (fun j => Fintype.card (UnclippedMassShell α (j+1))) m)
  rw [hcount,unclippedPolynomial,eval_add,eval_one,prefixSumPolynomial_eval]
  push_cast
  exact congrArg (fun q : ℚ => 1+q) (Finset.sum_congr rfl (fun j _ => massShellPolynomial_eval j))

theorem unclippedPolynomial_degree (hα : 2 ≤ Fintype.card α) :
    (unclippedPolynomial (α:=α)).natDegree ≤ Fintype.card α-1 := by
  unfold unclippedPolynomial
  apply (natDegree_add_le _ _).trans
  rw [natDegree_one,zero_max]
  have h := massShellPolynomial_degree (α:=α) hα
  exact (prefixSumPolynomial_degree _).trans (by omega)

end HKMEhrhart
