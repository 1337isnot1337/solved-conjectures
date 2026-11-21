import Conjectures.ChenKhareSahiTranslate
import Mathlib.Topology.Algebra.Ring.Real
import Mathlib.Tactic.FunProp
import Mathlib.Tactic.Linarith

namespace ChenKhareSahi

theorem boundary_two_positive (a b : ℕ) (ha : 0<a) (hb : 0<b) :
    realM a b 0 2 1 0 = ((2:ℝ)^a + 2^b)/6 := by
  rw [realM_average]
  simp [Nat.ne_of_gt ha, Nat.ne_of_gt hb]

theorem boundary_one_positive (a : ℕ) (ha : 0<a) :
    realM a 0 0 2 1 0 = ((2:ℝ)^a + 1)/3 := by
  rw [realM_average]
  simp [Nat.ne_of_gt ha]
  ring

theorem boundary_all_positive (a b c : ℕ) (ha : 0<a) (hb : 0<b) (hc : 0<c) :
    realM a b c 2 1 0 = 0 := by
  rw [realM_average]
  simp [Nat.ne_of_gt ha, Nat.ne_of_gt hb, Nat.ne_of_gt hc]

theorem two_power_spread (a b c d : ℕ) (_hab : b ≤ a) (hcd : d ≤ c)
    (hsum : a+b = c+d) (hac : c < a) :
    (2:ℝ)^c + 2^d < 2^a + 2^b := by
  let k := a-c
  have hk : 0 < k := by dsimp [k]; omega
  have ha : a = c+k := by dsimp [k]; omega
  have hd : d = b+k := by omega
  have hbc : b < c := by omega
  have hpow : (2:ℝ)^b < 2^c := pow_lt_pow_right₀ (by norm_num) hbc
  have hkpow : (1:ℝ) < 2^k := one_lt_pow₀ (by norm_num) (by omega)
  have hprod : 0 < ((2:ℝ)^k - 1) * (2^c - 2^b) := mul_pos (by linarith) (by linarith)
  rw [ha, hd, pow_add, pow_add]
  nlinarith


theorem boundary_dominance_strict (a b c d e : ℕ) (hab : b ≤ a) (hcd : d ≤ c) (hde : e ≤ d)
    (hsum : a+b = c+d+e) (hac : c ≤ a) (hne : (a,b,0) ≠ (c,d,e)) :
    0 < realD (a,b,0) (c,d,e) 2 1 0 := by
  have ha : 0 < a := by
    by_contra h
    have hz : a = 0 := by omega
    subst a
    have : b=0 ∧ c=0 ∧ d=0 ∧ e=0 := by omega
    obtain ⟨rfl,rfl,rfl,rfl⟩ := this
    exact hne rfl
  change 0 < realM a b 0 2 1 0 - realM c d e 2 1 0
  by_cases he : 0 < e
  · have hc : 0 < c := by omega
    have hd : 0 < d := by omega
    rw [boundary_all_positive c d e hc hd he]
    by_cases hb : 0 < b
    · rw [boundary_two_positive a b ha hb]
      have h1 : 0 < (2:ℝ)^a := by positivity
      have h2 : 0 < (2:ℝ)^b := by positivity
      linarith
    · have hb0 : b=0 := by omega
      subst b
      rw [boundary_one_positive a ha]
      have h1 : 0 < (2:ℝ)^a := by positivity
      linarith
  · have he0 : e=0 := by omega
    subst e
    have hsum' : a+b = c+d := by omega
    have hac' : c<a := by
      by_contra h
      have heq : a=c ∧ b=d := by omega
      obtain ⟨rfl,rfl⟩ := heq
      exact hne rfl
    have hd : 0 < d := by omega
    have hc : 0 < c := by omega
    have hs := two_power_spread a b c d hab hcd hsum' hac'
    rw [boundary_two_positive c d hc hd]
    by_cases hb : 0 < b
    · rw [boundary_two_positive a b ha hb]
      linarith
    · have hb0 : b=0 := by omega
      subst b
      rw [boundary_one_positive a ha]
      norm_num at hs
      have hp : 0 < (2:ℝ)^a := by positivity
      linarith


def unshiftPartition (p : Partition) (r : ℕ) : Partition := (p.1-r, p.2.1-r, p.2.2-r)

