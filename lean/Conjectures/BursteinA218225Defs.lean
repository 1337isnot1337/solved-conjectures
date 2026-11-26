import Mathlib.Data.Fin.Tuple.Basic
import Mathlib.Data.Finset.Max
import Mathlib.Data.Fintype.Perm
import Mathlib.Data.List.Range
import Mathlib.Data.Multiset.Basic
import Mathlib.Order.Fin.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.SetTheory.Cardinal.Finite

/-!
# Burstein's A218225 Enumeration Conjecture — Core Definitions

Literal definitions of pattern avoidance for
- `X = Av(2134, 42153, 24153)`
- `Y = Av(2143, 42135, 24135)`
maximum insertion/deletion on `Equiv.Perm (Fin n)`, occurrence statistics,
and the common generating tree.
-/

namespace Conjectures.BursteinA218225

open Classical

/-! ## Literal Pattern Containment and Avoidance Classes -/

/-- A permutation `π` of `Fin n` contains pattern `τ : Fin k → ℕ` if there is a strictly
increasing sequence of positions whose values under `π` have the same relative order as `τ`. -/
def ContainsPattern {n k : ℕ} (π : Equiv.Perm (Fin n)) (τ : Fin k → ℕ) : Prop :=
  ∃ f : Fin k → Fin n, StrictMono f ∧ ∀ i j : Fin k, π (f i) < π (f j) ↔ τ i < τ j

def pat213 : Fin 3 → ℕ := ![2, 1, 3]
def pat4213 : Fin 4 → ℕ := ![4, 2, 1, 3]
def pat2413 : Fin 4 → ℕ := ![2, 4, 1, 3]

def pat2134 : Fin 4 → ℕ := ![2, 1, 3, 4]
def pat42153 : Fin 5 → ℕ := ![4, 2, 1, 5, 3]
def pat24153 : Fin 5 → ℕ := ![2, 4, 1, 5, 3]

def pat2143 : Fin 4 → ℕ := ![2, 1, 4, 3]
def pat42135 : Fin 5 → ℕ := ![4, 2, 1, 3, 5]
def pat24135 : Fin 5 → ℕ := ![2, 4, 1, 3, 5]

/-- The class `X = Av(2134, 42153, 24153)`. -/
def InX {n : ℕ} (π : Equiv.Perm (Fin n)) : Prop :=
  ¬ ContainsPattern π pat2134 ∧ ¬ ContainsPattern π pat42153 ∧ ¬ ContainsPattern π pat24153

/-- The class `Y = Av(2143, 42135, 24135)`. -/
def InY {n : ℕ} (π : Equiv.Perm (Fin n)) : Prop :=
  ¬ ContainsPattern π pat2143 ∧ ¬ ContainsPattern π pat42135 ∧ ¬ ContainsPattern π pat24135

