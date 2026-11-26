import Conjectures.BursteinA218225Defs

/-!
# Burstein's A218225 Enumeration Conjecture — Section 1: Generating Tree for `X`

Proves that `X = Av(2134, 42153, 24153)` has the generating tree of `PROOF.md` §1,
and therefore `countX n = treeCount (.A 0 0) n` for all `n`.
-/

namespace Conjectures.BursteinA218225

open Classical

/-- A gap `g` of `π` is legal for `X` if inserting the new maximum at `g` stays in `X`. -/
def LegalGapX {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n + 1)) : Prop :=
  InX (insertMax π g)

/-- `k`: minimum of `T_3` and all 1-based 3rd positions `u.val + 1` of `4213`/`2413` occurrences. -/
noncomputable def kX {n : ℕ} (π : Equiv.Perm (Fin n)) : ℕ :=
  (insert (least213End π)
    ((Finset.univ.filter fun u : Fin n =>
      ∃ p q v : Fin n, IsFourPat π p q u v).image fun u => u.val + 1)).min'
    (Finset.insert_nonempty _ _)

/-- Generating-tree label for `π ∈ X`: `A (d - 1) (k - 1)` when `b = k`,
and `B (d - 1) (k - 1)` when `b < k`. -/
noncomputable def labelX {n : ℕ} (π : Equiv.Perm (Fin n)) : TreeLabel :=
  if least213Mid π = kX π then
    TreeLabel.A (firstDescent π - 1) (kX π - 1)
  else
    TreeLabel.B (firstDescent π - 1) (kX π - 1)

/-! ### Private Helpers for `succAbove` and `insertMax` -/

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

private theorem succAbove_lt_iff_lt {n : ℕ} (g : Fin (n + 1)) (x : Fin n) :
    g.succAbove x < g ↔ x.val < g.val := by
  by_cases h : x.val < g.val
  · rw [Fin.lt_def, succAbove_val_of_lt g x h]
  · have hle : g.val ≤ x.val := by omega
    rw [Fin.lt_def, succAbove_val_of_le g x hle]
    omega

private theorem not_insertMax_self_lt {n : ℕ} (π : Equiv.Perm (Fin n)) (g x : Fin (n + 1)) :
    ¬ insertMax π g g < insertMax π g x := by
  rw [insertMax_apply_self]
  exact not_lt.2 (Fin.le_last _)

private theorem insertMax_succAbove_lt_self {n : ℕ} (π : Equiv.Perm (Fin n))
    (g : Fin (n + 1)) (i : Fin n) :
    insertMax π g (g.succAbove i) < insertMax π g g := by
  rw [insertMax_apply_succAbove, insertMax_apply_self]
  exact Fin.castSucc_lt_last (π i)

/-! ### Pattern Characterizations for `2134`, `42153`, `24153` -/

private theorem contains_pat2134_iff {n : ℕ} (π : Equiv.Perm (Fin n)) :
    ContainsPattern π pat2134 ↔
      ∃ i j c d : Fin n, i < j ∧ j < c ∧ c < d ∧ π j < π i ∧ π i < π c ∧ π c < π d := by
  constructor
  · rintro ⟨f, hf, hord⟩
    exact ⟨f 0, f 1, f 2, f 3, hf (by decide), hf (by decide), hf (by decide),
      (hord 1 0).2 (by decide), (hord 0 2).2 (by decide), (hord 2 3).2 (by decide)⟩
  · rintro ⟨i, j, c, d, hij, hjc, hcd, hji, hic, hcdv⟩
    have hij' : i.val < j.val := hij
    have hjc' : j.val < c.val := hjc
    have hcd' : c.val < d.val := hcd
    have hji' : (π j).val < (π i).val := hji
    have hic' : (π i).val < (π c).val := hic
    have hcdv' : (π c).val < (π d).val := hcdv
    refine ⟨![i, j, c, d], ?_, ?_⟩
    · intro a b hab
      rw [Fin.lt_def] at hab ⊢
      fin_cases a <;> fin_cases b <;> simp at hab ⊢ <;> omega
    · intro a b
      rw [Fin.lt_def]
      fin_cases a <;> fin_cases b <;> simp [pat2134] <;> omega

private theorem contains_pat42153_iff {n : ℕ} (π : Equiv.Perm (Fin n)) :
    ContainsPattern π pat42153 ↔
      ∃ p q u w v : Fin n, p < q ∧ q < u ∧ u < w ∧ w < v ∧
        π u < π q ∧ π q < π v ∧ π v < π p ∧ π p < π w := by
  constructor
  · rintro ⟨f, hf, hord⟩
    exact ⟨f 0, f 1, f 2, f 3, f 4,
      hf (by decide), hf (by decide), hf (by decide), hf (by decide),
      (hord 2 1).2 (by decide), (hord 1 4).2 (by decide),
      (hord 4 0).2 (by decide), (hord 0 3).2 (by decide)⟩
  · rintro ⟨p, q, u, w, v, hpq, hqu, huw, hwv, huq, hqv, hvp, hpw⟩
    have hpq' : p.val < q.val := hpq
    have hqu' : q.val < u.val := hqu
    have huw' : u.val < w.val := huw
    have hwv' : w.val < v.val := hwv
    have huq' : (π u).val < (π q).val := huq
    have hqv' : (π q).val < (π v).val := hqv
    have hvp' : (π v).val < (π p).val := hvp
    have hpw' : (π p).val < (π w).val := hpw
    refine ⟨![p, q, u, w, v], ?_, ?_⟩
    · intro a b hab
      rw [Fin.lt_def] at hab ⊢
      fin_cases a <;> fin_cases b <;> simp at hab ⊢ <;> omega
    · intro a b
      rw [Fin.lt_def]
      fin_cases a <;> fin_cases b <;> simp [pat42153] <;> omega

