import Conjectures.ChernFuLinThreeStatisticCutMass

/-! # Summing the excess cuts by telescoping

Subtract the ordinary weight of each word from its cut mass. Excess can only
propagate along inverse-descent edges. Outside A it is zero. Multiplication
by `u^degree` sums all inverse-only continuations, and the difference to the
next level is the contribution of the newly marked edges.
-/

namespace Conjectures.ChernFuLinThreeStatistic.Growth

open BursteinA218225 Expansion Kernel PowerSeries Finset
noncomputable section
open Classical
local notation "S" => PowerSeries WeightField

def excess {n : ℕ} (π : Equiv.Perm (Fin (n+1))) := countMass π-wt π

private theorem excess_after {n : ℕ} (π : Equiv.Perm (Fin (n+1))) (hx : InX π) (g : Fin (n+2))
    (hl : LegalGapX π g) (hh : (maxGap π).val<g.val) : excess (insertMax π g)=0 := by
  have hni : ¬ g<g.succAbove (maxGap π) := by rw [Fin.lt_succAbove_iff_le_castSucc]; exact hh.not_ge
  simp [excess,countMass_insert π hx,noninverse_edge_eligible hx hl hh,hh.not_ge,wt,ides_insertMax,hni]

private theorem excess_inverse {n : ℕ} (π : Equiv.Perm (Fin (n+1))) (hx : InX π) (g : Fin (n+2))
    (hi : g.val≤(maxGap π).val) : excess (insertMax π g)=excess π*(T*Z) +
      if g.val<least213Mid π then wt π*Z else 0 := by
  unfold excess; rw [countMass_insert π hx,ite_eq_left hi,wt_inverse π g hi,rma_inverse_edge π hi]
  split_ifs <;> simp [wt,pow_add] <;> ring

theorem excess_B {n : ℕ} (π : Equiv.Perm (Fin (n+1))) (hx : InX π) (hB : least213Mid π ≠ kX π) : excess π=0 := by
  induction n with
  | zero => have he := state_one π; simp [state,hB] at he
  | succ n ih =>
    let σ := deleteMax π; let g := maxGap π
    have he : insertMax σ g=π := insertMax_deleteMax π
    have hs : InX σ := inX_deleteMax hx
    have hl : LegalGapX σ g := by change InX (insertMax σ g); rwa [he]
    rw [← he]; by_cases hi : g.val≤(maxGap σ).val
    · have hne : ¬ g.val<least213Mid σ := by
        intro h; obtain ⟨_,hb,_⟩ := eligible_inverse_child hs h hi; rw [he] at hb; exact hB hb
      have hσ : least213Mid σ ≠ kX σ := fun e => hne (e ▸ (legalGapX_iff_lt_kX hs g).mp hl)
      simp [excess_inverse σ hs g hi,hne,ih σ hs hσ]
    · exact excess_after σ hs g hl (by omega)

theorem excess_one (π : Equiv.Perm (Fin 1)) : excess π=0 := by
  let A := deleteMax π; let g := maxGap π
  have he : insertMax A g=π := insertMax_deleteMax π
  have hA : InX A := (Subsingleton.elim (1 : Equiv.Perm (Fin 0)) A) ▸ inX_empty
  have hf : TailOK false 0 1 π := by rw [←he,first_cut]; refine ⟨hA,?_⟩; have := invariantsX_bounds A; have := g.isLt; omega
  have hR : rma π=1 := by simp [rma]
  have hi : ides π=0 := by simp [ides]
  have hw : tailWeight 0 1 π=wt π := by simp [tailWeight,wt,hi,internal]
  unfold excess countMass
  let p : Split 0 := ⟨(0,0),by simp⟩
  rw [sum_eq_single p]; rotate_left
  · intro q _ hn; have hh := mem_antidiagonal.mp q.property; exact (hn (Subtype.ext (Prod.ext (by change _=0; omega) (by change _=0; omega)))).elim
  · exact fun h => (h (mem_univ _)).elim
  change (if TailOK false 0 1 π then tailWeight 0 1 π else 0)-wt π=0
  rw [ite_eq_left hf,hw,sub_self]

private theorem geo {u k : S} (hu : u*(1-k)=1) (a : ℕ) : k*(∑ i ∈ range a, u^(i+1))=u^a-1 := by
  induction a with
  | zero => simp
  | succ a ih => rw [sum_range_succ,mul_add,ih,pow_succ]; linear_combination -(u^a)*hu

