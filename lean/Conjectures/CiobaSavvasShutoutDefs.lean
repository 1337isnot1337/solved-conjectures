import Mathlib.Combinatorics.SimpleGraph.Clique
import Mathlib.Combinatorics.SimpleGraph.Finite
import Mathlib.Data.ENat.Lattice
import Mathlib.Basic.Real.Basic

/-!
# Cioba–Savvas Shutout Number Conjecture — Core Definitions

Literal definitions for the Maker–Breaker shutout game on a finite simple graph `G`:
- Board states (`ValidBoard`), unclaimed edges (`freeEdges`), Maker/Breaker degrees;
- Immediate shutout convention (`MakerWinsImmediate`, `BreakerWinsImmediate`, `tau`)
  versus Cioba–Savvas's free `s`-star convention checked after Breaker's reply
  (`MakerWinsFreeStar`, `BreakerWinsFreeStar`, `sigma`);
- Finite determinacy, timing comparison (`sigma ≥ tau`), and graph-isomorphism invariance;
- The local Shearer independence polynomial `Q_U(z)` (`indepPoly`), risk region `ℛ(G)`
  (`InRiskRegion`, `InRiskRegionOn`), and deletion ratio `R_v(U)` (`riskRatio`).
-/

open Finset
open scoped BigOperators

namespace Conjectures.CiobaSavvasShutout

section GameDefs

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A valid board state consists of disjoint subsets `M` (Maker) and `B` (Breaker)
of the edges of `G`. -/
def ValidBoard (G : SimpleGraph V) [DecidableRel G.Adj] (M B : Finset (Sym2 V)) : Prop :=
  M ⊆ G.edgeFinset ∧ B ⊆ G.edgeFinset ∧ Disjoint M B

/-- The currently unclaimed edges of `G`. -/
def freeEdges (G : SimpleGraph V) [DecidableRel G.Adj] (M B : Finset (Sym2 V)) :
    Finset (Sym2 V) :=
  G.edgeFinset \ (M ∪ B)

/-- The number of Maker edges incident to vertex `v`. -/
def makerDeg (M : Finset (Sym2 V)) (v : V) : ℕ :=
  #{e ∈ M | v ∈ e}

/-- The number of Breaker edges incident to vertex `v`. -/
def breakerDeg (B : Finset (Sym2 V)) (v : V) : ℕ :=
  #{e ∈ B | v ∈ e}

/-- Shutout condition with parameter `s`: some vertex has at least `s` Maker edges
and no Breaker edge. -/
def HasShutout (s : ℕ) (M B : Finset (Sym2 V)) : Prop :=
  ∃ v : V, s ≤ makerDeg M v ∧ breakerDeg B v = 0