private theorem contains_pat24153_iff {n : ℕ} (π : Equiv.Perm (Fin n)) :
    ContainsPattern π pat24153 ↔
      ∃ p q u w v : Fin n, p < q ∧ q < u ∧ u < w ∧ w < v ∧
        π u < π p ∧ π p < π v ∧ π v < π q ∧ π q < π w := by
  constructor
  · rintro ⟨f, hf, hord⟩
    exact ⟨f 0, f 1, f 2, f 3, f 4,
      hf (by decide), hf (by decide), hf (by decide), hf (by decide),
      (hord 2 0).2 (by decide), (hord 0 4).2 (by decide),
      (hord 4 1).2 (by decide), (hord 1 3).2 (by decide)⟩
  · rintro ⟨p, q, u, w, v, hpq, hqu, huw, hwv, hup, hpv, hvq, hqw⟩
    have hpq' : p.val < q.val := hpq
    have hqu' : q.val < u.val := hqu
    have huw' : u.val < w.val := huw
    have hwv' : w.val < v.val := hwv
    have hup' : (π u).val < (π p).val := hup
    have hpv' : (π p).val < (π v).val := hpv
    have hvq' : (π v).val < (π q).val := hvq
    have hqw' : (π q).val < (π w).val := hqw
    refine ⟨![p, q, u, w, v], ?_, ?_⟩
    · intro a b hab
      rw [Fin.lt_def] at hab ⊢
      fin_cases a <;> fin_cases b <;> simp at hab ⊢ <;> omega
    · intro a b
      rw [Fin.lt_def]
      fin_cases a <;> fin_cases b <;> simp [pat24153] <;> omega

private theorem contains_pat2134_insertMax_iff {n : ℕ} {π : Equiv.Perm (Fin n)}
    (hno : ¬ ContainsPattern π pat2134) (g : Fin (n + 1)) :
    ContainsPattern (insertMax π g) pat2134 ↔
      ∃ i j c : Fin n, Is213 π i j c ∧ c.val < g.val := by
  rw [contains_pat2134_iff]
  constructor
  · rintro ⟨i', j', c', d', hij, hjc, hcd, hji, hic, hcdv⟩
    by_cases hd : d' = g
    · subst d'
      obtain ⟨i, rfl⟩ := Fin.exists_succAbove_eq (ne_of_lt (lt_trans (lt_trans hij hjc) hcd))
      obtain ⟨j, rfl⟩ := Fin.exists_succAbove_eq (ne_of_lt (lt_trans hjc hcd))
      obtain ⟨c, rfl⟩ := Fin.exists_succAbove_eq (ne_of_lt hcd)
      refine ⟨i, j, c, ?_, (succAbove_lt_iff_lt g c).1 hcd⟩
      exact ⟨(Fin.strictMono_succAbove g).lt_iff_lt.1 hij,
        (Fin.strictMono_succAbove g).lt_iff_lt.1 hjc,
        (insertMax_order_iff π g j i).1 hji,
        (insertMax_order_iff π g i c).1 hic⟩
    · have hi : i' ≠ g := fun h => by rw [h] at hic; exact not_insertMax_self_lt π g c' hic
      have hj : j' ≠ g := fun h => by rw [h] at hji; exact not_insertMax_self_lt π g i' hji
      have hc : c' ≠ g := fun h => by rw [h] at hcdv; exact not_insertMax_self_lt π g d' hcdv
      obtain ⟨i, rfl⟩ := Fin.exists_succAbove_eq hi
      obtain ⟨j, rfl⟩ := Fin.exists_succAbove_eq hj
      obtain ⟨c, rfl⟩ := Fin.exists_succAbove_eq hc
      obtain ⟨d, rfl⟩ := Fin.exists_succAbove_eq hd
      exfalso
      apply hno
      rw [contains_pat2134_iff]
      exact ⟨i, j, c, d,
        (Fin.strictMono_succAbove g).lt_iff_lt.1 hij,
        (Fin.strictMono_succAbove g).lt_iff_lt.1 hjc,
        (Fin.strictMono_succAbove g).lt_iff_lt.1 hcd,
        (insertMax_order_iff π g j i).1 hji,
        (insertMax_order_iff π g i c).1 hic,
        (insertMax_order_iff π g c d).1 hcdv⟩
  · rintro ⟨i, j, c, ⟨hij, hjc, hji, hic⟩, hcg⟩
    exact ⟨g.succAbove i, g.succAbove j, g.succAbove c, g,
      Fin.strictMono_succAbove g hij,
      Fin.strictMono_succAbove g hjc,
      (succAbove_lt_iff_lt g c).2 hcg,
      (insertMax_order_iff π g j i).2 hji,
      (insertMax_order_iff π g i c).2 hic,
      insertMax_succAbove_lt_self π g c⟩

