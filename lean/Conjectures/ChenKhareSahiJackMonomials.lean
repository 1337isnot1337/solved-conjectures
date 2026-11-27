import Conjectures.ChenKhareSahiJackSchur

/-!
# Literal five-variable monomial and power-sum bases in degree five

Chen–Khare–Sahi's target parameter `τ = 3/2` is the reciprocal of Stanley's Jack
parameter, so `α = 2/3`. In degree five with five variables the monic Jack polynomials
`P_λ(x; α)` are characterized by Stanley's definition: `P_λ = m_λ + (dominance-lower
monomials)`, pairwise orthogonal for the power-sum scalar product
`⟨p_λ, p_μ⟩ = δ_{λμ} z_λ α^{ℓ(λ)}`. All seven partitions of five occur, the monomial
symmetric polynomials are literal orbit sums, and the power-sum coordinates are the
literal coefficients of the same five-variable polynomial functions.
-/

namespace ChenKhareSahi.Jack

noncomputable section

set_option maxRecDepth 32768
set_option maxHeartbeats 16000000

/-- The partitions of five, indexed in increasing dominance order. -/
abbrev Index := Fin 7

def jparts : Index → List ℕ :=
  ![[1, 1, 1, 1, 1], [2, 1, 1, 1], [2, 2, 1], [3, 1, 1], [3, 2], [4, 1], [5]]

/-- The exponent vector padded by zeros to five entries. -/
def padded (i : Index) : List ℕ := jparts i ++ List.replicate (5 - (jparts i).length) 0

/-- The partition as a function `Fin 5 → ℕ`. -/
def jpart5 (i : Index) : Fin 5 → ℕ := fun k => (padded i).getD k 0

/-! ## Literal monomial symmetric polynomials -/

/-- All distinct rearrangements of the padded exponents. -/
def orbit (i : Index) : Finset (List ℕ) := (padded i).permutations.toFinset

def orbitList : Index → List (List ℕ) :=
  ![[[1,1,1,1,1]],
    [[0,1,1,1,2], [0,1,1,2,1], [0,1,2,1,1], [0,2,1,1,1], [1,0,1,1,2], [1,0,1,2,1], [1,0,2,1,1], [1,1,0,1,2], [1,1,0,2,1], [1,1,1,0,2], [1,1,1,2,0], [1,1,2,0,1], [1,1,2,1,0], [1,2,0,1,1], [1,2,1,0,1], [1,2,1,1,0], [2,0,1,1,1], [2,1,0,1,1], [2,1,1,0,1], [2,1,1,1,0]],
    [[0,0,1,2,2], [0,0,2,1,2], [0,0,2,2,1], [0,1,0,2,2], [0,1,2,0,2], [0,1,2,2,0], [0,2,0,1,2], [0,2,0,2,1], [0,2,1,0,2], [0,2,1,2,0], [0,2,2,0,1], [0,2,2,1,0], [1,0,0,2,2], [1,0,2,0,2], [1,0,2,2,0], [1,2,0,0,2], [1,2,0,2,0], [1,2,2,0,0], [2,0,0,1,2], [2,0,0,2,1], [2,0,1,0,2], [2,0,1,2,0], [2,0,2,0,1], [2,0,2,1,0], [2,1,0,0,2], [2,1,0,2,0], [2,1,2,0,0], [2,2,0,0,1], [2,2,0,1,0], [2,2,1,0,0]],
    [[0,0,1,1,3], [0,0,1,3,1], [0,0,3,1,1], [0,1,0,1,3], [0,1,0,3,1], [0,1,1,0,3], [0,1,1,3,0], [0,1,3,0,1], [0,1,3,1,0], [0,3,0,1,1], [0,3,1,0,1], [0,3,1,1,0], [1,0,0,1,3], [1,0,0,3,1], [1,0,1,0,3], [1,0,1,3,0], [1,0,3,0,1], [1,0,3,1,0], [1,1,0,0,3], [1,1,0,3,0], [1,1,3,0,0], [1,3,0,0,1], [1,3,0,1,0], [1,3,1,0,0], [3,0,0,1,1], [3,0,1,0,1], [3,0,1,1,0], [3,1,0,0,1], [3,1,0,1,0], [3,1,1,0,0]],
    [[0,0,0,2,3], [0,0,0,3,2], [0,0,2,0,3], [0,0,2,3,0], [0,0,3,0,2], [0,0,3,2,0], [0,2,0,0,3], [0,2,0,3,0], [0,2,3,0,0], [0,3,0,0,2], [0,3,0,2,0], [0,3,2,0,0], [2,0,0,0,3], [2,0,0,3,0], [2,0,3,0,0], [2,3,0,0,0], [3,0,0,0,2], [3,0,0,2,0], [3,0,2,0,0], [3,2,0,0,0]],
    [[0,0,0,1,4], [0,0,0,4,1], [0,0,1,0,4], [0,0,1,4,0], [0,0,4,0,1], [0,0,4,1,0], [0,1,0,0,4], [0,1,0,4,0], [0,1,4,0,0], [0,4,0,0,1], [0,4,0,1,0], [0,4,1,0,0], [1,0,0,0,4], [1,0,0,4,0], [1,0,4,0,0], [1,4,0,0,0], [4,0,0,0,1], [4,0,0,1,0], [4,0,1,0,0], [4,1,0,0,0]],
    [[0,0,0,0,5], [0,0,0,5,0], [0,0,5,0,0], [0,5,0,0,0], [5,0,0,0,0]]]

theorem orbitList_nodup (i : Index) : (orbitList i).Nodup := by
  fin_cases i <;> decide +kernel

theorem orbit_eq (i : Index) : orbit i = (orbitList i).toFinset := by
  trans (padded i).permutations'.toFinset
  · ext e
    simp only [orbit, List.mem_toFinset, List.mem_permutations, List.mem_permutations']
  · fin_cases i <;> decide +kernel

theorem orbitList_shape : ∀ i : Index, ∀ e ∈ orbitList i, e.length = 5 ∧ e.sum = 5 := by
  decide +kernel

/-- A literal monomial in the five variables. -/
def term (e : List ℕ) (x : Pt) : ℝ :=
  x 0 ^ e[0]! * x 1 ^ e[1]! * x 2 ^ e[2]! * x 3 ^ e[3]! * x 4 ^ e[4]!

/-- The monomial symmetric polynomial `m_λ`: the sum over distinct exponent rearrangements. -/
def monomial (i : Index) (x : Pt) : ℝ := ∑ e ∈ orbit i, term e x

theorem monomial_eq_list (i : Index) (x : Pt) :
    monomial i x = ((orbitList i).map fun e => term e x).sum := by
  rw [monomial, orbit_eq, List.sum_toFinset _ (orbitList_nodup i)]

theorem term_smul (e : List ℕ) (he : e.length = 5) (t : ℝ) (x : Pt) :
    term e (t • x) = t ^ e.sum * term e x := by
  match e, he with
  | [a, b, c, d, f], _ =>
    simp only [term, Pi.smul_apply, smul_eq_mul, mul_pow, List.sum_cons, List.sum_nil, pow_add]
    simp
    ring

theorem monomial_smul (i : Index) (t : ℝ) (x : Pt) :
    monomial i (t • x) = t ^ 5 * monomial i x := by
  rw [monomial_eq_list, monomial_eq_list, ← List.sum_map_mul_left]
  congr 1
  apply List.map_congr_left
  intro e he
  obtain ⟨hl, hs⟩ := orbitList_shape i e he
  rw [term_smul e hl, hs]

/-! ## Power sums and the change of basis -/

/-- The power-sum product `p_λ`. -/
def power (i : Index) (x : Pt) : ℝ := ((jparts i).map fun a => ∑ k : Fin 5, x k ^ a).prod

/-- Monomial coefficients of the power sums: `p_λ = ∑_μ A_{λμ} m_μ`. -/
def powerInMonomial : Matrix Index Index ℚ :=
  !![120, 60, 30, 20, 10, 5, 1;
    0, 6, 6, 6, 4, 3, 1;
    0, 0, 2, 0, 2, 1, 1;
    0, 0, 0, 2, 1, 2, 1;
    0, 0, 0, 0, 1, 0, 1;
    0, 0, 0, 0, 0, 1, 1;
    0, 0, 0, 0, 0, 0, 1]

/-- Power-sum coefficients of the monomials: `m_μ = ∑_λ B_{μλ} p_λ`. -/
def monomialInPower : Matrix Index Index ℚ :=
  !![1/120, -1/12, 1/8, 1/6, -1/6, -1/4, 1/5;
    0, 1/6, -1/2, -1/2, 5/6, 1, -1;
    0, 0, 1/2, 0, -1, -1/2, 1;
    0, 0, 0, 1/2, -1/2, -1, 1;
    0, 0, 0, 0, 1, 0, -1;
    0, 0, 0, 0, 0, 1, -1;
    0, 0, 0, 0, 0, 0, 1]

theorem transition_inverse : monomialInPower * powerInMonomial = 1 := by
  decide +kernel

/-- The literal power-sum expansion in the monomial basis, as five-variable identities. -/
theorem power_expansion (i : Index) (x : Pt) :
    power i x = ∑ j, (powerInMonomial i j : ℝ) * monomial j x := by
  simp only [monomial_eq_list, Fin.sum_univ_succ, Fin.sum_univ_zero]
  fin_cases i <;>
    simp [power, powerInMonomial, orbitList, term, jparts, Fin.sum_univ_succ] <;> ring

end

end ChenKhareSahi.Jack
