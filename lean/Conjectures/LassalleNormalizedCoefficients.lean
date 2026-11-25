module

public import Conjectures.LassalleEventualReduction
public import Conjectures.LassalleBernsteinDifference

@[expose] public section
namespace LassalleRefinement

theorem catalan_mul_factorials (i : ℕ) :
    catalan i * i.factorial * (i+1).factorial = (2*i).factorial := by
  calc
    _ = ((i+1)*catalan i)*i.factorial*i.factorial := by rw [Nat.factorial_succ]; ring
    _ = (2*i).choose i*i.factorial*i.factorial := by
      rw [succ_mul_catalan_eq_centralBinom,Nat.centralBinom,Nat.two_mul]
    _ = _ := by
      have hh := Nat.choose_mul_factorial_mul_factorial (by omega : i≤2*i)
      rwa [show 2*i-i=i by omega] at hh

theorem signed_choose_desc (a i : ℕ) :
    (chooseFast a (2*i):ℝ)*(signedCatalan i:ℝ) =
      (-1:ℝ)^i*(a.descFactorial (2*i):ℝ) /
        ((i.factorial:ℝ)*((i+1).factorial:ℝ)) := by
  rw [signedCatalan_eq,chooseFast_eq,Nat.descFactorial_eq_factorial_mul_choose]
  push_cast
  have hC := congrArg (fun x : ℕ => (x:ℝ)) (catalan_mul_factorials i)
  push_cast at hC
  have hf₂ : (((i+1).factorial:ℕ):ℝ)≠0 := by positivity
  have hf₁ : ((i.factorial:ℕ):ℝ)≠0 := by positivity
  field_simp
  rw [←hC]
  ring

noncomputable def normalizedInverse (R M : ℝ) (m : ℕ) : ℝ :=
  R^m/(M*((2*m).factorial:ℝ))*(inverseCatalan m:ℝ)

theorem normalized_monomial_coefficient (R M : ℝ) (k a i j : ℕ)
    (hi : 2*i≤a) (hj : 2*j≤2*k-a) (ha : a≤2*k) (hM : M≠0) :
    R^k/(M*((2*k).factorial:ℝ)) *
      ((chooseFast a (2*i):ℝ)*(chooseFast (2*k-a) (2*j):ℝ)*
      (signedCatalan i:ℝ)*(signedCatalan j:ℝ)*(inverseCatalan (k-i-j):ℝ)) =
    realCoeff R i j * fallingRatio a (2*k-a) (2*i) (2*j) *
      normalizedInverse R M (k-i-j) := by
  have hd : 2*i+2*j≤2*k := by omega
  have h₁ : 2*k-(2*i+2*j)=2*(k-i-j) := by omega
  have h₂ : a+(2*k-a)=2*k := by omega
  have hN := Nat.factorial_mul_descFactorial hd
  rw [h₁] at hN
  have hNr := congrArg (fun n : ℕ => (n:ℝ)) hN
  push_cast at hNr
  have hp : R^k=R^(i+j)*R^(k-i-j) := by
    rw [←pow_add,show i+j+(k-i-j)=k by omega]
  have hc : ((coeffFactor i j:ℕ):ℝ)=
      ((i.factorial:ℝ)*((i+1).factorial:ℝ))*((j.factorial:ℝ)*((j+1).factorial:ℝ)) := by
    unfold coeffFactor
    push_cast
    ring
  have hf (n : ℕ) : ((n.factorial:ℕ):ℝ)≠0 := by positivity
  have hd' : ((2*k).descFactorial (2*i+2*j):ℝ)≠0 := by
    exact_mod_cast (Nat.descFactorial_pos.mpr hd).ne'
  calc
    _ = R^k/(M*((2*k).factorial:ℝ)) *
        (((chooseFast a (2*i):ℝ)*(signedCatalan i:ℝ)) *
         ((chooseFast (2*k-a) (2*j):ℝ)*(signedCatalan j:ℝ)) *
         (inverseCatalan (k-i-j):ℝ)) := by ring
    _ = _ := by
      rw [signed_choose_desc,signed_choose_desc,realCoeff,fallingRatio,normalizedInverse,hp,h₂,hc,←pow_add]
      rw [←hNr]
      field_simp
      ring

theorem scaledQuotientRow_expansion (R M : ℝ) (k a : ℕ) (ha : a≤2*k) (hM : M≠0) :
    scaledQuotientRow R M k a =
      ∑ i ∈ Finset.range (a/2+1), ∑ j ∈ Finset.range ((2*k-a)/2+1),
        realCoeff R i j * fallingRatio a (2*k-a) (2*i) (2*j) * normalizedInverse R M (k-i-j) := by
  unfold scaledQuotientRow quotientRow
  push_cast
  simp_rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i hi
  apply Finset.sum_congr rfl
  intro j hj
  have hi' := Finset.mem_range.mp hi
  have hj' := Finset.mem_range.mp hj
  exact normalized_monomial_coefficient R M k a i j (by omega) (by omega) ha hM

end LassalleRefinement