private theorem contains_pat42153_insertMax_iff {n : ℕ} {π : Equiv.Perm (Fin n)}
    (hno : ¬ ContainsPattern π pat42153) (g : Fin (n + 1)) :
    ContainsPattern (insertMax π g) pat42153 ↔
      ∃ p q u v : Fin n, Is4213 π p q u v ∧ u.val < g.val ∧ g.val ≤ v.val := by
  rw [contains_pat42153_iff]
  constructor
  · rintro ⟨p', q', u', w', v', hpq, hqu, huw, hwv, huq, hqv, hvp, hpw⟩
    by_cases hw : w' = g
    · subst w'
      obtain ⟨p, rfl⟩ := Fin.exists_succAbove_eq (ne_of_lt (lt_trans (lt_trans hpq hqu) huw))
      obtain ⟨q, rfl⟩ := Fin.exists_succAbove_eq (ne_of_lt (lt_trans hqu huw))
      obtain ⟨u, rfl⟩ := Fin.exists_succAbove_eq (ne_of_lt huw)
      obtain ⟨v, rfl⟩ := Fin.exists_succAbove_eq (ne_of_gt hwv)
      refine ⟨p, q, u, v, ?_, (succAbove_lt_iff_lt g u).1 huw, (lt_succAbove_iff_le g v).1 hwv⟩
      exact ⟨(Fin.strictMono_succAbove g).lt_iff_lt.1 hpq,
        (Fin.strictMono_succAbove g).lt_iff_lt.1 hqu,
        (Fin.strictMono_succAbove g).lt_iff_lt.1 (lt_trans huw hwv),
        (insertMax_order_iff π g u q).1 huq,
        (insertMax_order_iff π g q v).1 hqv,
        (insertMax_order_iff π g v p).1 hvp⟩
    · have hp : p' ≠ g := fun h => by rw [h] at hpw; exact not_insertMax_self_lt π g w' hpw
      have hq : q' ≠ g := fun h => by rw [h] at hqv; exact not_insertMax_self_lt π g v' hqv
      have hu : u' ≠ g := fun h => by rw [h] at huq; exact not_insertMax_self_lt π g q' huq
      have hv : v' ≠ g := fun h => by rw [h] at hvp; exact not_insertMax_self_lt π g p' hvp
      obtain ⟨p, rfl⟩ := Fin.exists_succAbove_eq hp
      obtain ⟨q, rfl⟩ := Fin.exists_succAbove_eq hq
      obtain ⟨u, rfl⟩ := Fin.exists_succAbove_eq hu
      obtain ⟨w, rfl⟩ := Fin.exists_succAbove_eq hw
      obtain ⟨v, rfl⟩ := Fin.exists_succAbove_eq hv
      exfalso
      apply hno
      rw [contains_pat42153_iff]
      exact ⟨p, q, u, w, v,
        (Fin.strictMono_succAbove g).lt_iff_lt.1 hpq,
        (Fin.strictMono_succAbove g).lt_iff_lt.1 hqu,
        (Fin.strictMono_succAbove g).lt_iff_lt.1 huw,
        (Fin.strictMono_succAbove g).lt_iff_lt.1 hwv,
        (insertMax_order_iff π g u q).1 huq,
        (insertMax_order_iff π g q v).1 hqv,
        (insertMax_order_iff π g v p).1 hvp,
        (insertMax_order_iff π g p w).1 hpw⟩
  · rintro ⟨p, q, u, v, ⟨hpq, hqu, _, huq, hqv, hvp⟩, hug, hgv⟩
    exact ⟨g.succAbove p, g.succAbove q, g.succAbove u, g, g.succAbove v,
      Fin.strictMono_succAbove g hpq,
      Fin.strictMono_succAbove g hqu,
      (succAbove_lt_iff_lt g u).2 hug,
      (lt_succAbove_iff_le g v).2 hgv,
      (insertMax_order_iff π g u q).2 huq,
      (insertMax_order_iff π g q v).2 hqv,
      (insertMax_order_iff π g v p).2 hvp,
      insertMax_succAbove_lt_self π g p⟩

private theorem contains_pat24153_insertMax_iff {n : ℕ} {π : Equiv.Perm (Fin n)}
    (hno : ¬ ContainsPattern π pat24153) (g : Fin (n + 1)) :
    ContainsPattern (insertMax π g) pat24153 ↔
      ∃ p q u v : Fin n, Is2413 π p q u v ∧ u.val < g.val ∧ g.val ≤ v.val := by
  rw [contains_pat24153_iff]
  constructor
  · rintro ⟨p', q', u', w', v', hpq, hqu, huw, hwv, hup, hpv, hvq, hqw⟩
    by_cases hw : w' = g
    · subst w'
      obtain ⟨p, rfl⟩ := Fin.exists_succAbove_eq (ne_of_lt (lt_trans (lt_trans hpq hqu) huw))
      obtain ⟨q, rfl⟩ := Fin.exists_succAbove_eq (ne_of_lt (lt_trans hqu huw))
      obtain ⟨u, rfl⟩ := Fin.exists_succAbove_eq (ne_of_lt huw)
      obtain ⟨v, rfl⟩ := Fin.exists_succAbove_eq (ne_of_gt hwv)
      refine ⟨p, q, u, v, ?_, (succAbove_lt_iff_lt g u).1 huw, (lt_succAbove_iff_le g v).1 hwv⟩
      exact ⟨(Fin.strictMono_succAbove g).lt_iff_lt.1 hpq,
        (Fin.strictMono_succAbove g).lt_iff_lt.1 hqu,
        (Fin.strictMono_succAbove g).lt_iff_lt.1 (lt_trans huw hwv),
        (insertMax_order_iff π g u p).1 hup,
        (insertMax_order_iff π g p v).1 hpv,
        (insertMax_order_iff π g v q).1 hvq⟩
    · have hp : p' ≠ g := fun h => by rw [h] at hpv; exact not_insertMax_self_lt π g v' hpv
      have hq : q' ≠ g := fun h => by rw [h] at hqw; exact not_insertMax_self_lt π g w' hqw
      have hu : u' ≠ g := fun h => by rw [h] at hup; exact not_insertMax_self_lt π g p' hup
      have hv : v' ≠ g := fun h => by rw [h] at hvq; exact not_insertMax_self_lt π g q' hvq
      obtain ⟨p, rfl⟩ := Fin.exists_succAbove_eq hp
      obtain ⟨q, rfl⟩ := Fin.exists_succAbove_eq hq
      obtain ⟨u, rfl⟩ := Fin.exists_succAbove_eq hu
      obtain ⟨w, rfl⟩ := Fin.exists_succAbove_eq hw
      obtain ⟨v, rfl⟩ := Fin.exists_succAbove_eq hv
      exfalso
      apply hno
      rw [contains_pat24153_iff]
      exact ⟨p, q, u, w, v,
        (Fin.strictMono_succAbove g).lt_iff_lt.1 hpq,
        (Fin.strictMono_succAbove g).lt_iff_lt.1 hqu,
        (Fin.strictMono_succAbove g).lt_iff_lt.1 huw,
        (Fin.strictMono_succAbove g).lt_iff_lt.1 hwv,
        (insertMax_order_iff π g u p).1 hup,
        (insertMax_order_iff π g p v).1 hpv,
        (insertMax_order_iff π g v q).1 hvq,
        (insertMax_order_iff π g q w).1 hqw⟩
  · rintro ⟨p, q, u, v, ⟨hpq, hqu, _, hup, hpv, hvq⟩, hug, hgv⟩
    exact ⟨g.succAbove p, g.succAbove q, g.succAbove u, g, g.succAbove v,
      Fin.strictMono_succAbove g hpq,
      Fin.strictMono_succAbove g hqu,
      (succAbove_lt_iff_lt g u).2 hug,
      (lt_succAbove_iff_le g v).2 hgv,
      (insertMax_order_iff π g u p).2 hup,
      (insertMax_order_iff π g p v).2 hpv,
      (insertMax_order_iff π g v q).2 hvq,
      insertMax_succAbove_lt_self π g q⟩

