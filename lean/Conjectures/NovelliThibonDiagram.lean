module
public import Mathlib.Combinatorics.Young.YoungDiagram
public import Mathlib.Order.Prod.Lex.Basic
public import Mathlib.Data.Finset.Sort
public import Mathlib.Data.Fintype.Prod

@[expose] public section
namespace NovelliThibon

abbrev Cell (μ : YoungDiagram) := ↥μ.cells

def row {μ : YoungDiagram} (c : Cell μ) : ℕ := c.val.1

def col {μ : YoungDiagram} (c : Cell μ) : ℕ := c.val.2

theorem cell_mem_row {μ : YoungDiagram} (c : Cell μ) : col c < μ.rowLen (row c) :=
  YoungDiagram.mem_iff_lt_rowLen.mp c.property

theorem cell_mem_col {μ : YoungDiagram} (c : Cell μ) : row c < μ.colLen (col c) :=
  YoungDiagram.mem_iff_lt_colLen.mp c.property

/-- French reading order goes top to bottom and left to right.
The row coordinate is therefore reversed. -/
def readingKey {μ : YoungDiagram} (c : Cell μ) : (ℕᵒᵈ ×ₗ ℕ) :=
  toLex (OrderDual.toDual (row c),col c)

theorem readingKey_injective (μ : YoungDiagram) : Function.Injective (readingKey (μ:=μ)) := by
  intro a b h
  apply Subtype.ext
  exact Prod.ext (congrArg (fun z : ℕᵒᵈ ×ₗ ℕ => OrderDual.ofDual (ofLex z).1) h)
    (congrArg (fun z : ℕᵒᵈ ×ₗ ℕ => (ofLex z).2) h)

def readingKeys (μ : YoungDiagram) : Finset (ℕᵒᵈ ×ₗ ℕ) :=
  Finset.univ.image (readingKey (μ:=μ))

noncomputable def readingCellEquiv (μ : YoungDiagram) : Cell μ ≃ ↥(readingKeys μ) :=
  Equiv.ofBijective
    (fun c => ⟨readingKey c,Finset.mem_image.mpr ⟨c,Finset.mem_univ _,rfl⟩⟩)
    ⟨fun _ _ h => readingKey_injective μ (congrArg (fun z : ↥(readingKeys μ) => z.val) h),
      fun ⟨x,hx⟩ => by
        obtain ⟨c,_,rfl⟩ := Finset.mem_image.mp hx
        exact ⟨c,rfl⟩⟩

theorem readingKeys_card (μ : YoungDiagram) : (readingKeys μ).card = μ.card := by
  rw [readingKeys,Finset.card_image_of_injective _ (readingKey_injective μ),Finset.card_univ,
    Fintype.card_coe]

/-- Exact label order for the source's top-to-bottom reading list. -/
noncomputable def readingLabel (μ : YoungDiagram) : Cell μ ≃ Fin μ.card :=
  (readingCellEquiv μ).trans (Finset.orderIsoOfFin (readingKeys μ) (readingKeys_card μ)).symm.toEquiv

theorem readingLabel_lt_iff (μ : YoungDiagram) (a b : Cell μ) :
    readingLabel μ a < readingLabel μ b ↔ row b<row a ∨ row a=row b ∧ col a<col b := by
  change ((Finset.orderIsoOfFin (readingKeys μ) (readingKeys_card μ)).symm (readingCellEquiv μ a)) <
      (Finset.orderIsoOfFin (readingKeys μ) (readingKeys_card μ)).symm (readingCellEquiv μ b) ↔ _
  rw [OrderIso.lt_iff_lt]
  exact Prod.Lex.toLex_lt_toLex

def sameRowAttacks (μ : YoungDiagram) : Finset (Cell μ × Cell μ) :=
  Finset.univ.filter (fun (p : Cell μ × Cell μ) => row p.1=row p.2 ∧ col p.1<col p.2)

def adjacentRowAttacks (μ : YoungDiagram) : Finset (Cell μ × Cell μ) :=
  Finset.univ.filter (fun (p : Cell μ × Cell μ) => row p.1=row p.2+1 ∧ col p.2<col p.1)

def optionalVertical (μ : YoungDiagram) : Finset (Cell μ × Cell μ) :=
  Finset.univ.filter (fun (p : Cell μ × Cell μ) => row p.1=row p.2+1 ∧ col p.1=col p.2)

def arm {μ : YoungDiagram} (c : Cell μ) : ℕ := μ.rowLen (row c)-1-col c

def legLabel {μ : YoungDiagram} (c : Cell μ) : ℕ := μ.colLen (col c)-row c

theorem mem_sameRowAttacks {μ : YoungDiagram} {p : Cell μ × Cell μ} :
    p ∈ sameRowAttacks μ ↔ row p.1=row p.2 ∧ col p.1 < col p.2 := by
  simp [sameRowAttacks]

theorem mem_adjacentRowAttacks {μ : YoungDiagram} {p : Cell μ × Cell μ} :
    p ∈ adjacentRowAttacks μ ↔ row p.1=row p.2+1 ∧ col p.2 < col p.1 := by
  simp [adjacentRowAttacks]

theorem mem_optionalVertical {μ : YoungDiagram} {p : Cell μ × Cell μ} :
    p ∈ optionalVertical μ ↔ row p.1=row p.2+1 ∧ col p.1=col p.2 := by
  simp [optionalVertical]

theorem sameRowAttacks_oriented {μ : YoungDiagram} {p : Cell μ × Cell μ}
    (h : p ∈ sameRowAttacks μ) : readingLabel μ p.1 < readingLabel μ p.2 :=
  (readingLabel_lt_iff _ _ _).mpr (Or.inr (mem_sameRowAttacks.mp h))

theorem adjacentRowAttacks_oriented {μ : YoungDiagram} {p : Cell μ × Cell μ}
    (h : p ∈ adjacentRowAttacks μ) : readingLabel μ p.1 < readingLabel μ p.2 := by
  apply (readingLabel_lt_iff _ _ _).mpr
  left
  have hh := (mem_adjacentRowAttacks.mp h).1
  omega

theorem optionalVertical_oriented {μ : YoungDiagram} {p : Cell μ × Cell μ}
    (h : p ∈ optionalVertical μ) : readingLabel μ p.1 < readingLabel μ p.2 := by
  apply (readingLabel_lt_iff _ _ _).mpr
  left
  have hh := (mem_optionalVertical.mp h).1
  omega

end NovelliThibon
