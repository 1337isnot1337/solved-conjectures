module

public import Mathlib.Combinatorics.SetFamily.Shatter
public import Mathlib.Algebra.Order.BigOperators.Ring.Finset
public import Mathlib.Basic.Real.Basic
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.Ring

@[expose] public section

namespace AgnosticVC

open Finset
open scoped BigOperators

variable {α : Type*} [DecidableEq α]

/-- The traces of a set family on the indicated coordinates. -/
def traceRestriction (F : Finset (Finset α)) (coords : Finset α) : Finset (Finset α) :=
  F.image (coords ∩ ·)

lemma traceRestriction_vcDim_le (F : Finset (Finset α)) (coords : Finset α) :
    (traceRestriction F coords).vcDim ≤ F.vcDim := by
  rw [vcDim, Finset.sup_le_iff]
  intro s hs
  have hsh := Finset.mem_shatterer.mp hs
  obtain ⟨r, hr, hsr⟩ := hsh.exists_superset
  obtain ⟨v, hv, rfl⟩ := Finset.mem_image.mp hr
  have hsc : s ⊆ coords := hsr.trans Finset.inter_subset_left
  apply Finset.Shatters.card_le_vcDim
  intro t ht
  obtain ⟨r, hr, hrt⟩ := hsh ht
  obtain ⟨u, hu, rfl⟩ := Finset.mem_image.mp hr
  exact ⟨u, hu, by rwa [← Finset.inter_assoc, Finset.inter_eq_left.mpr hsc] at hrt⟩

/-- Lower endpoints of the edges that differ only in coordinate `i`. -/
def oneInclusionEdges (F : Finset (Finset α)) (i : α) : Finset (Finset α) :=
  F.nonMemberSubfamily i ∩ F.memberSubfamily i

@[simp] lemma mem_oneInclusionEdges {F : Finset (Finset α)} {i : α} {s : Finset α} :
    s ∈ oneInclusionEdges F i ↔ s ∈ F ∧ i ∉ s ∧ insert i s ∈ F := by
  simp only [oneInclusionEdges, Finset.mem_inter, Finset.mem_nonMemberSubfamily,
    Finset.mem_memberSubfamily]
  tauto

lemma oneInclusionEdges_mono {F G : Finset (Finset α)} (h : F ⊆ G) (i : α) :
    oneInclusionEdges F i ⊆ oneInclusionEdges G i := by
  intro s hs
  rcases mem_oneInclusionEdges.mp hs with ⟨hs, hi, his⟩
  exact mem_oneInclusionEdges.mpr ⟨h hs, hi, h his⟩

private lemma oneInclusionEdges_inter (F G : Finset (Finset α)) (i : α) :
    oneInclusionEdges (F ∩ G) i = oneInclusionEdges F i ∩ oneInclusionEdges G i := by
  ext s
  simp only [mem_oneInclusionEdges, Finset.mem_inter]
  tauto

private lemma oneInclusionEdges_split (F : Finset (Finset α)) {i j : α} (hji : j ≠ i) :
    (oneInclusionEdges F j).card =
      (oneInclusionEdges (F.nonMemberSubfamily i) j).card +
      (oneInclusionEdges (F.memberSubfamily i) j).card := by
  have h0 : (oneInclusionEdges F j).nonMemberSubfamily i =
      oneInclusionEdges (F.nonMemberSubfamily i) j := by
    ext s
    simp only [Finset.mem_nonMemberSubfamily, mem_oneInclusionEdges,
      Finset.mem_insert, hji.symm, false_or]
    tauto
  have h1 : (oneInclusionEdges F j).memberSubfamily i =
      oneInclusionEdges (F.memberSubfamily i) j := by
    ext s
    simp only [Finset.mem_memberSubfamily, mem_oneInclusionEdges,
      Finset.mem_insert, hji, hji.symm, false_or]
    rw [Finset.insert_comm j i s]
    tauto
  rw [← h0, ← h1, Nat.add_comm, Finset.card_memberSubfamily_add_card_nonMemberSubfamily]