/-- Literal forbidden gaps in `X`: a `213` ending at `c` forbids `c.val < g.val`,
and a `4213`/`2413` with 3rd and 4th positions `u, v` forbids `u.val < g.val ≤ v.val`. -/
theorem legalGapX_iff_forbid {n : ℕ} {π : Equiv.Perm (Fin n)} (hX : InX π) (g : Fin (n + 1)) :
    LegalGapX π g ↔
      (∀ i j c : Fin n, Is213 π i j c → g.val ≤ c.val) ∧
      (∀ p q u v : Fin n, IsFourPat π p q u v → ¬ (u.val < g.val ∧ g.val ≤ v.val)) := by
  unfold LegalGapX InX
  rw [contains_pat2134_insertMax_iff hX.1 g,
      contains_pat42153_insertMax_iff hX.2.1 g,
      contains_pat24153_insertMax_iff hX.2.2 g]
  constructor
  · rintro ⟨h1, h2, h3⟩
    refine ⟨?_, ?_⟩
    · intro i j c h213
      by_contra hlt
      push Not at hlt
      exact h1 ⟨i, j, c, h213, hlt⟩
    · intro p q u v hfp ⟨hug, hgv⟩
      rcases hfp with h4 | h24
      · exact h2 ⟨p, q, u, v, h4, hug, hgv⟩
      · exact h3 ⟨p, q, u, v, h24, hug, hgv⟩
  · rintro ⟨h1, h2⟩
    refine ⟨?_, ?_, ?_⟩
    · rintro ⟨i, j, c, h213, hcg⟩
      have := h1 i j c h213
      omega
    · rintro ⟨p, q, u, v, h4, hug, hgv⟩
      exact h2 p q u v (Or.inl h4) ⟨hug, hgv⟩
    · rintro ⟨p, q, u, v, h24, hug, hgv⟩
      exact h2 p q u v (Or.inr h24) ⟨hug, hgv⟩

/-! ### Private Helpers for `least213Mid`, `least213End`, `kX` -/

private theorem least213Mid_le_succ {n : ℕ} (π : Equiv.Perm (Fin n)) :
    least213Mid π ≤ n + 1 :=
  Finset.min'_le _ _ (Finset.mem_insert_self _ _)

private theorem least213Mid_le_of_is213 {n : ℕ} (π : Equiv.Perm (Fin n)) {i j c : Fin n}
    (h : Is213 π i j c) : least213Mid π ≤ j.val + 1 := by
  apply Finset.min'_le
  refine Finset.mem_insert_of_mem (Finset.mem_image.2 ⟨j, ?_, rfl⟩)
  exact Finset.mem_filter.2 ⟨Finset.mem_univ j, i, c, h⟩

private theorem least213End_le_succ {n : ℕ} (π : Equiv.Perm (Fin n)) :
    least213End π ≤ n + 1 :=
  Finset.min'_le _ _ (Finset.mem_insert_self _ _)

private theorem least213End_le_of_is213 {n : ℕ} (π : Equiv.Perm (Fin n)) {i j c : Fin n}
    (h : Is213 π i j c) : least213End π ≤ c.val + 1 := by
  apply Finset.min'_le
  refine Finset.mem_insert_of_mem (Finset.mem_image.2 ⟨c, ?_, rfl⟩)
  exact Finset.mem_filter.2 ⟨Finset.mem_univ c, i, j, h⟩

private theorem kX_le_least213End {n : ℕ} (π : Equiv.Perm (Fin n)) :
    kX π ≤ least213End π :=
  Finset.min'_le _ _ (Finset.mem_insert_self _ _)

private theorem kX_le_of_fourPat {n : ℕ} (π : Equiv.Perm (Fin n)) {p q u v : Fin n}
    (h : IsFourPat π p q u v) : kX π ≤ u.val + 1 := by
  apply Finset.min'_le
  refine Finset.mem_insert_of_mem (Finset.mem_image.2 ⟨u, ?_, rfl⟩)
  exact Finset.mem_filter.2 ⟨Finset.mem_univ u, p, q, v, h⟩

