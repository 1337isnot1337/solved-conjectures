import Mathlib.Combinatorics.SimpleGraph.Finite
import Mathlib.Combinatorics.SimpleGraph.Connectivity.Connected
import Mathlib.Tactic.Tauto

/-!
# Vertex boundaries and minimum fragments

These lemmas prove the finite-graph atom argument used in the connectivity
part of the circulant construction.  Boundaries are the actual external
vertex neighborhoods of a `SimpleGraph`.
-/

namespace CircularIndex.Connectivity

open Finset

variable {V : Type*} [Fintype V] [DecidableEq V]

noncomputable def boundary (G : SimpleGraph V) (A : Finset V) : Finset V := by
  classical
  exact univ.filter fun v => v ∉ A ∧ ∃ a ∈ A, G.Adj a v

noncomputable def exterior (G : SimpleGraph V) (A : Finset V) : Finset V := by
  classical
  exact (A ∪ boundary G A)ᶜ

@[simp] theorem mem_boundary {G : SimpleGraph V} {A : Finset V} {v : V} :
    v ∈ boundary G A ↔ v ∉ A ∧ ∃ a ∈ A, G.Adj a v := by
  classical
  simp [boundary]

@[simp] theorem mem_exterior {G : SimpleGraph V} {A : Finset V} {v : V} :
    v ∈ exterior G A ↔ v ∉ A ∧ ∀ a ∈ A, ¬ G.Adj a v := by
  classical
  simp only [exterior, mem_compl, mem_union, mem_boundary]
  constructor
  · intro h
    have hv : v ∉ A := fun ha => h (Or.inl ha)
    exact ⟨hv, fun a ha hav => h (Or.inr ⟨hv, a, ha, hav⟩)⟩
  · rintro ⟨hv, hn⟩ (ha | ⟨_, a, ha, hav⟩)
    · exact hv ha
    · exact hn a ha hav

theorem disjoint_boundary (G : SimpleGraph V) (A : Finset V) :
    Disjoint A (boundary G A) := by
  classical
  simp only [Finset.disjoint_left, mem_boundary]
  tauto

theorem disjoint_exterior (G : SimpleGraph V) (A : Finset V) :
    Disjoint A (exterior G A) := by
  classical
  simp only [Finset.disjoint_left, mem_exterior]
  tauto

theorem boundary_disjoint_exterior (G : SimpleGraph V) (A : Finset V) :
    Disjoint (boundary G A) (exterior G A) := by
  classical
  apply Finset.disjoint_left.mpr
  intro v hv he
  obtain ⟨_, a, ha, hav⟩ := mem_boundary.mp hv
  exact (mem_exterior.mp he).2 a ha hav

theorem exterior_antitone (G : SimpleGraph V) {A B : Finset V} (h : A ⊆ B) :
    exterior G B ⊆ exterior G A := by
  classical
  intro v hv
  obtain ⟨hv, hadj⟩ := mem_exterior.mp hv
  exact mem_exterior.mpr ⟨fun ha => hv (h ha), fun a ha => hadj a (h ha)⟩

theorem subset_exterior_exterior (G : SimpleGraph V) (A : Finset V) :
    A ⊆ exterior G (exterior G A) := by
  classical
  intro a ha
  apply mem_exterior.mpr
  refine ⟨fun he => (mem_exterior.mp he).1 ha, ?_⟩
  intro b hb hba
  exact (mem_exterior.mp hb).2 a ha hba.symm

theorem boundary_exterior_subset (G : SimpleGraph V) (A : Finset V) :
    boundary G (exterior G A) ⊆ boundary G A := by
  classical
  intro v hv
  obtain ⟨hv, a, ha, hav⟩ := mem_boundary.mp hv
  have hn : v ∉ A := fun hva => (mem_exterior.mp ha).2 v hva hav.symm
  have : v ∈ A ∪ boundary G A := by simpa only [exterior, mem_compl, not_not] using hv
  exact (mem_union.mp this).resolve_left hn

