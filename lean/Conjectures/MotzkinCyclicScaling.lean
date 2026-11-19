import Conjectures.MotzkinCyclicGeneral

/-! Exact scaling of the cyclic independence number when both jumps and the
modulus share a factor. The value is connected to actual finite independent
sets by finite_cyclic_theorem_all. -/
namespace Motzkin.Cyclic

theorem score_scale (g M a b t : ℕ) [NeZero g] [NeZero M] :
    score (t:ZMod (g*M)) ((g*a:ℕ):ZMod (g*M)) ((g*b:ℕ):ZMod (g*M)) =
      g*score (t:ZMod M) (a:ZMod M) (b:ZMod M) := by
  rw [score_natCast,score_natCast]
  have ha : (t*(g*a))%(g*M)=g*((t*a)%M) := by
    rw [show t*(g*a)=g*(t*a) by ring,Nat.mul_mod_mul_left]
  have hb : (t*(g*b))%(g*M)=g*((t*b)%M) := by
    rw [show t*(g*b)=g*(t*b) by ring,Nat.mul_mod_mul_left]
  rw [ha,hb,← Nat.mul_sub_left_distrib,← Nat.mul_sub_left_distrib]
  simp only [Nat.mul_min_mul_left]

theorem independence_scale (g M a b : ℕ) [NeZero g] [NeZero M] :
    independence ((g*a:ℕ):ZMod (g*M)) ((g*b:ℕ):ZMod (g*M)) =
      g*independence (a:ZMod M) (b:ZMod M) := by
  apply le_antisymm
  · apply Finset.sup_le
    intro t _
    have ht := score_scale g M a b t.val
    simp only [ZMod.natCast_zmod_val] at ht
    rw [ht]
    exact Nat.mul_le_mul_left g (score_le_independence (a:ZMod M) (b:ZMod M) (t.val:ZMod M))
  · obtain ⟨t,ht⟩ := exists_score_eq_independence (a:ZMod M) (b:ZMod M)
    have hscale := score_scale g M a b t.val
    simp only [ZMod.natCast_zmod_val] at hscale
    rw [ht] at hscale
    rw [← hscale]
    exact score_le_independence _ _ _

noncomputable def independenceNumber (N a b : ℕ) : ℕ :=
  if h : 0 < N then
    @independence N ⟨h.ne'⟩ (a:ZMod N) (b:ZMod N)
  else 0

theorem independenceNumber_eq (N a b : ℕ) [NeZero N] :
    independenceNumber N a b=independence (a:ZMod N) (b:ZMod N) := by
  simp only [independenceNumber,dif_pos (NeZero.pos N)]

theorem independenceNumber_scale (g M a b : ℕ) (hg : 0 < g) (hM : 0 < M) :
    independenceNumber (g*M) (g*a) (g*b)=g*independenceNumber M a b := by
  letI : NeZero g := ⟨hg.ne'⟩
  letI : NeZero M := ⟨hM.ne'⟩
  rw [independenceNumber_eq,independenceNumber_eq]
  exact independence_scale g M a b

/-- The stated gcd reduction, applied to the actual integer optimum. -/
theorem independenceNumber_gcd (N a b : ℕ) (hN : 0 < N) :
    let g := Nat.gcd N (Nat.gcd a b)
    independenceNumber N a b = g*independenceNumber (N/g) (a/g) (b/g) := by
  let g := Nat.gcd N (Nat.gcd a b)
  have hg : 0 < g := Nat.gcd_pos_of_pos_left (Nat.gcd a b) hN
  have hgN : g ∣ N := Nat.gcd_dvd_left _ _
  have hga : g ∣ a := dvd_trans (Nat.gcd_dvd_right N (Nat.gcd a b)) (Nat.gcd_dvd_left a b)
  have hgb : g ∣ b := dvd_trans (Nat.gcd_dvd_right N (Nat.gcd a b)) (Nat.gcd_dvd_right a b)
  have hM : 0 < N/g := Nat.div_pos (Nat.gcd_le_left (Nat.gcd a b) hN) hg
  have h := independenceNumber_scale g (N/g) (a/g) (b/g) hg hM
  rw [Nat.mul_div_cancel' hgN,Nat.mul_div_cancel' hga,Nat.mul_div_cancel' hgb] at h
  exact h

theorem reduced_gcd_eq_one (N a b : ℕ) (hN : 0 < N) :
    let g := Nat.gcd N (Nat.gcd a b)
    Nat.gcd (N/g) (Nat.gcd (a/g) (b/g))=1 := by
  let g := Nat.gcd N (Nat.gcd a b)
  have hg : 0 < g := Nat.gcd_pos_of_pos_left (Nat.gcd a b) hN
  have hgN : g ∣ N := Nat.gcd_dvd_left _ _
  have hgd : g ∣ Nat.gcd a b := Nat.gcd_dvd_right _ _
  have hga : g ∣ a := dvd_trans hgd (Nat.gcd_dvd_left a b)
  have hgb : g ∣ b := dvd_trans hgd (Nat.gcd_dvd_right a b)
  change Nat.gcd (N/g) (Nat.gcd (a/g) (b/g))=1
  rw [Nat.gcd_div hga hgb,Nat.gcd_div hgN hgd]
  exact Nat.div_self hg

end Motzkin.Cyclic
