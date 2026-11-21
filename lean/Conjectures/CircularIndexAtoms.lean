import Conjectures.CircularIndexConnectivity
import Mathlib.Algebra.Group.Subgroup.Basic

/-!
# Atoms of finite translation-invariant graphs

The atom at zero is a subgroup.  If every nontrivial subgroup dominates the
graph, all nontrivial vertex boundaries have at least the degree of zero.
-/

namespace CircularIndex.Connectivity

open Finset

variable {V : Type*} [Fintype V] [DecidableEq V]

theorem exists_atom_of_fragment {G : SimpleGraph V} {k : ℕ}
    (h : ∃ A, IsFragment G k A) : ∃ A, IsAtom G k A := by
  classical
  have hn : ∃ n : ℕ, ∃ A, IsFragment G k A ∧ A.card = n := by
    obtain ⟨A, hA⟩ := h
    exact ⟨A.card, A, hA, rfl⟩
  obtain ⟨A, hA, hcard⟩ := Nat.find_spec hn
  refine ⟨A, hA, ?_⟩
  intro B hB
  rw [hcard]
  exact Nat.find_min' hn ⟨B, hB, rfl⟩

theorem exists_minimal_fragment (G : SimpleGraph V)
    (h : ∃ A : Finset V, A.Nonempty ∧ (exterior G A).Nonempty) :
    ∃ k, BoundaryLowerBound G k ∧ ∃ A, IsAtom G k A := by
  classical
  have hn : ∃ n : ℕ, ∃ A : Finset V,
      A.Nonempty ∧ (exterior G A).Nonempty ∧ (boundary G A).card = n := by
    obtain ⟨A, hA, hE⟩ := h
    exact ⟨_, A, hA, hE, rfl⟩
  refine ⟨Nat.find hn, ?_, exists_atom_of_fragment (Nat.find_spec hn)⟩
  intro A hA hE
  exact Nat.find_min' hn ⟨A, hA, hE, rfl⟩

section Translation

variable [AddGroup V]

def translate (h : V) (A : Finset V) : Finset V := A.image (h + ·)

omit [Fintype V] in
@[simp] theorem mem_translate {h v : V} {A : Finset V} :
    v ∈ translate h A ↔ -h + v ∈ A := by
  simp only [translate, mem_image]
  constructor
  · rintro ⟨a, ha, rfl⟩
    simpa using ha
  · intro hv
    exact ⟨-h + v, hv, by simp⟩

omit [Fintype V] in
@[simp] theorem card_translate (h : V) (A : Finset V) :
    (translate h A).card = A.card := card_image_of_injective A (add_right_injective h)

omit [Fintype V] in
theorem translate_nonempty (h : V) {A : Finset V} (hA : A.Nonempty) :
    (translate h A).Nonempty := hA.image _

def TranslationInvariant (G : SimpleGraph V) : Prop :=
  ∀ h x y : V, G.Adj (h + x) (h + y) ↔ G.Adj x y

theorem boundary_translate {G : SimpleGraph V} (hG : TranslationInvariant G)
    (h : V) (A : Finset V) : boundary G (translate h A) = translate h (boundary G A) := by
  ext v
  rw [mem_boundary, mem_translate (A := boundary G A), mem_boundary]
  constructor
  · rintro ⟨hv, a, ha, hav⟩
    refine ⟨fun hvA => hv (mem_translate.mpr hvA), -h + a, mem_translate.mp ha, ?_⟩
    exact (hG (-h) a v).mpr hav
  · rintro ⟨hv, a, ha, hav⟩
    refine ⟨fun hvA => hv (mem_translate.mp hvA), h + a, ?_, ?_⟩
    · simpa using ha
    · simpa using (hG h a (-h + v)).mpr hav

theorem exterior_translate {G : SimpleGraph V} (hG : TranslationInvariant G)
    (h : V) (A : Finset V) : exterior G (translate h A) = translate h (exterior G A) := by
  ext v
  simp only [exterior, mem_compl, mem_union, boundary_translate hG, mem_translate]

theorem fragment_translate {G : SimpleGraph V} (hG : TranslationInvariant G)
    {k : ℕ} {A : Finset V} (hA : IsFragment G k A) (h : V) :
    IsFragment G k (translate h A) := by
  refine ⟨translate_nonempty h hA.1, ?_, ?_⟩
  · rw [exterior_translate hG]
    exact translate_nonempty h hA.2.1
  · rw [boundary_translate hG, card_translate]
    exact hA.2.2

theorem atom_translate {G : SimpleGraph V} (hG : TranslationInvariant G)
    {k : ℕ} {A : Finset V} (hA : IsAtom G k A) (h : V) :
    IsAtom G k (translate h A) := by
  refine ⟨fragment_translate hG hA.1 h, ?_⟩
  intro B hB
  rw [card_translate]
  exact hA.2 B hB

theorem atom_translate_eq {G : SimpleGraph V} (hG : TranslationInvariant G)
    {k : ℕ} (hlow : BoundaryLowerBound G k) {A : Finset V}
    (hA : IsAtom G k A) (hzero : 0 ∈ A) {h : V} (hh : h ∈ A) :
    translate h A = A := by
  apply atoms_eq_of_inter_nonempty hlow (atom_translate hG hA h) hA
  exact ⟨h, mem_inter.mpr ⟨by simpa using hzero, hh⟩⟩