private theorem lt_least213End_iff {n : ℕ} (π : Equiv.Perm (Fin n)) (x : ℕ) :
    x < least213End π ↔ x < n + 1 ∧ ∀ i j c : Fin n, Is213 π i j c → x ≤ c.val := by
  unfold least213End
  rw [Finset.lt_min'_iff]
  constructor
  · intro h
    refine ⟨h (n + 1) (Finset.mem_insert_self _ _), fun i j c h213 => ?_⟩
    have hlt := h (c.val + 1) (Finset.mem_insert_of_mem
      (Finset.mem_image.2 ⟨c, Finset.mem_filter.2 ⟨Finset.mem_univ c, i, j, h213⟩, rfl⟩))
    omega
  · rintro ⟨hx, h213⟩ y hy
    rcases Finset.mem_insert.1 hy with rfl | hy'
    · exact hx
    · rcases Finset.mem_image.1 hy' with ⟨c, hc, rfl⟩
      rcases (Finset.mem_filter.1 hc).2 with ⟨i, j, hijc⟩
      have := h213 i j c hijc
      omega

private theorem lt_kX_iff {n : ℕ} (π : Equiv.Perm (Fin n)) (x : ℕ) :
    x < kX π ↔ x < least213End π ∧ ∀ p q u v : Fin n, IsFourPat π p q u v → x ≤ u.val := by
  unfold kX
  rw [Finset.lt_min'_iff]
  constructor
  · intro h
    refine ⟨h (least213End π) (Finset.mem_insert_self _ _), fun p q u v hfp => ?_⟩
    have hlt := h (u.val + 1) (Finset.mem_insert_of_mem
      (Finset.mem_image.2 ⟨u, Finset.mem_filter.2 ⟨Finset.mem_univ u, p, q, v, hfp⟩, rfl⟩))
    omega
  · rintro ⟨hx, hfp⟩ y hy
    rcases Finset.mem_insert.1 hy with rfl | hy'
    · exact hx
    · rcases Finset.mem_image.1 hy' with ⟨u, hu, rfl⟩
      rcases (Finset.mem_filter.1 hu).2 with ⟨p, q, v, hpquv⟩
      have := hfp p q u v hpquv
      omega

/-- The forbidden gaps in `X` form a single tail, so the legal gaps are `0, …, k - 1`. -/
theorem legalGapX_iff_lt_kX {n : ℕ} {π : Equiv.Perm (Fin n)} (hX : InX π) (g : Fin (n + 1)) :
    LegalGapX π g ↔ g.val < kX π := by
  rw [legalGapX_iff_forbid hX g, lt_kX_iff, lt_least213End_iff]
  constructor
  · rintro ⟨h1, h2⟩
    refine ⟨⟨g.isLt, h1⟩, fun p q u v hfp => ?_⟩
    obtain ⟨i, h213⟩ := fourPat_contains_213 hfp
    have hgv : g.val ≤ v.val := h1 i u v h213
    by_contra hlt
    push Not at hlt
    exact h2 p q u v hfp ⟨hlt, hgv⟩
  · rintro ⟨⟨_, h1⟩, h2⟩
    refine ⟨h1, fun p q u v hfp ⟨hug, _⟩ => ?_⟩
    have := h2 p q u v hfp
    omega

/-- Basic ordering invariants `1 ≤ d ≤ b ≤ k ≤ n + 1` for `π ∈ X`. -/
theorem invariantsX_bounds {n : ℕ} (π : Equiv.Perm (Fin n)) :
    1 ≤ firstDescent π ∧
    firstDescent π ≤ least213Mid π ∧
    least213Mid π ≤ kX π ∧
    kX π ≤ n + 1 := by
  refine ⟨firstDescent_pos π, ?_, ?_, le_trans (kX_le_least213End π) (least213End_le_succ π)⟩
  · unfold least213Mid
    rw [Finset.le_min'_iff]
    intro y hy
    rcases Finset.mem_insert.1 hy with rfl | hy'
    · exact firstDescent_le π
    · rcases Finset.mem_image.1 hy' with ⟨j, hj, rfl⟩
      rcases (Finset.mem_filter.1 hj).2 with ⟨i, c, hij, _, hji, _⟩
      by_contra hlt
      push Not at hlt
      exact lt_asymm hji (firstDescent_prefix_strictMono π hij hlt)
  · unfold kX
    rw [Finset.le_min'_iff]
    intro y hy
    rcases Finset.mem_insert.1 hy with rfl | hy'
    · unfold least213End
      rw [Finset.le_min'_iff]
      intro z hz
      rcases Finset.mem_insert.1 hz with rfl | hz'
      · exact least213Mid_le_succ π
      · rcases Finset.mem_image.1 hz' with ⟨c, hc, rfl⟩
        rcases (Finset.mem_filter.1 hc).2 with ⟨i, j, h213⟩
        have hmid := least213Mid_le_of_is213 π h213
        have hjc : j.val < c.val := h213.2.1
        omega
    · rcases Finset.mem_image.1 hy' with ⟨u, hu, rfl⟩
      rcases (Finset.mem_filter.1 hu).2 with ⟨p, q, v, hfp⟩
      obtain ⟨i, h213⟩ := fourPat_contains_213 hfp
      exact least213Mid_le_of_is213 π h213

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

private theorem least213Mid_cases {n : ℕ} (π : Equiv.Perm (Fin n)) :
    least213Mid π = n + 1 ∨
      ∃ i j c : Fin n, Is213 π i j c ∧ least213Mid π = j.val + 1 := by
  have hmem := Finset.min'_mem _ (Finset.insert_nonempty (n + 1)
    ((Finset.univ.filter fun j : Fin n =>
      ∃ i c : Fin n, Is213 π i j c).image fun j => j.val + 1))
  change least213Mid π ∈ _ at hmem
  rcases Finset.mem_insert.1 hmem with heq | hmem'
  · exact Or.inl heq
  · rcases Finset.mem_image.1 hmem' with ⟨j, hj, heq⟩
    rcases (Finset.mem_filter.1 hj).2 with ⟨i, c, h213⟩
    exact Or.inr ⟨i, j, c, h213, heq.symm⟩

private theorem is213_insertMax_not_uses_max_of_lt_d {n : ℕ} {π : Equiv.Perm (Fin n)}
    {g : Fin (n + 1)} (hg : g.val < firstDescent π)
    {i' j' c' : Fin (n + 1)} (h : Is213 (insertMax π g) i' j' c') :
    i' ≠ g ∧ j' ≠ g ∧ c' ≠ g := by
  rcases h with ⟨hij, hjc, hji, hic⟩
  have hi : i' ≠ g := fun heq => by rw [heq] at hic; exact not_insertMax_self_lt π g c' hic
  have hj : j' ≠ g := fun heq => by rw [heq] at hji; exact not_insertMax_self_lt π g i' hji
  have hc : c' ≠ g := by
    intro heq
    subst c'
    obtain ⟨i, rfl⟩ := Fin.exists_succAbove_eq hi
    obtain ⟨j, rfl⟩ := Fin.exists_succAbove_eq hj
    have hij' : i < j := (Fin.strictMono_succAbove g).lt_iff_lt.1 hij
    have hjg : j.val < g.val := (succAbove_lt_iff_lt g j).1 hjc
    have hji' : π j < π i := (insertMax_order_iff π g j i).1 hji
    exact lt_asymm hji' (firstDescent_prefix_strictMono π hij' (by omega))
  exact ⟨hi, hj, hc⟩

/-- Transition for `g < d`: `(d, b, k) → (g + 2, b + 1, b + 1)`. -/
theorem updateX_lt_d {n : ℕ} {π : Equiv.Perm (Fin n)} (_hX : InX π) (g : Fin (n + 1))
    (hg : g.val < firstDescent π) :
    firstDescent (insertMax π g) = g.val + 2 ∧
    least213Mid (insertMax π g) = least213Mid π + 1 ∧
    kX (insertMax π g) = least213Mid π + 1 := by
  have hbd : firstDescent π ≤ least213Mid π := (invariantsX_bounds π).2.1
  have hmid : least213Mid (insertMax π g) = least213Mid π + 1 := by
    have hle : least213Mid (insertMax π g) ≤ least213Mid π + 1 := by
      rcases least213Mid_cases π with heq | ⟨i, j, c, h213, heq⟩
      · rw [heq]
        exact least213Mid_le_succ (insertMax π g)
      · have h213' : Is213 (insertMax π g) (g.succAbove i) (g.succAbove j) (g.succAbove c) :=
          ⟨Fin.strictMono_succAbove g h213.1, Fin.strictMono_succAbove g h213.2.1,
            (insertMax_order_iff π g j i).2 h213.2.2.1,
            (insertMax_order_iff π g i c).2 h213.2.2.2⟩
        have hgj : g.val ≤ j.val := by omega
        have hval := least213Mid_le_of_is213 (insertMax π g) h213'
        rw [succAbove_val_of_le g j hgj] at hval
        omega
    have hge : least213Mid π + 1 ≤ least213Mid (insertMax π g) := by
      conv_rhs => unfold least213Mid
      rw [Finset.le_min'_iff]
      intro y hy
      rcases Finset.mem_insert.1 hy with rfl | hy'
      · have := least213Mid_le_succ π
        omega
      · rcases Finset.mem_image.1 hy' with ⟨j', hj', rfl⟩
        rcases (Finset.mem_filter.1 hj').2 with ⟨i', c', h213'⟩
        obtain ⟨hi, hj, hc⟩ := is213_insertMax_not_uses_max_of_lt_d hg h213'
        obtain ⟨i, rfl⟩ := Fin.exists_succAbove_eq hi
        obtain ⟨j, rfl⟩ := Fin.exists_succAbove_eq hj
        obtain ⟨c, rfl⟩ := Fin.exists_succAbove_eq hc
        have h213 : Is213 π i j c :=
          ⟨(Fin.strictMono_succAbove g).lt_iff_lt.1 h213'.1,
            (Fin.strictMono_succAbove g).lt_iff_lt.1 h213'.2.1,
            (insertMax_order_iff π g j i).1 h213'.2.2.1,
            (insertMax_order_iff π g i c).1 h213'.2.2.2⟩
        have hjm := least213Mid_le_of_is213 π h213
        have hgj : g.val ≤ j.val := by omega
        rw [succAbove_val_of_le g j hgj]
        omega
    omega
  have hk : kX (insertMax π g) = least213Mid π + 1 := by
    have hge : least213Mid π + 1 ≤ kX (insertMax π g) := by
      rw [← hmid]
      exact (invariantsX_bounds (insertMax π g)).2.2.1
    have hle : kX (insertMax π g) ≤ least213Mid π + 1 := by
      rcases least213Mid_cases π with heq | ⟨i, j, c, h213, heq⟩
      · rw [heq]
        exact (invariantsX_bounds (insertMax π g)).2.2.2
      · have hgj : g.val ≤ j.val := by omega
        obtain ⟨p, q, hfp⟩ := insertMax_creates_fourPat h213 hgj
        have hval := kX_le_of_fourPat (insertMax π g) hfp
        rw [succAbove_val_of_le g j hgj] at hval
        omega
    omega
  exact ⟨firstDescent_insertMax_lt π g hg, hmid, hk⟩

/-- Transition for `d ≤ g < k`: `(d, b, k) → (d, d, g + 1)`. -/
theorem updateX_ge_d {n : ℕ} {π : Equiv.Perm (Fin n)} (_hX : InX π) (g : Fin (n + 1))
    (hlo : firstDescent π ≤ g.val) (hhi : g.val < kX π) :
    firstDescent (insertMax π g) = firstDescent π ∧
    least213Mid (insertMax π g) = firstDescent π ∧
    kX (insertMax π g) = g.val + 1 := by
  have hd_eq : firstDescent (insertMax π g) = firstDescent π :=
    firstDescent_insertMax_ge π g hlo
  have hkn : kX π ≤ n + 1 := (invariantsX_bounds π).2.2.2
  have hd_lt : firstDescent π < n + 1 := by omega
  obtain ⟨j₀, hj₀0, hdesc₀, heq₀⟩ := firstDescent_lt_succ_exists π hd_lt
  let i₀ : Fin n := ⟨j₀.val - 1, by omega⟩
  have hj₀g : j₀.val < g.val := by omega
  have h213_new : Is213 (insertMax π g) (g.succAbove i₀) (g.succAbove j₀) g := by
    refine ⟨Fin.strictMono_succAbove g (by show i₀.val < j₀.val; simp [i₀]; omega),
      (succAbove_lt_iff_lt g j₀).2 hj₀g,
      (insertMax_order_iff π g j₀ i₀).2 hdesc₀,
      insertMax_succAbove_lt_self π g i₀⟩
  have hmid : least213Mid (insertMax π g) = firstDescent π := by
    have hge : firstDescent π ≤ least213Mid (insertMax π g) := by
      rw [← hd_eq]
      exact (invariantsX_bounds (insertMax π g)).2.1
    have hle : least213Mid (insertMax π g) ≤ firstDescent π := by
      have hval := least213Mid_le_of_is213 (insertMax π g) h213_new
      rw [succAbove_val_of_lt g j₀ hj₀g] at hval
      omega
    omega
  have hk : kX (insertMax π g) = g.val + 1 := by
    have hle : kX (insertMax π g) ≤ g.val + 1 :=
      le_trans (kX_le_least213End (insertMax π g)) (least213End_le_of_is213 (insertMax π g) h213_new)
    have hge : g.val + 1 ≤ kX (insertMax π g) := by
      unfold kX
      rw [Finset.le_min'_iff]
      intro y hy
      rcases Finset.mem_insert.1 hy with rfl | hy'
      · unfold least213End
        rw [Finset.le_min'_iff]
        intro z hz
        rcases Finset.mem_insert.1 hz with rfl | hz'
        · omega
        · rcases Finset.mem_image.1 hz' with ⟨c', hc', rfl⟩
          rcases (Finset.mem_filter.1 hc').2 with ⟨i', j', h213'⟩
          by_cases hcg : c' = g
          · rw [hcg]
          · have hi : i' ≠ g := fun h => by
              rw [h] at h213'; exact not_insertMax_self_lt π g c' h213'.2.2.2
            have hj : j' ≠ g := fun h => by
              rw [h] at h213'; exact not_insertMax_self_lt π g i' h213'.2.2.1
            obtain ⟨i, rfl⟩ := Fin.exists_succAbove_eq hi
            obtain ⟨j, rfl⟩ := Fin.exists_succAbove_eq hj
            obtain ⟨c, rfl⟩ := Fin.exists_succAbove_eq hcg
            have h213 : Is213 π i j c :=
              ⟨(Fin.strictMono_succAbove g).lt_iff_lt.1 h213'.1,
                (Fin.strictMono_succAbove g).lt_iff_lt.1 h213'.2.1,
                (insertMax_order_iff π g j i).1 h213'.2.2.1,
                (insertMax_order_iff π g i c).1 h213'.2.2.2⟩
            have hgc : g.val ≤ c.val := by
              have h1 := le_trans (kX_le_least213End π) (least213End_le_of_is213 π h213)
              omega
            rw [succAbove_val_of_le g c hgc]
            omega
      · rcases Finset.mem_image.1 hy' with ⟨u', hu', rfl⟩
        rcases (Finset.mem_filter.1 hu').2 with ⟨p', q', v', hfp'⟩
        by_cases huse : p' = g ∨ q' = g ∨ u' = g ∨ v' = g
        · obtain ⟨i, u, v, _, hgu, rfl, _⟩ := fourPat_insertMax_uses_max hfp' huse
          rw [succAbove_val_of_le g u hgu]
          omega
        · push Not at huse
          obtain ⟨hp, hq, hu, hv⟩ := huse
          obtain ⟨p, rfl⟩ := Fin.exists_succAbove_eq hp
          obtain ⟨q, rfl⟩ := Fin.exists_succAbove_eq hq
          obtain ⟨u, rfl⟩ := Fin.exists_succAbove_eq hu
          obtain ⟨v, rfl⟩ := Fin.exists_succAbove_eq hv
          have hfp : IsFourPat π p q u v := by
            rcases hfp' with h4 | h24
            · exact Or.inl ⟨(Fin.strictMono_succAbove g).lt_iff_lt.1 h4.1,
                (Fin.strictMono_succAbove g).lt_iff_lt.1 h4.2.1,
                (Fin.strictMono_succAbove g).lt_iff_lt.1 h4.2.2.1,
                (insertMax_order_iff π g u q).1 h4.2.2.2.1,
                (insertMax_order_iff π g q v).1 h4.2.2.2.2.1,
                (insertMax_order_iff π g v p).1 h4.2.2.2.2.2⟩
            · exact Or.inr ⟨(Fin.strictMono_succAbove g).lt_iff_lt.1 h24.1,
                (Fin.strictMono_succAbove g).lt_iff_lt.1 h24.2.1,
                (Fin.strictMono_succAbove g).lt_iff_lt.1 h24.2.2.1,
                (insertMax_order_iff π g u p).1 h24.2.2.2.1,
                (insertMax_order_iff π g p v).1 h24.2.2.2.2.1,
                (insertMax_order_iff π g v q).1 h24.2.2.2.2.2⟩
          have hgu : g.val ≤ u.val := by
            have := kX_le_of_fourPat π hfp
            omega
          rw [succAbove_val_of_le g u hgu]
          omega
    omega
  exact ⟨hd_eq, hmid, hk⟩

/-- Every `π ∈ X` satisfies either `b = k` (type `A`) or `d = b < k` (type `B`). -/
theorem invariantX_dichotomy {n : ℕ} {π : Equiv.Perm (Fin n)} (hX : InX π) :
    least213Mid π = kX π ∨ (firstDescent π = least213Mid π ∧ least213Mid π < kX π) := by
  cases n with
  | zero =>
    have hb := invariantsX_bounds π
    left
    omega
  | succ m =>
    let σ := deleteMax π
    let g := maxGap π
    have hσ : InX σ := inX_deleteMax hX
    have hπ : insertMax σ g = π := insertMax_deleteMax π
    have hleg : LegalGapX σ g := by
      unfold LegalGapX
      rwa [hπ]
    have hgk : g.val < kX σ := (legalGapX_iff_lt_kX hσ g).1 hleg
    by_cases hgd : g.val < firstDescent σ
    · obtain ⟨_, hmid, hk⟩ := updateX_lt_d hσ g hgd
      rw [hπ] at hmid hk
      left
      omega
    · have hlo : firstDescent σ ≤ g.val := by omega
      obtain ⟨hd, hmid, hk⟩ := updateX_ge_d hσ g hlo hgk
      rw [hπ] at hd hmid hk
      right
      omega

theorem labelX_empty : labelX (1 : Equiv.Perm (Fin 0)) = TreeLabel.A 0 0 := by
  have hb := invariantsX_bounds (1 : Equiv.Perm (Fin 0))
  have hd : firstDescent (1 : Equiv.Perm (Fin 0)) = 1 := by omega
  have hmid : least213Mid (1 : Equiv.Perm (Fin 0)) = 1 := by omega
  have hk : kX (1 : Equiv.Perm (Fin 0)) = 1 := by omega
  simp [labelX, hd, hmid, hk]

private theorem range'_succ_eq_map (s m : ℕ) :
    List.range' (s + 1) m = (List.range' s m).map (· + 1) := by
  induction m generalizing s with
  | zero => rfl
  | succ m ih => simp [List.range', ih]

private theorem filter_lt_val_map {n k : ℕ} (hk : k ≤ n + 1) {α : Type*}
    (f : Fin (n + 1) → α) (F : ℕ → α) (hF : ∀ g : Fin (n + 1), g.val < k → f g = F g.val) :
    (Finset.univ.filter fun g : Fin (n + 1) => g.val < k).val.map f =
      ((List.range' 0 k).map F : Multiset α) := by
  have hcongr : (Finset.univ.filter fun g : Fin (n + 1) => g.val < k).val.map f =
      (Finset.univ.filter fun g : Fin (n + 1) => g.val < k).val.map (F ∘ Fin.val) := by
    refine Multiset.map_congr rfl fun g hg => ?_
    have hg' : g ∈ Finset.univ.filter (fun g : Fin (n + 1) => g.val < k) := hg
    exact hF g (Finset.mem_filter.1 hg').2
  rw [hcongr, ← Multiset.map_map]
  have himg : (Finset.univ.filter fun g : Fin (n + 1) => g.val < k).image Fin.val =
      Finset.range k := by
    ext x
    simp only [Finset.mem_image, Finset.mem_filter, Finset.mem_univ, true_and, Finset.mem_range]
    constructor
    · rintro ⟨g, hg, rfl⟩
      exact hg
    · intro hx
      exact ⟨⟨x, by omega⟩, hx, rfl⟩
  have hval : (Finset.univ.filter fun g : Fin (n + 1) => g.val < k).val.map Fin.val =
      (List.range' 0 k : Multiset ℕ) := by
    rw [← Finset.image_val_of_injOn Fin.val_injective.injOn, himg, Finset.range_val,
      Multiset.range, List.range_eq_range']
  rw [hval, Multiset.map_coe]

/-- The multiset of child labels of `π ∈ X` equals `children (labelX π)`. -/
theorem childrenX_multiset_eq {n : ℕ} {π : Equiv.Perm (Fin n)} (hX : InX π) :
    (Finset.univ.filter fun g : Fin (n + 1) => InX (insertMax π g)).val.map
      (fun g => labelX (insertMax π g)) = (children (labelX π) : Multiset TreeLabel) := by
  have hb := invariantsX_bounds π
  have hfilt : (Finset.univ.filter fun g : Fin (n + 1) => InX (insertMax π g)) =
      (Finset.univ.filter fun g : Fin (n + 1) => g.val < kX π) := by
    ext g
    simp only [Finset.mem_filter, Finset.mem_univ, true_and]
    exact legalGapX_iff_lt_kX hX g
  rw [hfilt]
  set d := firstDescent π
  set b := least213Mid π
  set k := kX π
  let a := d - 1
  let m := k - 1
  have hda : d = a + 1 := by omega
  have hkm : k = m + 1 := by omega
  let F : ℕ → TreeLabel := fun i =>
    if i < d then TreeLabel.A (i + 1) b else TreeLabel.B a i
  have hF : ∀ g : Fin (n + 1), g.val < k → labelX (insertMax π g) = F g.val := by
    intro g hgk
    dsimp [F]
    by_cases hgd : g.val < d
    · obtain ⟨hd', hb', hk'⟩ := updateX_lt_d hX g hgd
      simp [hgd, labelX, hd', hb', hk', b]
    · have hlo : d ≤ g.val := by omega
      obtain ⟨hd', hb', hk'⟩ := updateX_ge_d hX g hlo hgk
      have hne : firstDescent π ≠ g.val + 1 := by omega
      simp [hgd, labelX, hd', hb', hk', hne, a, d]
  rw [filter_lt_val_map hb.2.2.2 _ F hF]
  have hsplit : List.range' 0 k = List.range' 0 d ++ List.range' d (k - d) := by
    have hk_eq : d + (k - d) = k := by omega
    rw [show List.range' d (k - d) = List.range' (0 + 1 * d) (k - d) by simp,
      List.range'_append, hk_eq]
  have hleft : (List.range' 0 d).map F = (List.range' 1 d).map (fun h => TreeLabel.A h b) := by
    have h1 : (List.range' 0 d).map F = (List.range' 0 d).map (fun i => TreeLabel.A (i + 1) b) := by
      refine List.map_congr_left fun i hi => ?_
      rw [List.mem_range'] at hi
      have hid : i < d := by omega
      simp [F, hid]
    rw [h1, range'_succ_eq_map 0 d, List.map_map]
    rfl
  have hright : (List.range' d (k - d)).map F =
      (List.range' (a + 1) (m - a)).map (fun m' => TreeLabel.B a m') := by
    have hkd : k - d = m - a := by omega
    rw [hkd, hda]
    refine List.map_congr_left fun i hi => ?_
    rw [List.mem_range'] at hi
    have hid : ¬ i < d := by omega
    simp [F, hid]
  have hlist : (List.range' 0 k).map F =
      (List.range' 1 (a + 1)).map (fun h => TreeLabel.A h b) ++
      (List.range' (a + 1) (m - a)).map (fun m' => TreeLabel.B a m') := by
    rw [hsplit, List.map_append, hleft, hright, hda]
  rw [hlist]
  rcases invariantX_dichotomy hX with hbk | ⟨hdb, hbk⟩
  · have hlab : labelX π = TreeLabel.A a m := by
      simp [labelX, hbk, a, m, d, k]
    have hb_eq : b = m + 1 := by omega
    rw [hlab, children, hb_eq]
  · have hne : least213Mid π ≠ kX π := by omega
    have hlab : labelX π = TreeLabel.B a m := by
      simp [labelX, hne, a, m, d, k]
    have hb_eq : b = a + 1 := by omega
    rw [hlab, children, hb_eq]

/-- Exact enumeration of `X` by the common generating tree. -/
theorem countX_eq_treeCount (n : ℕ) : countX n = treeCount (TreeLabel.A 0 0) n := by
  exact card_eq_treeCount_of_treeIso InX inX_empty (fun _ h => inX_deleteMax h)
    labelX labelX_empty (fun _ h => childrenX_multiset_eq h) n

end Conjectures.BursteinA218225
