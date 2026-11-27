import Conjectures.ChenKhareSahiJackSource

/-! Literal power-sum and monomial expansions for the Jack source family at parameter one. -/

namespace ChenKhareSahi.Jack.Source

noncomputable section

open Matrix

def monomialValue (p : Shape) (x : Pt) : ℝ :=
  (((List.ofFn p).permutations'.eraseDups).map fun exps =>
    (List.ofFn fun i : Fin 5 => x i ^ exps.getD i 0).prod).sum

def powerValue (p : Shape) (x : Pt) : ℝ :=
  ((parts p).map fun k => ∑ i, x i ^ k).prod

theorem monomialValue_nat (p x : Shape) : monomialValue p (natPt x) = (monAt p x : ℝ) := by
  simp [monomialValue, monAt, natPt, Nat.cast_list_sum, List.map_map, Function.comp_def]

theorem powerValue_nat (p x : Shape) : powerValue p (natPt x) = (powAt p x : ℝ) := by
  simp [powerValue, powAt, natPt, Nat.cast_list_prod, List.map_map, Function.comp_def]

/-- The two coefficient matrices describe the same actual functions. The monic
triangularity and the power-sum orthogonality are the source's equations (2.8)–(2.10)
at parameter one. -/
structure IsUnitJackBlock {n : ℕ} (b : Block n) (G : Shape → Pt → ℝ)
    (M P : Mat n ℝ) : Prop where
  monic : ∀ i, M i i = 1
  triangular : ∀ i j, ¬ Dominates (b.sh i) (b.sh j) → M i j = 0
  orthogonal : ∀ i j, i ≠ j → (P * liftQ (weights b.sh) * P.transpose) i j = 0
  monomial_expansion : ∀ i x, G (b.sh i) x = ∑ j, M i j * monomialValue (b.sh j) x
  power_expansion : ∀ i x, G (b.sh i) x = ∑ j, P i j * powerValue (b.sh j) x

theorem IsUnitJackBlock.monomial_eq {n : ℕ} {b : Block n} {G : Shape → Pt → ℝ}
    {M P : Mat n ℝ} (hG : IsUnitJackBlock b G M P) (hv : ValidBlock b)
    (order : ∀ i j, i < j → ¬ Dominates (b.sh i) (b.sh j)) :
    M = liftQ b.schurRow := by
  apply source_coordinates b hv M P ⟨hG.monic, fun i j h => hG.triangular i j (order i j h)⟩
  · ext i k
    have h := (hG.monomial_expansion i (natPt (b.sh k))).symm.trans
      (hG.power_expansion i (natPt (b.sh k)))
    simp only [monomialValue_nat, powerValue_nat] at h
    simpa [Matrix.mul_apply, liftQ, sampleMatrix] using h
  · exact hG.orthogonal

def testPoint : Fin 4 → Shape := ![pt1, pt2, pt3, ones5]

def rawValue {n : ℕ} (b : Block n) (i : Fin n) (x : Shape) : ℚ :=
  ∑ j, b.schurRow i j * (monAt (b.sh j) x : ℚ)

def expectedPoint (e : Shape × ℤ × ℤ × ℤ × ℤ) : Fin 4 → ℚ :=
  ![(e.2.1 : ℚ), (e.2.2.1 : ℚ), (e.2.2.2.1 : ℚ), (e.2.2.2.2 : ℚ)]

theorem IsUnitJackBlock.sample {n : ℕ} {b : Block n} {G : Shape → Pt → ℝ} {M P : Mat n ℝ}
    (hG : IsUnitJackBlock b G M P) (hv : ValidBlock b)
    (order : ∀ i j, i < j → ¬ Dominates (b.sh i) (b.sh j)) (i : Fin n) (x : Shape) :
    G (b.sh i) (natPt x) = (rawValue b i x : ℝ) := by
  rw [hG.monomial_expansion, hG.monomial_eq hv order]
  simp [rawValue, monomialValue_nat, liftQ]

end

end ChenKhareSahi.Jack.Source
