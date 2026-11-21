import Conjectures.JohnsonPfaffianSwap
set_option linter.unusedSimpArgs false
namespace JohnsonPfaffian
open GilmoreCrossingNesting

theorem swap_cross_both_right (i b d : ℕ) (hb : i+1<b) (hd : i+1<d) (hbd : b≠d) :
    edgeCross (swapEdge i (i,b)) (swapEdge i (i+1,d)) + edgeCross (i,b) (i+1,d) = 1 := by
  have hbi : b ≠ i := by omega
  have hbi1 : b ≠ i+1 := by omega
  have hdi : d ≠ i := by omega
  have hdi1 : d ≠ i+1 := by omega
  have he : swapEdge i (i,b) = (i+1,b) := by
    simp [swapEdge,swapVertex,hbi,hbi1,min_eq_left (by omega : i+1 ≤ b),max_eq_right (by omega : i+1 ≤ b)]
  have hf : swapEdge i (i+1,d) = (i,d) := by
    simp [swapEdge,swapVertex,hdi,hdi1,min_eq_left (by omega : i ≤ d),max_eq_right (by omega : i ≤ d)]
  rw [he,hf]
  unfold edgeCross crosses
  simp only [Prod.fst,Prod.snd]
  split_ifs <;> omega

theorem swap_cross_both_left (i a c : ℕ) (ha : a < i) (hc : c < i) (hac : a≠c) :
    edgeCross (swapEdge i (a,i)) (swapEdge i (c,i+1)) + edgeCross (a,i) (c,i+1) = 1 := by
  have he : swapEdge i (a,i) = (a,i+1) := by
    simp [swapEdge,swapVertex,show a≠i by omega,show a≠i+1 by omega,min_eq_left (by omega : a ≤ i+1),max_eq_right (by omega : a ≤ i+1)]
  have hf : swapEdge i (c,i+1) = (c,i) := by
    simp [swapEdge,swapVertex,show c≠i by omega,show c≠i+1 by omega,min_eq_left (by omega : c ≤ i),max_eq_right (by omega : c ≤ i)]
  rw [he,hf]
  unfold edgeCross crosses
  simp only [Prod.fst,Prod.snd]
  split_ifs <;> omega

theorem swap_cross_straddle (i a d : ℕ) (ha : a < i) (hd : i+1<d) :
    edgeCross (swapEdge i (a,i)) (swapEdge i (i+1,d)) + edgeCross (a,i) (i+1,d) = 1 := by
  have he : swapEdge i (a,i) = (a,i+1) := by
    simp [swapEdge,swapVertex,show a≠i by omega,show a≠i+1 by omega,min_eq_left (by omega : a ≤ i+1),max_eq_right (by omega : a ≤ i+1)]
  have hf : swapEdge i (i+1,d) = (i,d) := by
    simp [swapEdge,swapVertex,show d≠i by omega,show d≠i+1 by omega,min_eq_left (by omega : i ≤ d),max_eq_right (by omega : i ≤ d)]
  rw [he,hf]
  unfold edgeCross crosses
  simp only [Prod.fst,Prod.snd]
  split_ifs <;> omega

theorem swap_cross_nested (i b c : ℕ) (hb : i+1<b) (hc : c < i) :
    edgeCross (swapEdge i (i,b)) (swapEdge i (c,i+1)) + edgeCross (i,b) (c,i+1) = 1 := by
  have he : swapEdge i (i,b) = (i+1,b) := by
    simp [swapEdge,swapVertex,show b≠i by omega,show b≠i+1 by omega,min_eq_left (by omega : i+1 ≤ b),max_eq_right (by omega : i+1 ≤ b)]
  have hf : swapEdge i (c,i+1) = (c,i) := by
    simp [swapEdge,swapVertex,show c≠i by omega,show c≠i+1 by omega,min_eq_left (by omega : c ≤ i),max_eq_right (by omega : c ≤ i)]
  rw [he,hf]
  unfold edgeCross crosses
  simp only [Prod.fst,Prod.snd]
  split_ifs <;> omega