/-- Immediate shutout game (Maker's winning predicate), indexed by remaining free-edge fuel `k`
and turn (`true` = Maker to move, `false` = Breaker to move). The shutout condition is checked
immediately, including immediately after Maker's move. -/
def MakerWinsImmAux (G : SimpleGraph V) [DecidableRel G.Adj] (s : ℕ) :
    ℕ → Bool → Finset (Sym2 V) → Finset (Sym2 V) → Prop
  | 0, _, M, B => HasShutout (V := V) s M B
  | k + 1, true, M, B =>
      HasShutout (V := V) s M B ∨
        ∃ e ∈ freeEdges G M B, MakerWinsImmAux G s k false (insert e M) B
  | k + 1, false, M, B =>
      HasShutout (V := V) s M B ∨
        ∀ f ∈ freeEdges G M B, MakerWinsImmAux G s k true M (insert f B)

/-- Positive existential-universal winning predicate for Breaker in the immediate shutout game. -/
def BreakerWinsImmAux (G : SimpleGraph V) [DecidableRel G.Adj] (s : ℕ) :
    ℕ → Bool → Finset (Sym2 V) → Finset (Sym2 V) → Prop
  | 0, _, M, B => ¬ HasShutout (V := V) s M B
  | k + 1, true, M, B =>
      ¬ HasShutout (V := V) s M B ∧
        ∀ e ∈ freeEdges G M B, BreakerWinsImmAux G s k false (insert e M) B
  | k + 1, false, M, B =>
      ¬ HasShutout (V := V) s M B ∧
        ∃ f ∈ freeEdges G M B, BreakerWinsImmAux G s k true M (insert f B)

/-- Free `s`-star game (Cioba–Savvas Definition 2.2 and §2): Maker's win is checked after
Breaker's reply (or when the board is exhausted and Breaker has no reply). -/
def MakerWinsFreeStarAux (G : SimpleGraph V) [DecidableRel G.Adj] (s : ℕ) :
    ℕ → Bool → Finset (Sym2 V) → Finset (Sym2 V) → Prop
  | 0, _, M, B => HasShutout (V := V) s M B
  | k + 1, true, M, B =>
      HasShutout (V := V) s M B ∨
        ∃ e ∈ freeEdges G M B, MakerWinsFreeStarAux G s k false (insert e M) B
  | k + 1, false, M, B =>
      ∀ f ∈ freeEdges G M B, MakerWinsFreeStarAux G s k true M (insert f B)

/-- Positive existential-universal winning predicate for Breaker in the free `s`-star game. -/
def BreakerWinsFreeStarAux (G : SimpleGraph V) [DecidableRel G.Adj] (s : ℕ) :
    ℕ → Bool → Finset (Sym2 V) → Finset (Sym2 V) → Prop
  | 0, _, M, B => ¬ HasShutout (V := V) s M B
  | k + 1, true, M, B =>
      ¬ HasShutout (V := V) s M B ∧
        ∀ e ∈ freeEdges G M B, BreakerWinsFreeStarAux G s k false (insert e M) B
  | k + 1, false, M, B =>
      ∃ f ∈ freeEdges G M B, BreakerWinsFreeStarAux G s k true M (insert f B)

/-- Maker has a winning strategy in the immediate `s`-shutout game on `G` (Maker moves first). -/
def MakerWinsImmediate (G : SimpleGraph V) [DecidableRel G.Adj] (s : ℕ) : Prop :=
  MakerWinsImmAux G s #G.edgeFinset true ∅ ∅

/-- Breaker has a winning strategy in the immediate `s`-shutout game on `G`. -/
def BreakerWinsImmediate (G : SimpleGraph V) [DecidableRel G.Adj] (s : ℕ) : Prop :=
  BreakerWinsImmAux G s #G.edgeFinset true ∅ ∅

/-- Maker has a winning strategy for a free `s`-star on `G` (checked after Breaker's reply). -/
def MakerWinsFreeStar (G : SimpleGraph V) [DecidableRel G.Adj] (s : ℕ) : Prop :=
  MakerWinsFreeStarAux G s #G.edgeFinset true ∅ ∅

/-- Breaker has a winning strategy preventing a free `s`-star on `G`. -/
def BreakerWinsFreeStar (G : SimpleGraph V) [DecidableRel G.Adj] (s : ℕ) : Prop :=
  BreakerWinsFreeStarAux G s #G.edgeFinset true ∅ ∅

lemma validBoard_empty (G : SimpleGraph V) [DecidableRel G.Adj] :
    ValidBoard G ∅ ∅ := by
  let _ := ‹DecidableEq V›
  simp [ValidBoard]

private lemma freeEdges_insert_left {G : SimpleGraph V} [DecidableRel G.Adj]
    {M B : Finset (Sym2 V)} {e : Sym2 V} :
    freeEdges G (insert e M) B = (freeEdges G M B).erase e := by
  ext x
  simp only [freeEdges, mem_sdiff, mem_union, mem_insert, mem_erase, ne_eq]
  tauto

private lemma freeEdges_insert_right {G : SimpleGraph V} [DecidableRel G.Adj]
    {M B : Finset (Sym2 V)} {f : Sym2 V} :
    freeEdges G M (insert f B) = (freeEdges G M B).erase f := by
  ext x
  simp only [freeEdges, mem_sdiff, mem_union, mem_insert, mem_erase, ne_eq]
  tauto

lemma validBoard_insert_maker {G : SimpleGraph V} [DecidableRel G.Adj]
    {M B : Finset (Sym2 V)} {e : Sym2 V}
    (h : ValidBoard G M B) (he : e ∈ freeEdges G M B) :
    ValidBoard G (insert e M) B ∧
      #(freeEdges G (insert e M) B) + 1 = #(freeEdges G M B) := by
  have he' := he
  simp only [freeEdges, mem_sdiff, mem_union, not_or] at he'
  refine ⟨⟨insert_subset_iff.mpr ⟨he'.1, h.1⟩, h.2.1,
    disjoint_insert_left.mpr ⟨he'.2.2, h.2.2⟩⟩, ?_⟩
  rw [freeEdges_insert_left, card_erase_add_one he]

lemma validBoard_insert_breaker {G : SimpleGraph V} [DecidableRel G.Adj]
    {M B : Finset (Sym2 V)} {f : Sym2 V}
    (h : ValidBoard G M B) (hf : f ∈ freeEdges G M B) :
    ValidBoard G M (insert f B) ∧
      #(freeEdges G M (insert f B)) + 1 = #(freeEdges G M B) := by
  have hf' := hf
  simp only [freeEdges, mem_sdiff, mem_union, not_or] at hf'
  refine ⟨⟨h.1, insert_subset_iff.mpr ⟨hf'.1, h.2.1⟩,
    disjoint_insert_right.mpr ⟨hf'.2.1, h.2.2⟩⟩, ?_⟩
  rw [freeEdges_insert_right, card_erase_add_one hf]

private lemma card_filter_edgeFinset_eq_degree (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) :
    #{e ∈ G.edgeFinset | v ∈ e} = G.degree v := by
  rw [← G.card_incidenceFinset_eq_degree]
  congr 1
  ext e
  simp [SimpleGraph.mem_incidenceFinset, SimpleGraph.incidenceSet, and_comm]

lemma incident_degree_partition {G : SimpleGraph V} [DecidableRel G.Adj]
    {M B : Finset (Sym2 V)} (h : ValidBoard G M B) (v : V) :
    makerDeg M v + breakerDeg B v + #{e ∈ freeEdges G M B | v ∈ e} = G.degree v := by
  have hMB : Disjoint (M.filter (v ∈ ·)) (B.filter (v ∈ ·)) :=
    h.2.2.mono (filter_subset _ _) (filter_subset _ _)
  have hMBF : Disjoint ((M ∪ B).filter (v ∈ ·)) ((freeEdges G M B).filter (v ∈ ·)) :=
    Disjoint.mono (filter_subset _ _) (filter_subset _ _) disjoint_sdiff_self_right
  have hunion1 : (M ∪ B).filter (v ∈ ·) = M.filter (v ∈ ·) ∪ B.filter (v ∈ ·) :=
    filter_union _ _ _
  have hunion2 : (M ∪ B) ∪ freeEdges G M B = G.edgeFinset := by
    rw [freeEdges, union_sdiff_of_subset (union_subset h.1 h.2.1)]
  have hunion3 : G.edgeFinset.filter (v ∈ ·) =
      (M ∪ B).filter (v ∈ ·) ∪ (freeEdges G M B).filter (v ∈ ·) := by
    rw [← filter_union, hunion2]
  rw [makerDeg, breakerDeg, ← card_union_of_disjoint hMB, ← hunion1,
    ← card_union_of_disjoint hMBF, ← hunion3, card_filter_edgeFinset_eq_degree]

private lemma card_filter_insert {S : Finset (Sym2 V)} {e : Sym2 V} (he : e ∉ S) (v : V) :
    #{x ∈ insert e S | v ∈ x} = #{x ∈ S | v ∈ x} + if v ∈ e then 1 else 0 := by
  let _ := ‹Fintype V›
  by_cases hv : v ∈ e
  · simp [filter_insert, hv, card_insert_of_notMem, he]
  · simp [filter_insert, hv]

lemma makerDeg_insert {M : Finset (Sym2 V)} {e : Sym2 V} (he : e ∉ M) (v : V) :
    makerDeg (insert e M) v = makerDeg M v + if v ∈ e then 1 else 0 :=
  card_filter_insert he v

lemma breakerDeg_insert {B : Finset (Sym2 V)} {f : Sym2 V} (hf : f ∉ B) (v : V) :
    breakerDeg (insert f B) v = breakerDeg B v + if v ∈ f then 1 else 0 :=
  card_filter_insert hf v

lemma breakerWinsImmAux_iff_not_makerWinsImmAux (G : SimpleGraph V) [DecidableRel G.Adj]
    (s k : ℕ) (turn : Bool) (M B : Finset (Sym2 V)) :
    BreakerWinsImmAux G s k turn M B ↔ ¬ MakerWinsImmAux G s k turn M B := by
  induction k generalizing turn M B with
  | zero =>
    simp [BreakerWinsImmAux, MakerWinsImmAux]
  | succ k ih =>
    cases turn
    · simp only [BreakerWinsImmAux, MakerWinsImmAux, ih, not_or, not_forall]
      tauto
    · simp only [BreakerWinsImmAux, MakerWinsImmAux, ih, not_or, not_exists, not_and]

theorem breakerWinsImmediate_iff_not_makerWinsImmediate (G : SimpleGraph V) [DecidableRel G.Adj]
    (s : ℕ) :
    BreakerWinsImmediate G s ↔ ¬ MakerWinsImmediate G s :=
  breakerWinsImmAux_iff_not_makerWinsImmAux G s #G.edgeFinset true ∅ ∅

lemma breakerWinsFreeStarAux_iff_not_makerWinsFreeStarAux (G : SimpleGraph V) [DecidableRel G.Adj]
    (s k : ℕ) (turn : Bool) (M B : Finset (Sym2 V)) :
    BreakerWinsFreeStarAux G s k turn M B ↔ ¬ MakerWinsFreeStarAux G s k turn M B := by
  induction k generalizing turn M B with
  | zero =>
    simp [BreakerWinsFreeStarAux, MakerWinsFreeStarAux]
  | succ k ih =>
    cases turn
    · simp only [BreakerWinsFreeStarAux, MakerWinsFreeStarAux, ih, not_forall]
      tauto
    · simp only [BreakerWinsFreeStarAux, MakerWinsFreeStarAux, ih, not_or, not_exists, not_and]

theorem breakerWinsFreeStar_iff_not_makerWinsFreeStar (G : SimpleGraph V) [DecidableRel G.Adj]
    (s : ℕ) :
    BreakerWinsFreeStar G s ↔ ¬ MakerWinsFreeStar G s :=
  breakerWinsFreeStarAux_iff_not_makerWinsFreeStarAux G s #G.edgeFinset true ∅ ∅

lemma makerWinsFreeStarAux_imp_makerWinsImmAux (G : SimpleGraph V) [DecidableRel G.Adj]
    (s k : ℕ) (turn : Bool) (M B : Finset (Sym2 V)) :
    MakerWinsFreeStarAux G s k turn M B → MakerWinsImmAux G s k turn M B := by
  induction k generalizing turn M B with
  | zero =>
    exact id
  | succ k ih =>
    cases turn
    · intro h
      exact Or.inr (fun f hf => ih true M (insert f B) (h f hf))
    · rintro (h | ⟨e, he, h'⟩)
      · exact Or.inl h
      · exact Or.inr ⟨e, he, ih false (insert e M) B h'⟩

theorem makerWinsFreeStar_imp_makerWinsImmediate (G : SimpleGraph V) [DecidableRel G.Adj]
    (s : ℕ) :
    MakerWinsFreeStar G s → MakerWinsImmediate G s :=
  makerWinsFreeStarAux_imp_makerWinsImmAux G s #G.edgeFinset true ∅ ∅

theorem breakerWinsImmediate_imp_breakerWinsFreeStar (G : SimpleGraph V) [DecidableRel G.Adj]
    (s : ℕ) :
    BreakerWinsImmediate G s → BreakerWinsFreeStar G s := by
  rw [breakerWinsImmediate_iff_not_makerWinsImmediate,
    breakerWinsFreeStar_iff_not_makerWinsFreeStar]
  exact mt (makerWinsFreeStar_imp_makerWinsImmediate G s)

end GameDefs

section IsoAndShutoutNumbers

private def sym2Equiv {V W : Type*} (e : V ≃ W) : Sym2 V ≃ Sym2 W where
  toFun := Sym2.map e
  invFun := Sym2.map e.symm
  left_inv x := by
    induction x using Sym2.ind with
    | _ a b => simp
  right_inv x := by
    induction x using Sym2.ind with
    | _ a b => simp

private lemma sym2Equiv_apply {V W : Type*} (e : V ≃ W) (x : Sym2 V) :
    sym2Equiv e x = Sym2.map e x := rfl

private def mapEdges {V W : Type*} (e : V ≃ W) (S : Finset (Sym2 V)) : Finset (Sym2 W) :=
  S.map (sym2Equiv e).toEmbedding

private lemma mem_mapEdges_iff {V W : Type*} (e : V ≃ W) {S : Finset (Sym2 V)} {x : Sym2 V} :
    sym2Equiv e x ∈ mapEdges e S ↔ x ∈ S := by
  simp [mapEdges]

private lemma mem_sym2Equiv_iff {V W : Type*} (e : V ≃ W) (v : V) (x : Sym2 V) :
    e v ∈ sym2Equiv e x ↔ v ∈ x := by
  induction x using Sym2.ind with
  | _ a b => simp [sym2Equiv_apply]

private lemma mapEdges_edgeFinset {V W : Type*} [Fintype V] [DecidableEq V]
    [Fintype W] [DecidableEq W] {G : SimpleGraph V} {H : SimpleGraph W}
    [DecidableRel G.Adj] [DecidableRel H.Adj] (φ : G ≃g H) :
    mapEdges φ.toEquiv G.edgeFinset = H.edgeFinset := by
  ext y
  obtain ⟨x, rfl⟩ := (sym2Equiv φ.toEquiv).surjective y
  rw [mem_mapEdges_iff]
  induction x using Sym2.ind with
  | _ a b =>
    simp [sym2Equiv_apply, φ.map_adj_iff]

private lemma mapEdges_freeEdges {V W : Type*} [Fintype V] [DecidableEq V]
    [Fintype W] [DecidableEq W] {G : SimpleGraph V} {H : SimpleGraph W}
    [DecidableRel G.Adj] [DecidableRel H.Adj] (φ : G ≃g H) (M B : Finset (Sym2 V)) :
    mapEdges φ.toEquiv (freeEdges G M B) =
      freeEdges H (mapEdges φ.toEquiv M) (mapEdges φ.toEquiv B) := by
  ext y
  obtain ⟨x, rfl⟩ := (sym2Equiv φ.toEquiv).surjective y
  simp [freeEdges, mapEdges, ← mapEdges_edgeFinset φ]

private lemma deg_mapEdges {V W : Type*} [DecidableEq V] [DecidableEq W]
    (e : V ≃ W) (S : Finset (Sym2 V)) (v : V) :
    #{y ∈ mapEdges e S | e v ∈ y} = #{x ∈ S | v ∈ x} := by
  rw [mapEdges, filter_map, card_map]
  congr 1
  ext x
  simp [mem_sym2Equiv_iff]

private lemma hasShutout_mapEdges {V W : Type*} [DecidableEq V] [DecidableEq W]
    (e : V ≃ W) (s : ℕ) (M B : Finset (Sym2 V)) :
    HasShutout s (mapEdges e M) (mapEdges e B) ↔ HasShutout s M B := by
  constructor
  · rintro ⟨w, hwM, hwB⟩
    obtain ⟨v, rfl⟩ := e.surjective w
    refine ⟨v, ?_, ?_⟩
    · simpa [makerDeg, deg_mapEdges] using hwM
    · simpa [breakerDeg, deg_mapEdges] using hwB
  · rintro ⟨v, hvM, hvB⟩
    refine ⟨e v, ?_, ?_⟩
    · simpa [makerDeg, deg_mapEdges] using hvM
    · simpa [breakerDeg, deg_mapEdges] using hvB

private lemma makerWinsImmAux_iso_iff
    {V W : Type*} [Fintype V] [DecidableEq V] [Fintype W] [DecidableEq W]
    {G : SimpleGraph V} {H : SimpleGraph W} [DecidableRel G.Adj] [DecidableRel H.Adj]
    (φ : G ≃g H) (s k : ℕ) (turn : Bool) (M B : Finset (Sym2 V)) :
    MakerWinsImmAux G s k turn M B ↔
      MakerWinsImmAux H s k turn (mapEdges φ.toEquiv M) (mapEdges φ.toEquiv B) := by
  induction k generalizing turn M B with
  | zero =>
    simpa [MakerWinsImmAux] using (hasShutout_mapEdges φ.toEquiv s M B).symm
  | succ k ih =>
    cases turn
    · simp only [MakerWinsImmAux, ← mapEdges_freeEdges φ]
      refine or_congr (hasShutout_mapEdges φ.toEquiv s M B).symm ?_
      constructor
      · intro h y hy
        obtain ⟨x, hx, rfl⟩ := mem_map.mp hy
        have hx' := (ih true M (insert x B)).mp (h x hx)
        simpa [mapEdges, map_insert] using hx'
      · intro h x hx
        have hy : sym2Equiv φ.toEquiv x ∈ mapEdges φ.toEquiv (freeEdges G M B) :=
          (mem_mapEdges_iff φ.toEquiv).mpr hx
        have hx' := h _ hy
        rw [ih true M (insert x B)]
        simpa [mapEdges, map_insert] using hx'
    · simp only [MakerWinsImmAux, ← mapEdges_freeEdges φ]
      refine or_congr (hasShutout_mapEdges φ.toEquiv s M B).symm ?_
      constructor
      · rintro ⟨x, hx, h⟩
        refine ⟨sym2Equiv φ.toEquiv x, (mem_mapEdges_iff φ.toEquiv).mpr hx, ?_⟩
        simpa [mapEdges, map_insert] using (ih false (insert x M) B).mp h
      · rintro ⟨y, hy, h⟩
        obtain ⟨x, hx, rfl⟩ := mem_map.mp hy
        refine ⟨x, hx, ?_⟩
        rw [ih false (insert x M) B]
        simpa [mapEdges, map_insert] using h

private lemma makerWinsFreeStarAux_iso_iff
    {V W : Type*} [Fintype V] [DecidableEq V] [Fintype W] [DecidableEq W]
    {G : SimpleGraph V} {H : SimpleGraph W} [DecidableRel G.Adj] [DecidableRel H.Adj]
    (φ : G ≃g H) (s k : ℕ) (turn : Bool) (M B : Finset (Sym2 V)) :
    MakerWinsFreeStarAux G s k turn M B ↔
      MakerWinsFreeStarAux H s k turn (mapEdges φ.toEquiv M) (mapEdges φ.toEquiv B) := by
  induction k generalizing turn M B with
  | zero =>
    simpa [MakerWinsFreeStarAux] using (hasShutout_mapEdges φ.toEquiv s M B).symm
  | succ k ih =>
    cases turn
    · simp only [MakerWinsFreeStarAux, ← mapEdges_freeEdges φ]
      constructor
      · intro h y hy
        obtain ⟨x, hx, rfl⟩ := mem_map.mp hy
        have hx' := (ih true M (insert x B)).mp (h x hx)
        simpa [mapEdges, map_insert] using hx'
      · intro h x hx
        have hy : sym2Equiv φ.toEquiv x ∈ mapEdges φ.toEquiv (freeEdges G M B) :=
          (mem_mapEdges_iff φ.toEquiv).mpr hx
        have hx' := h _ hy
        rw [ih true M (insert x B)]
        simpa [mapEdges, map_insert] using hx'
    · simp only [MakerWinsFreeStarAux, ← mapEdges_freeEdges φ]
      refine or_congr (hasShutout_mapEdges φ.toEquiv s M B).symm ?_
      constructor
      · rintro ⟨x, hx, h⟩
        refine ⟨sym2Equiv φ.toEquiv x, (mem_mapEdges_iff φ.toEquiv).mpr hx, ?_⟩
        simpa [mapEdges, map_insert] using (ih false (insert x M) B).mp h
      · rintro ⟨y, hy, h⟩
        obtain ⟨x, hx, rfl⟩ := mem_map.mp hy
        refine ⟨x, hx, ?_⟩
        rw [ih false (insert x M) B]
        simpa [mapEdges, map_insert] using h

lemma makerWinsImmediate_iso_iff
    {V W : Type*} [Fintype V] [DecidableEq V] [Fintype W] [DecidableEq W]
    {G : SimpleGraph V} {H : SimpleGraph W} [DecidableRel G.Adj] [DecidableRel H.Adj]
    (φ : G ≃g H) (s : ℕ) :
    MakerWinsImmediate G s ↔ MakerWinsImmediate H s := by
  have hcard : #G.edgeFinset = #H.edgeFinset := by
    rw [← mapEdges_edgeFinset φ, mapEdges, card_map]
  simpa [MakerWinsImmediate, hcard, mapEdges] using
    makerWinsImmAux_iso_iff φ s #G.edgeFinset true ∅ ∅

lemma makerWinsFreeStar_iso_iff
    {V W : Type*} [Fintype V] [DecidableEq V] [Fintype W] [DecidableEq W]
    {G : SimpleGraph V} {H : SimpleGraph W} [DecidableRel G.Adj] [DecidableRel H.Adj]
    (φ : G ≃g H) (s : ℕ) :
    MakerWinsFreeStar G s ↔ MakerWinsFreeStar H s := by
  have hcard : #G.edgeFinset = #H.edgeFinset := by
    rw [← mapEdges_edgeFinset φ, mapEdges, card_map]
  simpa [MakerWinsFreeStar, hcard, mapEdges] using
    makerWinsFreeStarAux_iso_iff φ s #G.edgeFinset true ∅ ∅

/-- The set of maximum degrees of finite simple graphs on which Maker forces
an immediate `s`-shutout. -/
def ImmediateWinningDegrees (s : ℕ) : Set ℕ :=
  {d : ℕ | ∃ (n : ℕ) (G : SimpleGraph (Fin n)) (_ : DecidableRel G.Adj),
    G.maxDegree = d ∧ MakerWinsImmediate G s}

/-- The set of maximum degrees of finite simple graphs on which Maker forces
a free `s`-star. -/
def FreeStarWinningDegrees (s : ℕ) : Set ℕ :=
  {d : ℕ | ∃ (n : ℕ) (G : SimpleGraph (Fin n)) (_ : DecidableRel G.Adj),
    G.maxDegree = d ∧ MakerWinsFreeStar G s}

/-- Immediate shutout number `τ(s) ∈ ℕ∞`: least maximum degree of a finite simple graph
on which Maker can force an immediate `s`-shutout. -/
noncomputable def tau (s : ℕ) : ℕ∞ :=
  sInf ((Nat.cast : ℕ → ℕ∞) '' ImmediateWinningDegrees s)

/-- Free-star shutout number `σ(s) ∈ ℕ∞` (Cioba–Savvas Definition 2.2): least maximum degree
of a finite simple graph on which Maker can force a free `s`-star. -/
noncomputable def sigma (s : ℕ) : ℕ∞ :=
  sInf ((Nat.cast : ℕ → ℕ∞) '' FreeStarWinningDegrees s)

/-- `ℕ`-valued infimum for `τ(s)` (matches `tau s` whenever `ImmediateWinningDegrees s` is nonempty). -/
noncomputable def tauNat (s : ℕ) : ℕ :=
  sInf (ImmediateWinningDegrees s)

/-- `ℕ`-valued infimum for `σ(s)` (matches `sigma s` whenever `FreeStarWinningDegrees s` is nonempty). -/
noncomputable def sigmaNat (s : ℕ) : ℕ :=
  sInf (FreeStarWinningDegrees s)

lemma freeStarWinningDegrees_subset_immediateWinningDegrees (s : ℕ) :
    FreeStarWinningDegrees s ⊆ ImmediateWinningDegrees s := by
  rintro d ⟨n, G, inst, hdeg, hwin⟩
  exact ⟨n, G, inst, hdeg, makerWinsFreeStar_imp_makerWinsImmediate G s hwin⟩

theorem tau_le_sigma (s : ℕ) : tau s ≤ sigma s := by
  apply sInf_le_sInf
  exact Set.image_mono (freeStarWinningDegrees_subset_immediateWinningDegrees s)

theorem tauNat_le_sigmaNat {s : ℕ} (hne : (FreeStarWinningDegrees s).Nonempty) :
    tauNat s ≤ sigmaNat s := by
  exact Nat.sInf_le (freeStarWinningDegrees_subset_immediateWinningDegrees s (Nat.sInf_mem hne))

end IsoAndShutoutNumbers

section RiskRegionDefs

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- All independent subsets of `U` in `G`. -/
def indepSubsets (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V) : Finset (Finset V) :=
  U.powerset.filter (fun I => G.IsIndepSet (I : Set V))

/-- The multivariate independence polynomial `Q_U(z) = ∑_{I ⊆ U indep.} (-1)^|I| ∏_{v ∈ I} z_v`. -/
noncomputable def indepPoly (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V)
    (z : V → ℝ) : ℝ :=
  ∑ I ∈ indepSubsets G U, (-1 : ℝ) ^ #I * ∏ v ∈ I, z v

/-- The local Shearer risk region `ℛ(G)`: nonnegative vertex vectors `z` with `Q_U(z) > 0`
for every `U ⊆ V`. -/
def InRiskRegion (G : SimpleGraph V) [DecidableRel G.Adj] (z : V → ℝ) : Prop :=
  (∀ v, 0 ≤ z v) ∧ ∀ U : Finset V, 0 < indepPoly G U z

/-- Restriction of the risk region to a vertex subset `A ⊆ V`: nonnegative on `A` and
`Q_U(z) > 0` for every `U ⊆ A`. -/
def InRiskRegionOn (G : SimpleGraph V) [DecidableRel G.Adj] (A : Finset V) (z : V → ℝ) : Prop :=
  (∀ v ∈ A, 0 ≤ z v) ∧ ∀ U : Finset V, U ⊆ A → 0 < indepPoly G U z

/-- The deletion ratio `R_v(U) = Q_{U \ N(v)}(z) / Q_U(z)`. -/
noncomputable def riskRatio (G : SimpleGraph V) [DecidableRel G.Adj] (z : V → ℝ)
    (v : V) (U : Finset V) : ℝ :=
  indepPoly G (U \ G.neighborFinset v) z / indepPoly G U z

lemma indepPoly_empty (G : SimpleGraph V) [DecidableRel G.Adj] (z : V → ℝ) :
    indepPoly G ∅ z = 1 := by
  let _ := ‹Fintype V›
  have hsub : indepSubsets G ∅ = {∅} := by
    ext I
    simp only [indepSubsets, mem_filter, mem_powerset, subset_empty, mem_singleton]
    exact ⟨And.left, fun h => ⟨h, by simp [h, SimpleGraph.IsIndepSet]⟩⟩
  simp [indepPoly, hsub]

lemma indepPoly_congr {G : SimpleGraph V} [DecidableRel G.Adj] {U : Finset V}
    {z z' : V → ℝ} (h : ∀ u ∈ U, z u = z' u) :
    indepPoly G U z = indepPoly G U z' := by
  let _ := ‹Fintype V›
  refine Finset.sum_congr rfl fun I hI => ?_
  have hIU : I ⊆ U := by
    simp only [indepSubsets, mem_filter, mem_powerset] at hI
    exact hI.1
  congr 1
  exact Finset.prod_congr rfl fun v hv => h v (hIU hv)

lemma inRiskRegionOn_of_inRiskRegion {G : SimpleGraph V} [DecidableRel G.Adj]
    {z : V → ℝ} (hz : InRiskRegion G z) (A : Finset V) :
    InRiskRegionOn G A z := by
  let _ := ‹Fintype V›
  exact ⟨fun v _ => hz.1 v, fun U _ => hz.2 U⟩

private lemma indepPoly_induce_eq (G : SimpleGraph V) [DecidableRel G.Adj]
    (A : Finset V) (z : V → ℝ) (U' : Finset (A : Set V)) :
    indepPoly (G.induce (A : Set V)) U' (fun x => z x.val) =
      indepPoly G (U'.map ⟨Subtype.val, Subtype.val_injective⟩) z := by
  classical
  let _ := ‹Fintype V›
  let ι : (A : Set V) ↪ V := ⟨Subtype.val, Subtype.val_injective⟩
  have hmap : (indepSubsets (G.induce (A : Set V)) U').map
      ⟨fun I' => I'.map ι, Finset.map_injective ι⟩ = indepSubsets G (U'.map ι) := by
    ext I
    simp only [indepSubsets, mem_map, mem_filter, mem_powerset, Function.Embedding.coeFn_mk]
    constructor
    · rintro ⟨I', ⟨hI'U, hI'ind⟩, rfl⟩
      refine ⟨Finset.map_subset_map.mpr hI'U, ?_⟩
      intro x hx y hy hxy
      simp only [coe_map, Set.mem_image, mem_coe, ι, Function.Embedding.coeFn_mk] at hx hy
      rcases hx with ⟨x', hx', rfl⟩
      rcases hy with ⟨y', hy', rfl⟩
      exact hI'ind hx' hy' (fun h => hxy (congrArg Subtype.val h))
    · rintro ⟨hIU, hIind⟩
      refine ⟨I.subtype (· ∈ A), ⟨?_, ?_⟩, ?_⟩
      · intro x hx
        simp only [mem_subtype] at hx
        have hx' := hIU hx
        simpa [ι] using hx'
      · intro x hx y hy hxy
        simp only [mem_coe, mem_subtype] at hx hy
        exact hIind hx hy (fun h => hxy (Subtype.ext h))
      · ext v
        simp only [mem_map, mem_subtype, ι, Function.Embedding.coeFn_mk]
        constructor
        · rintro ⟨x, hx, rfl⟩
          exact hx
        · intro hv
          obtain ⟨x, _, hxv⟩ := mem_map.mp (hIU hv)
          dsimp [ι] at hxv
          exact ⟨x, hxv ▸ hv, hxv⟩
  rw [indepPoly, indepPoly, ← hmap, Finset.sum_map]
  refine Finset.sum_congr rfl fun I' _ => ?_
  simp [ι]

lemma inRiskRegionOn_iff_induce (G : SimpleGraph V) [DecidableRel G.Adj]
    (A : Finset V) (z : V → ℝ) :
    InRiskRegionOn G A z ↔ InRiskRegion (G.induce (A : Set V)) (fun x => z x.val) := by
  let ι : (A : Set V) ↪ V := ⟨Subtype.val, Subtype.val_injective⟩
  constructor
  · rintro ⟨hnonneg, hpos⟩
    refine ⟨fun x => hnonneg x.val x.2, fun U' => ?_⟩
    rw [indepPoly_induce_eq]
    apply hpos
    intro v hv
    rcases mem_map.mp hv with ⟨x, _, rfl⟩
    exact x.2
  · rintro ⟨hnonneg, hpos⟩
    refine ⟨fun v hv => hnonneg ⟨v, hv⟩, fun U hUA => ?_⟩
    have hU : U = (U.subtype (· ∈ A)).map ι := by
      ext v
      simp only [mem_map, mem_subtype, ι, Function.Embedding.coeFn_mk]
      exact ⟨fun hv => ⟨⟨v, hUA hv⟩, hv, rfl⟩, by rintro ⟨x, hx, rfl⟩; exact hx⟩
    rw [hU, ← indepPoly_induce_eq]
    exact hpos (U.subtype (· ∈ A))

end RiskRegionDefs

end Conjectures.CiobaSavvasShutout
