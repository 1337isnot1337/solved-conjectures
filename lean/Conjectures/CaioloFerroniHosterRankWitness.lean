import Conjectures.CaioloFerroniHosterRankFlags
import Conjectures.CaioloFerroniHosterRankGraphs
import Conjectures.CaioloFerroniHosterRankBounds
import Conjectures.CaioloFerroniHosterRankRoots
import Mathlib.FieldTheory.Finite.Extension
import Mathlib.Algebra.IsPrimePow

/-! # The matroid in rank `k+1`, and its flag counts -/

set_option linter.unusedSectionVars false
set_option linter.unusedSimpArgs false

namespace CaioloFerroniHoster.Ranks

open Finset Submodule
open scoped Classical

noncomputable section

variable {F K : Type} [Field F] [Field K] [Fintype F] [Fintype K] [Algebra F K]

/-- One block for every linearized polynomial; the label is its top coefficient. -/
def geometryBlocks {j : ℕ} (hj : 1 ≤ j) (hK : Module.finrank F K = j + 1) :
    Blocks (F := F) (V := K × K) (X := K) (j + 1) (Fin (j + 1) → K) where
  frame a := (graphSpace a, {a (Fin.last j)})
  rank_top a := by
    change Module.finrank F (graphSpace a : Submodule F (K × K)) +
      ({a (Fin.last j)} : Finset K).card = j + 1 + 1
    rw [graphSpace_finrank hK, card_singleton]
  inf_rank_le {a b} hab := by
    change Module.finrank F (graphSpace a ⊓ graphSpace b : Submodule F (K × K)) +
      (({a (Fin.last j)} : Finset K) ∩ {b (Fin.last j)}).card < j + 1
    by_cases he : a (Fin.last j) = b (Fin.last j)
    · have hr := graphSpace_inf_same_label (F := F) hab he hj
      rw [he, inter_self, card_singleton]
      omega
    · have hr := graphSpace_inf_finrank (F := F) hab j (fun i hi => by have := i.isLt; omega)
      have hi : ({a (Fin.last j)} : Finset K) ∩ {b (Fin.last j)} = ∅ := by simp [he]
      rw [hi, card_empty]
      omega

theorem geometryBlocks_cover {j : ℕ} (hj : 1 ≤ j) (hK : Module.finrank F K = j + 1)
    (a : Fin (j + 1) → K) :
    Nonempty (FrameLayer ((geometryBlocks (F := F) hj hK).frame a) (j + 1)) := by
  refine ⟨⟨(graphSpace a, ∅), ⟨le_rfl, empty_subset _⟩, ?_⟩⟩
  change Module.finrank F (graphSpace a : Submodule F (K × K)) + (∅ : Finset K).card = j + 1
  rw [graphSpace_finrank hK, card_empty, add_zero]

/-- The matroid of rank `j+2`. -/
def witness {j : ℕ} (hj : 1 ≤ j) (hK : Module.finrank F K = j + 1) :
    Matroid (Point F (K × K) K) := coalescedMatroid (geometryBlocks (F := F) hj hK)

instance : Finite (Point F (K × K) K) := by
  have : Finite (Submodule F (K × K)) := inferInstance
  infer_instance

/-- Every set of at most two points is independent. -/
def IsSimple {P : Type*} (M : Matroid P) : Prop :=
  ∀ I : Finset P, I.card ≤ 2 → M.Indep (I : Set P)

private theorem pointFrame_inj :
    Function.Injective (pointFrame (F := F) (V := K × K) (X := K)) := by
  intro x y hh
  cases x <;> cases y
  · exact congrArg Sum.inl (Subtype.ext (congrArg Prod.fst hh))
  · have hz := congrArg Prod.snd hh
    simp [pointFrame] at hz
  · have hz := congrArg Prod.snd hh
    simp [pointFrame] at hz
  · exact congrArg Sum.inr (Finset.singleton_injective (congrArg Prod.snd hh))