theorem card_partition (G : SimpleGraph V) (A S : Finset V) :
    (S ∩ A).card + (S ∩ boundary G A).card + (S ∩ exterior G A).card = S.card := by
  classical
  have h₁ : Disjoint (S ∩ A) (S ∩ boundary G A) :=
    (disjoint_boundary G A).mono inter_subset_right inter_subset_right
  have h₂ : Disjoint ((S ∩ A) ∪ (S ∩ boundary G A)) (S ∩ exterior G A) := by
    apply Finset.disjoint_union_left.mpr
    exact ⟨(disjoint_exterior G A).mono inter_subset_right inter_subset_right,
      (boundary_disjoint_exterior G A).mono inter_subset_right inter_subset_right⟩
  have hu : ((S ∩ A) ∪ (S ∩ boundary G A)) ∪ (S ∩ exterior G A) = S := by
    ext v
    simp only [exterior, mem_union, mem_inter, mem_compl]
    tauto
  rw [← card_union_of_disjoint h₁, ← card_union_of_disjoint h₂, hu]

theorem boundary_inter_subset (G : SimpleGraph V) (A B : Finset V) :
    boundary G (A ∩ B) ⊆
      (A ∩ boundary G B) ∪ (boundary G A ∩ B) ∪ (boundary G A ∩ boundary G B) := by
  classical
  intro v hv
  obtain ⟨hv, a, ha, hav⟩ := mem_boundary.mp hv
  obtain ⟨ha, hb⟩ := mem_inter.mp ha
  by_cases hA : v ∈ A
  · have hB : v ∉ B := fun hB => hv (mem_inter.mpr ⟨hA, hB⟩)
    exact mem_union_left _ (mem_union_left _
      (mem_inter.mpr ⟨hA, mem_boundary.mpr ⟨hB, a, hb, hav⟩⟩))
  · have hNA : v ∈ boundary G A := mem_boundary.mpr ⟨hA, a, ha, hav⟩
    by_cases hB : v ∈ B
    · exact mem_union_left _ (mem_union_right _ (mem_inter.mpr ⟨hNA, hB⟩))
    · exact mem_union_right _ (mem_inter.mpr
        ⟨hNA, mem_boundary.mpr ⟨hB, a, hb, hav⟩⟩)

theorem card_boundary_inter_le (G : SimpleGraph V) (A B : Finset V) :
    (boundary G (A ∩ B)).card ≤
      (A ∩ boundary G B).card + (boundary G A ∩ B).card +
        (boundary G A ∩ boundary G B).card := by
  classical
  exact (card_le_card (boundary_inter_subset G A B)).trans
    ((card_union_le _ _).trans (Nat.add_le_add_right (card_union_le _ _) _))

def IsFragment (G : SimpleGraph V) (k : ℕ) (A : Finset V) : Prop :=
  A.Nonempty ∧ (exterior G A).Nonempty ∧ (boundary G A).card = k

def IsAtom (G : SimpleGraph V) (k : ℕ) (A : Finset V) : Prop :=
  IsFragment G k A ∧ ∀ B, IsFragment G k B → A.card ≤ B.card

def BoundaryLowerBound (G : SimpleGraph V) (k : ℕ) : Prop :=
  ∀ A : Finset V, A.Nonempty → (exterior G A).Nonempty → k ≤ (boundary G A).card

theorem fragment_of_boundary_le {G : SimpleGraph V} {k : ℕ}
    (hlow : BoundaryLowerBound G k) {A : Finset V}
    (hA : A.Nonempty) (hE : (exterior G A).Nonempty)
    (hcard : (boundary G A).card ≤ k) : IsFragment G k A :=
  ⟨hA, hE, Nat.le_antisymm hcard (hlow A hA hE)⟩

theorem fragment_exterior {G : SimpleGraph V} {k : ℕ}
    (hlow : BoundaryLowerBound G k) {A : Finset V} (hA : IsFragment G k A) :
    IsFragment G k (exterior G A) := by
  apply fragment_of_boundary_le hlow hA.2.1
  · exact hA.1.mono (subset_exterior_exterior G A)
  · exact (card_le_card (boundary_exterior_subset G A)).trans hA.2.2.le

theorem fragment_boundary_exterior {G : SimpleGraph V} {k : ℕ}
    (hlow : BoundaryLowerBound G k) {A : Finset V} (hA : IsFragment G k A) :
    boundary G (exterior G A) = boundary G A := by
  apply eq_of_subset_of_card_le (boundary_exterior_subset G A)
  rw [hA.2.2, (fragment_exterior hlow hA).2.2]

theorem atom_card_le_exterior {G : SimpleGraph V} {k : ℕ}
    (hlow : BoundaryLowerBound G k) {A : Finset V} (hA : IsAtom G k A) :
    A.card ≤ (exterior G A).card :=
  hA.2 _ (fragment_exterior hlow hA.1)