/-- Literal count of length-`n` permutations in `X`. -/
noncomputable def countX (n : ℕ) : ℕ :=
  Nat.card {π : Equiv.Perm (Fin n) // InX π}

/-- Literal count of length-`n` permutations in `Y`. -/
noncomputable def countY (n : ℕ) : ℕ :=
  Nat.card {π : Equiv.Perm (Fin n) // InY π}

/-- Nonempty ordinary generating series of `X`. -/
noncomputable def seriesX : PowerSeries ℤ :=
  PowerSeries.mk fun n => if n = 0 then 0 else (countX n : ℤ)

/-- Nonempty ordinary generating series of `Y`. -/
noncomputable def seriesY : PowerSeries ℤ :=
  PowerSeries.mk fun n => if n = 0 then 0 else (countY n : ℤ)

private theorem not_containsPattern_fin0 {k : ℕ} (hk : 0 < k) (π : Equiv.Perm (Fin 0))
    (τ : Fin k → ℕ) : ¬ ContainsPattern π τ := by
  rintro ⟨f, -, -⟩
  exact Fin.elim0 (f ⟨0, hk⟩)

theorem inX_empty : InX (1 : Equiv.Perm (Fin 0)) :=
  ⟨not_containsPattern_fin0 (by decide) _ _,
   not_containsPattern_fin0 (by decide) _ _,
   not_containsPattern_fin0 (by decide) _ _⟩

theorem inY_empty : InY (1 : Equiv.Perm (Fin 0)) :=
  ⟨not_containsPattern_fin0 (by decide) _ _,
   not_containsPattern_fin0 (by decide) _ _,
   not_containsPattern_fin0 (by decide) _ _⟩

theorem countX_zero : countX 0 = 1 := by
  have : Unique {π : Equiv.Perm (Fin 0) // InX π} :=
    { default := ⟨1, inX_empty⟩
      uniq := fun ⟨π, _⟩ => Subtype.ext (Subsingleton.elim π 1) }
  exact Nat.card_unique

theorem countY_zero : countY 0 = 1 := by
  have : Unique {π : Equiv.Perm (Fin 0) // InY π} :=
    { default := ⟨1, inY_empty⟩
      uniq := fun ⟨π, _⟩ => Subtype.ext (Subsingleton.elim π 1) }
  exact Nat.card_unique

/-! ## Maximum Insertion and Deletion -/

/-- Insert the new maximum `Fin.last n` into `π` at gap `g : Fin (n + 1)`. -/
def insertMax {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n + 1)) : Equiv.Perm (Fin (n + 1)) where
  toFun := g.succAboveCases (Fin.last n) (fun i => (π i).castSucc)
  invFun := Fin.lastCases g (fun y => g.succAbove (π.symm y))
  left_inv := by
    intro x
    refine g.succAboveCases ?_ ?_ x
    · simp
    · intro i
      simp
  right_inv := by
    intro y
    refine Fin.lastCases ?_ ?_ y
    · simp
    · intro i
      simp

/-- Gap index of the maximum entry `Fin.last n` in `σ`. -/
def maxGap {n : ℕ} (σ : Equiv.Perm (Fin (n + 1))) : Fin (n + 1) :=
  σ.symm (Fin.last n)

private theorem apply_succAbove_maxGap_ne_last {n : ℕ} (σ : Equiv.Perm (Fin (n + 1))) (i : Fin n) :
    σ ((maxGap σ).succAbove i) ≠ Fin.last n := by
  intro h
  have h1 : (maxGap σ).succAbove i = maxGap σ := by
    apply σ.injective
    rw [maxGap, Equiv.apply_symm_apply]
    exact h
  exact Fin.succAbove_ne (maxGap σ) i h1

private theorem symm_castSucc_ne_maxGap {n : ℕ} (σ : Equiv.Perm (Fin (n + 1))) (y : Fin n) :
    σ.symm y.castSucc ≠ maxGap σ := by
  intro h
  have h1 : y.castSucc = Fin.last n := by
    apply σ.symm.injective
    rw [← maxGap]
    exact h
  exact Fin.castSucc_ne_last y h1

/-- Delete the maximum entry `Fin.last n` from `σ : Equiv.Perm (Fin (n + 1))`. -/
noncomputable def deleteMax {n : ℕ} (σ : Equiv.Perm (Fin (n + 1))) : Equiv.Perm (Fin n) where
  toFun i :=
    (σ ((maxGap σ).succAbove i)).castPred (apply_succAbove_maxGap_ne_last σ i)
  invFun y :=
    Classical.choose (Fin.exists_succAbove_eq (symm_castSucc_ne_maxGap σ y))
  left_inv := by
    intro i
    have hspec := Classical.choose_spec
      (Fin.exists_succAbove_eq
        (symm_castSucc_ne_maxGap σ
          ((σ ((maxGap σ).succAbove i)).castPred (apply_succAbove_maxGap_ne_last σ i))))
    apply Fin.succAbove_right_injective
    rw [hspec, Fin.castSucc_castPred, Equiv.symm_apply_apply]
  right_inv := by
    intro y
    have hspec := Classical.choose_spec (Fin.exists_succAbove_eq (symm_castSucc_ne_maxGap σ y))
    apply Fin.castSucc_injective
    rw [Fin.castSucc_castPred, hspec, Equiv.apply_symm_apply]

theorem insertMax_apply_self {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n + 1)) :
    insertMax π g g = Fin.last n := by
  simp [insertMax]

theorem insertMax_apply_succAbove {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n + 1)) (i : Fin n) :
    insertMax π g (g.succAbove i) = (π i).castSucc := by
  simp [insertMax]

theorem insertMax_order_iff {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n + 1)) (i j : Fin n) :
    insertMax π g (g.succAbove i) < insertMax π g (g.succAbove j) ↔ π i < π j := by
  rw [insertMax_apply_succAbove, insertMax_apply_succAbove]
  exact Fin.castSucc_lt_castSucc_iff

theorem maxGap_insertMax {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n + 1)) :
    maxGap (insertMax π g) = g := by
  unfold maxGap
  rw [Equiv.symm_apply_eq]
  exact (insertMax_apply_self π g).symm

theorem deleteMax_insertMax {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n + 1)) :
    deleteMax (insertMax π g) = π := by
  ext i
  have h : ((deleteMax (insertMax π g) i).castSucc : Fin (n + 1)) = (π i).castSucc := by
    simp [deleteMax, maxGap_insertMax, insertMax_apply_succAbove]
  exact congrArg Fin.val (Fin.castSucc_injective n h)

theorem insertMax_deleteMax {n : ℕ} (σ : Equiv.Perm (Fin (n + 1))) :
    insertMax (deleteMax σ) (maxGap σ) = σ := by
  ext x
  refine (maxGap σ).succAboveCases ?_ ?_ x
  · rw [insertMax_apply_self]
    simp [maxGap]
  · intro i
    rw [insertMax_apply_succAbove]
    simp [deleteMax]

/-- Bijection `(π, g) ↦ insertMax π g` between `S_n × Fin (n + 1)` and `S_{n + 1}`. -/
noncomputable def insertMaxEquiv (n : ℕ) :
    Equiv.Perm (Fin n) × Fin (n + 1) ≃ Equiv.Perm (Fin (n + 1)) where
  toFun p := insertMax p.1 p.2
  invFun σ := (deleteMax σ, maxGap σ)
  left_inv := by
    rintro ⟨π, g⟩
    exact Prod.ext (deleteMax_insertMax π g) (maxGap_insertMax π g)
  right_inv := by
    intro σ
    exact insertMax_deleteMax σ

