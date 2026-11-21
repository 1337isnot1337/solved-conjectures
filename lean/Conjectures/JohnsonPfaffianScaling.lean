import Conjectures.JohnsonPfaffianProduct
namespace JohnsonPfaffian

def endpoints (M : List (ℕ × ℕ)) : List ℕ := M.flatMap (fun e => [e.1,e.2])
def edgeProduct {R : Type*} [CommSemiring R] (w : ℕ → ℕ → R) (M : List (ℕ × ℕ)) : R :=
  (M.map (fun e => w e.1 e.2)).prod

theorem diagonal_matching_scale {R : Type*} [CommSemiring R]
    (d : ℕ → R) (w : ℕ → ℕ → R) (M : List (ℕ × ℕ)) :
    edgeProduct (fun i j => d i*d j*w i j) M =
      ((endpoints M).map d).prod * edgeProduct w M := by
  induction M with
  | nil => simp [edgeProduct,endpoints]
  | cons e M ih =>
    simp only [edgeProduct,endpoints,List.map_cons,List.prod_cons,List.flatMap_cons,List.map_append,
      List.prod_append,List.map_nil,List.prod_nil,mul_one] at *
    rw [ih]
    ring

theorem diagonal_matching_scale_on_vertices {R : Type*} [CommSemiring R]
    (d : ℕ → R) (w : ℕ → ℕ → R) (M : List (ℕ × ℕ)) (V : List ℕ)
    (hM : (endpoints M).Perm V) :
    edgeProduct (fun i j => d i*d j*w i j) M = (V.map d).prod * edgeProduct w M := by
  rw [diagonal_matching_scale, (hM.map d).prod_eq]

theorem diagonal_signed_matching_sum_scale {R : Type*} [CommSemiring R]
    (d : ℕ → R) (w : ℕ → ℕ → R) (sign : List (ℕ × ℕ) → R)
    (𝓜 : Finset (List (ℕ × ℕ))) (V : List ℕ)
    (hM : ∀ M ∈ 𝓜, (endpoints M).Perm V) :
    (∑ M ∈ 𝓜, sign M * edgeProduct (fun i j => d i*d j*w i j) M) =
      (V.map d).prod * ∑ M ∈ 𝓜, sign M * edgeProduct w M := by
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro M hmem
  rw [diagonal_matching_scale_on_vertices d w M V (hM M hmem)]
  ring
end JohnsonPfaffian
