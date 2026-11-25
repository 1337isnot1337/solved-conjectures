module

public import Conjectures.McNamaraSteingrimssonBlockEmbeddings
public import Conjectures.McNamaraSteingrimssonNormalize

@[expose] public section
namespace McNamaraSteingrimsson

private theorem lex_code_forward {B i j a b : ℕ} (ha : a<B) (h : i<j) :
    B*i+a<B*j+b := by
  calc
    B*i+a < B*i+B := Nat.add_lt_add_left ha _
    _ = B*(i+1) := (Nat.mul_succ ..).symm
    _ ≤ B*j := Nat.mul_le_mul_left B (Nat.succ_le_of_lt h)
    _ ≤ B*j+b := Nat.le_add_right ..

theorem lex_code_lt_iff {B i j a b : ℕ} (ha : a<B) (hb : b<B) :
    B*i+a < B*j+b ↔ i<j ∨ i=j ∧ a<b := by
  rcases lt_trichotomy i j with h|rfl|h
  · exact iff_of_true (lex_code_forward ha h) (Or.inl h)
  · simp only [lt_irrefl,false_or,true_and,Nat.add_lt_add_iff_left]
  · exact iff_of_false (not_lt_of_ge (lex_code_forward hb h).le)
      (fun H => H.elim (lt_asymm h) (fun e => h.ne e.1.symm))

def blockPositionCode {n : ℕ} {lengths : Fin n→ℕ} (B : ℕ)
    (p : BlockPosition lengths) : ℕ :=
  B*p.fst.val+p.snd.val

def blockValueCode {n : ℕ} {lengths : Fin n→ℕ} (B : ℕ) (f : BlockOrder lengths)
    (p : BlockPosition lengths) : ℕ :=
  B*p.fst.val+(f p.fst p.snd).val

theorem blockPositionCode_lt {n B : ℕ} {lengths : Fin n→ℕ} (hB : ∀ i,lengths i≤B)
    (p q : BlockPosition lengths) :
    blockPositionCode B p < blockPositionCode B q ↔ blockPositionLT p q := by
  unfold blockPositionCode blockPositionLT
  simpa only [Fin.lt_def,Fin.ext_iff] using
    lex_code_lt_iff (p.snd.isLt.trans_le (hB p.fst)) (q.snd.isLt.trans_le (hB q.fst))

theorem blockValueCode_lt {n B : ℕ} {lengths : Fin n→ℕ} (hB : ∀ i,lengths i≤B)
    (f : BlockOrder lengths) (p q : BlockPosition lengths) :
    blockValueCode B f p < blockValueCode B f q ↔ blockValueLT f p q := by
  unfold blockValueCode blockValueLT
  simpa only [Fin.lt_def,Fin.ext_iff] using
    lex_code_lt_iff ((f p.fst p.snd).isLt.trans_le (hB p.fst))
      ((f q.fst q.snd).isLt.trans_le (hB q.fst))

theorem blockPositionCode_inj {n B : ℕ} {lengths : Fin n→ℕ} (hB : ∀ i,lengths i≤B) :
    Function.Injective (blockPositionCode (lengths := lengths) B) := by
  intro p q h
  have hpos : ¬blockPositionLT p q := fun hp => h.not_lt ((blockPositionCode_lt hB _ _).mpr hp)
  have hneg : ¬blockPositionLT q p := fun hq => h.symm.not_lt ((blockPositionCode_lt hB _ _).mpr hq)
  have he : p.fst=q.fst := le_antisymm (le_of_not_gt (fun h => hneg (Or.inl h)))
    (le_of_not_gt (fun h => hpos (Or.inl h)))
  apply blockPosition_ext he
  exact le_antisymm (le_of_not_gt (fun h => hneg (Or.inr ⟨he.symm,h⟩)))
      (le_of_not_gt (fun h => hpos (Or.inr ⟨he,h⟩)))

