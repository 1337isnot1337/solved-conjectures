import Mathlib.Combinatorics.SimpleGraph.Metric
import Mathlib.Data.Finset.Max
import Mathlib.Data.Fintype.Powerset

/-! Finite general position, maximality, and the lower general position number. -/

namespace WeltonProduct

open SimpleGraph

variable {V : Type*}

/-- No three distinct points of the set occur on a single geodesic. -/
def GeneralPosition (G : SimpleGraph V) (S : Finset V) : Prop :=
  ∀ a ∈ S, ∀ b ∈ S, ∀ c ∈ S, a ≠ b → b ≠ c → a ≠ c →
    G.dist a c ≠ G.dist a b + G.dist b c

theorem GeneralPosition.subset {G : SimpleGraph V} {S T : Finset V}
    (h : GeneralPosition G T) (hST : S ⊆ T) : GeneralPosition G S :=
  fun a ha b hb c hc => h a (hST ha) b (hST hb) c (hST hc)

/-- Inclusion maximality among general position subsets. -/
def MaximalGP (G : SimpleGraph V) (S : Finset V) : Prop :=
  GeneralPosition G S ∧ ∀ T, S ⊆ T → GeneralPosition G T → T = S

theorem maximal_of_insert [DecidableEq V] {G : SimpleGraph V} {S : Finset V}
    (h : GeneralPosition G S) (hn : ∀ x ∉ S, ¬ GeneralPosition G (insert x S)) :
    MaximalGP G S := by
  refine ⟨h, fun T hST hT => Finset.Subset.antisymm ?_ hST⟩
  intro x hx
  by_contra hns
  exact hn x hns (hT.subset (Finset.insert_subset hx hST))

private theorem exists_maximal_card [Fintype V] (G : SimpleGraph V) :
    ∃ k, ∃ S : Finset V, MaximalGP G S ∧ S.card = k := by
  classical
  let family := Finset.univ.filter (GeneralPosition G)
  have hempty : (∅ : Finset V) ∈ family := by simp [family, GeneralPosition]
  obtain ⟨S, hS, hm⟩ := family.exists_max_image Finset.card ⟨∅, hempty⟩
  refine ⟨S.card, S, ⟨(Finset.mem_filter.mp hS).2, fun T hST hT => ?_⟩, rfl⟩
  exact (Finset.eq_of_subset_of_card_le hST (hm T (by simp [family, hT]))).symm

/-- The smallest size of an inclusion-maximal general position set. -/
noncomputable def lowerGP [Fintype V] (G : SimpleGraph V) : ℕ := by
  classical exact Nat.find (exists_maximal_card G)

theorem lowerGP_attained [Fintype V] (G : SimpleGraph V) :
    ∃ S : Finset V, MaximalGP G S ∧ S.card = lowerGP G := by
  classical exact Nat.find_spec (exists_maximal_card G)

theorem lowerGP_le [Fintype V] {G : SimpleGraph V} {S : Finset V} (h : MaximalGP G S) :
    lowerGP G ≤ S.card := by
  classical exact Nat.find_min' (exists_maximal_card G) ⟨S, h, rfl⟩

theorem lowerGP_complete [Fintype V] : lowerGP (⊤ : SimpleGraph V) = Fintype.card V := by
  classical
  have hu : GeneralPosition (⊤ : SimpleGraph V) Finset.univ := by
    intro a _ b _ c _ hab hbc hac
    simp [SimpleGraph.dist, SimpleGraph.edist_top, hab, hbc, hac]
  obtain ⟨S, hS, hcard⟩ := lowerGP_attained (⊤ : SimpleGraph V)
  have hfull := hS.2 Finset.univ (Finset.subset_univ S) hu
  simpa only [← hfull, Finset.card_univ] using hcard.symm

end WeltonProduct