private lemma shatters_insert_of_layers (F : Finset (Finset α)) {i : α} {s : Finset α}
    (hs : (oneInclusionEdges F i).Shatters s) :
    i ∉ s ∧ F.Shatters (insert i s) := by
  obtain ⟨r, hr, hsr⟩ := hs.exists_superset
  have hi : i ∉ s := fun his => (mem_oneInclusionEdges.mp hr).2.1 (hsr his)
  refine ⟨hi, ?_⟩
  intro t ht
  obtain ⟨r, hr, hrt⟩ := hs (Finset.subset_insert_iff.mp ht)
  obtain ⟨hr, hir, hri⟩ := mem_oneInclusionEdges.mp hr
  by_cases hit : i ∈ t
  · exact ⟨insert i r, hri, by rw [← Finset.insert_inter_distrib, hrt, Finset.insert_erase hit]⟩
  · exact ⟨r, hr, by rw [Finset.insert_inter_of_notMem hir, hrt, Finset.erase_eq_self.mpr hit]⟩

/-- The unit-distance graph of a finite trace family has at most `d * |F|` edges. -/
theorem card_oneInclusionEdges_le (F : Finset (Finset α)) (coords : Finset α) (d : ℕ)
    (hF : ∀ s ∈ F, s ⊆ coords) (hd : F.vcDim ≤ d) :
    ∑ i ∈ coords, (oneInclusionEdges F i).card ≤ d * F.card := by
  induction coords using Finset.induction generalizing F d with
  | empty => simp
  | @insert i coords hi ih =>
    let F₀ := F.nonMemberSubfamily i
    let F₁ := F.memberSubfamily i
    let G := F₀ ∪ F₁
    let H := oneInclusionEdges F i
    have hH : H = F₀ ∩ F₁ := rfl
    have hcoords : ∀ s ∈ G, s ⊆ coords := by
      intro s hs
      rcases Finset.mem_union.mp hs with hs | hs
      · obtain ⟨hs, hsi⟩ := Finset.mem_nonMemberSubfamily.mp hs
        exact (Finset.subset_insert_iff_of_notMem hsi).mp (hF s hs)
      · obtain ⟨hs, hsi⟩ := Finset.mem_memberSubfamily.mp hs
        exact (Finset.insert_subset_insert_iff hsi).mp (hF _ hs)
    have hG : G.vcDim ≤ d := by
      have heq : G = traceRestriction F coords := by
        rw [show G = F₀ ∪ F₁ from rfl, Finset.union_comm,
          Finset.memberSubfamily_union_nonMemberSubfamily, traceRestriction]
        apply Finset.image_congr
        intro s hs
        ext j
        specialize hF s hs
        simp only [Finset.mem_erase, Finset.mem_inter]
        constructor
        · rintro ⟨hji, hjs⟩
          exact ⟨(Finset.mem_insert.mp (hF hjs)).resolve_left hji, hjs⟩
        · rintro ⟨hj, hjs⟩
          exact ⟨fun h => hi (h ▸ hj), hjs⟩
      exact heq ▸ (traceRestriction_vcDim_le F coords).trans hd
    have hdimH : ∀ s ∈ H.shatterer, s.card + 1 ≤ d := by
      intro s hs
      obtain ⟨his, hsh⟩ := shatters_insert_of_layers F (Finset.mem_shatterer.mp hs)
      simpa [Finset.card_insert_of_notMem his] using hsh.card_le_vcDim.trans hd
    have hcard : G.card + H.card = F.card := by
      rw [hH, Finset.card_union_add_card_inter, Nat.add_comm,
        Finset.card_memberSubfamily_add_card_nonMemberSubfamily]
    have hGbound := ih G d hcoords hG
    have hHbound : (∑ j ∈ coords, (oneInclusionEdges H j).card) + H.card ≤ d * H.card := by
      by_cases hne : H.Nonempty
      · have hdpos := hdimH ∅ (Finset.mem_shatterer.mpr (Finset.shatters_empty.mpr hne))
        have hdim : H.vcDim ≤ d - 1 := by
          rw [Finset.vcDim, Finset.sup_le_iff]
          intro s hs
          have := hdimH s hs
          omega
        have h := ih H (d - 1) (fun s hs => hcoords s (Finset.mem_union_left _
          (Finset.mem_inter.mp (hH ▸ hs)).1)) hdim
        have heq : d - 1 + 1 = d := by simp at hdpos; omega
        calc
          _ ≤ (d - 1) * H.card + H.card := Nat.add_le_add_right h _
          _ = d * H.card := by rw [← Nat.succ_mul, Nat.succ_eq_add_one, heq]
      · rw [Finset.not_nonempty_iff_eq_empty.mp hne]
        simp [oneInclusionEdges, Finset.nonMemberSubfamily]
    have hcompare : ∀ j ∈ coords, (oneInclusionEdges F j).card ≤
        (oneInclusionEdges G j).card + (oneInclusionEdges H j).card := by
      intro j hj
      have hji : j ≠ i := fun e => hi (e ▸ hj)
      rw [oneInclusionEdges_split F hji, hH, oneInclusionEdges_inter,
        ← Finset.card_union_add_card_inter]
      apply Nat.add_le_add_right
      exact Finset.card_le_card (Finset.union_subset
        (oneInclusionEdges_mono Finset.subset_union_left j)
        (oneInclusionEdges_mono Finset.subset_union_right j))
    rw [Finset.sum_insert hi]
    have hsum := Finset.sum_le_sum hcompare
    rw [Finset.sum_add_distrib] at hsum
    change H.card + _ ≤ _
    rw [← hcard, Nat.mul_add]
    omega