theorem swap_cross_toggles (i : ℕ) (e f : ℕ × ℕ)
    (he : e.1<e.2) (hf : f.1<f.2)
    (hdis : ([e.1,e.2] : List ℕ).Disjoint [f.1,f.2])
    (heI : e.1=i ∨ e.2=i) (hfI : f.1=i+1 ∨ f.2=i+1) :
    edgeCross (swapEdge i e) (swapEdge i f) + edgeCross e f = 1 := by
  rcases e with ⟨a,b⟩
  rcases f with ⟨c,d⟩
  simp only [Prod.fst,Prod.snd] at *
  have hdis' := List.disjoint_left.mp hdis
  have h1 : a ≠ c := by intro h; exact (hdis' (by simp : a ∈ [a,b])) (by simp [h])
  have h2 : a ≠ d := by intro h; exact (hdis' (by simp : a ∈ [a,b])) (by simp [h])
  have h3 : b ≠ c := by intro h; exact (hdis' (by simp : b ∈ [a,b])) (by simp [h])
  have h4 : b ≠ d := by intro h; exact (hdis' (by simp : b ∈ [a,b])) (by simp [h])
  rcases heI with heI | heI <;> rcases hfI with hfI | hfI
  · subst a; subst c
    exact swap_cross_both_right i b d (by omega) (by omega) h4
  · subst a; subst d
    exact swap_cross_nested i b c (by omega) (by omega)
  · subst b; subst c
    exact swap_cross_straddle i a d (by omega) (by omega)
  · subst b; subst d
    exact swap_cross_both_left i a c (by omega) (by omega) h1

theorem crossing_increment_left (i b c d : ℕ) (hb : i+1<b) (hcd : c<d)
    (hc0 : c≠i) (hc1 : c≠i+1) (hd0 : d≠i) (hd1 : d≠i+1) :
    edgeCross (i+1,b) (c,d) = edgeCross (i,b) (c,d) := by
  unfold edgeCross crosses
  simp only [Prod.fst,Prod.snd]
  split_ifs <;> omega

theorem crossing_increment_right (a i c d : ℕ) (ha : a < i) (hcd : c<d)
    (hc0 : c≠i) (hc1 : c≠i+1) (hd0 : d≠i) (hd1 : d≠i+1) :
    edgeCross (a,i+1) (c,d) = edgeCross (a,i) (c,d) := by
  unfold edgeCross crosses
  simp only [Prod.fst,Prod.snd]
  split_ifs <;> omega

theorem swapEdge_untouched (i : ℕ) (e : ℕ × ℕ) (he : e.1<e.2)
    (h1 : e.1≠i) (h2 : e.1≠i+1) (h3 : e.2≠i) (h4 : e.2≠i+1) : swapEdge i e = e := by
  rcases e with ⟨a,b⟩
  simp only [Prod.fst,Prod.snd] at *
  simp [swapEdge,swapVertex,h1,h2,h3,h4,min_eq_left he.le,max_eq_right he.le]
theorem swap_cross_one (i : ℕ) (e f : ℕ × ℕ)
    (he : e.1<e.2) (hf : f.1<f.2)
    (h1 : f.1≠i) (h2 : f.1≠i+1) (h3 : f.2≠i) (h4 : f.2≠i+1) :
    edgeCross (swapEdge i e) (swapEdge i f) = edgeCross e f := by
  rw [swapEdge_untouched i f hf h1 h2 h3 h4]
  rcases e with ⟨a,b⟩
  rcases f with ⟨c,d⟩
  simp only [Prod.fst,Prod.snd] at *
  by_cases ha : a=i
  · subst a
    by_cases hb : b=i+1
    · subst b
      simp [swapEdge,swapVertex, min_eq_right (by omega : i ≤ i+1), max_eq_left (by omega : i ≤ i+1)]
    · have hb0 : b≠i := by omega
      have hb1 : i+1<b := by omega
      have hs : swapEdge i (i,b) = (i+1,b) := by
        simp [swapEdge,swapVertex,hb0,hb,min_eq_left (by omega : i+1 ≤ b),max_eq_right (by omega : i+1 ≤ b)]
      rw [hs]
      exact crossing_increment_left i b c d hb1 hf h1 h2 h3 h4
  · by_cases ha1 : a=i+1
    · subst a
      have hb0 : b≠i := by omega
      have hb1 : b≠i+1 := by omega
      have hs : swapEdge i (i+1,b) = (i,b) := by
        simp [swapEdge,swapVertex,hb0,hb1,min_eq_left (by omega : i ≤ b),max_eq_right (by omega : i ≤ b)]
      rw [hs]
      exact (crossing_increment_left i b c d (by omega) hf h1 h2 h3 h4).symm
    · by_cases hb : b=i
      · subst b
        have hs : swapEdge i (a,i) = (a,i+1) := by
          simp [swapEdge,swapVertex,ha,ha1,min_eq_left (by omega : a ≤ i+1),max_eq_right (by omega : a ≤ i+1)]
        rw [hs]
        exact crossing_increment_right a i c d he hf h1 h2 h3 h4
      · by_cases hb1 : b=i+1
        · subst b
          have hs : swapEdge i (a,i+1) = (a,i) := by
            simp [swapEdge,swapVertex,ha,ha1,min_eq_left (by omega : a ≤ i),max_eq_right (by omega : a ≤ i)]
          rw [hs]
          exact (crossing_increment_right a i c d (by omega) hf h1 h2 h3 h4).symm
        · rw [swapEdge_untouched i (a,b) he ha ha1 hb hb1]
theorem swap_crossingCount_pair (i : ℕ) (e f : ℕ × ℕ) (R : List (ℕ × ℕ))
    (he : e.1<e.2) (hf : f.1<f.2)
    (hdis : ([e.1,e.2] : List ℕ).Disjoint [f.1,f.2])
    (heI : e.1=i ∨ e.2=i) (hfI : f.1=i+1 ∨ f.2=i+1)
    (hR : ∀ g ∈ R, g.1<g.2 ∧ g.1≠i ∧ g.1≠i+1 ∧ g.2≠i ∧ g.2≠i+1) :
    (crossingCount ((e::f::R).map (swapEdge i)) + crossingCount (e::f::R)) % 2 = 1 := by
  have hmap : R.map (swapEdge i) = R := by
    conv_rhs => rw [← List.map_id R]
    apply List.map_congr_left
    intro g hg
    obtain ⟨ho,h1,h2,h3,h4⟩ := hR g hg
    exact swapEdge_untouched i g ho h1 h2 h3 h4
  have heq (x : ℕ × ℕ) (hx : x.1<x.2) :
      (R.map (edgeCross (swapEdge i x))).sum = (R.map (edgeCross x)).sum := by
    apply congrArg List.sum
    apply List.map_congr_left
    intro g hg
    obtain ⟨ho,h1,h2,h3,h4⟩ := hR g hg
    have h := swap_cross_one i x g hx ho h1 h2 h3 h4
    rw [swapEdge_untouched i g ho h1 h2 h3 h4] at h
    exact h
  have htoggle := swap_cross_toggles i e f he hf hdis heI hfI
  simp only [List.map_cons, crossingCount, List.sum_cons]
  rw [hmap, heq e he, heq f hf]
  omega
theorem swap_matching_crossing_parity (u i : ℕ) (hi : i+1<2*u)
    (M : {M // M ∈ matchingFinset u}) (hpair : (i,i+1) ∉ M.val) :
    (crossingCount (swapMatching u i hi M).val + crossingCount M.val) % 2 = 1 := by
  obtain ⟨e,he,hei⟩ := matching_edge_at_vertex u i M.val M.property (by omega)
  obtain ⟨f,hf,hfi⟩ := matching_edge_at_vertex u (i+1) M.val M.property hi
  have heord := (valid_matching_edges u M.val M.property e he).1
  have hford := (valid_matching_edges u M.val M.property f hf).1
  have hef : e ≠ f := by
    intro h; subst f
    rcases e with ⟨a,b⟩
    simp only [Prod.fst,Prod.snd] at *
    have : (a,b) = (i,i+1) := by rcases hei with h | h <;> rcases hfi with h' | h' <;> simp_all
    exact hpair (this ▸ he)
  have hdis := matching_edges_disjoint u M.val M.property e f he hf hef
  have hsort := ((mem_matchingFinset (u := u) (arcs := M.val)).mp M.property).2.2
  have hnodup : M.val.Nodup := List.nodup_iff_pairwise_ne.mpr (hsort.imp (by intro a b h hab; subst b; omega))
  let R := (M.val.erase e).erase f
  have hf' : f ∈ M.val.erase e := (List.mem_erase_of_ne hef.symm).mpr hf
  have hp : M.val.Perm (e::f::R) :=
    (List.perm_cons_erase he).trans ((List.perm_cons_erase hf').cons e)
  have hR : ∀ g ∈ R, g.1<g.2 ∧ g.1≠i ∧ g.1≠i+1 ∧ g.2≠i ∧ g.2≠i+1 := by
    intro g hg
    have hg1 := (List.Nodup.mem_erase_iff (hnodup.erase e)).mp hg
    have hg2 := (List.Nodup.mem_erase_iff hnodup).mp hg1.2
    have hgM := hg2.2
    have hge := matching_edges_disjoint u M.val M.property g e hgM he hg2.1
    have hgf := matching_edges_disjoint u M.val M.property g f hgM hf hg1.1
    have hge' := List.disjoint_left.mp hge
    have hgf' := List.disjoint_left.mp hgf
    have hie : i ∈ ([e.1,e.2] : List ℕ) := by simpa [eq_comm] using hei
    have hif : i+1 ∈ ([f.1,f.2] : List ℕ) := by simpa [eq_comm] using hfi
    have hga : g.1≠i := by intro h; apply hge' _ hie; simp [h]
    have hgb : g.2≠i := by intro h; apply hge' _ hie; simp [h]
    have hgc : g.1≠i+1 := by intro h; apply hgf' _ hif; simp [h]
    have hgd : g.2≠i+1 := by intro h; apply hgf' _ hif; simp [h]
    exact ⟨(valid_matching_edges u M.val M.property g hgM).1,hga,hgc,hgb,hgd⟩
  have hpar := swap_crossingCount_pair i e f R heord hford hdis hei hfi hR
  rw [← crossingCount_perm hp] at hpar
  have hperms : (swapMatching u i hi M).val.Perm ((e::f::R).map (swapEdge i)) :=
    (swapMatching_spec u i hi M).trans (hp.map _)
  rw [← crossingCount_perm hperms] at hpar
  exact hpar
theorem swap_matching_sign (u i : ℕ) (hi : i+1<2*u)
    (M : {M // M ∈ matchingFinset u}) (hpair : (i,i+1) ∉ M.val) :
    (-1:ℝ)^(pairCount crossContribution (swapMatching u i hi M).val) =
      -((-1:ℝ)^(pairCount crossContribution M.val)) := by
  have hpar := swap_matching_crossing_parity u i hi M hpair
  have ⟨_,horig,hsorig⟩ := (mem_matchingFinset (u := u) (arcs := M.val)).mp M.property
  have ⟨_,hnew,hsnew⟩ := (mem_matchingFinset (u := u) (arcs := (swapMatching u i hi M).val)).mp (swapMatching u i hi M).property
  rw [← crossingCount_eq_pairCount _ hnew hsnew, ← crossingCount_eq_pairCount _ horig hsorig]
  by_cases h : Even (crossingCount M.val)
  · have hnewodd : Odd (crossingCount (swapMatching u i hi M).val) := by
      rw [Nat.odd_iff]; have := Nat.even_iff.mp h; omega
    rw [hnewodd.neg_one_pow, h.neg_one_pow]
  · have holdodd : Odd (crossingCount M.val) := by
      rw [Nat.odd_iff]; have := Nat.mod_lt (crossingCount M.val) (by decide : 0<2)
      have hn : crossingCount M.val % 2 ≠ 0 := by simpa [Nat.even_iff] using h
      omega
    have hneweven : Even (crossingCount (swapMatching u i hi M).val) := by
      rw [Nat.even_iff]; have := Nat.odd_iff.mp holdodd
      have := Nat.mod_lt (crossingCount (swapMatching u i hi M).val) (by decide : 0<2)
      omega
    rw [hneweven.neg_one_pow, holdodd.neg_one_pow]; norm_num
theorem swapMatching_edgeProduct (u i : ℕ) (hi : i+1<2*u) (w : ℕ → ℕ → ℝ)
    (hw : ∀ e : ℕ × ℕ, e.1<e.2 → w (swapEdge i e).1 (swapEdge i e).2 = w e.1 e.2)
    (M : {M // M ∈ matchingFinset u}) :
    edgeProduct w (swapMatching u i hi M).val = edgeProduct w M.val := by
  unfold edgeProduct
  rw [((swapMatching_spec u i hi M).map (fun e => w e.1 e.2)).prod_eq]
  rw [List.map_map]
  apply congrArg List.prod
  apply List.map_congr_left
  intro e he
  exact hw e (valid_matching_edges u M.val M.property e he).1

theorem swapMatching_avoids_pair (u i : ℕ) (hi : i+1<2*u)
    (M : {M // M ∈ matchingFinset u}) (hpair : (i,i+1) ∉ M.val) :
    (i,i+1) ∉ (swapMatching u i hi M).val := by
  intro hh
  have hm := (swapMatching_spec u i hi M).mem_iff.mp hh
  obtain ⟨e,he,heq⟩ := List.mem_map.mp hm
  have ho := (valid_matching_edges u M.val M.property e he).1
  have hs : swapEdge i (i,i+1) = (i,i+1) := by simp [swapEdge,swapVertex]
  have heq' := congrArg (swapEdge i) heq
  rw [swapEdge_involutive i e ho, hs] at heq'
  exact hpair (heq' ▸ he)
theorem adjacent_swap_matching_cancellation (u i : ℕ) (hi : i+1<2*u) (w : ℕ → ℕ → ℝ)
    (hw : ∀ e : ℕ × ℕ, e.1<e.2 → w (swapEdge i e).1 (swapEdge i e).2 = w e.1 e.2) :
    ∑ M ∈ (matchingFinset u).filter (fun M => (i,i+1) ∉ M),
      (-1:ℝ)^(pairCount crossContribution M) * edgeProduct w M = 0 := by
  classical
  apply Finset.sum_involution (fun M hM => (swapMatching u i hi ⟨M,(Finset.mem_filter.mp hM).1⟩).val)
  · intro M hM
    have hp := (Finset.mem_filter.mp hM).2
    have hs := swap_matching_sign u i hi ⟨M,(Finset.mem_filter.mp hM).1⟩ hp
    have hw' := swapMatching_edgeProduct u i hi w hw ⟨M,(Finset.mem_filter.mp hM).1⟩
    simp only at hs hw'
    rw [hs,hw']
    ring
  · intro M hM _ hh
    have hn := swapMatching_no_fixed u i hi ⟨M,(Finset.mem_filter.mp hM).1⟩ (Finset.mem_filter.mp hM).2
    apply hn
    exact Subtype.ext hh
  · intro M hM
    exact congrArg Subtype.val (swapMatching_involutive u i hi ⟨M,(Finset.mem_filter.mp hM).1⟩)
  · intro M hM
    apply Finset.mem_filter.mpr
    exact ⟨(swapMatching u i hi ⟨M,(Finset.mem_filter.mp hM).1⟩).property,
      swapMatching_avoids_pair u i hi ⟨M,(Finset.mem_filter.mp hM).1⟩ (Finset.mem_filter.mp hM).2⟩
theorem twin_rows_swap_weight (i : ℕ) (w : ℕ → ℕ → ℝ)
    (htwin : ∀ k, k≠i → k≠i+1 →
      w (min i k) (max i k) = w (min (i+1) k) (max (i+1) k)) :
    ∀ e : ℕ × ℕ, e.1<e.2 → w (swapEdge i e).1 (swapEdge i e).2 = w e.1 e.2 := by
  intro ⟨a,b⟩ he
  simp only [Prod.fst,Prod.snd] at he
  by_cases ha : a=i
  · subst a
    by_cases hb : b=i+1
    · subst b; simp [swapEdge,swapVertex]
    · have hb0 : b≠i := by omega
      have hb1 : i+1<b := by omega
      have hs : swapEdge i (i,b) = (i+1,b) := by
        simp [swapEdge,swapVertex,hb0,hb,min_eq_left (by omega : i+1 ≤ b),max_eq_right (by omega : i+1 ≤ b)]
      rw [hs]
      simpa [min_eq_left (by omega : i ≤ b),max_eq_right (by omega : i ≤ b),
        min_eq_left hb1.le,max_eq_right hb1.le] using (htwin b hb0 hb).symm
  · by_cases ha1 : a=i+1
    · subst a
      have hb0 : b≠i := by omega
      have hb1 : b≠i+1 := by omega
      have hs : swapEdge i (i+1,b) = (i,b) := by
        simp [swapEdge,swapVertex,hb0,hb1,min_eq_left (by omega : i ≤ b),max_eq_right (by omega : i ≤ b)]
      rw [hs]
      simpa [min_eq_left (by omega : i ≤ b),max_eq_right (by omega : i ≤ b),
        min_eq_left (by omega : i+1 ≤ b),max_eq_right (by omega : i+1 ≤ b)] using htwin b hb0 hb1
    · by_cases hb : b=i
      · subst b
        have hs : swapEdge i (a,i) = (a,i+1) := by
          simp [swapEdge,swapVertex,ha,ha1,min_eq_left (by omega : a ≤ i+1),max_eq_right (by omega : a ≤ i+1)]
        rw [hs]
        simpa [min_eq_right (by omega : a ≤ i),max_eq_left (by omega : a ≤ i),
          min_eq_right (by omega : a ≤ i+1),max_eq_left (by omega : a ≤ i+1)] using (htwin a ha ha1).symm
      · by_cases hb1 : b=i+1
        · subst b
          have hs : swapEdge i (a,i+1) = (a,i) := by
            simp [swapEdge,swapVertex,ha,ha1,min_eq_left (by omega : a ≤ i),max_eq_right (by omega : a ≤ i)]
          rw [hs]
          simpa [min_eq_right (by omega : a ≤ i),max_eq_left (by omega : a ≤ i),
            min_eq_right (by omega : a ≤ i+1),max_eq_left (by omega : a ≤ i+1)] using htwin a ha ha1
        · rw [swapEdge_untouched i (a,b) he ha ha1 hb hb1]

theorem twin_rows_matching_cancellation (u i : ℕ) (hi : i+1<2*u) (w : ℕ → ℕ → ℝ)
    (htwin : ∀ k, k≠i → k≠i+1 →
      w (min i k) (max i k) = w (min (i+1) k) (max (i+1) k)) :
    ∑ M ∈ (matchingFinset u).filter (fun M => (i,i+1) ∉ M),
      (-1:ℝ)^(pairCount crossContribution M) * edgeProduct w M = 0 :=
  adjacent_swap_matching_cancellation u i hi w (twin_rows_swap_weight i w htwin)
end JohnsonPfaffian
