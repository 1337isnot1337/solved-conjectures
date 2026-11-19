import Conjectures.LonelinessModularWitness
import Mathlib.Data.Finset.Max
import Mathlib.Data.Finset.Card

/-!
# Folded unit actions on finite modular supports

These lemmas justify lossless support normalization before the modular
search. Multiplication by a checked unit permutes the nonzero folded
residues, including their exact support cardinality.
-/

namespace Loneliness.Modular

theorem folded_eq_self {m a : ℕ} (ha : 2*a ≤ m) : folded m a = a := by
  by_cases hm : m=0
  · have hz : a=0 := by omega
    simp [hm,hz,folded]
  have hlt : a<m := by omega
  unfold folded
  rw [Nat.mod_eq_of_lt hlt]
  omega

theorem folded_eq_zero_iff {m a : ℕ} (hm : 0<m) : folded m a=0 ↔ a%m=0 := by
  have hlt := Nat.mod_lt a hm
  unfold folded
  omega

theorem folded_one {m : ℕ} (hm : 2≤m) : folded m 1=1 :=
  folded_eq_self (by omega)

theorem folded_action_comp (m u v a : ℕ) (hm : 0<m) :
    folded m (v*folded m (u*a))=folded m ((v*u)*a) := by
  rw [folded_mul_folded m (u*a) v hm, Nat.mul_assoc]

theorem folded_unit_cancel_folded {m u v : ℕ} (hm : 0<m)
    (hunit : (u*v)%m=1%m) (a : ℕ) :
    folded m (v*folded m (u*a))=folded m a := by
  rw [folded_mul_folded m (u*a) v hm,folded_unit_cancel hunit]

theorem folded_unit_injective_on {m u v : ℕ} (hm : 0<m)
    (hunit : (u*v)%m=1%m) {a b : ℕ}
    (ha : 2*a≤m) (hb : 2*b≤m)
    (heq : folded m (u*a)=folded m (u*b)) : a=b := by
  have h := congrArg (fun x => folded m (v*x)) heq
  simpa only [folded_unit_cancel_folded hm hunit,folded_eq_self ha,
    folded_eq_self hb] using h

theorem folded_unit_pos {m u v a : ℕ} (hm : 0<m)
    (hunit : (u*v)%m=1%m) (ha : 0<a) (ham : a<m) :
    0<folded m (u*a) := by
  by_contra hnot
  have hz : folded m (u*a)=0 := by omega
  have h := folded_unit_cancel_folded hm hunit a
  rw [hz] at h
  have hzero : folded m a=0 := by simpa [folded] using h.symm
  have haz := (folded_eq_zero_iff hm).mp hzero
  rw [Nat.mod_eq_of_lt ham] at haz
  omega

def FoldedSupport (m : ℕ) (s : Finset ℕ) : Prop :=
  ∀ a ∈ s, 0<a ∧ 2*a≤m

def foldedSupport (m u : ℕ) (s : Finset ℕ) : Finset ℕ :=
  s.image (fun a => folded m (u*a))

theorem foldedSupport_valid {m u v : ℕ} {s : Finset ℕ} (hm : 0<m)
    (hunit : (u*v)%m=1%m) (hs : FoldedSupport m s) :
    FoldedSupport m (foldedSupport m u s) := by
  intro b hb
  obtain ⟨a,ha,rfl⟩ := Finset.mem_image.mp hb
  obtain ⟨hapos,ham⟩ := hs a ha
  exact ⟨folded_unit_pos hm hunit hapos (by omega),folded_le_half m (u*a)⟩

theorem foldedSupport_card {m u v : ℕ} {s : Finset ℕ} (hm : 0<m)
    (hunit : (u*v)%m=1%m) (hs : FoldedSupport m s) :
    (foldedSupport m u s).card=s.card := by
  apply Finset.card_image_iff.mpr
  intro a ha b hb heq
  exact folded_unit_injective_on hm hunit (hs a ha).2 (hs b hb).2 heq

