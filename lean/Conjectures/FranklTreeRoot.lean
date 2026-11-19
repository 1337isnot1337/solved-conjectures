module

public import Conjectures.FranklTreeCone
public import Mathlib.Tactic.Ring

@[expose] public section

/-!
# Bounds at a root with three children

The root inequality is trilinear in the child messages. A finite certificate
can therefore check every triple of generating rays directly. Three uses of
cone generation extend these checks to three arbitrary, possibly different,
messages in the cone. This avoids an assumption that the children are equal.
-/

namespace FranklTreeCone

def rootOccupiedCount (x y z : Message) : ℝ :=
  factorMap x 0 * factorMap y 0 * factorMap z 0

def rootUnoccupiedCount (x y z : Message) : ℝ :=
  factorMap x 1 * factorMap y 1 * factorMap z 1 -
    factorMap x 2 * factorMap y 2 * factorMap z 2

/-- `rootSlack num den ≥ 0` is the denominator-cleared occupation bound. -/
def rootSlack (num den : ℝ) (x y z : Message) : ℝ :=
  num * (factorMap x 1 * factorMap y 1 * factorMap z 1) -
    (den - num) * (factorMap x 0 * factorMap y 0 * factorMap z 0) -
    num * (factorMap x 2 * factorMap y 2 * factorMap z 2)

theorem rootSlack_swap_right (num den : ℝ) (x y z : Message) :
    rootSlack num den x y z = rootSlack num den x z y := by
  unfold rootSlack
  ring

theorem rootSlack_cycle (num den : ℝ) (x y z : Message) :
    rootSlack num den x y z = rootSlack num den y z x := by
  unfold rootSlack
  ring

/-- Fixing two children leaves a linear function of the third. -/
def rootSlackLinear (num den : ℝ) (x y : Message) : Message →ₗ[ℝ] ℝ where
  toFun z := rootSlack num den x y z
  map_add' z w := by
    simp only [rootSlack, map_add, Pi.add_apply]
    ring
  map_smul' c z := by
    simp only [rootSlack, map_smul, Pi.smul_apply, smul_eq_mul, RingHom.id_apply]
    ring

theorem nonneg_linear_of_generators (A : Set Message) (f : Message →ₗ[ℝ] ℝ)
    (h : ∀ a ∈ A, 0 ≤ f a) {x : Message} (hx : x ∈ PointedCone.hull ℝ A) :
    0 ≤ f x := by
  have hle : PointedCone.hull ℝ A ≤ (PointedCone.positive ℝ ℝ).comap f :=
    Submodule.span_le.mpr h
  exact hle hx

/-- Finite checks on all triples of rays imply the bound for arbitrary cone
children, with no equality restriction on the child messages. -/
theorem rootSlack_nonneg_of_generators (A : Set Message) (num den : ℝ)
    (h : ∀ a ∈ A, ∀ b ∈ A, ∀ c ∈ A, 0 ≤ rootSlack num den a b c)
    {x y z : Message} (hx : x ∈ PointedCone.hull ℝ A)
    (hy : y ∈ PointedCone.hull ℝ A) (hz : z ∈ PointedCone.hull ℝ A) :
    0 ≤ rootSlack num den x y z := by
  have hthird : ∀ a ∈ A, ∀ b ∈ A, 0 ≤ rootSlack num den a b z := by
    intro a ha b hb
    exact nonneg_linear_of_generators A (rootSlackLinear num den a b)
      (fun c hc => h a ha b hb c hc) hz
  have hsecond : ∀ a ∈ A, 0 ≤ rootSlack num den a y z := by
    intro a ha
    have hlin : 0 ≤ rootSlack num den a z y :=
      nonneg_linear_of_generators A (rootSlackLinear num den a z)
        (fun b hb => by
          change 0 ≤ rootSlack num den a z b
          rw [rootSlack_swap_right]
          exact hthird a ha b hb) hy
    rw [rootSlack_swap_right] at hlin
    exact hlin
  have hlin : 0 ≤ rootSlack num den y z x :=
    nonneg_linear_of_generators A (rootSlackLinear num den y z)
      (fun a ha => by
        change 0 ≤ rootSlack num den y z a
        rw [← rootSlack_cycle num den a y z]
        exact hsecond a ha) hx
  rw [← rootSlack_cycle num den x y z] at hlin
  exact hlin

theorem occupation_le_of_rootSlack (num den : ℝ) (x y z : Message)
    (hden : 0 < den)
    (htotal : 0 < rootOccupiedCount x y z + rootUnoccupiedCount x y z)
    (hslack : 0 ≤ rootSlack num den x y z) :
    rootOccupiedCount x y z /
        (rootOccupiedCount x y z + rootUnoccupiedCount x y z) ≤ num / den := by
  apply (div_le_div_iff₀ htotal hden).mpr
  have hid : num * (rootOccupiedCount x y z + rootUnoccupiedCount x y z) -
      rootOccupiedCount x y z * den = rootSlack num den x y z := by
    unfold rootOccupiedCount rootUnoccupiedCount rootSlack
    ring
  exact sub_nonneg.mp (hid.symm ▸ hslack)

theorem occupation_le_of_ray_triples (A : Set Message) (num den : ℝ)
    (h : ∀ a ∈ A, ∀ b ∈ A, ∀ c ∈ A, 0 ≤ rootSlack num den a b c)
    {x y z : Message} (hx : x ∈ PointedCone.hull ℝ A)
    (hy : y ∈ PointedCone.hull ℝ A) (hz : z ∈ PointedCone.hull ℝ A)
    (hden : 0 < den)
    (htotal : 0 < rootOccupiedCount x y z + rootUnoccupiedCount x y z) :
    rootOccupiedCount x y z /
        (rootOccupiedCount x y z + rootUnoccupiedCount x y z) ≤ num / den :=
  occupation_le_of_rootSlack num den x y z hden htotal
    (rootSlack_nonneg_of_generators A num den h hx hy hz)

end FranklTreeCone