/-- The unit-distance edges weighted by their smaller endpoint masses. -/
theorem weighted_oneInclusionEdges_le (F : Finset (Finset α)) (coords : Finset α) (d : ℕ)
    (p : Finset α → ℝ) (hF : ∀ s ∈ F, s ⊆ coords) (hd : F.vcDim ≤ d)
    (hp : ∀ s ∈ F, 0 ≤ p s) :
    (∑ i ∈ coords, ∑ s ∈ oneInclusionEdges F i, min (p s) (p (insert i s))) ≤
      (d : ℝ) * ∑ s ∈ F, p s := by
  induction F using Finset.strongInductionOn generalizing p with
  | _ F ih =>
    by_cases hne : F.Nonempty
    · obtain ⟨u, hu, hmin⟩ := Finset.exists_min_image F p hne
      let q : Finset α → ℝ := fun s => p s - p u
      have hq : ∀ s ∈ F, 0 ≤ q s := fun s hs => sub_nonneg.mpr (hmin s hs)
      have hqu : q u = 0 := sub_self _
      have hsubset : F.erase u ⊆ F := Finset.erase_subset _ _
      have him := ih (F.erase u) (Finset.erase_ssubset hu) q
        (fun s hs => hF s (hsubset hs)) ((Finset.vcDim_mono hsubset).trans hd)
        (fun s hs => hq s (hsubset hs))
      have hedge : ∀ i, (∑ s ∈ oneInclusionEdges (F.erase u) i,
          min (q s) (q (insert i s))) = ∑ s ∈ oneInclusionEdges F i,
          min (q s) (q (insert i s)) := by
        intro i
        refine Finset.sum_subset (oneInclusionEdges_mono hsubset i) ?_
        intro s hs hs'
        obtain ⟨hs, hi, his⟩ := mem_oneInclusionEdges.mp hs
        have heq : s = u ∨ insert i s = u := by
          simp only [mem_oneInclusionEdges, Finset.mem_erase, hs, hi, his, not_false_eq_true,
            and_true, true_and, not_and, not_not] at hs'
          tauto
        rcases heq with heq | heq
        · rw [heq, hqu, min_eq_left (hq _ (heq ▸ his))]
        · rw [heq, hqu, min_eq_right (hq _ hs)]
      simp_rw [hedge] at him
      have hmass : ∑ s ∈ F.erase u, q s = (∑ s ∈ F, p s) - (F.card : ℝ) * p u := by
        calc
          _ = ∑ s ∈ F, q s := by rw [← Finset.sum_erase_add _ _ hu, hqu, add_zero]
          _ = _ := by simp [q, Finset.sum_sub_distrib, nsmul_eq_mul]
      rw [hmass] at him
      have hsplit : ∀ i s, min (p s) (p (insert i s)) =
          p u + min (q s) (q (insert i s)) := by
        intro i s
        unfold q
        by_cases hle : p s ≤ p (insert i s)
        · rw [min_eq_left hle, min_eq_left (sub_le_sub_right hle _)]
          ring
        · have hge := le_of_not_ge hle
          rw [min_eq_right hge, min_eq_right (sub_le_sub_right hge _)]
          ring
      simp_rw [hsplit, Finset.sum_add_distrib, Finset.sum_const, nsmul_eq_mul]
      rw [← Finset.sum_mul]
      have hc : (∑ i ∈ coords, ((oneInclusionEdges F i).card : ℝ)) ≤
          (d : ℝ) * (F.card : ℝ) := by
        exact_mod_cast card_oneInclusionEdges_le F coords d hF hd
      have hscale := mul_le_mul_of_nonneg_right hc (hp u hu)
      linarith only [hscale, him]
    · rw [Finset.not_nonempty_iff_eq_empty.mp hne]
      simp [oneInclusionEdges, Finset.nonMemberSubfamily]

end AgnosticVC