def subgroupOfAtom {G : SimpleGraph V} (hG : TranslationInvariant G)
    {k : ℕ} (hlow : BoundaryLowerBound G k) {A : Finset V}
    (hA : IsAtom G k A) (hzero : 0 ∈ A) : AddSubgroup V where
  carrier := A
  zero_mem' := hzero
  add_mem' {a b} ha hb := by
    change a + b ∈ A
    rw [← atom_translate_eq hG hlow hA hzero ha]
    simpa using hb
  neg_mem' {a} ha := by
    have hmem : 0 ∈ translate a A := by rw [atom_translate_eq hG hlow hA hzero ha]; exact hzero
    simpa using mem_translate.mp hmem

noncomputable def subgroupVertices (H : AddSubgroup V) : Finset V := by
  classical
  exact univ.filter fun v => v ∈ H

omit [DecidableEq V] in
@[simp] theorem mem_subgroupVertices (H : AddSubgroup V) (v : V) :
    v ∈ subgroupVertices H ↔ v ∈ H := by
  classical
  simp [subgroupVertices]

theorem exists_subgroup_atom {G : SimpleGraph V} (hG : TranslationInvariant G)
    {k : ℕ} (hlow : BoundaryLowerBound G k) (h : ∃ A, IsAtom G k A) :
    ∃ H : AddSubgroup V, IsAtom G k (subgroupVertices H) := by
  classical
  obtain ⟨A, hA⟩ := h
  obtain ⟨a, ha⟩ := hA.1.1
  have hT := atom_translate hG hA (-a)
  have hz : 0 ∈ translate (-a) A := by simpa using ha
  let H := subgroupOfAtom hG hlow hT hz
  refine ⟨H, ?_⟩
  have hverts : subgroupVertices H = translate (-a) A := by
    ext v
    rw [mem_subgroupVertices]
    rfl
  rw [hverts]
  exact hT

theorem boundary_lower_of_subgroup_dominates {G : SimpleGraph V}
    (hG : TranslationInvariant G) {d : ℕ} (hdegree : (boundary G {0}).card = d)
    (hdom : ∀ H : AddSubgroup V, H ≠ ⊥ → exterior G (subgroupVertices H) = ∅) :
    BoundaryLowerBound G d := by
  classical
  intro A hA hE
  obtain ⟨k, hlow, hatom⟩ := exists_minimal_fragment G ⟨A, hA, hE⟩
  obtain ⟨H, hH⟩ := exists_subgroup_atom hG hlow hatom
  have hbot : H = ⊥ := by
    by_contra hn
    have hne := hH.1.2.1
    rw [hdom H hn] at hne
    exact not_nonempty_empty hne
  have hsingleton : subgroupVertices H = {0} := by
    ext v
    simp [hbot]
  have hkd : d = k := by
    have hc := hH.1.2.2
    rwa [hsingleton, hdegree] at hc
  rw [hkd]
  exact hlow A hA hE

end Translation

theorem induced_preconnected_of_boundary_lower {G : SimpleGraph V} {k : ℕ}
    (hlow : BoundaryLowerBound G k) (T : Finset V) (hT : T.card < k) :
    (G.induce (↑T : Set V)ᶜ).Preconnected := by
  classical
  let H := G.induce (↑T : Set V)ᶜ
  intro u v
  by_contra huv
  let A : Finset V := univ.filter fun a => ∃ ha : a ∉ T, H.Reachable u ⟨a, ha⟩
  have memA (a : V) : a ∈ A ↔ ∃ ha : a ∉ T, H.Reachable u ⟨a, ha⟩ := by
    simp [A]
  have hA : A.Nonempty := ⟨u.val, (memA _).mpr ⟨u.prop, SimpleGraph.Reachable.refl _⟩⟩
  have hE : (exterior G A).Nonempty := by
    refine ⟨v.val, mem_exterior.mpr ⟨?_, ?_⟩⟩
    · intro hvA
      obtain ⟨_, hreach⟩ := (memA _).mp hvA
      exact huv hreach
    · intro a ha hav
      obtain ⟨haT, hreach⟩ := (memA _).mp ha
      have hadj : H.Adj ⟨a, haT⟩ v := hav
      exact huv (hreach.trans hadj.reachable)
  have hsub : boundary G A ⊆ T := by
    intro b hb
    by_contra hbT
    obtain ⟨hbA, a, ha, hab⟩ := mem_boundary.mp hb
    obtain ⟨haT, hreach⟩ := (memA _).mp ha
    have hadj : H.Adj ⟨a, haT⟩ ⟨b, hbT⟩ := hab
    exact hbA ((memA _).mpr ⟨hbT, hreach.trans hadj.reachable⟩)
  exact (hlow A hA hE).not_gt ((card_le_card hsub).trans_lt hT)

theorem induced_connected_of_boundary_lower {G : SimpleGraph V} {k : ℕ}
    (hlow : BoundaryLowerBound G k) (hcard : k < Fintype.card V)
    (T : Finset V) (hT : T.card < k) : (G.induce (↑T : Set V)ᶜ).Connected := by
  classical
  have hproper : T ≠ univ := by intro h; rw [h, card_univ] at hT; omega
  have hex : ∃ v : V, v ∉ T := by
    by_contra hn
    apply hproper
    ext v
    simp only [mem_univ, iff_true]
    by_contra hv
    exact hn ⟨v, hv⟩
  obtain ⟨v, hv⟩ := hex
  have : Nonempty ↥((↑T : Set V)ᶜ) := ⟨⟨v, by simpa using hv⟩⟩
  exact ⟨induced_preconnected_of_boundary_lower hlow T hT⟩

end CircularIndex.Connectivity
