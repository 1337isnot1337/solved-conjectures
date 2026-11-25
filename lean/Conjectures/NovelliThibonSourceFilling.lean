module
public import Conjectures.NovelliThibonSourceGraphSum

@[expose] public section
namespace NovelliThibon

open Classical

variable {n : ℕ} {A K : Type*} [LinearOrder A] [Fintype A] [Field K]

/-- Normalized weight of a word for the oriented attacking and vertical
edge sets. The (q) exponent is integral. -/
noncomputable def normalizedGraphWordWeight {r : ℕ} {B : Type*} [LinearOrder B]
    (E U : Finset (LabelEdge r)) (q : K) (t : LabelEdge r → K)
    (armValue : LabelEdge r → ℕ) (w : Fin r → B) : K :=
  q^((graphDescents E w:ℤ)-((∑ e ∈ U,if w e.2<w e.1 then armValue e else 0:ℕ):ℤ)) *
    (∏ e ∈ U,if w e.2<w e.1 then t e else 1)

omit [Fintype A] in
theorem graphDescents_standardize {r : ℕ} (E : Finset (LabelEdge r)) (hE : OrientedForward E)
    (w : Fin r → A) : graphDescents E (standardizeWord w) = graphDescents E w := by
  unfold graphDescents
  congr 1
  exact Finset.filter_congr (fun e he => standardizeWord_inversion_iff w (hE e he))

omit [Fintype A] in
theorem normalizedGraphWordWeight_standardize {r : ℕ} (E U : Finset (LabelEdge r))
    (hE : OrientedForward E) (hU : OrientedForward U)
    (q : K) (t : LabelEdge r → K) (armValue : LabelEdge r → ℕ) (w : Fin r → A) :
    normalizedGraphWordWeight E U q t armValue (standardizeWord w) =
      normalizedGraphWordWeight E U q t armValue w := by
  unfold normalizedGraphWordWeight
  rw [graphDescents_standardize E hE]
  have hs :
      (∑ e ∈ U,if standardizeWord w e.2 < standardizeWord w e.1 then armValue e else 0) =
      ∑ e ∈ U,if w e.2 < w e.1 then armValue e else 0 :=
    Finset.sum_congr rfl (fun e he => by simp only [standardizeWord_inversion_iff w (hU e he)])
  have hp :
      (∏ e ∈ U,if standardizeWord w e.2 < standardizeWord w e.1 then t e else 1) =
      ∏ e ∈ U,if w e.2 < w e.1 then t e else 1 :=
    Finset.prod_congr rfl (fun e he => by simp only [standardizeWord_inversion_iff w (hU e he)])
  rw [hs,hp]

/-- The original intermediate graph sum evaluates to the literal
normalized rising-alphabet word sum, for all independent edge parameters. -/
theorem sourceModifiedGraphSum_eq_word_sum (x : A → K)
    (E U : Finset (LabelEdge (n+1))) (hE : OrientedForward E) (hU : OrientedForward U)
    (h : Disjoint E U) (q : K) (hq : q≠0) (hq1 : q≠1)
    (t : LabelEdge (n+1) → K) (armValue : LabelEdge (n+1) → ℕ) :
    sourceModifiedGraphSum x E U q t armValue =
      ∑ w : Fin (n+1) → A, normalizedGraphWordWeight E U q t armValue w * wordWeight x w := by
  rw [sourceModifiedGraphSum_normalized x E U hE hU h q hq hq1 t armValue]
  have hh (σ : Equiv.Perm (Fin (n+1))) (e : LabelEdge (n+1)) :
      (edgeDescent σ e=true) ↔ σ e.2 < σ e.1 := by simp [edgeDescent]
  simp_rw [hh]
  change (∑ σ : Equiv.Perm (Fin (n+1)),
    normalizedGraphWordWeight E U q t armValue σ * fundamentalEvaluation σ x) = _
  simp_rw [fundamentalEvaluation_as_fibre,Finset.mul_sum]
  have hw (σ : Equiv.Perm (Fin (n+1))) :
      (∑ w : Fin (n+1) → A with standardizeWord w=σ,
        normalizedGraphWordWeight E U q t armValue σ * wordWeight x w) =
      ∑ w : Fin (n+1) → A with standardizeWord w=σ,
        normalizedGraphWordWeight E U q t armValue (standardizeWord w) * wordWeight x w := by
    apply Finset.sum_congr rfl
    intro w hw
    rw [(Finset.mem_filter.mp hw).2]
  simp_rw [hw]
  rw [Finset.sum_fiberwise]
  simp_rw [normalizedGraphWordWeight_standardize E U hE hU]

end NovelliThibon