theorem containsPattern_of_deleteMax {n k : ℕ} {σ : Equiv.Perm (Fin (n + 1))} {τ : Fin k → ℕ}
    (h : ContainsPattern (deleteMax σ) τ) : ContainsPattern σ τ := by
  rcases h with ⟨f, hf, hord⟩
  refine ⟨fun i => (maxGap σ).succAbove (f i), (Fin.strictMono_succAbove (maxGap σ)).comp hf, ?_⟩
  intro i j
  have h1 : σ ((maxGap σ).succAbove (f i)) = (deleteMax σ (f i)).castSucc := by
    simp [deleteMax]
  have h2 : σ ((maxGap σ).succAbove (f j)) = (deleteMax σ (f j)).castSucc := by
    simp [deleteMax]
  rw [h1, h2, Fin.castSucc_lt_castSucc_iff]
  exact hord i j

theorem inX_deleteMax {n : ℕ} {σ : Equiv.Perm (Fin (n + 1))} (h : InX σ) :
    InX (deleteMax σ) :=
  ⟨fun hc => h.1 (containsPattern_of_deleteMax hc),
   fun hc => h.2.1 (containsPattern_of_deleteMax hc),
   fun hc => h.2.2 (containsPattern_of_deleteMax hc)⟩

theorem inY_deleteMax {n : ℕ} {σ : Equiv.Perm (Fin (n + 1))} (h : InY σ) :
    InY (deleteMax σ) :=
  ⟨fun hc => h.1 (containsPattern_of_deleteMax hc),
   fun hc => h.2.1 (containsPattern_of_deleteMax hc),
   fun hc => h.2.2 (containsPattern_of_deleteMax hc)⟩

/-! ## Explicit Pattern Occurrences (0-based `Fin n` Positions) -/

def Is213 {n : ℕ} (π : Equiv.Perm (Fin n)) (i j c : Fin n) : Prop :=
  i < j ∧ j < c ∧ π j < π i ∧ π i < π c

def Is4213 {n : ℕ} (π : Equiv.Perm (Fin n)) (p q u v : Fin n) : Prop :=
  p < q ∧ q < u ∧ u < v ∧ π u < π q ∧ π q < π v ∧ π v < π p

def Is2413 {n : ℕ} (π : Equiv.Perm (Fin n)) (p q u v : Fin n) : Prop :=
  p < q ∧ q < u ∧ u < v ∧ π u < π p ∧ π p < π v ∧ π v < π q

def IsFourPat {n : ℕ} (π : Equiv.Perm (Fin n)) (p q u v : Fin n) : Prop :=
  Is4213 π p q u v ∨ Is2413 π p q u v

theorem contains_pat213_iff {n : ℕ} (π : Equiv.Perm (Fin n)) :
    ContainsPattern π pat213 ↔ ∃ i j c : Fin n, Is213 π i j c := by
  constructor
  · rintro ⟨f, hf, hord⟩
    exact ⟨f 0, f 1, f 2, hf (by decide), hf (by decide),
      (hord 1 0).2 (by decide), (hord 0 2).2 (by decide)⟩
  · rintro ⟨i, j, c, hij, hjc, hji, hic⟩
    have hij' : i.val < j.val := hij
    have hjc' : j.val < c.val := hjc
    have hji' : (π j).val < (π i).val := hji
    have hic' : (π i).val < (π c).val := hic
    refine ⟨![i, j, c], ?_, ?_⟩
    · intro a b hab
      rw [Fin.lt_def] at hab ⊢
      fin_cases a <;> fin_cases b <;> simp at hab ⊢ <;> omega
    · intro a b
      rw [Fin.lt_def]
      fin_cases a <;> fin_cases b <;> simp [pat213] <;> omega

theorem contains_pat4213_iff {n : ℕ} (π : Equiv.Perm (Fin n)) :
    ContainsPattern π pat4213 ↔ ∃ p q u v : Fin n, Is4213 π p q u v := by
  constructor
  · rintro ⟨f, hf, hord⟩
    exact ⟨f 0, f 1, f 2, f 3, hf (by decide), hf (by decide), hf (by decide),
      (hord 2 1).2 (by decide), (hord 1 3).2 (by decide), (hord 3 0).2 (by decide)⟩
  · rintro ⟨p, q, u, v, hpq, hqu, huv, huq, hqv, hvp⟩
    have hpq' : p.val < q.val := hpq
    have hqu' : q.val < u.val := hqu
    have huv' : u.val < v.val := huv
    have huq' : (π u).val < (π q).val := huq
    have hqv' : (π q).val < (π v).val := hqv
    have hvp' : (π v).val < (π p).val := hvp
    refine ⟨![p, q, u, v], ?_, ?_⟩
    · intro a b hab
      rw [Fin.lt_def] at hab ⊢
      fin_cases a <;> fin_cases b <;> simp at hab ⊢ <;> omega
    · intro a b
      rw [Fin.lt_def]
      fin_cases a <;> fin_cases b <;> simp [pat4213] <;> omega

