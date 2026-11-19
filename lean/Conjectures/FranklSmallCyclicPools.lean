module

public import Conjectures.FranklSmallCyclicSearch
public import Conjectures.FranklSpanFourShapes

@[expose] public section

/-! Literal finite generator pools for small cycles. The normalisation
theorem proves that every cyclic span-four family with generator size at
least three is contained in this pool, including periods below four where
some tile sites coincide. -/

namespace FranklSmallCyclic

open FranklSpanFour

def generatorPool (n : ℕ) [NeZero n] : Finset (Finset (Fin n)) :=
  (Finset.univ.biUnion (fun s : Fin n =>
    (Finset.univ : Finset (Fin 4)).image (cyclicTile s))).filter
      (fun g => 3 ≤ g.card)

theorem subset_generatorPool {n : ℕ} [NeZero n]
    {G : Finset (Finset (Fin n))} (hspan : CyclicSpanFour G)
    (hlarge : ∀ g ∈ G, 3 ≤ g.card) : G ⊆ generatorPool n := by
  intro g hg
  obtain ⟨s, t, heq⟩ := normalize_generator hspan hlarge hg
  refine Finset.mem_filter.mpr ⟨?_, hlarge g hg⟩
  exact Finset.mem_biUnion.mpr ⟨s, Finset.mem_univ _,
    Finset.mem_image.mpr ⟨t, Finset.mem_univ _, heq.symm⟩⟩

theorem obstruction_of_pool_check {n : ℕ} [NeZero n]
    (t : SearchTree (Fin n)) (hc : check ∅ (generatorPool n) t = true)
    {G : Finset (Finset (Fin n))} (hspan : CyclicSpanFour G)
    (hlarge : ∀ g ∈ G, 3 ≤ g.card) : Obstruction G :=
  check_sound t ∅ (generatorPool n) G hc (Finset.empty_subset G)
    (subset_generatorPool hspan hlarge)

end FranklSmallCyclic