theorem witness_simple {j : ℕ} (hj : 1 ≤ j) (hK : Module.finrank F K = j + 1) :
    IsSimple (witness (F := F) hj hK) := by
  intro I hI
  apply indep_of_free_of_card_le (geometryBlocks (F := F) hj hK) _ (by omega)
  induction I using Finset.induction_on with
  | empty => simp [freeIndependent, spanPoints]
  | @insert e I he ih =>
    rw [Finset.card_insert_of_notMem he] at hI
    have hfree := ih (by omega)
    refine (freeIndependent_insert hfree).2 (Or.inr ?_)
    intro hc
    have hr : frameRank (spanPoints I) ≤ 1 := (span_rank_le_card I).trans (by omega)
    have hle : pointFrame e ≤ spanPoints I := hc
    have hEq : pointFrame e = spanPoints I := by
      by_contra hn
      have h := frameRank_strictMono (lt_of_le_of_ne hle hn)
      rw [pointFrame_rank] at h
      omega
    obtain hzero | hone : I.card = 0 ∨ I.card = 1 := by omega
    · have hh := congrArg frameRank hEq
      rw [pointFrame_rank, hfree, hzero] at hh
      contradiction
    · obtain ⟨f, hf⟩ := Finset.card_eq_one.mp hone
      subst I
      rw [show spanPoints {f} = pointFrame f by simp [spanPoints]] at hEq
      exact he (pointFrame_inj hEq ▸ mem_singleton_self f)

theorem witness_rank {j : ℕ} (hj : 1 ≤ j) (hK : Module.finrank F K = j + 1)
    (hk : j + 2 ≤ Fintype.card K) : (witness (F := F) hj hK).eRank = (j + 2 : ℕ) := by
  obtain ⟨A, hA⟩ := Finset.exists_subset_card_eq (s := (univ : Finset K)) (by simpa using hk)
  let J : Finset (Point F (K × K) K) := A.map ⟨Sum.inr, Sum.inr_injective⟩
  have hjc : J.card = j + 2 := by simpa [J] using hA.2
  have hs : spanPoints J = (⊥, A) := by
    apply le_antisymm
    · rw [spanPoints_le]
      intro e he
      obtain ⟨x, hx, rfl⟩ := Finset.mem_map.mp he
      exact ⟨le_rfl, singleton_subset_iff.mpr hx⟩
    · refine ⟨bot_le, ?_⟩
      intro x hx
      have he : (Sum.inr x : Point F (K × K) K) ∈ J := Finset.mem_map.mpr ⟨x, hx, rfl⟩
      exact (spanPoints_le.mp (le_refl (spanPoints J)) he).2 (mem_singleton_self x)
  have hbase : (witness (F := F) hj hK).Indep (J : Set _) := by
    refine (coalescedMatroid_indep (geometryBlocks (F := F) hj hK)).2 ⟨?_, by omega, ?_⟩
    · rw [freeIndependent, hs, hjc]
      change Module.finrank F (⊥ : Submodule F (K × K)) + A.card = j + 2
      rw [finrank_bot, zero_add, hA.2]
    · intro b hb
      rw [hs] at hb
      have h := Finset.card_le_card hb.2
      change A.card ≤ ({b (Fin.last j)} : Finset K).card at h
      rw [hA.2, card_singleton] at h
      omega
  have hcl := hbase.isBasis_closure
  have hu : (witness (F := F) hj hK).closure J = (witness (F := F) hj hK).E := by
    refine le_antisymm ((witness (F := F) hj hK).closure_subset_ground _) ?_
    intro e he
    by_contra hnot
    have heJ : e ∉ J := fun h => hnot ((witness (F := F) hj hK).subset_closure _ hbase.subset_ground h)
    have hi := (hbase.notMem_closure_iff_of_notMem heJ he).mp hnot
    have hcard := ((coalescedMatroid_indep (geometryBlocks (F := F) hj hK)).mp
      (Finset.coe_insert e J ▸ hi)).2.1
    rw [Finset.card_insert_of_notMem heJ, hjc] at hcard
    omega
  rw [hu] at hcl
  rw [Matroid.eRank_def, ← hcl.encard_eq_eRk, Set.encard_coe_eq_coe_finsetCard, hjc]