theorem unshift_shift (p : Partition) (r : ℕ) (h : r ≤ p.2.2)
    (hp1 : p.2.1 ≤ p.1) (hp2 : p.2.2 ≤ p.2.1) :
    shiftPartition (unshiftPartition p r) r = p := by
  rcases p with ⟨a,b,c⟩
  simp only [Prod.fst, Prod.snd] at *
  simp only [unshiftPartition, shiftPartition, Prod.mk.injEq]
  omega

theorem unshift_dominates (a b : Partition) (r : ℕ)
    (ha1 : a.2.1 ≤ a.1) (ha2 : a.2.2 ≤ a.2.1)
    (hb1 : b.2.1 ≤ b.1) (hb2 : b.2.2 ≤ b.2.1)
    (hra : r ≤ a.2.2) (hrb : r ≤ b.2.2) (hab : dominates a b) :
    dominates (unshiftPartition a r) (unshiftPartition b r) := by
  apply (dominates_translate (unshiftPartition a r) (unshiftPartition b r) r).mp
  simpa [unshift_shift a r hra ha1 ha2, unshift_shift b r hrb hb1 hb2] using hab

theorem difference_factored_positive (a b : Partition)
    (ha1 : a.2.1 ≤ a.1) (ha2 : a.2.2 ≤ a.2.1)
    (hb1 : b.2.1 ≤ b.1) (hb2 : b.2.2 ≤ b.2.1)
    (hab : dominates a b) (hne : a ≠ b) :
    ∃ a' b' : Partition,
      a'.2.2 = 0 ∧ a'.2.1 ≤ a'.1 ∧ a'.2.2 ≤ a'.2.1 ∧
      b'.2.1 ≤ b'.1 ∧ b'.2.2 ≤ b'.2.1 ∧ dominates a' b' ∧
      (∀ x y z, realD a b x y z = (x*y*z)^a.2.2 * realD a' b' x y z) ∧
      0 < realD a' b' 2 1 0 := by
  have hlast : a.2.2 ≤ b.2.2 := by
    have ⟨hs, h1, h2⟩ := hab
    simp only [degree] at hs
    omega
  let a' := unshiftPartition a a.2.2
  let b' := unshiftPartition b a.2.2
  have hshiftA : shiftPartition a' a.2.2 = a := unshift_shift a _ (by omega) ha1 ha2
  have hshiftB : shiftPartition b' a.2.2 = b := unshift_shift b _ hlast hb1 hb2
  have hdom : dominates a' b' := unshift_dominates a b a.2.2 ha1 ha2 hb1 hb2 (by omega) hlast hab
  have hne' : a' ≠ b' := by
    intro h
    apply hne
    rw [← hshiftA, ← hshiftB, h]
  refine ⟨a',b', ?_, ?_, ?_, ?_, ?_, hdom, ?_, ?_⟩
  · simp [a', unshiftPartition]
  · dsimp [a', unshiftPartition]; omega
  · dsimp [a', unshiftPartition]; omega
  · dsimp [b', unshiftPartition]; omega
  · dsimp [b', unshiftPartition]; omega
  · intro x y z
    calc
      realD a b x y z = realD (shiftPartition a' a.2.2) (shiftPartition b' a.2.2) x y z := by rw [hshiftA, hshiftB]
      _ = (x*y*z)^a.2.2 * realD a' b' x y z := realD_translate a' b' _ x y z
  · have h0 : a'.2.2 = 0 := by simp [a', unshiftPartition]
    have hs1 : a'.2.1 ≤ a'.1 := by dsimp [a', unshiftPartition]; omega
    have ht1 : b'.2.1 ≤ b'.1 := by dsimp [b', unshiftPartition]; omega
    have ht2 : b'.2.2 ≤ b'.2.1 := by dsimp [b', unshiftPartition]; omega
    have ⟨hsum, hfirst, hpair⟩ := hdom
    simp only [degree] at hsum
    have haeq : (a'.1, a'.2.1, 0) = a' := by
      rcases a' with ⟨aa,bb,cc⟩
      simp_all
    have hpos := boundary_dominance_strict a'.1 a'.2.1 b'.1 b'.2.1 b'.2.2 hs1 ht1 ht2 (by omega) hfirst
      (by simpa [haeq, Prod.eta] using hne')
    simpa [haeq, Prod.eta] using hpos


theorem monomial_factored_positive (p : Partition)
    (hp1 : p.2.1 ≤ p.1) (hp2 : p.2.2 ≤ p.2.1) :
    ∃ p' : Partition, p'.2.2 = 0 ∧ p'.2.1 ≤ p'.1 ∧ p'.2.2 ≤ p'.2.1 ∧
      (∀ x y z, realP p x y z = (x*y*z)^p.2.2 * realP p' x y z) ∧
      0 < realP p' 2 1 0 := by
  let p' := unshiftPartition p p.2.2
  have hshift : shiftPartition p' p.2.2 = p := unshift_shift p _ (by omega) hp1 hp2
  have h0 : p'.2.2 = 0 := by simp [p', unshiftPartition]
  have hs : p'.2.1 ≤ p'.1 := by dsimp [p', unshiftPartition]; omega
  refine ⟨p', h0, hs, by omega, ?_, ?_⟩
  · intro x y z
    calc
      realP p x y z = realP (shiftPartition p' p.2.2) x y z := by rw [hshift]
      _ = (x*y*z)^p.2.2 * realP p' x y z := realP_translate p' _ x y z
  · by_cases ha : 0 < p'.1
    · by_cases hb : 0 < p'.2.1
      · change 0 < realM p'.1 p'.2.1 p'.2.2 2 1 0
        rw [h0, boundary_two_positive _ _ ha hb]
        have h1 : 0 < (2:ℝ)^p'.1 := by positivity
        have h2 : 0 < (2:ℝ)^p'.2.1 := by positivity
        linarith
      · have hb0 : p'.2.1 = 0 := by omega
        change 0 < realM p'.1 p'.2.1 p'.2.2 2 1 0
        rw [h0, hb0, boundary_one_positive _ ha]
        have h1 : 0 < (2:ℝ)^p'.1 := by positivity
        linarith
    · have ha0 : p'.1=0 := by omega
      have hb0 : p'.2.1=0 := by omega
      change 0 < realM p'.1 p'.2.1 p'.2.2 2 1 0
      rw [ha0, hb0, h0, realM_average]
      norm_num


theorem fullSemiring_power (n : ℕ) : FullSemiring (fun x y z => (x*y*z)^n) := by
  have h := FullSemiring.monomial (n,n,n) (by simp) (by simp)
  convert h using 1
  funext x y z
  have hp := realP_translate (0,0,0) n x y z
  have hz : realP (0,0,0) x y z = 1 := by norm_num [realP, realM_average]
  simp only [shiftPartition, Nat.zero_add] at hp
  rw [hz, mul_one] at hp
  exact hp.symm

def LeadingFactor (f : SymFun) : Prop :=
  ∃ n : ℕ, ∃ g : SymFun, FullSemiring g ∧ 0 < g 2 1 0 ∧
    ∀ x y z, f x y z = (x*y*z)^n * g x y z

theorem LeadingFactor.mul {f g : SymFun} (hf : LeadingFactor f) (hg : LeadingFactor g) :
    LeadingFactor (fun x y z => f x y z * g x y z) := by
  obtain ⟨n,f',hf',hfp,hfeq⟩ := hf
  obtain ⟨m,g',hg',hgp,hgeq⟩ := hg
  refine ⟨n+m, (fun x y z => f' x y z * g' x y z), FullSemiring.mul hf' hg', mul_pos hfp hgp, ?_⟩
  intro x y z
  dsimp only
  rw [hfeq, hgeq, pow_add]
  ring

theorem LeadingFactor.scale {f : SymFun} (hf : LeadingFactor f) (s : ℝ) (hs : 0 < s) :
    LeadingFactor (fun x y z => s * f x y z) := by
  obtain ⟨n,g,hg,hgp,hfeq⟩ := hf
  refine ⟨n, (fun x y z => s * g x y z), FullSemiring.scale s (le_of_lt hs) hg, mul_pos hs hgp, ?_⟩
  intro x y z
  dsimp only
  rw [hfeq]
  ring

theorem LeadingFactor.add {f g : SymFun} (hf : LeadingFactor f) (hg : LeadingFactor g) :
    LeadingFactor (fun x y z => f x y z + g x y z) := by
  obtain ⟨n,f',hf',hfp,hfeq⟩ := hf
  obtain ⟨m,g',hg',hgp,hgeq⟩ := hg
  by_cases hnm : n ≤ m
  · let k := m-n
    have hm : m = n+k := by dsimp [k]; omega
    let h : SymFun := fun x y z => f' x y z + (x*y*z)^k * g' x y z
    have hh : FullSemiring h := FullSemiring.add hf' (FullSemiring.mul (fullSemiring_power k) hg')
    have hp : 0 < h 2 1 0 := by
      dsimp [h]
      by_cases hk : k=0
      · simp [hk]; linarith
      · simp [hk]; exact hfp
    refine ⟨n,h,hh,hp,?_⟩
    intro x y z
    dsimp only
    rw [hfeq,hgeq,hm,pow_add]
    dsimp [h]
    ring
  · have hmn : m ≤ n := by omega
    let k := n-m
    have hn : n = m+k := by dsimp [k]; omega
    let h : SymFun := fun x y z => (x*y*z)^k * f' x y z + g' x y z
    have hh : FullSemiring h := FullSemiring.add (FullSemiring.mul (fullSemiring_power k) hf') hg'
    have hp : 0 < h 2 1 0 := by
      dsimp [h]
      have hk : k ≠ 0 := by dsimp [k]; omega
      simp [hk]
      exact hgp
    refine ⟨m,h,hh,hp,?_⟩
    intro x y z
    dsimp only
    rw [hfeq,hgeq,hn,pow_add]
    dsimp [h]
    ring


theorem FullSemiring.leading_factor {f : SymFun} (hf : FullSemiring f) :
    f = (fun _ _ _ => 0) ∨ LeadingFactor f := by
  induction hf with
  | zero => exact Or.inl rfl
  | monomial p hp1 hp2 =>
    right
    obtain ⟨p',h0,h1,h2,heq,hpos⟩ := monomial_factored_positive p hp1 hp2
    exact ⟨p.2.2, (fun x y z => realP p' x y z), FullSemiring.monomial p' h1 h2, hpos, heq⟩
  | difference a b ha1 ha2 hb1 hb2 hab =>
    by_cases h : a=b
    · left
      subst b
      funext x y z
      simp [realD]
    · right
      obtain ⟨a',b',h0,ha1',ha2',hb1',hb2',hdom,heq,hpos⟩ :=
        difference_factored_positive a b ha1 ha2 hb1 hb2 hab h
      exact ⟨a.2.2, (fun x y z => realD a' b' x y z),
        FullSemiring.difference a' b' ha1' ha2' hb1' hb2' hdom, hpos, heq⟩
  | @add f g hf hg ihf ihg =>
    rcases ihf with hf0 | hfl <;> rcases ihg with hg0 | hgl
    · left; funext x y z; simp [hf0,hg0]
    · right; simpa [hf0] using hgl
    · right; simpa [hg0] using hfl
    · exact Or.inr (hfl.add hgl)
  | @mul f g hf hg ihf ihg =>
    rcases ihf with hf0 | hfl <;> rcases ihg with hg0 | hgl
    · left; funext x y z; simp [hf0]
    · left; funext x y z; simp [hf0]
    · left; funext x y z; simp [hg0]
    · exact Or.inr (hfl.mul hgl)
  | @scale s f hs hf ih =>
    rcases ih with hf0 | hfl
    · left; funext x y z; simp [hf0]
    · by_cases h : s=0
      · left; funext x y z; simp [h]
      · right
        exact hfl.scale s (lt_of_le_of_ne hs (Ne.symm h))


theorem realP_continuous (p : Partition) :
    Continuous (fun v : ℝ × ℝ × ℝ => realP p v.1 v.2.1 v.2.2) := by
  unfold realP realM
  fun_prop

theorem FullSemiring.continuous {f : SymFun} (hf : FullSemiring f) :
    Continuous (fun v : ℝ × ℝ × ℝ => f v.1 v.2.1 v.2.2) := by
  induction hf with
  | zero => fun_prop
  | monomial p hp1 hp2 => exact realP_continuous p
  | difference a b ha1 ha2 hb1 hb2 hab =>
    change Continuous (fun v : ℝ × ℝ × ℝ => realP a v.1 v.2.1 v.2.2 - realP b v.1 v.2.1 v.2.2)
    exact (realP_continuous a).sub (realP_continuous b)
  | add hf hg ihf ihg => exact ihf.add ihg
  | mul hf hg ihf ihg => exact ihf.mul ihg
  | scale s hs hf ih => exact continuous_const.mul ih

end ChenKhareSahi
