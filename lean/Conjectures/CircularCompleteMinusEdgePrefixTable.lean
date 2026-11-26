import Conjectures.CircularCompleteMinusEdgePrefixCrossings

/-! Consecutive closed row intervals and their literal crossing sites. -/

namespace CircularCompleteMinusEdge

theorem two_gap_prefix_table {m P : ℕ} (p : Fin (m+1) → ℕ)
    (hp : StrictMono p) (hG : ∀ j, runStep p j = 1 ∨ runStep p j = P) (hP : 2 ≤ P) :
    let G := edgeStepPrefix p false (Fin.last m)
    let K := edgeStepPrefix p true (Fin.last m)
    ∃ lo hi : ℕ → ℕ, lo 0 = 0 ∧ hi G = K ∧
      (∀ g ≤ G, lo g ≤ hi g ∧
        ∀ k, (∃ i, edgeStepPrefix p false i = g ∧ edgeStepPrefix p true i = k) ↔
          lo g ≤ k ∧ k ≤ hi g) ∧
      (∀ g < G, hi g = lo (g+1)) ∧
      (∀ q : ℕ, (∃ i, p i = q) ↔
        ∃ g k, g ≤ G ∧ lo g ≤ k ∧ k ≤ hi g ∧ q = p 0 + g + P*k) ∧
      (∀ q : ℕ, (∃ i : Fin m, p i.castSucc = q ∧ p i.succ = q+1) ↔
        ∃ g < G, q = p 0+g+P*hi g) := by
  classical
  let G := edgeStepPrefix p false (Fin.last m)
  let K := edgeStepPrefix p true (Fin.last m)
  change ∃ lo hi : ℕ → ℕ, lo 0 = 0 ∧ hi G = K ∧ _ at *
  have hh : ∀ g : ℕ, ∃ l r : ℕ, g ≤ G → l ≤ r ∧
      ∀ k, (∃ i, edgeStepPrefix p false i = g ∧ edgeStepPrefix p true i = k) ↔
        l ≤ k ∧ k ≤ r := by
    intro g
    by_cases hg : g ≤ G
    · obtain ⟨l,r,hl,hr⟩ := exact_jump_interval_at_short_count p hp hG hP g hg
      exact ⟨l,r,fun _ => ⟨hl,hr⟩⟩
    · exact ⟨0,0,fun e => (hg e).elim⟩
  choose lo hi hI using hh
  have hL : lo 0 = 0 := by
    have hzero := ((hI 0 (Nat.zero_le G)).2 0).mp
      ⟨0,edgeStepPrefix_zero p false,edgeStepPrefix_zero p true⟩
    omega
  have hR : hi G = K := by
    have hI' := (hI G le_rfl).2
    have hlow := (hI' K).mp ⟨Fin.last m,rfl,rfl⟩
    obtain ⟨a,_,ha⟩ := (hI' (hi G)).mpr ⟨(hI G le_rfl).1,le_rfl⟩
    have hhigh := edgeStepPrefix_monotone p true (Fin.le_last a)
    change edgeStepPrefix p true a ≤ K at hhigh
    omega
  have hCross (g : ℕ) (hg : g < G) :
      ∃ i : Fin m, edgeStepPrefix p false i.castSucc = g ∧
        edgeStepPrefix p true i.castSucc = hi g ∧
        hi g = lo (g+1) ∧ runStep p i = 1 := by
    obtain ⟨i,h0,h1,hs,hmax,hmin,hstep⟩ := crossing_adjacent_preserves_jump p g hg
    have hBg := (hI g hg.le).2
    have hBg' := (hI (g+1) hg).2
    obtain ⟨j,hjg,hj⟩ := (hBg (hi g)).mpr ⟨(hI g hg.le).1,le_rfl⟩
    obtain ⟨a,hag,ha⟩ := (hBg' (lo (g+1))).mpr ⟨le_rfl,(hI (g+1) hg).1⟩
    have l := edgeStepPrefix_monotone p true (hmax j hjg)
    have r := edgeStepPrefix_monotone p true (hmin a hag)
    have e := (hBg _).mp ⟨i.castSucc,h0,rfl⟩
    have e' := (hBg' _).mp ⟨i.succ,h1,rfl⟩
    exact ⟨i,h0,by omega,by omega,hstep⟩
  refine ⟨lo,hi,hL,hR,hI,fun g hg => ?_,?_,?_⟩
  · obtain ⟨_,_,_,h,_⟩ := hCross g hg
    exact h
  · intro q
    constructor
    · rintro ⟨i,rfl⟩
      let g := edgeStepPrefix p false i
      let k := edgeStepPrefix p true i
      have hg : g ≤ G := edgeStepPrefix_monotone p false (Fin.le_last i)
      obtain ⟨hl,hr⟩ := ((hI g hg).2 k).mp ⟨i,rfl,rfl⟩
      exact ⟨g,k,hg,hl,hr,(exact_two_gap_prefix_position p hp hG hP i).2⟩
    · rintro ⟨g,k,hg,hl,hr,hq⟩
      obtain ⟨i,hg',hk'⟩ := ((hI g hg).2 k).mpr ⟨hl,hr⟩
      exact ⟨i,by simpa [hg',hk',← hq] using (exact_two_gap_prefix_position p hp hG hP i).2⟩
  · intro q
    constructor
    · rintro ⟨j,rfl,hj⟩
      let g := edgeStepPrefix p false j.castSucc
      have hshort : runStep p j = 1 := by unfold runStep; omega
      have hsucc : edgeStepPrefix p false j.succ = g+1 := by
        simp [edgeStepPrefix_succ,hshort,g]
      have hg : g < G := by
        have hn := edgeStepPrefix_monotone p false (Fin.le_last j.succ)
        change edgeStepPrefix p false j.succ ≤ G at hn
        omega
      obtain ⟨i,hi₀,hi₁,_,hiS⟩ := hCross g hg
      have hJ : j = i := by
        by_contra hn
        rcases lt_or_gt_of_ne hn with h|h
        · have hc : j.succ ≤ i.castSucc := by change j.val+1 ≤ i.val; exact h
          have hd := edgeStepPrefix_monotone p false hc
          rw [hsucc,hi₀] at hd
          omega
        · have hc : i.succ ≤ j.castSucc := by change i.val+1 ≤ j.val; exact h
          have hd := edgeStepPrefix_monotone p false hc
          have e : edgeStepPrefix p false i.succ = g+1 := by simp [edgeStepPrefix_succ,hi₀,hiS]
          rw [e] at hd
          change g+1 ≤ g at hd
          omega
      refine ⟨g,hg,?_⟩
      rw [hJ]
      simpa [hi₀,hi₁] using (exact_two_gap_prefix_position p hp hG hP i.castSucc).2
    · rintro ⟨g,hg,rfl⟩
      obtain ⟨i,h0,h1,_,hs⟩ := hCross g hg
      have hq : p i.castSucc = p 0+g+P*hi g := by
        simpa [h0,h1] using (exact_two_gap_prefix_position p hp hG hP i.castSucc).2
      have hle : p i.castSucc ≤ p i.succ := (hp (show i.castSucc < i.succ from Nat.lt_succ_self _)).le
      unfold runStep at hs
      exact ⟨i,hq,by omega⟩

end CircularCompleteMinusEdge