theorem contains_pat2413_iff {n : ℕ} (π : Equiv.Perm (Fin n)) :
    ContainsPattern π pat2413 ↔ ∃ p q u v : Fin n, Is2413 π p q u v := by
  constructor
  · rintro ⟨f, hf, hord⟩
    exact ⟨f 0, f 1, f 2, f 3, hf (by decide), hf (by decide), hf (by decide),
      (hord 2 0).2 (by decide), (hord 0 3).2 (by decide), (hord 3 1).2 (by decide)⟩
  · rintro ⟨p, q, u, v, hpq, hqu, huv, hup, hpv, hvq⟩
    have hpq' : p.val < q.val := hpq
    have hqu' : q.val < u.val := hqu
    have huv' : u.val < v.val := huv
    have hup' : (π u).val < (π p).val := hup
    have hpv' : (π p).val < (π v).val := hpv
    have hvq' : (π v).val < (π q).val := hvq
    refine ⟨![p, q, u, v], ?_, ?_⟩
    · intro a b hab
      rw [Fin.lt_def] at hab ⊢
      fin_cases a <;> fin_cases b <;> simp at hab ⊢ <;> omega
    · intro a b
      rw [Fin.lt_def]
      fin_cases a <;> fin_cases b <;> simp [pat2413] <;> omega

/-- Every `4213` or `2413` occurrence with 3rd and 4th positions `u, v` contains a `213`
occurrence sharing middle `u` and end `v`. -/
theorem fourPat_contains_213 {n : ℕ} {π : Equiv.Perm (Fin n)} {p q u v : Fin n}
    (h : IsFourPat π p q u v) : ∃ i : Fin n, Is213 π i u v := by
  rcases h with ⟨_, hqu, huv, huq, hqv, _⟩ | ⟨hpq, hqu, huv, hup, hpv, _⟩
  · exact ⟨q, hqu, huv, huq, hqv⟩
  · exact ⟨p, lt_trans hpq hqu, huv, hup, hpv⟩

private theorem succAbove_val_of_lt {n : ℕ} (g : Fin (n + 1)) (x : Fin n) (h : x.val < g.val) :
    (g.succAbove x).val = x.val := by
  have hx : x.castSucc < g := h
  simp [Fin.succAbove_of_castSucc_lt, hx]

private theorem succAbove_val_of_le {n : ℕ} (g : Fin (n + 1)) (x : Fin n) (h : g.val ≤ x.val) :
    (g.succAbove x).val = x.val + 1 := by
  have hx : g ≤ x.castSucc := h
  simp [Fin.succAbove_of_le_castSucc, hx]

private theorem lt_succAbove_iff_le {n : ℕ} (g : Fin (n + 1)) (x : Fin n) :
    g < g.succAbove x ↔ g.val ≤ x.val := by
  by_cases h : x.val < g.val
  · rw [Fin.lt_def, succAbove_val_of_lt g x h]
    omega
  · have hle : g.val ≤ x.val := by omega
    rw [Fin.lt_def, succAbove_val_of_le g x hle]
    omega

/-- Inserting the new maximum strictly before the middle `u` of a `213` creates a `4213` or
`2413` whose 3rd and 4th positions are the shifted `u` and `v`. -/
theorem insertMax_creates_fourPat {n : ℕ} {π : Equiv.Perm (Fin n)} {g : Fin (n + 1)}
    {i u v : Fin n} (h213 : Is213 π i u v) (hg : g.val ≤ u.val) :
    ∃ p q : Fin (n + 1), IsFourPat (insertMax π g) p q (g.succAbove u) (g.succAbove v) := by
  rcases h213 with ⟨hiu, huv, hui, hiv⟩
  by_cases hgi : g.val ≤ i.val
  · refine ⟨g, g.succAbove i, Or.inl ?_⟩
    refine ⟨(lt_succAbove_iff_le g i).2 hgi,
      Fin.strictMono_succAbove g hiu,
      Fin.strictMono_succAbove g huv, ?_, ?_, ?_⟩
    · exact (insertMax_order_iff π g u i).2 hui
    · exact (insertMax_order_iff π g i v).2 hiv
    · rw [insertMax_apply_succAbove, insertMax_apply_self]
      exact Fin.castSucc_lt_last (π v)
  · have hig : i.val < g.val := by omega
    refine ⟨g.succAbove i, g, Or.inr ?_⟩
    refine ⟨?_, (lt_succAbove_iff_le g u).2 hg,
      Fin.strictMono_succAbove g huv, ?_, ?_, ?_⟩
    · rw [Fin.lt_def, succAbove_val_of_lt g i hig]
      exact hig
    · exact (insertMax_order_iff π g u i).2 hui
    · exact (insertMax_order_iff π g i v).2 hiv
    · rw [insertMax_apply_succAbove, insertMax_apply_self]
      exact Fin.castSucc_lt_last (π v)

private theorem not_insertMax_self_lt {n : ℕ} (π : Equiv.Perm (Fin n)) (g x : Fin (n + 1)) :
    ¬ insertMax π g g < insertMax π g x := by
  rw [insertMax_apply_self]
  exact not_lt.2 (Fin.le_last _)

