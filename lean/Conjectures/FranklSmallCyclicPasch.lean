module

public import Conjectures.FranklSmallCyclicSearch
public import Conjectures.FranklSmallCyclicPaschCertificate
public import Conjectures.FranklFCEmbedding
public import Conjectures.FranklFCClosure

@[expose] public section

/-! The Pasch leaf of the finite search forces abundance in every ambient
union-closed family. The finite six-label embedding is injective; no global
injection from natural numbers into the ambient ground is assumed. -/

namespace FranklSmallCyclic

open Frankl

private def natPasch : Finset (Finset ℕ) :=
  {{0, 1, 2}, {0, 3, 4}, {2, 3, 5}, {1, 4, 5}}

private theorem certificate_base_generated :
    ∀ U ∈ FC.SmallCyclicPasch.base, U ∈ generatedUnions natPasch ∧ U ≠ ∅ := by
  decide +kernel

private theorem certificate_base_supported :
    ∀ U ∈ FC.SmallCyclicPasch.base, U ⊆ FC.SmallCyclicPasch.ground := by
  decide +kernel

private theorem certificate_weight_positive :
    ∃ i ∈ FC.SmallCyclicPasch.ground, 0 < FC.SmallCyclicPasch.weights i := by
  refine ⟨0, ?_, ?_⟩ <;> decide +kernel

variable {α : Type*} [DecidableEq α]

private def extendLabels (f : Fin 6 → α) (i : ℕ) : α :=
  f ⟨i % 6, Nat.mod_lt _ (by decide)⟩

omit [DecidableEq α] in
private theorem extendLabels_injOn {f : Fin 6 → α} (hf : Function.Injective f) :
    Set.InjOn (extendLabels f) FC.SmallCyclicPasch.ground := by
  intro i hi j hj hij
  have hi' : i < 6 := Finset.mem_range.mp hi
  have hj' : j < 6 := Finset.mem_range.mp hj
  have h := congrArg Fin.val (hf hij)
  simpa only [Nat.mod_eq_of_lt hi', Nat.mod_eq_of_lt hj'] using h

private theorem natPasch_image (f : Fin 6 → α) :
    natPasch.image (Finset.image (extendLabels f)) = paschBase.image (Finset.image f) := by
  simp [natPasch, paschBase, extendLabels]

/-- Any injective copy of the four Pasch triples in a finite union-closed
family gives an abundant point among its six labels. -/
theorem pasch_abundant {family : Finset (Finset α)} {f : Fin 6 → α}
    (hu : UnionClosed family) (hw : PaschWitness family f) :
    ∃ i : Fin 6, Abundant family (f i) := by
  have htriples : natPasch.image (Finset.image (extendLabels f)) ⊆ family := by
    rw [natPasch_image]
    exact hw.2
  have hbase : FC.SmallCyclicPasch.base.image (Finset.image (extendLabels f)) ⊆
      family := by
    intro S hS
    obtain ⟨U, hU, rfl⟩ := Finset.mem_image.mp hS
    obtain ⟨hUg, hUne⟩ := certificate_base_generated U hU
    exact embedded_nonempty_generated_mem (extendLabels f) hu htriples hUg hUne
  obtain ⟨i, _, _, hab⟩ := FC.abundant_of_embedded_extension_shares
    (extendLabels_injOn hw.1) certificate_base_supported certificate_weight_positive
    (fun F hd hc => FC.SmallCyclicPasch.extension_share_nonnegative hc hd) hu hbase
  exact ⟨⟨i % 6, Nat.mod_lt _ (by decide)⟩, hab⟩

theorem pasch_generators_abundant {G : Finset (Finset α)} {f : Fin 6 → α}
    (hw : PaschWitness G f) : ∃ i : Fin 6, Abundant (generatedUnions G) (f i) := by
  apply pasch_abundant (generatedUnions_union_closed G)
  exact ⟨hw.1, fun S hS => generator_mem_generatedUnions (hw.2 hS)⟩

end FranklSmallCyclic
