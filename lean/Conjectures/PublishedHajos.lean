import Mathlib.Combinatorics.SimpleGraph.Coloring.Vertex
import Mathlib.Data.Fin.VecNotation
import Mathlib.Data.Fintype.Card
import Mathlib.Data.Fintype.Prod
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Tactic

/-!
# Hajós's conjecture

P. A. Catlin, JCT B 26 (1979), 268–274, §2, Propositions 1–2.
DOI 10.1016/0095-8956(79)90062-5.
-/

namespace PublishedHajos

/-- A finite simple path, represented by its length and indexed vertices.
The values beyond the length are irrelevant. -/
structure SimplePath {V : Type} (G : SimpleGraph V) (u v : V) where
  length : ℕ
  vertex : ℕ → V
  first : vertex 0 = u
  last : vertex length = v
  step : ∀ i, i < length → G.Adj (vertex i) (vertex (i + 1))
  simple : ∀ i j, i ≤ length → j ≤ length → vertex i = vertex j → i = j

def SimplePath.Visits {V : Type} {G : SimpleGraph V} {u v : V}
    (p : SimplePath G u v) (x : V) : Prop :=
  ∃ i, i ≤ p.length ∧ p.vertex i = x

/-- An exact subdivision certificate: injective branch vertices, a
simple path for each pair, no other branch on any path, and paths for
distinct unordered pairs meeting only in a shared branch endpoint. -/
structure Subdivision {V : Type} (G : SimpleGraph V) (k : ℕ) where
  branch : Fin k ↪ V
  path : ∀ i j, SimplePath G (branch i) (branch j)
  branch_only : ∀ i j m, (path i j).Visits (branch m) → m = i ∨ m = j
  overlap : ∀ (i j p q : Fin k) (x : V), i ≠ j → p ≠ q →
    (i, j) ≠ (p, q) → (i, j) ≠ (q, p) →
    (path i j).Visits x → (path p q).Visits x →
    ∃ m, (m = i ∨ m = j) ∧ (m = p ∨ m = q) ∧ branch m = x

/-- Full finite graph conjecture, with the usual exact chromatic-number premise. -/
def HajosConjecture : Prop :=
  ∀ (V : Type) [Fintype V] (G : SimpleGraph V) (k : ℕ),
    G.Colorable k → ¬ G.Colorable (k - 1) → Nonempty (Subdivision G k)

/-- Every path leaving one side of a separator must visit the cut. -/
theorem path_hits_cut {V : Type} {G : SimpleGraph V} {u v : V}
    (p : SimplePath G u v) (side cut : V → Prop)
    (hu : side u) (hv : ¬ side v)
    (hs : ∀ x y, G.Adj x y → side x → ¬ cut y → side y) :
    ∃ x, cut x ∧ p.Visits x := by
  by_contra hn
  have hc : ∀ i, i ≤ p.length → ¬ cut (p.vertex i) := by
    intro i hi hci
    exact hn ⟨p.vertex i, hci, i, hi, rfl⟩
  have hside : ∀ i, i ≤ p.length → side (p.vertex i) := by
    intro i
    induction i with
    | zero =>
      intro _
      rw [p.first]
      exact hu
    | succ i ih =>
      intro hi
      exact hs _ _ (p.step i (by omega)) (ih (by omega)) (hc _ hi)
  apply hv
  rw [← p.last]
  exact hside _ le_rfl

abbrev V := Fin 5 × Fin 3

abbrev Near (i j : Fin 5) : Prop :=
  i = j ∨ (i.val + 1) % 5 = j.val ∨ (j.val + 1) % 5 = i.val

/-- Catlin's L(3 C_5), i.e. the 3-clique blow-up of C_5. -/
def catlin : SimpleGraph V where
  Adj x y := x ≠ y ∧ Near x.1 y.1
  symm := by
    intro x y h
    exact ⟨Ne.symm h.1, h.2.elim (fun e => Or.inl e.symm)
      (fun h => Or.inr h.symm)⟩
  loopless := by
    intro x h
    exact h.1 rfl

abbrev colorTable : Fin 5 → Fin 3 → Fin 8 :=
  ![![0,1,2], ![3,4,5], ![0,1,6], ![2,3,4], ![5,6,7]]

abbrev color (x : V) : Fin 8 := colorTable x.1 x.2

set_option maxRecDepth 100000
set_option maxHeartbeats 0

private theorem color_ok : ∀ x y : V, catlin.Adj x y → color x ≠ color y := by
  change ∀ x y : V, x ≠ y ∧ Near x.1 y.1 → color x ≠ color y
  decide

