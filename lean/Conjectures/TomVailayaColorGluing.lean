import Conjectures.TomVailayaColorTrace

/-! The transfer matrix for a gluing of two directed arc families. -/

open scoped BigOperators

namespace TomVailaya

noncomputable section

variable {C E F R : Type*} [Fintype E] [Fintype F] [CommSemiring R]

private def leftVertex {m : ℕ} (n : ℕ) (i : Fin (m + 2)) : Fin (m + n + 1 + 2) :=
  ⟨i, by have := i.isLt; omega⟩

private def rightVertex (m : ℕ) {n : ℕ} (i : Fin (n + 2)) : Fin (m + n + 1 + 2) :=
  ⟨m + 1 + i, by have := i.isLt; omega⟩

/-- Identifying the last vertex of the left graph with the first vertex of the
right graph retains every arc from the two indexed families. -/
def glueEdges {m n : ℕ} (left : E → Fin (m + 2) × Fin (m + 2))
    (right : F → Fin (n + 2) × Fin (n + 2)) :
    E ⊕ F → Fin (m + n + 1 + 2) × Fin (m + n + 1 + 2) :=
  Sum.elim (fun e => (leftVertex n (left e).1, leftVertex n (left e).2))
    (fun f => (rightVertex m (right f).1, rightVertex m (right f).2))

private theorem leftVertex_last (m n : ℕ) :
    leftVertex n (Fin.last (m + 1)) = rightVertex m (0 : Fin (n + 2)) := by
  apply Fin.ext
  simp [leftVertex, rightVertex]

private theorem leftVertex_zero (m n : ℕ) :
    leftVertex n (0 : Fin (m + 2)) = 0 := Fin.ext rfl

private theorem rightVertex_last (m n : ℕ) :
    rightVertex m (Fin.last (n + 1)) = Fin.last (m + n + 1 + 1) := by
  apply Fin.ext
  change m + 1 + (n + 1) = m + n + 1 + 1
  omega

private def gluedColor {m n : ℕ} (c : Fin (m + 2) → C) (d : Fin (n + 2) → C)
    (i : Fin (m + n + 1 + 2)) : C :=
  if h : i.val ≤ m + 1 then c ⟨i, by omega⟩
  else d ⟨i.val - (m + 1), by have := i.isLt; omega⟩

private theorem gluedColor_left {m n : ℕ} (c : Fin (m + 2) → C) (d : Fin (n + 2) → C)
    (i : Fin (m + 2)) : gluedColor c d (leftVertex n i) = c i := by
  have hi : i.val ≤ m + 1 := by have := i.isLt; omega
  simp [gluedColor, leftVertex, hi]

private theorem gluedColor_right {m n : ℕ} (c : Fin (m + 2) → C) (d : Fin (n + 2) → C)
    (h : c (Fin.last (m + 1)) = d 0) (i : Fin (n + 2)) :
    gluedColor c d (rightVertex m i) = d i := by
  by_cases hi : i = 0
  · rw [hi, ← leftVertex_last, gluedColor_left, h]
  · have hi' : 0 < i.val := by
      by_contra! hz
      exact hi (Fin.ext (Nat.eq_zero_of_le_zero hz))
    have hgt : ¬ m + 1 + i.val ≤ m + 1 := by omega
    simp [gluedColor, rightVertex, hgt]

private theorem gluedColor_restrict {m n : ℕ} (f : Fin (m + n + 1 + 2) → C) :
    gluedColor (f ∘ leftVertex n) (f ∘ rightVertex m) = f := by
  funext i
  unfold gluedColor
  split
  · exact congrArg f (Fin.ext rfl)
  · rename_i h
    apply congrArg f
    apply Fin.ext
    change m + 1 + (i.val - (m + 1)) = i.val
    omega