/-- Any `4213` or `2413` occurrence in `insertMax π g` using the inserted maximum `g` comes from
a `213` occurrence in `π` with middle `u` satisfying `g.val ≤ u.val`. -/
theorem fourPat_insertMax_uses_max {n : ℕ} {π : Equiv.Perm (Fin n)} {g : Fin (n + 1)}
    {p q u' v' : Fin (n + 1)} (h : IsFourPat (insertMax π g) p q u' v')
    (huse : p = g ∨ q = g ∨ u' = g ∨ v' = g) :
    ∃ i u v : Fin n, Is213 π i u v ∧ g.val ≤ u.val ∧
      u' = g.succAbove u ∧ v' = g.succAbove v := by
  rcases h with ⟨hpq, hqu, huv, huq, hqv, hvp⟩ | ⟨hpq, hqu, huv, hup, hpv, hvq⟩
  · have hp : p = g := by
      rcases huse with h1 | h1 | h1 | h1
      · exact h1
      · rw [h1] at hqv; exact False.elim (not_insertMax_self_lt π g v' hqv)
      · rw [h1] at huq; exact False.elim (not_insertMax_self_lt π g q huq)
      · rw [h1] at hvp; exact False.elim (not_insertMax_self_lt π g p hvp)
    rw [hp] at hpq
    obtain ⟨i, rfl⟩ := Fin.exists_succAbove_eq (ne_of_gt hpq)
    obtain ⟨u, rfl⟩ := Fin.exists_succAbove_eq (ne_of_gt (lt_trans hpq hqu))
    obtain ⟨v, rfl⟩ := Fin.exists_succAbove_eq (ne_of_gt (lt_trans (lt_trans hpq hqu) huv))
    refine ⟨i, u, v, ?_, (lt_succAbove_iff_le g u).1 (lt_trans hpq hqu), rfl, rfl⟩
    exact ⟨(Fin.strictMono_succAbove g).lt_iff_lt.1 hqu,
      (Fin.strictMono_succAbove g).lt_iff_lt.1 huv,
      (insertMax_order_iff π g u i).1 huq,
      (insertMax_order_iff π g i v).1 hqv⟩
  · have hq : q = g := by
      rcases huse with h1 | h1 | h1 | h1
      · rw [h1] at hpv; exact False.elim (not_insertMax_self_lt π g v' hpv)
      · exact h1
      · rw [h1] at hup; exact False.elim (not_insertMax_self_lt π g p hup)
      · rw [h1] at hvq; exact False.elim (not_insertMax_self_lt π g q hvq)
    rw [hq] at hpq hqu
    obtain ⟨i, rfl⟩ := Fin.exists_succAbove_eq (ne_of_lt hpq)
    obtain ⟨u, rfl⟩ := Fin.exists_succAbove_eq (ne_of_gt hqu)
    obtain ⟨v, rfl⟩ := Fin.exists_succAbove_eq (ne_of_gt (lt_trans hqu huv))
    refine ⟨i, u, v, ?_, (lt_succAbove_iff_le g u).1 hqu, rfl, rfl⟩
    exact ⟨(Fin.strictMono_succAbove g).lt_iff_lt.1 (lt_trans hpq hqu),
      (Fin.strictMono_succAbove g).lt_iff_lt.1 huv,
      (insertMax_order_iff π g u i).1 hup,
      (insertMax_order_iff π g i v).1 hpv⟩

/-! ## 1-based Occurrence Statistics with Sentinel `n + 1` -/

/-- `d`: 1-based bottom index of the first adjacent descent, or `n + 1` if `π` is increasing. -/
noncomputable def firstDescent {n : ℕ} (π : Equiv.Perm (Fin n)) : ℕ :=
  (insert (n + 1)
    ((Finset.univ.filter fun j : Fin n =>
      ∃ h : 0 < j.val, π ⟨j.val - 1, by omega⟩ > π j).image fun j => j.val + 1)).min'
    (Finset.insert_nonempty _ _)

/-- `b`: least 1-based middle index of a `213` occurrence, or `n + 1` if absent. -/
noncomputable def least213Mid {n : ℕ} (π : Equiv.Perm (Fin n)) : ℕ :=
  (insert (n + 1)
    ((Finset.univ.filter fun j : Fin n =>
      ∃ i c : Fin n, Is213 π i j c).image fun j => j.val + 1)).min'
    (Finset.insert_nonempty _ _)

/-- `T_3`: least 1-based ending index of a `213` occurrence, or `n + 1` if absent. -/
noncomputable def least213End {n : ℕ} (π : Equiv.Perm (Fin n)) : ℕ :=
  (insert (n + 1)
    ((Finset.univ.filter fun c : Fin n =>
      ∃ i j : Fin n, Is213 π i j c).image fun c => c.val + 1)).min'
    (Finset.insert_nonempty _ _)

/-- `T_4`: least 1-based ending index of a `4213` or `2413` occurrence, or `n + 1` if absent. -/
noncomputable def leastFourEnd {n : ℕ} (π : Equiv.Perm (Fin n)) : ℕ :=
  (insert (n + 1)
    ((Finset.univ.filter fun v : Fin n =>
      ∃ p q u : Fin n, IsFourPat π p q u v).image fun v => v.val + 1)).min'
    (Finset.insert_nonempty _ _)

theorem firstDescent_pos {n : ℕ} (π : Equiv.Perm (Fin n)) : 1 ≤ firstDescent π := by
  have hmem := Finset.min'_mem _ (Finset.insert_nonempty (n + 1)
    ((Finset.univ.filter fun j : Fin n =>
      ∃ h : 0 < j.val, π ⟨j.val - 1, by omega⟩ > π j).image fun j => j.val + 1))
  change firstDescent π ∈ _ at hmem
  rcases Finset.mem_insert.1 hmem with h | h
  · omega
  · rcases Finset.mem_image.1 h with ⟨j, _, hj⟩
    omega

theorem firstDescent_le {n : ℕ} (π : Equiv.Perm (Fin n)) : firstDescent π ≤ n + 1 :=
  Finset.min'_le _ _ (Finset.mem_insert_self _ _)

private theorem firstDescent_le_of_descent {n : ℕ} (π : Equiv.Perm (Fin n)) (j : Fin n)
    (hj0 : 0 < j.val) (hdesc : π ⟨j.val - 1, by omega⟩ > π j) :
    firstDescent π ≤ j.val + 1 := by
  apply Finset.min'_le
  refine Finset.mem_insert_of_mem (Finset.mem_image.2 ⟨j, ?_, rfl⟩)
  exact Finset.mem_filter.2 ⟨Finset.mem_univ j, hj0, hdesc⟩

private theorem firstDescent_lt_succ_exists {n : ℕ} (π : Equiv.Perm (Fin n))
    (h : firstDescent π < n + 1) :
    ∃ j : Fin n, 0 < j.val ∧ π ⟨j.val - 1, by omega⟩ > π j ∧ firstDescent π = j.val + 1 := by
  have hmem := Finset.min'_mem _ (Finset.insert_nonempty (n + 1)
    ((Finset.univ.filter fun j : Fin n =>
      ∃ h : 0 < j.val, π ⟨j.val - 1, by omega⟩ > π j).image fun j => j.val + 1))
  change firstDescent π ∈ _ at hmem
  rcases Finset.mem_insert.1 hmem with heq | hmem'
  · omega
  · rcases Finset.mem_image.1 hmem' with ⟨j, hj, heq⟩
    rcases (Finset.mem_filter.1 hj).2 with ⟨hj0, hdesc⟩
    exact ⟨j, hj0, hdesc, heq.symm⟩