/-- The flag counts of the lattice of flats agree with the explicit flag types. -/
theorem alpha_eq_card {V X : Type} [AddCommGroup V] [Module F V]
    [Module.Finite F V] [Finite V] [Finite X] [Finite (Point F V X)]
    (M : Matroid (Point F V X)) (s : List ℕ) : ∀ G : Flats M,
    alpha (flatRk M) G s = (Nat.card (FlatFlag M G.1 s) : ℤ) := by
  induction s with
  | nil => intro G; simp [alpha, FlatFlag]
  | cons r s ih =>
    intro G
    let e : {B : RankedFlat M r // B.val ⊆ G.1} ≃ {H // H ∈ layer (flatRk M) G r} :=
      { toFun := fun B => ⟨⟨B.1.1, B.1.2.1⟩, by
          rw [mem_layer]
          refine ⟨B.2, ?_⟩
          have : (flatRk M ⟨B.1.1, B.1.2.1⟩ : ℕ∞) = r := by rw [flatRk_coe]; exact B.1.2.2
          exact_mod_cast this⟩
        invFun := fun H => ⟨⟨H.1.1, H.1.2, by
          rw [← flatRk_coe M H.1, (mem_layer.1 H.2).2]⟩, (mem_layer.1 H.2).1⟩
        left_inv := fun _ => rfl
        right_inv := fun _ => rfl }
    have h1 : Nat.card (FlatFlag M G.1 (r :: s)) =
        Nat.card (Σ H : {H // H ∈ layer (flatRk M) G r}, FlatFlag M H.1.1 s) :=
      Nat.card_congr (Equiv.sigmaCongr e fun B => Equiv.refl _)
    rw [h1, Nat.card_sigma, alpha, Nat.cast_sum, ← sum_coe_sort (layer (flatRk M) G r)]
    exact sum_congr rfl fun H _ => ih H.1

theorem witness_isCount {j : ℕ} (hj : 1 ≤ j) (hK : Module.finrank F K = j + 1) :
    IsCount (Fintype.card F) (j + 1)
      (fun s => Nat.card (FlatFlag (witness (F := F) hj hK) Set.univ s)) := by
  have hdim : Module.finrank F (K × K) = 2 * (j + 1) := by rw [Module.finrank_prod, hK]; ring
  have hsize : Fintype.card K = Fintype.card F ^ (j + 1) := by
    rw [Module.card_eq_pow_finrank (K := F), hK]
  have hcfg : Fintype.card (Fin (j + 1) → K) = Fintype.card F ^ ((j + 1) * (j + 1)) := by
    rw [Fintype.card_fun, Fintype.card_fin, hsize, ← pow_mul]
  let g := geometryBlocks (F := F) hj hK
  have hdimA : Module.finrank F (topFrame : Frame F (K × K) K).1 = 2 * (j + 1) :=
    (finrank_top _ _).trans hdim
  have hcardA : (topFrame : Frame F (K × K) K).2.card = Fintype.card F ^ (j + 1) :=
    (Finset.card_univ).trans hsize
  constructor
  · intro s hs
    have h := card_lowFlatFlag g (topFrame : Frame F (K × K) K) s hs
    rw [hdimA, hcardA, carrier_topFrame] at h
    exact h
  · intro s hs
    have h := hyperplane_replacement_count g (geometryBlocks_cover hj hK) s hs
    have hsum (t : List ℕ) : Nat.card (Σ b : Fin (j + 1) → K, FrameFlag (g.frame b) t) =
        Fintype.card F ^ ((j + 1) * (j + 1)) * productFlag (Fintype.card F) (j + 1) 1 t := by
      rw [Nat.card_sigma]
      simp only [card_frameFlag, show ∀ b, Module.finrank F (g.frame b).1 = j + 1 from
        graphSpace_finrank hK, show ∀ b, (g.frame b).2.card = 1 from fun _ => card_singleton _,
        Finset.sum_const, Finset.card_univ, nsmul_eq_mul, hcfg, Nat.cast_id]
    rw [hsum, hsum, card_frameFlag, hdimA, hcardA, carrier_topFrame] at h
    exact h

end
end CaioloFerroniHoster.Ranks
