import Conjectures.HornakTiling
import Mathlib.Data.Nat.GCD.Basic

/-! Arithmetic transfer between arbitrary two-consecutive-size partitions. -/
namespace Hornak

theorem equal_size_counts (i a b a' b' : ℕ) (hi : 0 < i)
    (horder : b ≤ b') (htotal : a*i+b*(i+1) = a'*i+b'*(i+1)) :
    ∃ t, b' = b+t*i ∧ a = a'+t*(i+1) := by
  have ha : a' ≤ a := by nlinarith
  have hdiff : (a-a')*i = (b'-b)*(i+1) := by
    have ha' := Nat.sub_add_cancel ha
    have hb' := Nat.sub_add_cancel horder
    nlinarith
  have hcop : i.Coprime (i+1) := Nat.coprime_self_add_right.mpr (Nat.coprime_one_right i)
  have hdvd : i ∣ (b'-b)*(i+1) := by
    rw [← hdiff]
    exact Nat.dvd_mul_left i (a-a')
  have hd : i ∣ b'-b := hcop.dvd_of_dvd_mul_right hdvd
  obtain ⟨t,ht⟩ := hd
  refine ⟨t, ?_, ?_⟩
  · have hb' := Nat.sub_add_cancel horder
    nlinarith
  · have ha' := Nat.sub_add_cancel ha
    nlinarith

/-- For the same total occupied size, feasibility at a larger admissible
larger-piece count implies feasibility at every smaller one with a budget. -/
theorem transfer_equal_total {m : ℕ} (capacity : Fin m → ℕ)
    (i a b a' b' K : ℕ) (hi : 0 < i) (horder : b ≤ b')
    (htotal : a*i+b*(i+1) = a'*i+b'*(i+1))
    (hbudget : a+b+K = ∑ j, capacity j/i)
    (hfeasible : ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a' ∧ (∑ j, large j) = b' ∧
      ∀ j, small j*i+large j*(i+1) ≤ capacity j) :
    ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ capacity j := by
  obtain ⟨t,hb,ha⟩ := equal_size_counts i a b a' b' hi horder htotal
  subst b'
  subst a
  exact transfer_many_fewer_large capacity i a' b K t hi hbudget hfeasible

theorem arm_quotient_sum_identity {m : ℕ} (capacity : Fin m → ℕ) (i : ℕ) :
    (∑ j, capacity j/i)*i + (∑ j, capacity j%i) = ∑ j, capacity j := by
  rw [Finset.sum_mul, ← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro j _
  simpa [Nat.mul_comm] using Nat.div_add_mod (capacity j) i

theorem regular_budget_nonnegative {m : ℕ} (capacity : Fin m → ℕ) (i a b : ℕ)
    (_hi : 0 < i) (hres : (∑ j, capacity j%i) < 2*i)
    (htotal : (i+1)+a*i+b*(i+1) = 1+∑ j, capacity j) :
    a+b ≤ ∑ j, capacity j/i := by
  have hq := arm_quotient_sum_identity capacity i
  by_contra h
  nlinarith

/-- The regular two-size case follows from the residue bound and the
explicit carry witness at the largest larger-piece endpoint. -/
theorem regular_two_size_packing {m : ℕ} (capacity : Fin m → ℕ)
    (i a b ae be γ : ℕ) (hi : 0 < i)
    (hres : (∑ j, capacity j%i) < 2*i)
    (htotal : (i+1)+a*i+b*(i+1) = 1+∑ j, capacity j)
    (hendpoint_total : a*i+b*(i+1) = ae*i+be*(i+1))
    (horder : b ≤ be)
    (hae : ae ≤ ∑ j, capacity j/i) (hγ : γ ≤ 1)
    (hendpoint : ae+be = (∑ j, capacity j/(i+1))+γ)
    (hcarry : γ = 1 → ∃ p : Fin m,
      (i+1)-capacity p%(i+1) ≤ ae ∧
      (i+1)-capacity p%(i+1) ≤ capacity p/i) :
    ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ capacity j := by
  have hq := regular_budget_nonnegative capacity i a b hi hres htotal
  have hbudget : a+b+((∑ j, capacity j/i)-(a+b)) = ∑ j, capacity j/i := by omega
  have hfeasible := regular_endpoint_packing capacity i ae be γ hi hae hγ hendpoint hcarry
  exact transfer_equal_total capacity i a b ae be _ hi horder hendpoint_total hbudget hfeasible

theorem regular_two_size_partition {m q : ℕ} (arms : Fin m → ℕ)
    (sizes : Fin (q+1) → ℕ) (i a b ae be γ : ℕ) (hi : 0 < i)
    (hcenter : sizes 0 = i+1)
    (hsmall : Nat.card {k : Fin q // sizes k.succ = i} = a)
    (hlarge : Nat.card {k : Fin q // sizes k.succ = i+1} = b)
    (hvalues : ∀ k : Fin q, sizes k.succ = i ∨ sizes k.succ = i+1)
    (hres : (∑ j, arms j%i) < 2*i)
    (htotal : (i+1)+a*i+b*(i+1) = 1+∑ j, arms j)
    (hendpoint_total : a*i+b*(i+1) = ae*i+be*(i+1)) (horder : b ≤ be)
    (hae : ae ≤ ∑ j, arms j/i) (hγ : γ ≤ 1)
    (hendpoint : ae+be = (∑ j, arms j/(i+1))+γ)
    (hcarry : γ = 1 → ∃ p : Fin m,
      (i+1)-arms p%(i+1) ≤ ae ∧ (i+1)-arms p%(i+1) ≤ arms p/i) :
    Partitionable arms sizes := by
  apply partition_from_packing arms sizes i a b (i+1) hi hcenter hsmall hlarge hvalues htotal
  exact regular_two_size_packing arms i a b ae be γ hi hres htotal hendpoint_total
    horder hae hγ hendpoint hcarry

/-- The endpoint with at most `i` small pieces has the quotient and
remainder described in the proof, for any total arm quotient and residue. -/
theorem endpoint_arithmetic (i ae be H V : ℕ) (ha : ae ≤ i)
    (htotal : (i+1)+ae*i+be*(i+1) = 1+H*(i+1)+V) :
    ae+(V%(i+1))+1 = i+1 ∧ ae+be = H+V/(i+1) := by
  have hpos : 0 < i+1 := by omega
  have hmod : V%(i+1) < i+1 := Nat.mod_lt _ hpos
  have hdiv := Nat.div_add_mod V (i+1)
  have hmult : (i+1) ∣ H*(i+1)+(1+V+ae) := by
    refine ⟨ae+be+1, ?_⟩
    nlinarith
  have hV : (i+1) ∣ 1+V+ae := (Nat.dvd_add_iff_right (Nat.dvd_mul_left (i+1) H)).2 hmult
  have hV' : (i+1) ∣ ((V/(i+1))*(i+1))+(1+V%(i+1)+ae) := by
    convert hV using 1
    nlinarith
  have hsmall : (i+1) ∣ 1+V%(i+1)+ae :=
    (Nat.dvd_add_iff_right (Nat.dvd_mul_left (i+1) (V/(i+1)))).2 hV'
  obtain ⟨t,ht⟩ := hsmall
  have htpos : 0 < t := by
    by_contra hn
    have : t = 0 := by omega
    subst t
    simp at ht
  have htone : t = 1 := by
    by_contra htne
    have ht2 : 2 ≤ t := by omega
    nlinarith
  subst t
  constructor <;> nlinarith

/-- The paper's residue bound and its fifth-test witness imply the entire
regular two-size connected-partition case, without a separate endpoint
hypothesis. The larger central part is the zeroth label. -/
theorem regular_case_from_tests {m q : ℕ} (arms : Fin m → ℕ)
    (sizes : Fin (q+1) → ℕ) (i a b : ℕ) (hi : 0 < i)
    (hcenter : sizes 0 = i+1)
    (hsmall : Nat.card {k : Fin q // sizes k.succ = i} = a)
    (hlarge : Nat.card {k : Fin q // sizes k.succ = i+1} = b)
    (hvalues : ∀ k : Fin q, sizes k.succ = i ∨ sizes k.succ = i+1)
    (htotal : (i+1)+a*i+b*(i+1) = 1+∑ j, arms j)
    (htest_i : (∑ j, arms j%i)/i ≤ 1)
    (htest_j : (∑ j, arms j%(i+1))/(i+1) ≤ 1)
    (htest5 : (∑ j, arms j%(i+1))/(i+1) = 1 →
      ∃ p : Fin m, (∑ j, arms j%(i+1))%(i+1) < arms p%(i+1) ∧
        i+1 ≤ arms p/i+arms p%(i+1)) :
    Partitionable arms sizes := by
  let ae := a%(i+1)
  let be := b+(a/(i+1))*i
  let U := ∑ j, arms j%i
  let V := ∑ j, arms j%(i+1)
  let H := ∑ j, arms j/(i+1)
  have hres : U < 2*i := by
    have hdiv : U/i < 2 := by dsimp [U]; omega
    have h := (Nat.div_lt_iff_lt_mul hi).1 hdiv
    nlinarith
  have haelt : ae ≤ i := by
    have h := Nat.mod_lt a (by omega : 0 < i+1)
    dsimp [ae]
    omega
  have heq : a*i+b*(i+1) = ae*i+be*(i+1) := by
    have h := Nat.div_add_mod a (i+1)
    dsimp [ae,be]
    nlinarith
  have heptotal : (i+1)+ae*i+be*(i+1) = 1+∑ j, arms j := by omega
  have horder : b ≤ be := by dsimp [be]; omega
  have hae : ae ≤ ∑ j, arms j/i := by
    have h := regular_budget_nonnegative arms i ae be hi hres heptotal
    omega
  have hq := arm_quotient_sum_identity arms (i+1)
  have hformula : ae+(V%(i+1))+1 = i+1 ∧ ae+be = H+V/(i+1) := by
    apply endpoint_arithmetic i ae be H V haelt
    dsimp [H,V]
    nlinarith
  apply regular_two_size_partition arms sizes i a b ae be (V/(i+1)) hi
    hcenter hsmall hlarge hvalues hres htotal heq horder hae htest_j hformula.2
  intro hγ
  obtain ⟨p,hv,hqv⟩ := htest5 hγ
  have hf := hformula.1
  change ae + ((∑ j, arms j%(i+1))%(i+1))+1 = i+1 at hf
  have hp : arms p%(i+1) < i+1 := Nat.mod_lt _ (by omega)
  refine ⟨p, ?_, ?_⟩ <;> omega

end Hornak
