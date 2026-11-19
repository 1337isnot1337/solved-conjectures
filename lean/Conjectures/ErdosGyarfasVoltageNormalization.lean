import Conjectures.ErdosGyarfasVoltageGraph
import Mathlib.Combinatorics.SimpleGraph.Paths
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic.Abel
import Mathlib.Tactic.FinCases

/-!
# Normalizing arbitrary voltages on the subdivided tetrahedron

Every assignment of seven labels in an arbitrary abelian group is isomorphic
to an assignment with four zero tree labels and three explicit chord labels.
The isomorphism subtracts the sum of the labels along the unique tree path
from vertex zero. It transports actual cycles without changing their lengths.

The normalized adjacency rule is also expressed through a homomorphism from
`Fin 3 → ℤ`. This module does not assume or reprove a universal cycle theorem.
It identifies the literal sharp example with its assignment in this same
arbitrary-voltage class.
-/

namespace ErdosGyarfasVoltage

abbrev Vector := Fin 3 → ℤ

/-- Signed chord counts, in the order `1--2`, `1--3`, `2--3`. -/
def chordStep (i j : Fin 5) : Vector :=
  if (i, j) = (1, 2) then ![1, 0, 0]
  else if (i, j) = (2, 1) then ![-1, 0, 0]
  else if (i, j) = (1, 3) then ![0, 1, 0]
  else if (i, j) = (3, 1) then ![0, -1, 0]
  else if (i, j) = (2, 3) then ![0, 0, 1]
  else if (i, j) = (3, 2) then ![0, 0, -1]
  else 0

section General

variable {A : Type*} [AddCommGroup A]

/-- The original sheet reached along each tree path from base vertex zero.
The seven labels are ordered `04,41,02,03,12,13,23`. -/
def treePotential (labels : Fin 7 → A) : Fin 5 → A :=
  ![0, labels 0 + labels 1, labels 2, labels 3, labels 0]

/-- The three chord labels remaining after the tree labels have been removed. -/
def normalizedChords (labels : Fin 7 → A) : Fin 3 → A :=
  ![labels 0 + labels 1 + labels 4 - labels 2,
    labels 0 + labels 1 + labels 5 - labels 3,
    labels 2 + labels 6 - labels 3]

/-- Four zero tree labels followed by the three normalized chord labels. -/
def normalizedLabels (labels : Fin 7 → A) : Fin 7 → A :=
  ![0, 0, 0, 0, normalizedChords labels 0,
    normalizedChords labels 1, normalizedChords labels 2]

theorem normalized_tree_labels (labels : Fin 7 → A) :
    normalizedLabels labels 0 = 0 ∧ normalizedLabels labels 1 = 0 ∧
      normalizedLabels labels 2 = 0 ∧ normalizedLabels labels 3 = 0 :=
  ⟨rfl, rfl, rfl, rfl⟩

theorem normalized_chord_labels (labels : Fin 7 → A) :
    normalizedLabels labels 4 = labels 0 + labels 1 + labels 4 - labels 2 ∧
      normalizedLabels labels 5 = labels 0 + labels 1 + labels 5 - labels 3 ∧
      normalizedLabels labels 6 = labels 2 + labels 6 - labels 3 :=
  ⟨rfl, rfl, rfl⟩

/-- The explicit tree potentials produce exactly the asserted normalized labels. -/
theorem gaugeLabels_treePotential (labels : Fin 7 → A) :
    gaugeLabels labels (treePotential labels) = normalizedLabels labels := by
  funext i
  fin_cases i <;>
    simp [gaugeLabels, treePotential, normalizedLabels, normalizedChords]

/-- Subtracting each tree potential is an actual graph isomorphism from an
arbitrary seven-label cover to its normalized cover. -/
def gaugeNormalizeIso (labels : Fin 7 → A) :
    voltageCover labels ≃g voltageCover (normalizedLabels labels) where
  toEquiv := (gaugeIso labels (treePotential labels)).toEquiv
  map_rel_iff' := by
    intro u v
    simpa only [gaugeLabels_treePotential] using
      (gaugeIso labels (treePotential labels)).map_rel_iff' (a := u) (b := v)

@[simp]
theorem gaugeNormalizeIso_apply (labels : Fin 7 → A) (u : Fin 5 × A) :
    gaugeNormalizeIso labels u = (u.1, u.2 - treePotential labels u.1) :=
  gaugeIso_apply labels (treePotential labels) u

