module

public import Conjectures.XuZhouZeroExtension

@[expose] public section
namespace XuZhou
open Matrix Finset
open scoped Matrix BigOperators InnerProductSpace

variable {V : Type*} [Fintype V] [DecidableEq V]

theorem quadraticEnergy_complete_graph_le_n (x : EuclideanSpace ℝ V) :
    quadraticEnergy ((⊤ : SimpleGraph V).lapMatrix ℝ) x ≤
      (Fintype.card V:ℝ)*‖x‖^2 := by
  rw [quadraticEnergy_lapMatrix,euclidean_norm_square]
  have h (i j : V) :
      (if (⊤ : SimpleGraph V).Adj i j then (x i-x j)^2 else 0)=(x i-x j)^2 := by
    by_cases hij : i=j
    · subst j
      simp
    · simp [hij]
  have he (i j : V) : (x i-x j)^2 = (x i)^2+(x j)^2-(2*x i*x j) := by ring
  simp_rw [h,he]
  simp only [Finset.sum_sub_distrib,Finset.sum_add_distrib]
  have h₁ : (∑ i : V,∑ _ : V,(x i)^2) = (Fintype.card V:ℝ)*∑ i : V,(x i)^2 := by
    simp only [Finset.sum_const,Finset.card_univ,nsmul_eq_mul,Finset.mul_sum]
  have h₂ : (∑ _ : V,∑ j : V,(x j)^2) = (Fintype.card V:ℝ)*∑ j : V,(x j)^2 := by
    simp [nsmul_eq_mul]
  have h₃ : (∑ i : V,∑ j : V,2*x i*x j) = 2*(∑ i : V,x i)^2 := by
    simp_rw [← Finset.mul_sum]
    have hfactor (i : V) : 2*x i*(∑ j : V,x j) = (2*(∑ j : V,x j))*x i := by ring
    simp_rw [hfactor]
    rw [← Finset.mul_sum]
    ring
  rw [h₁,h₂,h₃]
  nlinarith [sq_nonneg (∑ i : V,x i)]

theorem laplacian_eigenvalue_le_card (G : SimpleGraph V) [DecidableRel G.Adj] (i : V) :
    (G.isHermitian_lapMatrix ℝ).eigenvalues i ≤ (Fintype.card V:ℝ) := by
  let h := G.isHermitian_lapMatrix ℝ
  let x := h.eigenvectorBasis i
  have hE : quadraticEnergy (G.lapMatrix ℝ) x=h.eigenvalues i := by
    unfold quadraticEnergy
    rw [matrix_apply_eigenvector h i,real_inner_smul_right,real_inner_self_eq_norm_sq]
    simp [x,h.eigenvectorBasis.orthonormal.norm_eq_one]
  have hn : ‖x‖=1 := h.eigenvectorBasis.orthonormal.norm_eq_one i
  have hm := (quadraticEnergy_lapMatrix_mono G ⊤ le_top x).trans (quadraticEnergy_complete_graph_le_n x)
  rw [hE,hn] at hm
  simpa [h] using hm

end XuZhou
