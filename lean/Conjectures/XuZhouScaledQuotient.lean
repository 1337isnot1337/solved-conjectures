module

public import Conjectures.XuZhouLayerSums

@[expose] public section
namespace XuZhou
open Matrix Finset
open scoped Matrix BigOperators InnerProductSpace
variable {n : ℕ}

def phase (i : Fin n) : ℝ := (-1:ℝ)^i.val

theorem phase_square (i : Fin n) : (phase i)^2=1 := by
  unfold phase
  rw [← pow_mul,Nat.mul_comm,pow_mul]
  norm_num

theorem phase_nonzero (i : Fin n) : phase i ≠ 0 := by unfold phase; positivity

theorem phase_opposite {i j : Fin n} (h : consecutive i j) : phase j= -phase i := by
  rcases h with h | h
  · simp [phase,← h,pow_succ,mul_neg]
  · have he : phase i= -phase j := by simp [phase,← h,pow_succ,mul_neg]
    linarith

noncomputable def scaledCoordinate (a : Fin n→ℕ) (z : Fin n→ℝ) (i : Fin n) :=
  phase i*z i/(a i:ℝ)

theorem scaled_norm_term (a : Fin n→ℕ) (z : Fin n→ℝ) (i : Fin n) (hi : 0<a i) :
    (a i:ℝ)*(scaledCoordinate a z i)^2=(z i)^2/(a i:ℝ) := by
  have h : (a i:ℝ)≠0 := Nat.cast_ne_zero.mpr hi.ne'
  calc
    _ = (phase i)^2 * ((z i)^2/(a i:ℝ)) := by
      unfold scaledCoordinate
      field_simp [h]
    _ = _ := by rw [phase_square,one_mul]

theorem scaled_pair_term (a : Fin n→ℕ) (z : Fin n→ℝ) (i j : Fin n)
    (hi : 0<a i) (hj : 0<a j) (hc : consecutive i j) :
    (a i:ℝ)*(a j:ℝ)*(scaledCoordinate a z i-scaledCoordinate a z j)^2 =
      (a j:ℝ)*(z i)^2/(a i:ℝ)+(a i:ℝ)*(z j)^2/(a j:ℝ)+2*z i*z j := by
  have h₁ : (a i:ℝ)≠0 := Nat.cast_ne_zero.mpr hi.ne'
  have h₂ : (a j:ℝ)≠0 := Nat.cast_ne_zero.mpr hj.ne'
  calc
    _ = (phase i)^2*((a i:ℝ)*(a j:ℝ)*(z i/(a i:ℝ)+z j/(a j:ℝ))^2) := by
      unfold scaledCoordinate
      rw [phase_opposite hc]
      ring
    _ = _ := by
      rw [phase_square,one_mul]
      field_simp [h₁,h₂]
      ring

private theorem sum_option_entry (o : Option (Fin n)) (f : Fin n→ℝ) :
    (∑ j,if o=some j then f j else 0)=(o.map f).getD 0 := by
  cases o with
  | none => simp
  | some i => simp

theorem consecutive_weight_sum (a : Fin n→ℕ) (i : Fin n) :
    (∑ j,if consecutive i j then (a j:ℝ) else 0) =
      (leftSize a i:ℝ)+(rightSize a i:ℝ) := by
  have h (j : Fin n) :
      (if consecutive i j then (a j:ℝ) else 0) =
        (if leftNeighbor i=some j then (a j:ℝ) else 0) +
        (if rightNeighbor i=some j then (a j:ℝ) else 0) := by
    simp only [leftNeighbor_eq_some_iff,rightNeighbor_eq_some_iff]
    unfold consecutive
    by_cases h1 : i.val+1=j.val
    · have h2 : ¬ j.val+1=i.val := by omega
      simp [h1,h2]
    · by_cases h2 : j.val+1=i.val <;> simp [h1,h2]
  simp_rw [h]
  rw [Finset.sum_add_distrib,sum_option_entry,sum_option_entry]
  unfold leftSize rightSize
  cases leftNeighbor i <;> cases rightNeighbor i <;> simp

theorem chainEnergy_explicit (a : Fin n→ℕ) (z : EuclideanSpace ℝ (Fin n)) :
    quadraticEnergy (chainTridiagonal a) z =
      (∑ i,chainDiag a i*(z i)^2) +
      (∑ i,∑ j,if consecutive i j then z i*z j else 0) := by
  rw [quadraticEnergy_dotProduct]
  simp only [Matrix.mulVec,dotProduct,Finset.mul_sum]
  have h (i j : Fin n) : z i*(chainTridiagonal a i j*z j) =
      (if i=j then chainDiag a i*(z i)^2 else 0) +
      (if consecutive i j then z i*z j else 0) := by
    by_cases hij : i=j
    · subst j
      simp [chainTridiagonal,not_consecutive_self]
      ring
    · by_cases hh : consecutive i j <;> simp [chainTridiagonal,hij,hh]
  simp_rw [h]
  simp only [Finset.sum_add_distrib,Finset.sum_ite_eq,Finset.mem_univ,ite_true]

theorem weighted_adjacent_energy (a : Fin n→ℕ) (ha : ∀ i,0<a i)
    (z : Fin n→ℝ) :
    (∑ i,∑ j,if consecutive i j then
      (a i:ℝ)*(a j:ℝ)*(scaledCoordinate a z i-scaledCoordinate a z j)^2 else 0)/2 =
      (∑ i,((leftSize a i:ℝ)+(rightSize a i:ℝ))*(z i)^2/(a i:ℝ)) +
        (∑ i,∑ j,if consecutive i j then z i*z j else 0) := by
  let D (i j : Fin n) := if consecutive i j then (a j:ℝ)*(z i)^2/(a i:ℝ) else 0
  let C (i j : Fin n) := if consecutive i j then z i*z j else 0
  have h (i j : Fin n) :
      (if consecutive i j then
        (a i:ℝ)*(a j:ℝ)*(scaledCoordinate a z i-scaledCoordinate a z j)^2 else 0) =
      D i j + D j i + 2*C i j := by
    by_cases hc : consecutive i j
    · have hc' := (consecutive_comm i j).mp hc
      simp only [D,C,hc,hc',ite_true]
      simpa only [mul_assoc] using scaled_pair_term a z i j (ha i) (ha j) hc
    · have hc' : ¬consecutive j i := fun hh => hc ((consecutive_comm j i).mp hh)
      simp [D,C,hc,hc']
  simp_rw [h]
  simp only [Finset.sum_add_distrib,← Finset.mul_sum]
  rw [show (∑ i,∑ j,D j i)=(∑ i,∑ j,D i j) from Finset.sum_comm]
  have hD : (∑ i,∑ j,D i j) =
      ∑ i,((leftSize a i:ℝ)+(rightSize a i:ℝ))*(z i)^2/(a i:ℝ) := by
    apply Finset.sum_congr rfl
    intro i _
    have hh (j : Fin n) : D i j =
        (if consecutive i j then (a j:ℝ) else 0)*((z i)^2/(a i:ℝ)) := by
      by_cases hc : consecutive i j <;> simp [D,hc,mul_div_assoc]
    simp_rw [hh]
    rw [← Finset.sum_mul,consecutive_weight_sum]
    exact (mul_div_assoc _ _ _).symm
  rw [hD]
  change (_+_+2*(∑ i,∑ j,C i j))/2 = _+(∑ i,∑ j,C i j)
  ring

end XuZhou
