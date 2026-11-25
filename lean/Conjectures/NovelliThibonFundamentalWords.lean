module
public import Conjectures.NovelliThibonStandardization

@[expose] public section
namespace NovelliThibon

variable {n : ℕ} {α : Type*} [LinearOrder α]

private theorem increasing_on_constant_intervals {f : Fin (n+1) → α}
    {g : Fin (n+1) → Fin (n+1)} (hf : Monotone f)
    (hstep : ∀ i : Fin n, f i.castSucc = f i.succ → g i.castSucc < g i.succ) :
    ∀ i j : Fin (n+1), i < j → f i = f j → g i < g j := by
  have h (m : ℕ) : ∀ (j i : Fin (n+1)), j.val=m → i<j → f i=f j → g i<g j := by
    induction m using Nat.strong_induction_on with
    | h m ih =>
      intro j i hj hij heq
      have hlt := Fin.lt_def.mp hij
      let s : Fin n := ⟨j.val-1,by have hh := j.isLt; omega⟩
      have hsj : s.succ = j := Fin.ext (by dsimp [s]; omega)
      have hs : s.castSucc < j := by rw [← hsj]; exact Fin.castSucc_lt_succ
      have hi : i≤s.castSucc := Fin.le_def.mpr (by dsimp [s]; omega)
      have hfs : f i = f s.castSucc := le_antisymm (hf hi) ((hf hs.le).trans_eq heq.symm)
      have hs' : f s.castSucc = f s.succ := hfs.symm.trans (heq.trans (congrArg f hsj).symm)
      have hgs : g s.castSucc < g j := hsj ▸ hstep s hs'
      by_cases hEq : i = s.castSucc
      · exact hEq ▸ hgs
      · have hil : i<s.castSucc := lt_of_le_of_ne hi hEq
        have hsub : s.castSucc.val < m := by dsimp [s]; omega
        exact (ih _ hsub s.castSucc i rfl hil hfs).trans hgs
  exact fun i j hij heq => h j.val j i rfl hij heq

/-- Gessel's finite fundamental word condition: weak increase in
label order, and strict increase at every inverse descent. -/
def AdjacentFundamentalWord (σ : Equiv.Perm (Fin (n+1))) (w : Fin (n+1) → α) : Prop :=
  Monotone (w ∘ σ.symm) ∧
  ∀ i : Fin n, σ.symm i.succ < σ.symm i.castSucc → w (σ.symm i.castSucc) < w (σ.symm i.succ)

theorem adjacentFundamentalWord_iff_standardize (σ : Equiv.Perm (Fin (n+1))) (w : Fin (n+1) → α) :
    AdjacentFundamentalWord σ w ↔ standardizeWord w = σ := by
  rw [← fundamentalWord_iff_standardize]
  constructor
  · rintro ⟨hm,hs⟩
    refine ⟨hm,fun i j hij hj => lt_of_le_of_ne (hm hij.le) ?_⟩
    intro heq
    have ht : ∀ s : Fin n, (w ∘ σ.symm) s.castSucc = (w ∘ σ.symm) s.succ →
        σ.symm s.castSucc < σ.symm s.succ := by
      intro s he
      apply lt_of_le_of_ne
      · exact le_of_not_gt (fun h => (hs s h).ne he)
      · exact fun h => (Fin.castSucc_lt_succ (i:=s)).ne (σ.symm.injective h)
    exact (increasing_on_constant_intervals hm ht i j hij heq).asymm hj
  · rintro ⟨hm,hs⟩
    exact ⟨hm,fun i hi => hs i.castSucc i.succ Fin.castSucc_lt_succ hi⟩

end NovelliThibon
