import Conjectures.ChernFuLinThreeStatisticDefs

/-! # The minimum decomposition: restrictions forced by crossing occurrences

Write a nonempty permutation as `u 1 v`, and take a minimum-value entry `l`
of `u`. The right-hand letters below `π l` are the low block `A`; those above
`π l` form the high block `B`. All indices in the lemmas are literal positions
of the original permutation.
-/

namespace Conjectures.ChernFuLinThreeStatistic

open BursteinA218225

private theorem occurs2134 {n : ℕ} {π : Equiv.Perm (Fin n)} {a b c d : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hba : π b < π a) (hac : π a < π c) (hcd' : π c < π d) :
    ContainsPattern π pat2134 := by
  refine ⟨![a,b,c,d], Fin.strictMono_iff_lt_succ.2 ?_, ?_⟩
  · intro i; fin_cases i <;> assumption
  · intro i j
    fin_cases i <;> fin_cases j <;> simp [pat2134] <;> omega

private theorem occurs3124 {n : ℕ} {π : Equiv.Perm (Fin n)} {a b c d : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hbc' : π b < π c) (hca : π c < π a) (had : π a < π d) :
    ContainsPattern π pat3124 := by
  refine ⟨![a,b,c,d], Fin.strictMono_iff_lt_succ.2 ?_, ?_⟩
  · intro i; fin_cases i <;> assumption
  · intro i j
    fin_cases i <;> fin_cases j <;> simp [pat3124] <;> omega

/-- The two long obstructions differ only in the order of their two tops. -/
private theorem occursFive {n : ℕ} {π : Equiv.Perm (Fin n)} {p q b d c : Fin n}
    (hpb : p < b) (hqb : q < b) (hbd : b < d) (hdc : d < c)
    (hbp : π b < π p) (hpc : π p < π c) (hcq : π c < π q) (hqd : π q < π d) :
    ContainsPattern π pat42153 ∨ ContainsPattern π pat24153 := by
  have hpq : p ≠ q := fun e => (hpc.trans hcq).ne (congrArg π e)
  rcases lt_or_gt_of_ne hpq with h | h
  · right; refine ⟨![p,q,b,d,c], Fin.strictMono_iff_lt_succ.2 ?_, ?_⟩
    · intro i; fin_cases i <;> assumption
    · intro i j; fin_cases i <;> fin_cases j <;> simp [pat24153] <;> omega
  · left; refine ⟨![q,p,b,d,c], Fin.strictMono_iff_lt_succ.2 ?_, ?_⟩
    · intro i; fin_cases i <;> assumption
    · intro i j; fin_cases i <;> fin_cases j <;> simp [pat42153] <;> omega

/-- Reading left/right by increasing value never gives a subsequence `LRLR`.
Here `m` can even be any separating position whose value is below the four. -/
theorem noLRLR {n : ℕ} {π : Equiv.Perm (Fin n)} (h : InX π ∨ InZ π)
    {m p q r s : Fin n} (hpm : p < m) (hqm : q < m) (hmr : m < r) (hms : m < s)
    (hmp : π m < π p) (hpr : π p < π r) (hrq : π r < π q) (hqs : π q < π s) : False := by
  have hrs : r ≠ s := fun e => (hrq.trans hqs).ne (congrArg π e)
  rcases lt_or_gt_of_ne hrs with hrs | hsr
  · rcases h with hx | hz
    · exact hx.1 (occurs2134 hpm hmr hrs hmp hpr (hrq.trans hqs))
    · exact hz.1 (occurs3124 hqm hmr hrs (hmp.trans hpr) hrq hqs)
  · have hf := occursFive hpm hqm hms hsr hmp hpr hrq hqs
    rcases h with hx | hz
    · exact hf.elim hx.2.1 hx.2.2
    · exact hf.elim hz.2.1 hz.2.2

/-- The high right values constitute an interval: any entry whose value lies
strictly between two of them is again on the right. -/
theorem highBlock_convex {n : ℕ} {π : Equiv.Perm (Fin n)} (h : InX π ∨ InZ π)
    {l m r i s : Fin n} (hlm : l < m) (hmr : m < r) (hms : m < s)
    (hml : π m < π l) (hlr : π l < π r) (hri : π r < π i) (his : π i < π s) : m < i := by
  rcases lt_trichotomy i m with him | rfl | hmi
  · exact (noLRLR h hlm him hmr hms hml hlr hri his).elim
  · exact (lt_asymm hml (hlr.trans hri)).elim
  · exact hmi

/-- In `X`, the high right block is decreasing in positional order. -/
theorem highBlock_decreasing {n : ℕ} {π : Equiv.Perm (Fin n)} (hx : InX π)
    {l m i j : Fin n} (hlm : l < m) (hmi : m < i) (hij : i < j)
    (hml : π m < π l) (hli : π l < π i) : π j < π i := by
  apply lt_of_not_ge
  intro hv
  exact hx.1 (occurs2134 hlm hmi hij hml hli (lt_of_le_of_ne hv
    (fun e => hij.ne (π.injective e))))

/-- In `Z`, no low right entry precedes a high right entry. -/
theorem lowBlock_trails {n : ℕ} {π : Equiv.Perm (Fin n)} (hz : InZ π)
    {l m a b : Fin n} (hlm : l < m) (hma : m < a) (hmal : π m < π a)
    (hal : π a < π l) (hlb : π l < π b) : b < a := by
  apply lt_of_not_ge
  intro hab
  exact hz.1 (occurs3124 hlm hma (lt_of_le_of_ne hab
    (fun e => (hal.trans hlb).ne (congrArg π e))) hmal hal hlb)

/-- In `X`, every `213` in `A` has its middle strictly after every `B`.
The fourth position of the obstruction can be on either side of its `213` end. -/
theorem middle_after_high {n : ℕ} {π : Equiv.Perm (Fin n)} (hx : InX π)
    {l m p q c b : Fin n} (hlm : l < m) (hmp : m < p) (hpq : p < q) (hqc : q < c)
    (hqp : π q < π p) (hpc : π p < π c) (hcl : π c < π l) (hlb : π l < π b) : b < q := by
  have hqb : π q < π b := ((hqp.trans hpc).trans hcl).trans hlb
  have hcb : π c < π b := hcl.trans hlb
  by_contra! h
  have hqb' : q < b := lt_of_le_of_ne h (fun e => hqb.ne (congrArg π e))
  rcases lt_or_gt_of_ne (fun e : c = b => hcb.ne (congrArg π e)) with h | h
  · exact hx.1 (occurs2134 hpq hqc h hqp hpc hcb)
  · exact (occursFive hpq ((hlm.trans hmp).trans hpq) hqb' h hqp hpc hcl hlb).elim hx.2.1 hx.2.2

end Conjectures.ChernFuLinThreeStatistic