private theorem firstDescent_step_lt {n : ℕ} (π : Equiv.Perm (Fin n)) (k : Fin n)
    (hk0 : 0 < k.val) (hk : k.val + 1 < firstDescent π) :
    π ⟨k.val - 1, by omega⟩ < π k := by
  have hne : π ⟨k.val - 1, by omega⟩ ≠ π k := by
    intro heq
    have := π.injective heq
    have := congrArg Fin.val this
    dsimp at this
    omega
  rcases lt_or_gt_of_ne hne with hlt | hgt
  · exact hlt
  · have hle := firstDescent_le_of_descent π k hk0 hgt
    omega

theorem firstDescent_prefix_strictMono {n : ℕ} (π : Equiv.Perm (Fin n)) {i j : Fin n}
    (hij : i < j) (hj : j.val + 1 < firstDescent π) : π i < π j := by
  have key : ∀ m : ℕ, ∀ (a b : Fin n), b.val = a.val + (m + 1) →
      b.val + 1 < firstDescent π → π a < π b := by
    intro m
    induction m with
    | zero =>
      intro a b hab hb
      have hstep := firstDescent_step_lt π b (by omega) hb
      have ha : (⟨b.val - 1, by omega⟩ : Fin n) = a := by
        ext
        dsimp
        omega
      simpa [ha] using hstep
    | succ m ih =>
      intro a b hab hb
      let b' : Fin n := ⟨b.val - 1, by omega⟩
      have h1 : π a < π b' := ih a b' (by simp [b']; omega) (by simp [b']; omega)
      have h2 : π b' < π b := firstDescent_step_lt π b (by omega) hb
      exact lt_trans h1 h2
  have hdiff : j.val = i.val + ((j.val - i.val - 1) + 1) := by
    have : i.val < j.val := hij
    omega
  exact key (j.val - i.val - 1) i j hdiff hj

theorem firstDescent_insertMax_lt {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n + 1))
    (hg : g.val < firstDescent π) :
    firstDescent (insertMax π g) = g.val + 2 := by
  have hle : firstDescent (insertMax π g) ≤ g.val + 2 := by
    by_cases hlast : g.val = n
    · have := firstDescent_le (insertMax π g)
      omega
    · have hgn : g.val < n := by omega
      let j : Fin (n + 1) := ⟨g.val + 1, by omega⟩
      have hjprev : (⟨j.val - 1, by omega⟩ : Fin (n + 1)) = g := by
        ext; simp [j]
      have hjcurr : j = g.succAbove ⟨g.val, hgn⟩ := by
        ext
        rw [succAbove_val_of_le g ⟨g.val, hgn⟩ (le_refl _)]
      have hdesc : insertMax π g ⟨j.val - 1, by omega⟩ > insertMax π g j := by
        rw [hjprev, hjcurr, insertMax_apply_self, insertMax_apply_succAbove]
        exact Fin.castSucc_lt_last _
      simpa [j] using firstDescent_le_of_descent (insertMax π g) j (by simp [j]) hdesc
  have hge : g.val + 2 ≤ firstDescent (insertMax π g) := by
    by_contra hlt
    push Not at hlt
    have hlt' : firstDescent (insertMax π g) < (n + 1) + 1 := by omega
    obtain ⟨j, hj0, hdesc, heq⟩ := firstDescent_lt_succ_exists (insertMax π g) hlt'
    have hjle : j.val ≤ g.val := by omega
    rcases lt_or_eq_of_le hjle with hjlt | hjeq
    · have hprev_eq : (⟨j.val - 1, by omega⟩ : Fin (n + 1)) = g.succAbove ⟨j.val - 1, by omega⟩ := by
        ext
        rw [succAbove_val_of_lt g ⟨j.val - 1, by omega⟩ (by dsimp; omega)]
      have hcurr_eq : j = g.succAbove ⟨j.val, by omega⟩ := by
        ext
        rw [succAbove_val_of_lt g ⟨j.val, by omega⟩ hjlt]
      have hdesc' : insertMax π g (g.succAbove ⟨j.val - 1, by omega⟩) >
          insertMax π g (g.succAbove ⟨j.val, by omega⟩) := by
        rwa [← hprev_eq, ← hcurr_eq]
      rw [gt_iff_lt, insertMax_order_iff] at hdesc'
      have hinc : π ⟨j.val - 1, by omega⟩ < π ⟨j.val, by omega⟩ :=
        firstDescent_prefix_strictMono π (by show j.val - 1 < j.val; omega) (by dsimp; omega)
      exact lt_asymm hdesc' hinc
    · have hjg : j = g := Fin.ext hjeq
      rw [hjg] at hdesc
      exact not_insertMax_self_lt π g _ hdesc
  omega