theorem excess_step {n : ℕ} {u : S} (hu : u*(1-X*C T*C Z)=1)
    (π : Equiv.Perm (Fin (n+1))) (hx : InX π) :
    X * (∑ g : Fin (n+2), if LegalGapX π g then C (excess (insertMax π g))*u^momentDegree (insertMax π g) else 0) =
      C (excess π)*(u^momentDegree π-1) + C (wt π)*C T⁻¹*(u^momentDegree π-1) := by
  let d := firstDescent π; let a := d-1; let k := X*C T*C Z
  let k0 := kX π; let f (g : Fin (n+2)) := C (excess (insertMax π g))*u^momentDegree (insertMax π g)
  have hb := invariantsX_bounds π
  have hd : d=a+1 := by dsimp [a,d]; omega
  have eqZ : C T⁻¹*k = X*C Z := by
    calc
      _ = X*C Z*(C (T⁻¹)*C T) := by dsimp [k]; ring
      _ = _ := by rw [←map_mul,inv_mul_cancel₀ T_ne,map_one,mul_one]
  have eligible (g : Fin (n+2)) (he : g.val<least213Mid π) (hi : g.val≤(maxGap π).val) :
      f g = (C (excess π)*C (T*Z)+C (wt π*Z))*u^(g.val+1) := by
    obtain ⟨_,hm,hd'⟩ := eligible_inverse_child hx he hi
    simp [f,momentDegree,state,hm,hd',excess_inverse π hx g hi,he,show g.val+2-1=g.val+1 by omega]
  let e := momentDegree π
  have cnt (g : Fin (n+2)) : (if LegalGapX π g then f g else 0) =
      if g.val<e then (C (excess π)*C (T*Z)+C (wt π*Z))*u^(g.val+1) else 0 := by
    rcases max_location hx with ⟨hA,hm⟩|⟨hB,hm,hm'⟩
    · have heq : e=a := by simp [e,momentDegree,state,hA,a,d]
      by_cases hg : g.val<e
      · have hi : g.val≤(maxGap π).val := by dsimp [a,d] at heq; omega
        have he : g.val<least213Mid π := by dsimp [a,d] at heq; omega
        rw [ite_eq_left ((legalGapX_iff_lt_kX hx g).mpr (by omega)),ite_eq_left hg,eligible g he hi]
      · rw [ite_eq_right hg]; split_ifs with hl; · simp [f,excess_after π hx g hl (by dsimp [a,d] at heq; omega)]
        rfl
    · have hn : least213Mid π ≠ kX π := by omega
      have heq : e=d := by simp [e,momentDegree,state,hn,←hd,a,d]
      have hz := excess_B π hx hn
      by_cases hg : g.val<e
      · have hi : g.val≤(maxGap π).val := by dsimp [d] at heq; omega
        have he : g.val<least213Mid π := by dsimp [d] at heq; omega
        rw [ite_eq_left ((legalGapX_iff_lt_kX hx g).mpr (by omega)),ite_eq_left hg,eligible g he hi]
      · rw [ite_eq_right hg]; split_ifs with hl
        · have hgk := (legalGapX_iff_lt_kX hx g).mp hl
          simp [f,excess_inverse π hx g (by omega),show ¬g.val<least213Mid π by dsimp [d] at heq; omega,hz]
        · rfl
  have heN : e≤n+2 := by unfold e momentDegree state; split_ifs <;> simp <;> omega
  let c : S := C (excess π)*C (T*Z)+C (wt π*Z)
  change X*(∑ g, if LegalGapX π g then f g else 0)=_
  simp_rw [cnt]; rw [Fin.sum_univ_eq_sum_range (fun i : ℕ => if i<e then c*u^(i+1) else 0),← sum_filter]
  have filt : (range (n+2)).filter (·<e)=range e := by ext i; simp; omega
  rw [filt,← mul_sum]; change X*(c*_) = C (excess π)*(u^e-1)+C (wt π)*C T⁻¹*(u^e-1)
  rw [← geo (k:=k) hu e]; dsimp [c]; simp only [map_mul]; dsimp [k] at eqZ ⊢
  linear_combination -(C (wt π))*(∑ i ∈ range e, u^(i+1))*eqZ

end
end Conjectures.ChernFuLinThreeStatistic.Growth