theorem foldedSupport_comp (m u v : ℕ) (s : Finset ℕ) (hm : 0<m) :
    foldedSupport m v (foldedSupport m u s)=foldedSupport m (v*u) s := by
  simp only [foldedSupport,Finset.image_image,Function.comp_def,
    folded_action_comp m u v _ hm]

theorem foldedSupport_cancel {m u v : ℕ} {s : Finset ℕ} (hm : 0<m)
    (hunit : (u*v)%m=1%m) (hs : FoldedSupport m s) :
    foldedSupport m v (foldedSupport m u s)=s := by
  ext a
  simp only [foldedSupport,Finset.mem_image]
  constructor
  · rintro ⟨b,⟨c,hc,rfl⟩,ha⟩
    rw [folded_unit_cancel_folded hm hunit,folded_eq_self (hs c hc).2] at ha
    exact ha ▸ hc
  · intro ha
    refine ⟨folded m (u*a),⟨a,ha,rfl⟩,?_⟩
    rw [folded_unit_cancel_folded hm hunit,folded_eq_self (hs a ha).2]

theorem folded_mul_congr {m a b : ℕ} (hm : 0<m)
    (hab : folded m a=folded m b) (c : ℕ) :
    folded m (c*a)=folded m (c*b) := by
  have h := congrArg (fun x => folded m (c*x)) hab
  simpa only [folded_mul_folded m _ c hm] using h

theorem folded_multiplier_cancel {m x ix a b : ℕ} (hm : 0<m)
    (hunit : (x*ix)%m=1%m)
    (hab : folded m (a*x)=folded m (b*x)) : folded m a=folded m b := by
  have h := folded_mul_congr hm hab ix
  simpa only [Nat.mul_comm a x,Nat.mul_comm b x,folded_unit_cancel hunit] using h

/-- Folded quotients are invariant when both coordinates are rescaled by
one unit and their signs are independently folded. -/
theorem folded_quotient_invariant (m u x y ix jx : ℕ) (hm : 0<m)
    (hx : (x*ix)%m=1%m)
    (hj : (folded m (u*x)*jx)%m=1%m) :
    folded m (jx*folded m (u*y))=folded m (ix*y) := by
  have hleft : folded m ((jx*u)*x)=folded m 1 := by
    calc
      _ = folded m (jx*folded m (u*x)) := by
        rw [folded_mul_folded m (u*x) jx hm,Nat.mul_assoc]
      _ = folded m 1 := by
        apply folded_eq_of_mod_eq
        simpa only [Nat.mul_comm jx] using hj
  have hright : folded m (ix*x)=folded m 1 := by
    apply folded_eq_of_mod_eq
    simpa only [Nat.mul_comm ix] using hx
  have hscale := folded_multiplier_cancel hm hx (hleft.trans hright.symm)
  have h := folded_mul_congr hm hscale y
  calc
    _ = folded m ((jx*u)*y) := folded_action_comp m u jx y hm
    _ = folded m (ix*y) := by simpa only [Nat.mul_comm y] using h

def pairQuotients (m : ℕ) (inv : ℕ → ℕ) (s : Finset ℕ) : Finset ℕ :=
  ((s ×ˢ s).filter (fun ab => ab.1≠ab.2)).image (fun ab => folded m (inv ab.1*ab.2))

theorem mem_pairQuotients {m : ℕ} {inv : ℕ → ℕ} {s : Finset ℕ} {r : ℕ} :
    r ∈ pairQuotients m inv s ↔
      ∃ a ∈ s, ∃ b ∈ s, a≠b ∧ folded m (inv a*b)=r := by
  simp only [pairQuotients,Finset.mem_image,Finset.mem_filter,Finset.mem_product]
  constructor
  · rintro ⟨⟨a,b⟩,⟨⟨ha,hb⟩,hne⟩,hr⟩
    exact ⟨a,ha,b,hb,hne,hr⟩
  · rintro ⟨a,ha,b,hb,hne,hr⟩
    exact ⟨(a,b),⟨⟨ha,hb⟩,hne⟩,hr⟩