theorem firstDescent_insertMax_ge {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n + 1))
    (hg : firstDescent π ≤ g.val) :
    firstDescent (insertMax π g) = firstDescent π := by
  have hd_lt : firstDescent π < n + 1 := by omega
  obtain ⟨j₀, hj₀0, hdesc₀, heq₀⟩ := firstDescent_lt_succ_exists π hd_lt
  have hle : firstDescent (insertMax π g) ≤ firstDescent π := by
    let j : Fin (n + 1) := j₀.castSucc
    have hjlt : j₀.val < g.val := by omega
    have hprev_eq : (⟨j.val - 1, by omega⟩ : Fin (n + 1)) = g.succAbove ⟨j₀.val - 1, by omega⟩ := by
      ext
      rw [succAbove_val_of_lt g ⟨j₀.val - 1, by omega⟩ (by dsimp; omega)]
      simp [j]
    have hcurr_eq : j = g.succAbove j₀ := by
      ext
      rw [succAbove_val_of_lt g j₀ hjlt]
      simp [j]
    have hdesc : insertMax π g ⟨j.val - 1, by omega⟩ > insertMax π g j := by
      rw [hprev_eq, hcurr_eq, gt_iff_lt, insertMax_order_iff]
      exact hdesc₀
    have := firstDescent_le_of_descent (insertMax π g) j (by simpa [j] using hj₀0) hdesc
    simpa [j, heq₀] using this
  have hge : firstDescent π ≤ firstDescent (insertMax π g) := by
    by_contra hlt
    push Not at hlt
    have hlt' : firstDescent (insertMax π g) < (n + 1) + 1 := by omega
    obtain ⟨j, hj0, hdesc, heq⟩ := firstDescent_lt_succ_exists (insertMax π g) hlt'
    have hjlt : j.val < g.val := by omega
    have hprev_eq : (⟨j.val - 1, by omega⟩ : Fin (n + 1)) = g.succAbove ⟨j.val - 1, by omega⟩ := by
      ext
      rw [succAbove_val_of_lt g ⟨j.val - 1, by omega⟩ (by dsimp; omega)]
    have hcurr_eq : j = g.succAbove ⟨j.val, by omega⟩ := by
      ext
      rw [succAbove_val_of_lt g ⟨j.val, by omega⟩ hjlt]
    have hdesc' : insertMax π g (g.succAbove ⟨j.val - 1, by omega⟩) >
        insertMax π g (g.succAbove ⟨j.val, by omega⟩) := by
      rwa [← hprev_eq, ← hcurr_eq]
    rw [gt_iff_lt, insertMax_order_iff] at hdesc'
    have := firstDescent_le_of_descent π ⟨j.val, by omega⟩ hj0 hdesc'
    dsimp at this
    omega
  omega

/-! ## Abstract Generating Tree and Generic Level-Counting Theorem -/

/-- Labels of the common maximum-insertion generating tree. -/
inductive TreeLabel where
  | A (a m : ℕ)
  | B (a m : ℕ)
  deriving DecidableEq