theorem atoms_eq_of_inter_nonempty {G : SimpleGraph V} {k : ℕ}
    (hlow : BoundaryLowerBound G k) {A B : Finset V}
    (hA : IsAtom G k A) (hB : IsAtom G k B) (hAB : (A ∩ B).Nonempty) :
    A = B := by
  classical
  have hI := card_boundary_inter_le G A B
  have hIE : (exterior G (A ∩ B)).Nonempty :=
    hA.1.2.1.mono (exterior_antitone G inter_subset_left)
  by_cases hs : (A ∩ boundary G B).card + (boundary G A ∩ B).card +
      (boundary G A ∩ boundary G B).card ≤ k
  · have hF := fragment_of_boundary_le hlow hAB hIE (hI.trans hs)
    have hIA : A ∩ B = A := eq_of_subset_of_card_le inter_subset_left (hA.2 _ hF)
    have hIB : A ∩ B = B := eq_of_subset_of_card_le inter_subset_right (hB.2 _ hF)
    exact hIA.symm.trans hIB
  · have hNA := fragment_boundary_exterior hlow hA.1
    have hNB := fragment_boundary_exterior hlow hB.1
    have hcentA := card_partition G B (boundary G A)
    have hcentB := card_partition G A (boundary G B)
    rw [hA.1.2.2] at hcentA
    rw [hB.1.2.2, inter_comm (boundary G B) A,
      inter_comm (boundary G B) (boundary G A),
      inter_comm (boundary G B) (exterior G A)] at hcentB
    have h33 : (exterior G A ∩ exterior G B).card = 0 := by
      by_contra hn
      have hC : (exterior G A ∩ exterior G B).Nonempty :=
        card_pos.mp (Nat.pos_of_ne_zero hn)
      have hCE : (exterior G (exterior G A ∩ exterior G B)).Nonempty :=
        hA.1.1.mono ((subset_exterior_exterior G A).trans
          (exterior_antitone G inter_subset_left))
      have hlo := hlow _ hC hCE
      have hup := card_boundary_inter_le G (exterior G A) (exterior G B)
      rw [hNA, hNB] at hup
      omega
    have hApart := card_partition G B A
    have hBpart := card_partition G A B
    rw [inter_comm B A, inter_comm B (boundary G A),
      inter_comm B (exterior G A)] at hBpart
    have hEApart := card_partition G B (exterior G A)
    have hEBpart := card_partition G A (exterior G B)
    rw [inter_comm (exterior G B) A, inter_comm (exterior G B) (boundary G A),
      inter_comm (exterior G B) (exterior G A)] at hEBpart
    have hEA := atom_card_le_exterior hlow hA
    have hEB := atom_card_le_exterior hlow hB
    have hsize₁ := hA.2 B hB.1
    have hsize₂ := hB.2 A hA.1
    have h11 := card_pos.mpr hAB
    have h13 : (A ∩ exterior G B).Nonempty := card_pos.mp (by omega)
    have h31 : (exterior G A ∩ B).Nonempty := card_pos.mp (by omega)
    have h13E : (exterior G (A ∩ exterior G B)).Nonempty :=
      hB.1.1.mono ((subset_exterior_exterior G B).trans
        (exterior_antitone G inter_subset_right))
    have h31E : (exterior G (exterior G A ∩ B)).Nonempty :=
      hA.1.1.mono ((subset_exterior_exterior G A).trans
        (exterior_antitone G inter_subset_left))
    have hlo13 := hlow _ h13 h13E
    have hlo31 := hlow _ h31 h31E
    have hup13 := card_boundary_inter_le G A (exterior G B)
    have hup31 := card_boundary_inter_le G (exterior G A) B
    rw [hNB] at hup13
    rw [hNA] at hup31
    have hsmall : (boundary G (A ∩ exterior G B)).card ≤ k := by omega
    have hF := fragment_of_boundary_le hlow h13 h13E hsmall
    have hmin := hA.2 _ hF
    omega

theorem atoms_disjoint_or_eq {G : SimpleGraph V} {k : ℕ}
    (hlow : BoundaryLowerBound G k) {A B : Finset V}
    (hA : IsAtom G k A) (hB : IsAtom G k B) : Disjoint A B ∨ A = B := by
  classical
  rcases disjoint_or_nonempty_inter A B with h | h
  · exact Or.inl h
  · exact Or.inr (atoms_eq_of_inter_nonempty hlow hA hB h)

end CircularIndex.Connectivity