private abbrev BoundaryColoring (n : ℕ) (a b : C) :=
  { c : Fin (n + 2) → C // c 0 = a ∧ c (Fin.last (n + 1)) = b }

variable [LinearOrder C] [Fintype C]

private theorem colorMatrix_sum_boundary {m : ℕ} (x : C → R) (q : R)
    (edge : E → Fin (m + 2) × Fin (m + 2)) (a b : C) :
    colorMatrix x q edge b a =
      ∑ c : BoundaryColoring m a b, tailWeight x q edge c.val := by
  classical
  unfold colorMatrix
  rw [← Finset.sum_filter]
  exact Finset.sum_subtype _ (fun c => by simp) (tailWeight x q edge)

private def glueBoundaryColorings {m n : ℕ} {a b : C}
    (p : Σ k : C, BoundaryColoring n k b × BoundaryColoring m a k) :
    BoundaryColoring (m + n + 1) a b :=
  ⟨gluedColor p.2.2.val p.2.1.val, by
    constructor
    · rw [← leftVertex_zero m n, gluedColor_left, p.2.2.property.1]
    · rw [← rightVertex_last, gluedColor_right _ _ (p.2.2.property.2.trans p.2.1.property.1.symm),
        p.2.1.property.2]⟩

omit [LinearOrder C] [Fintype C] in
private theorem glueBoundaryColorings_bijective (m n : ℕ) (a b : C) :
    Function.Bijective (glueBoundaryColorings (m := m) (n := n) (a := a) (b := b)) := by
  constructor
  · rintro ⟨p, lp⟩ ⟨q, lq⟩ heq
    have hval := congrArg Subtype.val heq
    have hleft (i : Fin (m + 2)) : lp.2.val i = lq.2.val i := by
      simpa [glueBoundaryColorings, gluedColor_left] using
        congrFun hval (leftVertex n i)
    have hmid : p = q :=
      lp.2.property.2.symm.trans ((hleft _).trans lq.2.property.2)
    subst q
    have hright (i : Fin (n + 2)) : lp.1.val i = lq.1.val i := by
      simpa [glueBoundaryColorings,
        gluedColor_right _ _ (lp.2.property.2.trans lp.1.property.1.symm),
        gluedColor_right _ _ (lq.2.property.2.trans lq.1.property.1.symm)] using
        congrFun hval (rightVertex m i)
    exact congrArg (Sigma.mk p) (Prod.ext (Subtype.ext (funext hright)) (Subtype.ext (funext hleft)))
  · intro c
    let k := c.val (leftVertex n (Fin.last (m + 1)))
    refine ⟨⟨k, ⟨c.val ∘ rightVertex m, ?_⟩, ⟨c.val ∘ leftVertex n, ?_⟩⟩, ?_⟩
    · constructor
      · simp [k, leftVertex_last]
      · simpa [rightVertex_last] using c.property.2
    · constructor
      · simpa [leftVertex_zero] using c.property.1
      · rfl
    · exact Subtype.ext (gluedColor_restrict c.val)


omit [LinearOrder C] [Fintype C] in
private theorem gluedTailProduct {m n : ℕ} (x : C → R)
    (c : Fin (m + 2) → C) (d : Fin (n + 2) → C)
    (h : c (Fin.last (m + 1)) = d 0) :
    (∏ i : Fin (m + n + 1 + 1), x (gluedColor c d i.succ)) =
      (∏ i : Fin (m + 1), x (c i.succ)) * ∏ j : Fin (n + 1), x (d j.succ) := by
  have hsize : m + n + 1 + 1 = (m + 1) + (n + 1) := by omega
  let f (i : Fin (m + n + 1 + 1)) := x (gluedColor c d i.succ)
  change (∏ i, f i) = _
  rw [← Fin.prod_congr' f hsize.symm, Fin.prod_univ_add]
  congr 1
  · apply Finset.prod_congr rfl
    intro i _
    have hi : ((i.castAdd (n + 1)).cast hsize.symm).succ = leftVertex n i.succ :=
      Fin.ext rfl
    dsimp only [f]
    rw [hi, gluedColor_left]
  · apply Finset.prod_congr rfl
    intro j _
    have hj : ((j.natAdd (m + 1)).cast hsize.symm).succ = rightVertex m j.succ := by
      apply Fin.ext
      change m + 1 + j.val + 1 = m + 1 + (j.val + 1)
      omega
    dsimp only [f]
    rw [hj, gluedColor_right _ _ h]

omit [Fintype C] in
private theorem gluedTailWeight {m n : ℕ} (x : C → R) (q : R)
    (left : E → Fin (m + 2) × Fin (m + 2)) (right : F → Fin (n + 2) × Fin (n + 2))
    (c : Fin (m + 2) → C) (d : Fin (n + 2) → C)
    (h : c (Fin.last (m + 1)) = d 0) :
    tailWeight x q (glueEdges left right) (gluedColor c d) =
      tailWeight x q right d * tailWeight x q left c := by
  rw [tailWeight, arcWeight, Fintype.prod_sum_type, gluedTailProduct x c d h]
  simp only [glueEdges, Sum.elim_inl, Sum.elim_inr, gluedColor_left, gluedColor_right _ _ h]
  unfold tailWeight arcWeight
  ac_rfl

/-- Endpoint gluing multiplies the two literal color matrices, with the right
graph's matrix on the left because rows index final colors. -/
theorem colorMatrix_glue {m n : ℕ} (x : C → R) (q : R)
    (left : E → Fin (m + 2) × Fin (m + 2)) (right : F → Fin (n + 2) × Fin (n + 2)) :
    colorMatrix x q (glueEdges left right) =
      colorMatrix x q right * colorMatrix x q left := by
  ext b a
  classical
  let equiv := Equiv.ofBijective _ (glueBoundaryColorings_bijective m n a b)
  calc
    _ = ∑ c : BoundaryColoring (m + n + 1) a b, tailWeight x q (glueEdges left right) c.val :=
      colorMatrix_sum_boundary x q _ a b
    _ = ∑ p : Σ k : C, BoundaryColoring n k b × BoundaryColoring m a k,
        tailWeight x q right p.2.1.val * tailWeight x q left p.2.2.val := by
      symm
      apply Fintype.sum_equiv equiv
      intro p
      exact (gluedTailWeight x q left right p.2.2.val p.2.1.val
        (p.2.2.property.2.trans p.2.1.property.1.symm)).symm
    _ = _ := by
      rw [Matrix.mul_apply, Fintype.sum_sigma]
      apply Finset.sum_congr rfl
      intro k _
      simp only [Fintype.sum_prod_type, colorMatrix_sum_boundary, Finset.sum_mul, Finset.mul_sum]
      exact Finset.sum_comm

end

end TomVailaya
