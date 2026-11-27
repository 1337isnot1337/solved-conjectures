import Conjectures.ChenKhareSahiJackSourceSamples

namespace ChenKhareSahi.Jack.Source

noncomputable section

set_option maxRecDepth 65536
set_option maxHeartbeats 16000000

private def orbit0 : Fin 1 → List (List ℕ) :=
  ![[[0, 0, 0, 0, 0]]]

private theorem orbit0_perm (i : Fin 1) :
    ((List.ofFn (block0.sh i)).permutations'.eraseDups).Perm (orbit0 i) := by
  revert i
  decide +kernel

private theorem mono0 (i : Fin 1) (x : Pt) :
    monomialValue (block0.sh i) x =
      ((orbit0 i).map fun es => (List.ofFn fun k : Fin 5 => x k ^ es.getD k 0).prod).sum :=
  ((orbit0_perm i).map _).sum_eq

theorem expansion0 (i : Fin 1) (x : Pt) :
    monomialValue (block0.sh i) x =
      ∑ j, ((block0.transition i j : ℚ) : ℝ) * powerValue (block0.sh j) x := by
  rw [mono0]
  fin_cases i
  simp [orbit0, block0, powerValue, parts, Fin.sum_univ_succ, List.ofFn_succ]

private def orbit1 : Fin 1 → List (List ℕ) :=
  ![[[0, 0, 0, 0, 1], [0, 0, 0, 1, 0], [0, 0, 1, 0, 0], [0, 1, 0, 0, 0], [1, 0, 0, 0, 0]]]

private theorem orbit1_perm (i : Fin 1) :
    ((List.ofFn (block1.sh i)).permutations'.eraseDups).Perm (orbit1 i) := by
  revert i
  decide +kernel

private theorem mono1 (i : Fin 1) (x : Pt) :
    monomialValue (block1.sh i) x =
      ((orbit1 i).map fun es => (List.ofFn fun k : Fin 5 => x k ^ es.getD k 0).prod).sum :=
  ((orbit1_perm i).map _).sum_eq

theorem expansion1 (i : Fin 1) (x : Pt) :
    monomialValue (block1.sh i) x =
      ∑ j, ((block1.transition i j : ℚ) : ℝ) * powerValue (block1.sh j) x := by
  rw [mono1]
  fin_cases i
  simp [orbit1, block1, powerValue, parts, Fin.sum_univ_succ, List.ofFn_succ]
  ring

private def orbit2 : Fin 2 → List (List ℕ) :=
  ![[[0, 0, 0, 1, 1], [0, 0, 1, 0, 1], [0, 0, 1, 1, 0], [0, 1, 0, 0, 1], [0, 1, 0, 1, 0], [0, 1, 1, 0, 0], [1, 0, 0, 0, 1], [1, 0, 0, 1, 0], [1, 0, 1, 0, 0], [1, 1, 0, 0, 0]], [[0, 0, 0, 0, 2], [0, 0, 0, 2, 0], [0, 0, 2, 0, 0], [0, 2, 0, 0, 0], [2, 0, 0, 0, 0]]]

private theorem orbit2_perm (i : Fin 2) :
    ((List.ofFn (block2.sh i)).permutations'.eraseDups).Perm (orbit2 i) := by
  revert i
  decide +kernel

private theorem mono2 (i : Fin 2) (x : Pt) :
    monomialValue (block2.sh i) x =
      ((orbit2 i).map fun es => (List.ofFn fun k : Fin 5 => x k ^ es.getD k 0).prod).sum :=
  ((orbit2_perm i).map _).sum_eq

theorem expansion2 (i : Fin 2) (x : Pt) :
    monomialValue (block2.sh i) x =
      ∑ j, ((block2.transition i j : ℚ) : ℝ) * powerValue (block2.sh j) x := by
  rw [mono2]
  fin_cases i <;>
    simp [orbit2, block2, powerValue, parts, Fin.sum_univ_succ, List.ofFn_succ] <;> ring

private def orbit3 : Fin 3 → List (List ℕ) :=
  ![[[0, 0, 1, 1, 1], [0, 1, 0, 1, 1], [0, 1, 1, 0, 1], [0, 1, 1, 1, 0], [1, 0, 0, 1, 1], [1, 0, 1, 0, 1], [1, 0, 1, 1, 0], [1, 1, 0, 0, 1], [1, 1, 0, 1, 0], [1, 1, 1, 0, 0]], [[0, 0, 0, 1, 2], [0, 0, 0, 2, 1], [0, 0, 1, 0, 2], [0, 0, 1, 2, 0], [0, 0, 2, 0, 1], [0, 0, 2, 1, 0], [0, 1, 0, 0, 2], [0, 1, 0, 2, 0], [0, 1, 2, 0, 0], [0, 2, 0, 0, 1], [0, 2, 0, 1, 0], [0, 2, 1, 0, 0], [1, 0, 0, 0, 2], [1, 0, 0, 2, 0], [1, 0, 2, 0, 0], [1, 2, 0, 0, 0], [2, 0, 0, 0, 1], [2, 0, 0, 1, 0], [2, 0, 1, 0, 0], [2, 1, 0, 0, 0]], [[0, 0, 0, 0, 3], [0, 0, 0, 3, 0], [0, 0, 3, 0, 0], [0, 3, 0, 0, 0], [3, 0, 0, 0, 0]]]

private theorem orbit3_perm (i : Fin 3) :
    ((List.ofFn (block3.sh i)).permutations'.eraseDups).Perm (orbit3 i) := by
  revert i
  decide +kernel

private theorem mono3 (i : Fin 3) (x : Pt) :
    monomialValue (block3.sh i) x =
      ((orbit3 i).map fun es => (List.ofFn fun k : Fin 5 => x k ^ es.getD k 0).prod).sum :=
  ((orbit3_perm i).map _).sum_eq

theorem expansion3 (i : Fin 3) (x : Pt) :
    monomialValue (block3.sh i) x =
      ∑ j, ((block3.transition i j : ℚ) : ℝ) * powerValue (block3.sh j) x := by
  rw [mono3]
  fin_cases i <;>
    simp [orbit3, block3, powerValue, parts, Fin.sum_univ_succ, List.ofFn_succ] <;> ring

private def orbit4 : Fin 5 → List (List ℕ) :=
  ![[[0, 1, 1, 1, 1], [1, 0, 1, 1, 1], [1, 1, 0, 1, 1], [1, 1, 1, 0, 1], [1, 1, 1, 1, 0]], [[0, 0, 1, 1, 2], [0, 0, 1, 2, 1], [0, 0, 2, 1, 1], [0, 1, 0, 1, 2], [0, 1, 0, 2, 1], [0, 1, 1, 0, 2], [0, 1, 1, 2, 0], [0, 1, 2, 0, 1], [0, 1, 2, 1, 0], [0, 2, 0, 1, 1], [0, 2, 1, 0, 1], [0, 2, 1, 1, 0], [1, 0, 0, 1, 2], [1, 0, 0, 2, 1], [1, 0, 1, 0, 2], [1, 0, 1, 2, 0], [1, 0, 2, 0, 1], [1, 0, 2, 1, 0], [1, 1, 0, 0, 2], [1, 1, 0, 2, 0], [1, 1, 2, 0, 0], [1, 2, 0, 0, 1], [1, 2, 0, 1, 0], [1, 2, 1, 0, 0], [2, 0, 0, 1, 1], [2, 0, 1, 0, 1], [2, 0, 1, 1, 0], [2, 1, 0, 0, 1], [2, 1, 0, 1, 0], [2, 1, 1, 0, 0]], [[0, 0, 0, 2, 2], [0, 0, 2, 0, 2], [0, 0, 2, 2, 0], [0, 2, 0, 0, 2], [0, 2, 0, 2, 0], [0, 2, 2, 0, 0], [2, 0, 0, 0, 2], [2, 0, 0, 2, 0], [2, 0, 2, 0, 0], [2, 2, 0, 0, 0]], [[0, 0, 0, 1, 3], [0, 0, 0, 3, 1], [0, 0, 1, 0, 3], [0, 0, 1, 3, 0], [0, 0, 3, 0, 1], [0, 0, 3, 1, 0], [0, 1, 0, 0, 3], [0, 1, 0, 3, 0], [0, 1, 3, 0, 0], [0, 3, 0, 0, 1], [0, 3, 0, 1, 0], [0, 3, 1, 0, 0], [1, 0, 0, 0, 3], [1, 0, 0, 3, 0], [1, 0, 3, 0, 0], [1, 3, 0, 0, 0], [3, 0, 0, 0, 1], [3, 0, 0, 1, 0], [3, 0, 1, 0, 0], [3, 1, 0, 0, 0]], [[0, 0, 0, 0, 4], [0, 0, 0, 4, 0], [0, 0, 4, 0, 0], [0, 4, 0, 0, 0], [4, 0, 0, 0, 0]]]

private theorem orbit4_perm (i : Fin 5) :
    ((List.ofFn (block4.sh i)).permutations'.eraseDups).Perm (orbit4 i) := by
  revert i
  decide +kernel

private theorem mono4 (i : Fin 5) (x : Pt) :
    monomialValue (block4.sh i) x =
      ((orbit4 i).map fun es => (List.ofFn fun k : Fin 5 => x k ^ es.getD k 0).prod).sum :=
  ((orbit4_perm i).map _).sum_eq

theorem expansion4 (i : Fin 5) (x : Pt) :
    monomialValue (block4.sh i) x =
      ∑ j, ((block4.transition i j : ℚ) : ℝ) * powerValue (block4.sh j) x := by
  rw [mono4]
  fin_cases i <;>
    simp [orbit4, block4, powerValue, parts, Fin.sum_univ_succ, List.ofFn_succ] <;> ring

private def orbit5 : Fin 7 → List (List ℕ) :=
  ![[[1, 1, 1, 1, 1]], [[0, 1, 1, 1, 2], [0, 1, 1, 2, 1], [0, 1, 2, 1, 1], [0, 2, 1, 1, 1], [1, 0, 1, 1, 2], [1, 0, 1, 2, 1], [1, 0, 2, 1, 1], [1, 1, 0, 1, 2], [1, 1, 0, 2, 1], [1, 1, 1, 0, 2], [1, 1, 1, 2, 0], [1, 1, 2, 0, 1], [1, 1, 2, 1, 0], [1, 2, 0, 1, 1], [1, 2, 1, 0, 1], [1, 2, 1, 1, 0], [2, 0, 1, 1, 1], [2, 1, 0, 1, 1], [2, 1, 1, 0, 1], [2, 1, 1, 1, 0]], [[0, 0, 1, 2, 2], [0, 0, 2, 1, 2], [0, 0, 2, 2, 1], [0, 1, 0, 2, 2], [0, 1, 2, 0, 2], [0, 1, 2, 2, 0], [0, 2, 0, 1, 2], [0, 2, 0, 2, 1], [0, 2, 1, 0, 2], [0, 2, 1, 2, 0], [0, 2, 2, 0, 1], [0, 2, 2, 1, 0], [1, 0, 0, 2, 2], [1, 0, 2, 0, 2], [1, 0, 2, 2, 0], [1, 2, 0, 0, 2], [1, 2, 0, 2, 0], [1, 2, 2, 0, 0], [2, 0, 0, 1, 2], [2, 0, 0, 2, 1], [2, 0, 1, 0, 2], [2, 0, 1, 2, 0], [2, 0, 2, 0, 1], [2, 0, 2, 1, 0], [2, 1, 0, 0, 2], [2, 1, 0, 2, 0], [2, 1, 2, 0, 0], [2, 2, 0, 0, 1], [2, 2, 0, 1, 0], [2, 2, 1, 0, 0]], [[0, 0, 1, 1, 3], [0, 0, 1, 3, 1], [0, 0, 3, 1, 1], [0, 1, 0, 1, 3], [0, 1, 0, 3, 1], [0, 1, 1, 0, 3], [0, 1, 1, 3, 0], [0, 1, 3, 0, 1], [0, 1, 3, 1, 0], [0, 3, 0, 1, 1], [0, 3, 1, 0, 1], [0, 3, 1, 1, 0], [1, 0, 0, 1, 3], [1, 0, 0, 3, 1], [1, 0, 1, 0, 3], [1, 0, 1, 3, 0], [1, 0, 3, 0, 1], [1, 0, 3, 1, 0], [1, 1, 0, 0, 3], [1, 1, 0, 3, 0], [1, 1, 3, 0, 0], [1, 3, 0, 0, 1], [1, 3, 0, 1, 0], [1, 3, 1, 0, 0], [3, 0, 0, 1, 1], [3, 0, 1, 0, 1], [3, 0, 1, 1, 0], [3, 1, 0, 0, 1], [3, 1, 0, 1, 0], [3, 1, 1, 0, 0]], [[0, 0, 0, 2, 3], [0, 0, 0, 3, 2], [0, 0, 2, 0, 3], [0, 0, 2, 3, 0], [0, 0, 3, 0, 2], [0, 0, 3, 2, 0], [0, 2, 0, 0, 3], [0, 2, 0, 3, 0], [0, 2, 3, 0, 0], [0, 3, 0, 0, 2], [0, 3, 0, 2, 0], [0, 3, 2, 0, 0], [2, 0, 0, 0, 3], [2, 0, 0, 3, 0], [2, 0, 3, 0, 0], [2, 3, 0, 0, 0], [3, 0, 0, 0, 2], [3, 0, 0, 2, 0], [3, 0, 2, 0, 0], [3, 2, 0, 0, 0]], [[0, 0, 0, 1, 4], [0, 0, 0, 4, 1], [0, 0, 1, 0, 4], [0, 0, 1, 4, 0], [0, 0, 4, 0, 1], [0, 0, 4, 1, 0], [0, 1, 0, 0, 4], [0, 1, 0, 4, 0], [0, 1, 4, 0, 0], [0, 4, 0, 0, 1], [0, 4, 0, 1, 0], [0, 4, 1, 0, 0], [1, 0, 0, 0, 4], [1, 0, 0, 4, 0], [1, 0, 4, 0, 0], [1, 4, 0, 0, 0], [4, 0, 0, 0, 1], [4, 0, 0, 1, 0], [4, 0, 1, 0, 0], [4, 1, 0, 0, 0]], [[0, 0, 0, 0, 5], [0, 0, 0, 5, 0], [0, 0, 5, 0, 0], [0, 5, 0, 0, 0], [5, 0, 0, 0, 0]]]

private theorem orbit5_perm (i : Fin 7) :
    ((List.ofFn (block5.sh i)).permutations'.eraseDups).Perm (orbit5 i) := by
  revert i
  decide +kernel

private theorem mono5 (i : Fin 7) (x : Pt) :
    monomialValue (block5.sh i) x =
      ((orbit5 i).map fun es => (List.ofFn fun k : Fin 5 => x k ^ es.getD k 0).prod).sum :=
  ((orbit5_perm i).map _).sum_eq

theorem expansion5 (i : Fin 7) (x : Pt) :
    monomialValue (block5.sh i) x =
      ∑ j, ((block5.transition i j : ℚ) : ℝ) * powerValue (block5.sh j) x := by
  rw [mono5]
  fin_cases i <;>
    simp [orbit5, block5, powerValue, parts, Fin.sum_univ_succ, List.ofFn_succ] <;> ring

theorem power_expansion (d : Fin 6) (i : Fin (dimension d)) (x : Pt) :
    monomialValue ((degreeBlock d).sh i) x =
      ∑ j, (((degreeBlock d).transition i j : ℚ) : ℝ) * powerValue ((degreeBlock d).sh j) x := by
  fin_cases d
  · exact expansion0 i x
  · exact expansion1 i x
  · exact expansion2 i x
  · exact expansion3 i x
  · exact expansion4 i x
  · exact expansion5 i x

end

end ChenKhareSahi.Jack.Source