/-- The minimum ordered folded quotient normalizes some representative to
`1,b`. Every other entry and every folded pair quotient is at least `b`.
These are precisely the restrictions used by the projective support sieve.
The inverse table is a finite arithmetic premise, not a classification. -/
theorem minimum_pair_normalization (m : ℕ) (hm : 2≤m) (inv : ℕ → ℕ)
    (hinv : ∀ a, 0<a → 2*a≤m → (a*inv a)%m=1%m)
    (s : Finset ℕ) (hs : FoldedSupport m s) (hcard : 2≤s.card) :
    ∃ u v b : ℕ, (u*v)%m=1%m ∧
      let t := foldedSupport m u s
      t.card=s.card ∧ FoldedSupport m t ∧ 1∈t ∧ b∈t ∧ 2≤b ∧
      (∀ x ∈ t, x≠1 → b≤x) ∧
      (∀ x ∈ t, ∀ y ∈ t, x≠y → b≤folded m (inv x*y)) := by
  classical
  have hmpos : 0<m := by omega
  have hnon : (pairQuotients m inv s).Nonempty := by
    obtain ⟨a,ha,b,hb,hne⟩ := Finset.one_lt_card.mp (by omega : 1<s.card)
    exact ⟨_,mem_pairQuotients.mpr ⟨a,ha,b,hb,hne,rfl⟩⟩
  let r := (pairQuotients m inv s).min' hnon
  have hrmem : r∈pairQuotients m inv s := Finset.min'_mem _ hnon
  obtain ⟨a,ha,b,hb,hab,hr⟩ := mem_pairQuotients.mp hrmem
  have haunit : (a*inv a)%m=1%m := hinv a (hs a ha).1 (hs a ha).2
  have hu : (inv a*a)%m=1%m := by simpa only [Nat.mul_comm] using haunit
  have hone : folded m (inv a*a)=1 := by
    calc
      _ = folded m 1 := folded_eq_of_mod_eq hu
      _ = 1 := folded_one hm
  have htvalid := foldedSupport_valid hmpos hu hs
  have htcard := foldedSupport_card hmpos hu hs
  have hmin {x y : ℕ} (hx : x∈s) (hy : y∈s) (hne : x≠y) :
      r≤folded m (inv x*y) :=
    Finset.min'_le _ _ (mem_pairQuotients.mpr ⟨x,hx,y,hy,hne,rfl⟩)
  have hrpos : 0<r := by
    rw [←hr]
    exact folded_unit_pos hmpos hu (hs b hb).1 (by have h := (hs b hb).2; omega)
  have hrne : r≠1 := by
    intro heq
    have hh : folded m (inv a*a)=folded m (inv a*b) := by rw [hone,hr,heq]
    exact hab (folded_unit_injective_on hmpos hu (hs a ha).2 (hs b hb).2 hh)
  refine ⟨inv a,a,r,hu,htcard,htvalid,?_,?_,by omega,?_,?_⟩
  · exact Finset.mem_image.mpr ⟨a,ha,hone⟩
  · exact Finset.mem_image.mpr ⟨b,hb,hr⟩
  · intro x hx hxone
    obtain ⟨c,hc,rfl⟩ := Finset.mem_image.mp hx
    apply hmin ha hc
    intro heq
    subst c
    exact hxone hone
  · intro x hx y hy hxy
    obtain ⟨c,hc,rfl⟩ := Finset.mem_image.mp hx
    obtain ⟨d,hd,rfl⟩ := Finset.mem_image.mp hy
    have hcd : c≠d := by intro heq; subst d; exact hxy rfl
    have hcinv := hinv c (hs c hc).1 (hs c hc).2
    have hcvalid := htvalid _ (Finset.mem_image.mpr ⟨c,hc,rfl⟩)
    have hcnew := hinv _ hcvalid.1 hcvalid.2
    rw [folded_quotient_invariant m (inv a) c d (inv c)
      (inv (folded m (inv a*c))) hmpos hcinv hcnew]
    exact hmin hc hd hcd

end Loneliness.Modular