theorem blockValueCode_inj {n B : ℕ} {lengths : Fin n→ℕ} (hB : ∀ i,lengths i≤B)
    (f : BlockOrder lengths) : Function.Injective (blockValueCode B f) := by
  intro p q h
  have hpos : ¬blockValueLT f p q := fun hp => h.not_lt ((blockValueCode_lt hB f _ _).mpr hp)
  have hneg : ¬blockValueLT f q p := fun hq => h.symm.not_lt ((blockValueCode_lt hB f _ _).mpr hq)
  have he : p.fst=q.fst := le_antisymm (le_of_not_gt (fun h => hneg (Or.inl h)))
    (le_of_not_gt (fun h => hpos (Or.inl h)))
  have hv : (f p.fst p.snd).val=(f q.fst q.snd).val :=
    le_antisymm (le_of_not_gt (fun h => hneg (Or.inr ⟨he.symm,h⟩)))
      (le_of_not_gt (fun h => hpos (Or.inr ⟨he,h⟩)))
  rcases p with ⟨i,p⟩
  rcases q with ⟨j,q⟩
  change i=j at he
  subst j
  exact congrArg (Sigma.mk i) ((f i).injective (Fin.ext hv))

/-- The literal standard permutation for the ordered direct sum. -/
noncomputable def blockPermutation {n B : ℕ} {lengths : Fin n→ℕ} (hB : ∀ i,lengths i≤B)
    (f : BlockOrder lengths) : Equiv.Perm (Fin (Fintype.card (BlockPosition lengths))) :=
  (codeRank (blockPositionCode B) (blockPositionCode_inj hB)).symm.trans
    (codeRank (blockValueCode B f) (blockValueCode_inj hB f))

theorem card_blockPosition {n : ℕ} (lengths : Fin n→ℕ) :
    Fintype.card (BlockPosition lengths)=∑ i,lengths i := by
  rw [Fintype.card_sigma]
  simp

/-- Standardization preserves classical containment exactly; the block
embedding is constructed from, and recovers, a literal position injection. -/
theorem blockPermutation_pattern_iff {s t B C : ℕ} {lengths : Fin s→ℕ} {widths : Fin t→ℕ}
    (hB : ∀ i,lengths i≤B) (hC : ∀ i,widths i≤C)
    (p : BlockOrder lengths) (q : BlockOrder widths) :
    ClassicalPattern (blockPermutation hB p) (blockPermutation hC q) ↔
      Nonempty (BlockEmbedding p q) := by
  let ps := codeRank (blockPositionCode B) (blockPositionCode_inj hB)
  let pt := codeRank (blockPositionCode C) (blockPositionCode_inj hC)
  let vs := codeRank (blockValueCode B p) (blockValueCode_inj hB p)
  let vt := codeRank (blockValueCode C q) (blockValueCode_inj hC q)
  have hps (i j : BlockPosition lengths) : ps i < ps j ↔ blockPositionLT i j :=
    (codeRank_lt_iff _ _ _ _).trans (blockPositionCode_lt hB _ _)
  have hpt (i j : BlockPosition widths) : pt i < pt j ↔ blockPositionLT i j :=
    (codeRank_lt_iff _ _ _ _).trans (blockPositionCode_lt hC _ _)
  have hvs (i j : BlockPosition lengths) : vs i < vs j ↔ blockValueLT p i j :=
    (codeRank_lt_iff _ _ _ _).trans (blockValueCode_lt hB p _ _)
  have hvt (i j : BlockPosition widths) : vt i < vt j ↔ blockValueLT q i j :=
    (codeRank_lt_iff _ _ _ _).trans (blockValueCode_lt hC q _ _)
  constructor
  · rintro ⟨g,hg,horder⟩
    let f : BlockPosition lengths → BlockPosition widths := fun i => pt.symm (g (ps i))
    refine ⟨⟨f,pt.symm.injective.comp (hg.injective.comp ps.injective),?_,?_⟩⟩
    · intro i j
      rw [← hps,← hpt]
      simpa [f] using (hg.lt_iff_lt (a := ps i) (b := ps j)).symm
    · intro i j
      have he := horder (ps i) (ps j)
      change vs (ps.symm (ps i)) < vs (ps.symm (ps j)) ↔ vt (f i) < vt (f j) at he
      simp only [Equiv.symm_apply_apply] at he
      exact (hvs _ _).symm.trans (he.trans (hvt _ _))
  · rintro ⟨e⟩
    let g := fun i => pt (e.map (ps.symm i))
    refine ⟨g,?_,?_⟩
    · intro i j hij
      have h := (hps (ps.symm i) (ps.symm j)).mp (by simpa using hij)
      exact (hpt _ _).mpr ((e.position_iff _ _).mp h)
    · intro i j
      change vs (ps.symm i) < vs (ps.symm j) ↔ vt (pt.symm (g i)) < vt (pt.symm (g j))
      simp only [g,Equiv.symm_apply_apply]
      exact (hvs _ _).trans ((e.value_iff _ _).trans (hvt _ _).symm)

end McNamaraSteingrimsson