@[simp]
theorem gaugeNormalizeIso_symm_apply (labels : Fin 7 → A) (u : Fin 5 × A) :
    (gaugeNormalizeIso labels).symm u = (u.1, u.2 + treePotential labels u.1) :=
  gaugeIso_symm_apply labels (treePotential labels) u

/-- Adjacency before and after the actual change of sheet coordinates. -/
theorem gauge_normalized_adj_iff (labels : Fin 7 → A) (u v : Fin 5 × A) :
    (voltageCover (normalizedLabels labels)).Adj
        (u.1, u.2 - treePotential labels u.1)
        (v.1, v.2 - treePotential labels v.1) ↔
      (voltageCover labels).Adj u v := by
  simpa only [gaugeNormalizeIso_apply] using
    (gaugeNormalizeIso labels).map_adj_iff (v := u) (w := v)

/-- Normalization preserves the existence of actual simple cycles of every
specified length, in both directions. -/
theorem cycle_length_normalized_iff (labels : Fin 7 → A) (n : ℕ) :
    (∃ (u : Fin 5 × A) (p : (voltageCover labels).Walk u u),
      p.IsCycle ∧ p.length = n) ↔
    (∃ (u : Fin 5 × A) (p : (voltageCover (normalizedLabels labels)).Walk u u),
      p.IsCycle ∧ p.length = n) := by
  constructor
  · rintro ⟨u, p, hp, hlen⟩
    refine ⟨gaugeNormalizeIso labels u, p.map (gaugeNormalizeIso labels).toHom,
      hp.map (gaugeNormalizeIso labels).injective, ?_⟩
    simpa only [SimpleGraph.Walk.length_map] using hlen
  · rintro ⟨u, p, hp, hlen⟩
    refine ⟨(gaugeNormalizeIso labels).symm u,
      p.map (gaugeNormalizeIso labels).symm.toHom,
      hp.map (gaugeNormalizeIso labels).symm.injective, ?_⟩
    simpa only [SimpleGraph.Walk.length_map] using hlen

/-- The homomorphism from signed chord-count vectors to sheet displacement. -/
def chordHom (labels : Fin 7 → A) : Vector →+ A where
  toFun v := (v 0) • normalizedChords labels 0 +
    (v 1) • normalizedChords labels 1 + (v 2) • normalizedChords labels 2
  map_zero' := by simp
  map_add' := by
    intro v w
    simp only [Pi.add_apply, add_zsmul]
    abel

/-- The normalized edge displacement is exactly the image of its signed
chord-count vector, including reversed edges. -/
theorem edgeVoltage_normalized_eq_chordHom (labels : Fin 7 → A) (i j : Fin 5) :
    edgeVoltage (normalizedLabels labels) i j = chordHom labels (chordStep i j) := by
  fin_cases i <;> fin_cases j <;>
    simp [edgeVoltage, normalizedLabels, chordStep, chordHom]

/-- The normalized cover has the precise `ℤ³`-homomorphism adjacency form. -/
theorem normalized_adjacency_iff (labels : Fin 7 → A) (u v : Fin 5 × A) :
    (voltageCover (normalizedLabels labels)).Adj u v ↔
      ErdosGyarfasSharp.baseGraph.Adj u.1 v.1 ∧
        v.2 = u.2 + chordHom labels (chordStep u.1 v.1) := by
  change (ErdosGyarfasSharp.baseGraph.Adj u.1 v.1 ∧
    v.2 = u.2 + edgeVoltage (normalizedLabels labels) u.1 v.1) ↔ _
  rw [edgeVoltage_normalized_eq_chordHom]

end General

private theorem sharp_edgeVoltage_eq : ∀ i j : Fin 5,
    edgeVoltage (![0, 0, 0, 0, 1, 8, 0] : Fin 7 → ZMod 19) i j =
      ErdosGyarfasSharp.baseVoltage i j := by
  decide

/-- The original sharp graph is literally a member of this arbitrary-voltage
class, with the four zero tree labels and chord labels `1,8,0`. -/
theorem sharp_voltageCover_eq :
    voltageCover (![0, 0, 0, 0, 1, 8, 0] : Fin 7 → ZMod 19) =
      ErdosGyarfasSharp.sharpGraph := by
  apply SimpleGraph.ext
  funext u v
  apply propext
  rw [ErdosGyarfasSharp.sharpGraph_adj_iff_base]
  change (ErdosGyarfasSharp.baseGraph.Adj u.1 v.1 ∧
    v.2 = u.2 + edgeVoltage (![0, 0, 0, 0, 1, 8, 0] : Fin 7 → ZMod 19) u.1 v.1) ↔ _
  rw [sharp_edgeVoltage_eq]

end ErdosGyarfasVoltage
