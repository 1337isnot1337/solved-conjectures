module

public import Mathlib.Algebra.Group.Basic
public import Mathlib.Algebra.Group.Hom.Defs

/-!
# Conjugacy around a cycle of simple factors

These are the label equations in the lift of the Shumyatsky proof, in
the order in which the corresponding factors are visited. The group
can be the automorphism group of a factor and the homomorphism its
quotient to the outer automorphism group.
-/

@[expose] public section

namespace Shumyatsky

variable {A B : Type*} [Group A] [Group B]

/-- Given the starting conjugator label, transport it along the paired
    edges of the two cycles. In each pair the first label is for the
    original cycle and the second is for its conjugate. -/
def transportLabels : List (A × A) → A → A
  | [], g => g
  | (x, y) :: rest, g => transportLabels rest (y * g * x⁻¹)

/-- Path labels compose in reverse traversal order. -/
def pathLabel : List A → A
  | [] => 1
  | x :: rest => pathLabel rest * x

theorem transportLabels_eq (edges : List (A × A)) (g : A) :
    transportLabels edges g =
      pathLabel (edges.map Prod.snd) * g * (pathLabel (edges.map Prod.fst))⁻¹ := by
  induction edges generalizing g with
  | nil =>
    change g = 1 * g * 1⁻¹
    have h : (1 : A)⁻¹ = 1 := inv_one
    rw [h, one_mul, mul_one]
  | cons edge rest ih =>
    rcases edge with ⟨x, y⟩
    simp only [transportLabels, List.map_cons, pathLabel]
    rw [ih]
    simp [mul_assoc]

/-- The consistency condition is precisely conjugacy of the full cycle
    products by the starting label, as in equation (2). -/
theorem transportLabels_returns_iff (edges : List (A × A)) (g : A) :
    transportLabels edges g = g ↔
      pathLabel (edges.map Prod.snd) =
        g * pathLabel (edges.map Prod.fst) * g⁻¹ := by
  rw [transportLabels_eq]
  constructor
  · intro h
    have h' := congrArg (fun z => z * pathLabel (edges.map Prod.fst) * g⁻¹) h
    simpa [mul_assoc] using h'
  · intro h
    rw [h]
    simp [mul_assoc]

theorem transportLabels_append (first second : List (A × A)) (g : A) :
    transportLabels (first ++ second) g =
      transportLabels second (transportLabels first g) := by
  induction first generalizing g with
  | nil => rfl
  | cons edge rest ih =>
    rcases edge with ⟨x, y⟩
    exact ih _

/-- The final edge of the conjugate cycle is forced by the prescribed
    starting label and the other edge labels. -/
def closingLabel (edges : List (A × A)) (x g : A) : A :=
  g * x * (transportLabels edges g)⁻¹

theorem transportLabels_close_iff (edges : List (A × A)) (x y g : A) :
    transportLabels (edges ++ [(x, y)]) g = g ↔ y = closingLabel edges x g := by
  rw [transportLabels_append]
  change y * transportLabels edges g * x⁻¹ = g ↔ _
  unfold closingLabel
  constructor
  · intro h
    have h' := congrArg (fun z => z * x * (transportLabels edges g)⁻¹) h
    simpa [mul_assoc] using h'
  · intro h
    rw [h]
    simp [mul_assoc]

/-- Passing to a quotient commutes with the label transport. -/
theorem map_transportLabels (f : A →* B) (edges : List (A × A)) (g : A) :
    f (transportLabels edges g) =
      transportLabels (edges.map (fun e => (f e.1, f e.2))) (f g) := by
  induction edges generalizing g with
  | nil => rfl
  | cons edge rest ih =>
    rcases edge with ⟨x, y⟩
    simp [transportLabels, ih]

/-- Every set of prefix labels in the prescribed outer classes can be
    closed by a unique final label in its prescribed outer class. -/
theorem existsUnique_closingLabel_in_class (f : A →* B)
    (edges original : List (A × A)) (x x₀ y₀ g : A)
    (hEdges : edges.map (fun e => (f e.1, f e.2)) =
      original.map (fun e => (f e.1, f e.2)))
    (hx : f x = f x₀)
    (hOriginal : transportLabels (original ++ [(x₀, y₀)]) g = g) :
    ∃! y : A, f y = f y₀ ∧ transportLabels (edges ++ [(x, y)]) g = g := by
  have hClass : f (closingLabel edges x g) = f (closingLabel original x₀ g) := by
    simp only [closingLabel, map_mul, map_inv, map_transportLabels, hEdges, hx]
  have hy₀ := (transportLabels_close_iff original x₀ y₀ g).1 hOriginal
  refine ⟨closingLabel edges x g, ⟨hClass.trans (congrArg f hy₀.symm), ?_⟩, ?_⟩
  · exact (transportLabels_close_iff _ _ _ _).2 rfl
  · intro y hy
    exact (transportLabels_close_iff _ _ _ _).1 hy.2

end Shumyatsky