theorem colorable8 : catlin.Colorable 8 :=
  ⟨SimpleGraph.Coloring.mk color (fun h => color_ok _ _ h)⟩

private theorem no_independent_three : ∀ x y z : V,
    x ≠ y → x ≠ z → y ≠ z →
    ¬ catlin.Adj x y → ¬ catlin.Adj x z → ¬ catlin.Adj y z → False := by
  change ∀ x y z : V, x ≠ y → x ≠ z → y ≠ z →
    ¬ (x ≠ y ∧ Near x.1 y.1) → ¬ (x ≠ z ∧ Near x.1 z.1) →
    ¬ (y ≠ z ∧ Near y.1 z.1) → False
  decide

open scoped BigOperators

theorem not_colorable7 : ¬ catlin.Colorable 7 := by
  rintro ⟨c⟩
  let fibers (i : Fin 7) : Finset V := Finset.univ.filter (fun x => c x = i)
  have small : ∀ i, (fibers i).card ≤ 2 := by
    intro i
    by_contra! h
    obtain ⟨x, y, z, hx, hy, hz, hxy, hxz, hyz⟩ :=
      Finset.two_lt_card_iff.mp h
    have ex : c x = i := (Finset.mem_filter.mp hx).2
    have ey : c y = i := (Finset.mem_filter.mp hy).2
    have ez : c z = i := (Finset.mem_filter.mp hz).2
    exact no_independent_three x y z hxy hxz hyz
      (fun h => c.valid h (ex.trans ey.symm))
      (fun h => c.valid h (ex.trans ez.symm))
      (fun h => c.valid h (ey.trans ez.symm))
  have total : (Finset.univ : Finset V).card =
      ∑ i : Fin 7, (fibers i).card := by
    exact Finset.card_eq_sum_card_fiberwise
      (fun _ _ => Finset.mem_univ _)
  have upper : (∑ i : Fin 7, (fibers i).card) ≤ ∑ _i : Fin 7, 2 :=
    Finset.sum_le_sum (fun i _ => small i)
  have hv : (Finset.univ : Finset V).card = 15 := by decide
  rw [hv] at total
  simp at upper
  omega

private theorem no_three_near : ∀ i j l : Fin 5,
    i ≠ j → i ≠ l → j ≠ l → Near i j → Near i l → Near j l → False := by
  decide

/-- Eight distinct vertices cannot be contained in two neighboring cliques. -/
theorem separated_branches (b : Fin 8 ↪ V) :
    ∃ i j : Fin 8, ¬ Near (b i).1 (b j).1 := by
  by_contra! hn
  let P : Finset (Fin 5) := Finset.univ.image (fun i : Fin 8 => (b i).1)
  have pair : ∀ x y, x ∈ P → y ∈ P → Near x y := by
    intro x y hx hy
    obtain ⟨i, _, rfl⟩ := Finset.mem_image.mp hx
    obtain ⟨j, _, rfl⟩ := Finset.mem_image.mp hy
    exact hn i j
  have small : P.card ≤ 2 := by
    by_contra! h
    obtain ⟨i, j, l, hi, hj, hl, hij, hil, hjl⟩ :=
      Finset.two_lt_card_iff.mp h
    exact no_three_near i j l hij hil hjl
      (pair i j hi hj) (pair i l hi hl) (pair j l hj hl)
  let f : Fin 8 → P × Fin 3 :=
    fun i => (⟨(b i).1, Finset.mem_image_of_mem _ (Finset.mem_univ i)⟩, (b i).2)
  have inj : Function.Injective f := by
    intro i j h
    apply b.injective
    exact Prod.ext (congrArg (fun p : P × Fin 3 => p.1.val) h)
      (congrArg Prod.snd h)
  have hc := Fintype.card_le_of_injective f inj
  simp only [Fintype.card_fin, Fintype.card_prod, Fintype.card_coe] at hc
  omega

abbrev Cut (s : Fin 5) (x : V) : Prop := Near s x.1 ∧ x.1 ≠ s

private theorem cut_step : ∀ (s : Fin 5) (x y : V),
    catlin.Adj x y → x.1 = s → ¬ Cut s y → y.1 = s := by
  change ∀ (s : Fin 5) (x y : V),
    x ≠ y ∧ Near x.1 y.1 → x.1 = s → ¬ Cut s y → y.1 = s
  decide

