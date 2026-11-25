module
public import Conjectures.NovelliThibonCompleteElimination
public import Conjectures.NovelliThibonSchurExtraction
public import Mathlib.LinearAlgebra.Matrix.Block
public import Mathlib.Tactic

@[expose] public section
namespace NovelliThibon

open Matrix
open Classical
variable {N : ℕ} {R : Type*} [CommRing R]

noncomputable def jacobiTrudiUniv (x : Fin (N+1) → R) (shape : Fin (N+1) → ℕ) :
    Matrix (Fin (N+1)) (Fin (N+1)) R :=
  Matrix.of fun i j => completeOn Finset.univ x ((shape i:ℤ)-(i.val:ℤ)+j.val)

noncomputable def complementaryMatrix (x : Fin (N+1) → R) :
    Matrix (Fin (N+1)) (Fin (N+1)) R :=
  Matrix.of fun i j => ∑ T ∈ (Finset.univ.erase j).powersetCard (N-i.val),∏ z ∈ T,-x z

def powerMatrix (x : Fin (N+1) → R) (exp : Fin (N+1) → ℕ) :
    Matrix (Fin (N+1)) (Fin (N+1)) R :=
  Matrix.of fun i j => x j ^ exp i

def steppedExponents (shape : Fin (N+1) → ℕ) (i : Fin (N+1)) : ℕ :=
  shape i + (N-i.val)

/-- A finite matrix product gives the alternant numerator without
dividing: complementary elementary factors eliminate all but one
variable in each column. -/
theorem jacobiTrudi_mul_complementary (x : Fin (N+1) → R) (shape : Fin (N+1) → ℕ) :
    jacobiTrudiUniv x shape * complementaryMatrix x =
      powerMatrix x (steppedExponents shape) := by
  ext i j
  rw [Matrix.mul_apply]
  conv_lhs => rw [← Equiv.sum_comp Fin.revPerm]
  let S := (Finset.univ : Finset (Fin (N+1))).erase j
  have hS : S.card < N+1 := by
    dsimp [S]
    rw [Finset.card_erase_of_mem (Finset.mem_univ j),Finset.card_univ,Fintype.card_fin]
    omega
  let d := steppedExponents shape i
  have hi := i.isLt
  change (∑ u : Fin (N+1),jacobiTrudiUniv x shape i u.rev * complementaryMatrix x u.rev j) =
    x j ^ d
  calc
    _ = ∑ u : Fin (N+1), ∑ T ∈ S.powersetCard u.val,
        (∏ z ∈ T,-x z)*completeOn Finset.univ x ((d:ℤ)-T.card) := by
      apply Finset.sum_congr rfl
      intro u _
      have hu := u.isLt
      have hrev : u.rev.val=N-u.val := by
        rw [Fin.val_rev]
        omega
      have he : (shape i:ℤ)-(i.val:ℤ)+u.rev.val=(d:ℤ)-u.val := by
        rw [hrev]
        dsimp only [d,steppedExponents]
        omega
      have hr : N-u.rev.val=u.val := by rw [hrev]; omega
      change completeOn Finset.univ x ((shape i:ℤ)-(i.val:ℤ)+u.rev.val) *
        (∑ T ∈ S.powersetCard (N-u.rev.val),∏ z ∈ T,-x z) = _
      rw [he,hr,Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro T ht
      rw [Finset.mem_powersetCard.mp ht |>.2]
      ac_rfl
    _ = _ := by
      rw [sum_powersetCard_univ_fin hS]
      have hIns : insert j S = Finset.univ := Finset.insert_erase (Finset.mem_univ j)
      have hnot : j∉S := Finset.notMem_erase _ _
      simpa only [hIns,completeOn_singleton_nat] using completeOn_eliminate x j S hnot d

theorem jacobiTrudi_zero_det (x : Fin (N+1) → R) :
    (jacobiTrudiUniv x (fun _ => 0)).det=1 := by
  have hU : (jacobiTrudiUniv x (fun _ => 0)).IsUpperTriangular := by
    intro i j hij
    have hv : j.val < i.val := hij
    change completeOn Finset.univ x ((0:ℤ)-i.val+j.val)=0
    exact completeOn_neg _ _ (by omega)
  rw [det_of_isUpperTriangular hU]
  apply Finset.prod_eq_one
  intro i _
  change completeOn Finset.univ x ((0:ℤ)-i.val+i.val)=1
  have he : (0:ℤ)-i.val+i.val=0 := by ring
  rw [he,completeOn_zero]

/-- Cross-multiplied Jacobi–Trudi / alternant identity over every
commutative ring, before specialization to independent indeterminates. -/
theorem jacobiTrudi_det_times_staircase (x : Fin (N+1) → R) (shape : Fin (N+1) → ℕ) :
    (jacobiTrudiUniv x shape).det * (powerMatrix x (fun i => N-i.val)).det =
      (powerMatrix x (steppedExponents shape)).det := by
  have h0 := congrArg Matrix.det (jacobiTrudi_mul_complementary x (fun _ => 0))
  rw [Matrix.det_mul,jacobiTrudi_zero_det,one_mul] at h0
  have h0' : (complementaryMatrix x).det = (powerMatrix x (fun i => N-i.val)).det := by
    have hstep : steppedExponents (fun _ : Fin (N+1) => 0) = (fun i => N-i.val) :=
      funext (fun _ => Nat.zero_add _)
    rwa [hstep] at h0
  rw [← h0',← Matrix.det_mul,jacobiTrudi_mul_complementary]

end NovelliThibon