/-- Children list of each generating-tree label, matching `PROOF.md` lines 23–26. -/
def children : TreeLabel → List TreeLabel
  | .A a m =>
      (List.range' 1 (a + 1)).map (fun h => .A h (m + 1)) ++
      (List.range' (a + 1) (m - a)).map (fun m' => .B a m')
  | .B a m =>
      (List.range' 1 (a + 1)).map (fun h => .A h (a + 1)) ++
      (List.range' (a + 1) (m - a)).map (fun m' => .B a m')

/-- Number of descendants of a generating-tree label `s` at depth `k`. -/
def treeCount : TreeLabel → ℕ → ℕ
  | _, 0 => 1
  | s, k + 1 => ((children s).map fun c => treeCount c k).sum

/-- Generic tree-isomorphism counting theorem: if a hereditary permutation class `C` admits
a labeling with root `A 0 0` whose legal maximum-insertion children match `children`, then
the number of length-`n` permutations in `C` equals `treeCount (.A 0 0) n`. -/
theorem card_eq_treeCount_of_treeIso
    (C : ∀ {n : ℕ}, Equiv.Perm (Fin n) → Prop)
    (h_empty : C (1 : Equiv.Perm (Fin 0)))
    (h_hered : ∀ {n : ℕ} (σ : Equiv.Perm (Fin (n + 1))), C σ → C (deleteMax σ))
    (lab : ∀ {n : ℕ}, Equiv.Perm (Fin n) → TreeLabel)
    (h_root : lab (1 : Equiv.Perm (Fin 0)) = TreeLabel.A 0 0)
    (h_step : ∀ {n : ℕ} (π : Equiv.Perm (Fin n)), C π →
      (Finset.univ.filter fun g : Fin (n + 1) => C (insertMax π g)).val.map
        (fun g => lab (insertMax π g)) = (children (lab π) : Multiset TreeLabel)) :
    ∀ n : ℕ, Nat.card {π : Equiv.Perm (Fin n) // C π} = treeCount (TreeLabel.A 0 0) n := by
  have key : ∀ k : ℕ, ∀ n : ℕ,
      (∑ π : {π : Equiv.Perm (Fin n) // C π}, treeCount (lab π.1) k) =
      Nat.card {σ : Equiv.Perm (Fin (n + k)) // C σ} := by
    intro k
    induction k with
    | zero =>
      intro n
      simp [treeCount, Nat.card_eq_fintype_card]
    | succ k ih =>
      intro n
      let eStep : (Σ π : {π : Equiv.Perm (Fin n) // C π},
          {g : Fin (n + 1) // C (insertMax π.1 g)}) ≃
          {σ : Equiv.Perm (Fin (n + 1)) // C σ} :=
        { toFun := fun ⟨π, g⟩ => ⟨insertMax π.1 g.1, g.2⟩
          invFun := fun σ =>
            ⟨⟨deleteMax σ.1, h_hered σ.1 σ.2⟩,
             ⟨maxGap σ.1, by simpa [insertMax_deleteMax] using σ.2⟩⟩
          left_inv := by
            have h_heq : ∀ {a b : Equiv.Perm (Fin n)}
                {x : {g : Fin (n + 1) // C (insertMax a g)}}
                {y : {g : Fin (n + 1) // C (insertMax b g)}},
                a = b → x.1 = y.1 → HEq x y := by
              rintro a _ ⟨gx, _⟩ ⟨gy, _⟩ rfl hxy
              cases hxy
              rfl
            rintro ⟨⟨π, hπ⟩, ⟨g, hg⟩⟩
            exact Sigma.ext (Subtype.ext (deleteMax_insertMax π g))
              (h_heq (deleteMax_insertMax π g) (maxGap_insertMax π g))
          right_inv := by
            rintro ⟨σ, hσ⟩
            exact Subtype.ext (insertMax_deleteMax σ) }
      have hstep_sum :
          (∑ π : {π : Equiv.Perm (Fin n) // C π}, treeCount (lab π.1) (k + 1)) =
          ∑ σ : {σ : Equiv.Perm (Fin (n + 1)) // C σ}, treeCount (lab σ.1) k := by
        calc
          (∑ π : {π : Equiv.Perm (Fin n) // C π}, treeCount (lab π.1) (k + 1))
              = ∑ π : {π : Equiv.Perm (Fin n) // C π},
                  ((Finset.univ.filter fun g : Fin (n + 1) => C (insertMax π.1 g)).val.map
                    (fun g => treeCount (lab (insertMax π.1 g)) k)).sum := by
                refine Finset.sum_congr rfl fun π _ => ?_
                have h1 : treeCount (lab π.1) (k + 1) =
                    ((children (lab π.1) : Multiset TreeLabel).map
                      (fun c => treeCount c k)).sum := by
                  simp [treeCount]
                rw [h1, ← h_step π.1 π.2, Multiset.map_map]
                rfl
          _ = ∑ π : {π : Equiv.Perm (Fin n) // C π},
                ∑ g : {g : Fin (n + 1) // C (insertMax π.1 g)},
                  treeCount (lab (insertMax π.1 g.1)) k := by
                refine Finset.sum_congr rfl fun π _ => ?_
                change ∑ g ∈ Finset.univ.filter (fun g : Fin (n + 1) => C (insertMax π.1 g)),
                    treeCount (lab (insertMax π.1 g)) k = _
                exact Finset.sum_subtype (Finset.univ.filter fun g : Fin (n + 1) =>
                    C (insertMax π.1 g)) (p := fun g => C (insertMax π.1 g)) (by simp)
                    (fun g => treeCount (lab (insertMax π.1 g)) k)
          _ = ∑ p : (Σ π : {π : Equiv.Perm (Fin n) // C π},
                {g : Fin (n + 1) // C (insertMax π.1 g)}),
                  treeCount (lab (eStep p).1) k := by
                rw [Fintype.sum_sigma]
                rfl
          _ = ∑ σ : {σ : Equiv.Perm (Fin (n + 1)) // C σ}, treeCount (lab σ.1) k := by
                exact Fintype.sum_equiv eStep _ _ (fun _ => rfl)
      rw [hstep_sum, ih (n + 1)]
      rw [show (n + 1) + k = n + (k + 1) by omega]
  intro n
  have h0 := key n 0
  rw [Nat.zero_add] at h0
  rw [← h0]
  have : Unique {π : Equiv.Perm (Fin 0) // C π} :=
    { default := ⟨1, h_empty⟩
      uniq := fun ⟨π, _⟩ => Subtype.ext (Subsingleton.elim π 1) }
  rw [Fintype.sum_unique]
  rw [show (default : {π : Equiv.Perm (Fin 0) // C π}).1 = 1 from Subsingleton.elim _ 1, h_root]

end Conjectures.BursteinA218225