private theorem cut_card : ∀ s : Fin 5, Fintype.card {x : V // Cut s x} = 6 := by
  decide

private theorem index_card : ∀ a : Fin 8, Fintype.card {i : Fin 8 // i ≠ a} = 7 := by
  decide

/-- The six-vertex separator rules out a subdivision with eight branches. -/
theorem no_subdivision8 : ¬ Nonempty (Subdivision catlin 8) := by
  classical
  rintro ⟨sub⟩
  obtain ⟨a, b, hab⟩ := separated_branches sub.branch
  let s := (sub.branch a).1
  have ha : (sub.branch a).1 = s := rfl
  have hb : (sub.branch b).1 ≠ s := by
    intro he
    exact hab (Or.inl he.symm)
  have hca : ¬ Cut s (sub.branch a) := fun h => h.2 ha
  have hcb : ¬ Cut s (sub.branch b) := fun h => hab h.1
  let W (i : Fin 8) (x : V) : Prop :=
    Cut s x ∧ (x = sub.branch i ∨
      ∃ p q : Fin 8, p ≠ q ∧
        ((p = i ∧ q = b) ∨ (p = a ∧ q = i)) ∧
        (sub.path p q).Visits x)
  have existsW : ∀ i : {i : Fin 8 // i ≠ a}, ∃ x : V, W i.val x := by
    intro i
    by_cases hci : Cut s (sub.branch i.val)
    · exact ⟨sub.branch i.val, hci, Or.inl rfl⟩
    · by_cases hsi : (sub.branch i.val).1 = s
      · have hib : i.val ≠ b := by
          intro he
          exact hb (he ▸ hsi)
        obtain ⟨x, hx, hv⟩ := path_hits_cut (sub.path i.val b)
          (fun x => x.1 = s) (Cut s) hsi hb (cut_step s)
        exact ⟨x, hx, Or.inr ⟨i.val, b, hib, Or.inl ⟨rfl, rfl⟩, hv⟩⟩
      · obtain ⟨x, hx, hv⟩ := path_hits_cut (sub.path a i.val)
          (fun x => x.1 = s) (Cut s) ha hsi (cut_step s)
        exact ⟨x, hx, Or.inr ⟨a, i.val, Ne.symm i.property, Or.inr ⟨rfl, rfl⟩, hv⟩⟩
  have uniqueW : ∀ i j : {i : Fin 8 // i ≠ a}, ∀ x : V,
      W i.val x → W j.val x → i = j := by
    intro i j x hi hj
    have hia := i.property
    have hja := j.property
    apply Subtype.ext
    by_contra hij
    have hx := hi.1
    rcases hi.2 with hi | ⟨p, q, hpq, hip, hv⟩
    · rcases hj.2 with hj | ⟨p, q, hpq, hjp, hv⟩
      · exact hij (sub.branch.injective (hi.symm.trans hj))
      · have hib : i.val ≠ b := by
          intro he
          apply hcb
          rw [← he, ← hi]
          exact hx
        have hm := sub.branch_only p q i.val (hi ▸ hv)
        grind
    · rcases hj.2 with hj | ⟨p', q', hpq', hjp, hv'⟩
      · have hjb : j.val ≠ b := by
          intro he
          apply hcb
          rw [← he, ← hj]
          exact hx
        have hm := sub.branch_only p q j.val (hj ▸ hv)
        grind
      · have hdiff : (p, q) ≠ (p', q') := by
          intro he
          have h1 := congrArg Prod.fst he
          have h2 := congrArg Prod.snd he
          grind
        have hrev : (p, q) ≠ (q', p') := by
          intro he
          have h1 := congrArg Prod.fst he
          have h2 := congrArg Prod.snd he
          grind
        obtain ⟨m, hm, hm', hmx⟩ := sub.overlap p q p' q' x
          hpq hpq' hdiff hrev hv hv'
        have hmc : Cut s (sub.branch m) := by rw [hmx]; exact hx
        have hma : m ≠ a := by intro he; exact hca (he ▸ hmc)
        have hmb : m ≠ b := by intro he; exact hcb (he ▸ hmc)
        grind
  choose f hf using existsW
  let fc : {i : Fin 8 // i ≠ a} → {x : V // Cut s x} :=
    fun i => ⟨f i, (hf i).1⟩
  have finj : Function.Injective fc := by
    intro i j he
    have he' : f i = f j := congrArg Subtype.val he
    apply uniqueW i j (f i) (hf i)
    rw [he']
    exact hf j
  have hc := Fintype.card_le_of_injective fc finj
  rw [index_card a, cut_card s] at hc
  omega

theorem hajos_conjecture_false : ¬ HajosConjecture := by
  intro h
  exact no_subdivision8 (h V catlin 8 colorable8 not_colorable7)

end PublishedHajos
