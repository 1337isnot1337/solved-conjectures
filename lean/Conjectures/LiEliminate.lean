import Mathlib.Tactic
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Combinatorics.SimpleGraph.Finite
import Mathlib.Data.Fin.Basic
import Mathlib.Algebra.BigOperators.Fin

open SimpleGraph
open scoped BigOperators

namespace LiElim

variable {V : Type*} [DecidableEq V]

section Basic

variable {R : Type*} [CommRing R]

/-- The chromatic partition function of the graph induced on `S`, with a
vertex-dependent weight in three colours. -/
def partFunOn (G : SimpleGraph V) [DecidableRel G.Adj] (S : Finset V)
    (w : V → Fin 3 → R) : R :=
  ∑ κ : {v // v ∈ S} → Fin 3,
    if (∀ u v : {v // v ∈ S}, G.Adj u v → κ u ≠ κ v) then
      S.attach.prod (fun v => w v.1 (κ v))
    else 0

/-- Splitting a colouring of `S` into the colour of `ℓ` and a colouring of
`S.erase ℓ`. -/
def colorEquiv (S : Finset V) (ℓ : V) (hℓ : ℓ ∈ S) :
    ({v // v ∈ S} → Fin 3) ≃ (Fin 3 × ({v // v ∈ S.erase ℓ} → Fin 3)) where
  toFun κ := (κ ⟨ℓ, hℓ⟩, fun v => κ ⟨v.1, Finset.mem_of_mem_erase v.2⟩)
  invFun p := fun v => if h : (v : V) = ℓ then p.1 else p.2 ⟨v.1, by
    rw [Finset.mem_erase]
    exact ⟨h, v.2⟩⟩
  left_inv κ := by
    funext v
    by_cases h : (v : V) = ℓ
    · subst h
      simp
    · simp [h]
  right_inv p := by
    rcases p with ⟨i, κ'⟩
    simp only [Prod.mk.injEq]
    constructor
    · simp
    · funext v
      have hv : (v : V) ≠ ℓ := fun hv => (Finset.mem_erase.mp v.2).1 hv
      simp [hv]

lemma colorEquiv_symm_none (S : Finset V) (ℓ : V) (hℓ : ℓ ∈ S)
    (p : Fin 3 × ({v // v ∈ S.erase ℓ} → Fin 3)) :
    (colorEquiv S ℓ hℓ).symm p ⟨ℓ, hℓ⟩ = p.1 := by
  simp [colorEquiv]

lemma colorEquiv_symm_some (S : Finset V) (ℓ : V) (hℓ : ℓ ∈ S)
    (p : Fin 3 × ({v // v ∈ S.erase ℓ} → Fin 3))
    (v : {v // v ∈ S.erase ℓ}) :
    (colorEquiv S ℓ hℓ).symm p ⟨v.1, Finset.mem_of_mem_erase v.2⟩ = p.2 v := by
  have hv : (v : V) ≠ ℓ := fun hv => (Finset.mem_erase.mp v.2).1 hv
  simp [colorEquiv, hv]

/-- Splitting the product over `S` at `p`. -/
theorem prod_split_at (S : Finset V) (p : V) (hp : p ∈ S) (w : V → Fin 3 → R)
    (κ : {v // v ∈ S} → Fin 3) :
    S.attach.prod (fun v => w v.1 (κ v))
      = w p (κ ⟨p, hp⟩) *
        (S.erase p).attach.prod (fun v => w v.1 (κ ⟨v.1, Finset.mem_of_mem_erase v.2⟩)) := by
  classical
  let f : V → R := fun v => if hv : v ∈ S then w v (κ ⟨v, hv⟩) else 0
  have hleft : S.attach.prod (fun v => w v.1 (κ v)) = S.attach.prod (fun v => f v.1) := by
    apply Finset.prod_congr rfl
    intro v _
    simp only [f]
    rw [dite_eq_left v.2]
  rw [hleft]
  rw [← Finset.mul_prod_erase S.attach (fun v => f v.1) (Finset.mem_attach S ⟨p, hp⟩)]
  congr 1
  · simp only [f]
    rw [dite_eq_left hp]
  · rw [Finset.prod_erase_attach]
    rw [show (S.erase p).attach.prod (fun v => w v.1 (κ ⟨v.1, Finset.mem_of_mem_erase v.2⟩))
        = (S.erase p).attach.prod (fun v => f v.1) from by
      apply Finset.prod_congr rfl
      intro v _
      simp only [f]
      rw [dite_eq_left (Finset.mem_of_mem_erase v.2)]]
    rw [← Finset.prod_attach (S.erase p) f]

/-- Splitting the product over `S` at the eliminated leaf `ℓ`, in terms of the
`colorEquiv` coordinates. -/
theorem prod_split (S : Finset V) (ℓ : V) (hℓ : ℓ ∈ S) (w : V → Fin 3 → R)
    (p : Fin 3 × ({v // v ∈ S.erase ℓ} → Fin 3)) :
    S.attach.prod (fun v => w v.1 ((colorEquiv S ℓ hℓ).symm p v))
      = w ℓ p.1 *
        (S.erase ℓ).attach.prod (fun v => w v.1 (p.2 v)) := by
  rw [prod_split_at S ℓ hℓ w ((colorEquiv S ℓ hℓ).symm p)]
  congr 1
  · rw [colorEquiv_symm_none]
  · apply Finset.prod_congr rfl
    intro v _
    rw [colorEquiv_symm_some]

/-- The properness condition splits at the leaf `ℓ`. -/
theorem proper_split (G : SimpleGraph V) [DecidableRel G.Adj]
    (S : Finset V) (ℓ p : V) (hℓ : ℓ ∈ S) (hp : p ∈ S) (hℓp : G.Adj ℓ p)
    (hleaf : ∀ x ∈ S, G.Adj ℓ x → x = p)
    (i : Fin 3) (κ' : {v // v ∈ S.erase ℓ} → Fin 3) :
    (∀ u v : {v // v ∈ S}, G.Adj u v →
        (colorEquiv S ℓ hℓ).symm (i, κ') u ≠ (colorEquiv S ℓ hℓ).symm (i, κ') v)
      ↔ (∀ u v : {v // v ∈ S.erase ℓ}, G.Adj u v → κ' u ≠ κ' v) ∧
        i ≠ κ' ⟨p, by rw [Finset.mem_erase]; exact ⟨Ne.symm hℓp.ne, hp⟩⟩ := by
  classical
  have hpne : (p : V) ≠ ℓ := Ne.symm hℓp.ne
  have hp' : p ∈ S.erase ℓ := by rw [Finset.mem_erase]; exact ⟨hpne, hp⟩
  constructor
  · intro h
    constructor
    · intro u v huv
      have := h ⟨u.1, Finset.mem_of_mem_erase u.2⟩ ⟨v.1, Finset.mem_of_mem_erase v.2⟩ huv
      simpa [colorEquiv_symm_some] using this
    · intro hi
      have hcontra := h ⟨ℓ, hℓ⟩ ⟨p, hp⟩ hℓp
      rw [colorEquiv_symm_none] at hcontra
      rw [colorEquiv_symm_some S ℓ hℓ (i, κ') ⟨p, hp'⟩] at hcontra
      exact hcontra hi
  · rintro ⟨hproper, hne⟩ u v huv
    by_cases hu : (u : V) = ℓ
    · have hvp : (v : V) = p := hleaf v.1 v.2 (hu ▸ huv)
      have hu' : u = ⟨ℓ, hℓ⟩ := Subtype.ext hu
      have hv' : v = ⟨p, hp⟩ := Subtype.ext hvp
      rw [hu', hv', colorEquiv_symm_none]
      rw [colorEquiv_symm_some S ℓ hℓ (i, κ') ⟨p, hp'⟩]
      exact hne
    · by_cases hv : (v : V) = ℓ
      · have hup : (u : V) = p := hleaf u.1 u.2 (hv ▸ huv.symm)
        have hu' : u = ⟨p, hp⟩ := Subtype.ext hup
        have hv' : v = ⟨ℓ, hℓ⟩ := Subtype.ext hv
        rw [hu', hv', colorEquiv_symm_none]
        rw [colorEquiv_symm_some S ℓ hℓ (i, κ') ⟨p, hp'⟩]
        exact Ne.symm hne
      · rw [colorEquiv_symm_some S ℓ hℓ (i, κ') ⟨u.1, by
            rw [Finset.mem_erase]; exact ⟨hu, u.2⟩⟩]
        rw [colorEquiv_symm_some S ℓ hℓ (i, κ') ⟨v.1, by
            rw [Finset.mem_erase]; exact ⟨hv, v.2⟩⟩]
        exact hproper ⟨u.1, by rw [Finset.mem_erase]; exact ⟨hu, u.2⟩⟩
          ⟨v.1, by rw [Finset.mem_erase]; exact ⟨hv, v.2⟩⟩ huv

/-- The elementary sum identity used in the elimination step. -/
lemma sum_ite_zero_else (w : Fin 3 → R) (c : Fin 3) :
    (∑ i : Fin 3, (if i = c then (0 : R) else w i)) = (∑ j : Fin 3, w j) - w c := by
  fin_cases c <;> simp [Fin.sum_univ_three] <;> ring

/-- One leaf elimination step.  The weight of the parent absorbs the sum of the
weights of the removed leaf over colours different from the parent's colour. -/
theorem partFunOn_erase (G : SimpleGraph V) [DecidableRel G.Adj]
    (S : Finset V) (ℓ p : V) (hℓ : ℓ ∈ S) (hp : p ∈ S) (hℓp : G.Adj ℓ p)
    (hleaf : ∀ x ∈ S, G.Adj ℓ x → x = p) (w : V → Fin 3 → R) :
    partFunOn G S w =
      partFunOn G (S.erase ℓ)
        (Function.update w p (fun i => w p i * ((∑ j : Fin 3, w ℓ j) - w ℓ i))) := by
  classical
  have hpne : (p : V) ≠ ℓ := Ne.symm hℓp.ne
  have hp' : p ∈ S.erase ℓ := by rw [Finset.mem_erase]; exact ⟨hpne, hp⟩
  rw [partFunOn, partFunOn]
  have hsum_equiv :
      (∑ κ : {v // v ∈ S} → Fin 3,
        if (∀ u v : {v // v ∈ S}, G.Adj u v → κ u ≠ κ v) then
          S.attach.prod (fun v => w v.1 (κ v)) else 0)
      = ∑ q : Fin 3 × ({v // v ∈ S.erase ℓ} → Fin 3),
        if (∀ u v : {v // v ∈ S}, G.Adj u v →
            (colorEquiv S ℓ hℓ).symm q u ≠ (colorEquiv S ℓ hℓ).symm q v) then
          S.attach.prod (fun v => w v.1 ((colorEquiv S ℓ hℓ).symm q v)) else 0 := by
    exact Fintype.sum_equiv (colorEquiv S ℓ hℓ) _ _ (by intro x; simp)
  rw [hsum_equiv]
  let F : Fin 3 × ({v // v ∈ S.erase ℓ} → Fin 3) → R := fun q =>
    if (∀ u v : {v // v ∈ S}, G.Adj u v →
        (colorEquiv S ℓ hℓ).symm q u ≠ (colorEquiv S ℓ hℓ).symm q v) then
      S.attach.prod (fun v => w v.1 ((colorEquiv S ℓ hℓ).symm q v))
    else 0
  have hsplit : (∑ q, F q) = ∑ κ' : {v // v ∈ S.erase ℓ} → Fin 3, ∑ i : Fin 3, F (i, κ') := by
    rw [Fintype.sum_prod_type, Finset.sum_comm]
  rw [hsplit]
  apply Finset.sum_congr rfl
  intro κ' _
  set c : Fin 3 := κ' ⟨p, hp'⟩
  let P : R := (S.erase ℓ).attach.prod (fun v => w v.1 (κ' v))
  let P' : R := ((S.erase ℓ).erase p).attach.prod
    (fun v => w v.1 (κ' ⟨v.1, Finset.mem_of_mem_erase v.2⟩))
  by_cases hproper : ∀ u v : {v // v ∈ S.erase ℓ}, G.Adj u v → κ' u ≠ κ' v
  · have hstep : ∀ i : Fin 3, F (i, κ') = if i = c then 0 else w ℓ i * P := by
      intro i
      by_cases hi : i = c
      · subst hi
        have hnot : ¬ (∀ u v : {v // v ∈ S}, G.Adj u v →
            (colorEquiv S ℓ hℓ).symm (c, κ') u ≠ (colorEquiv S ℓ hℓ).symm (c, κ') v) :=
          fun h => ((proper_split G S ℓ p hℓ hp hℓp hleaf c κ').mp h).2 rfl
        simp only [F]
        by_cases h : (∀ u v : {v // v ∈ S}, G.Adj u v →
            (colorEquiv S ℓ hℓ).symm (c, κ') u ≠ (colorEquiv S ℓ hℓ).symm (c, κ') v)
        · exact absurd h hnot
        · rw [ite_eq_right h]
          simp
      · have hif : (∀ u v : {v // v ∈ S}, G.Adj u v →
            (colorEquiv S ℓ hℓ).symm (i, κ') u ≠ (colorEquiv S ℓ hℓ).symm (i, κ') v) :=
          (proper_split G S ℓ p hℓ hp hℓp hleaf i κ').mpr ⟨hproper, hi⟩
        simp only [F, ite_eq_left hif, ite_eq_right hi]
        rw [prod_split]
    rw [Finset.sum_congr rfl (fun i _ => hstep i)]
    have hfac : (∑ i : Fin 3, (if i = c then 0 else w ℓ i * P))
        = (∑ i : Fin 3, (if i = c then 0 else w ℓ i)) * P := by
      rw [Finset.sum_mul]
      apply Finset.sum_congr rfl
      intro i _
      by_cases hi : i = c <;> simp [hi]
    rw [hfac, sum_ite_zero_else]
    rw [ite_eq_left hproper]
    have hP : P = w p c * P' := by
      simp only [P, P', c]
      rw [prod_split_at (S.erase ℓ) p hp' w κ']
    have hP' : ((S.erase ℓ).attach.prod (fun v =>
        Function.update w p (fun i => w p i * ((∑ j : Fin 3, w ℓ j) - w ℓ i)) v.1 (κ' v)))
        = (w p c * ((∑ j : Fin 3, w ℓ j) - w ℓ c)) * P' := by
      rw [prod_split_at (S.erase ℓ) p hp' (Function.update w p
        (fun i => w p i * ((∑ j : Fin 3, w ℓ j) - w ℓ i))) κ']
      rw [Function.update_self]
      congr 1
      apply Finset.prod_congr rfl
      intro v hv
      have hvne : (v : V) ≠ p := (Finset.mem_erase.mp v.2).1
      simp only [Function.update, dite_eq_right hvne]
    rw [hP, hP']
    ring
  · have hzero : ∀ i : Fin 3, F (i, κ') = 0 := by
      intro i
      have hnot : ¬ (∀ u v : {v // v ∈ S}, G.Adj u v →
          (colorEquiv S ℓ hℓ).symm (i, κ') u ≠ (colorEquiv S ℓ hℓ).symm (i, κ') v) :=
        fun h => hproper ((proper_split G S ℓ p hℓ hp hℓp hleaf i κ').mp h).1
      simp only [F]
      by_cases h : (∀ u v : {v // v ∈ S}, G.Adj u v →
          (colorEquiv S ℓ hℓ).symm (i, κ') u ≠ (colorEquiv S ℓ hℓ).symm (i, κ') v)
      · exact absurd h hnot
      · rw [ite_eq_right h]
    rw [Finset.sum_congr rfl (fun i _ => hzero i)]
    rw [ite_eq_right hproper]
    simp

end Basic

end LiElim
