import Conjectures.AlmironMoyanoWilfFixedThreshold
import Conjectures.AlmironMoyanoWilfGapFamily
import Conjectures.AlmironMoyanoWilfTwoGeneratorThreshold

/-! Generator counts, the sharp threshold over two-generated semigroups, and
the fixed-multiplicity comparison in Almirón–Moyano-Fernández Question 4.13. -/

namespace AlmironMoyanoWilf

open Finset

theorem minimal_generator_count_le {S : AddSubmonoid ℕ} {D : Set ℕ} {A : Finset ℕ} {m d : ℕ}
    (hc : IsConductor (fun n => n ∈ S) d) (hm : IsMultiplicity S m)
    (hD : IsNormalizedModule S D) (hA : IsMinimalGenerating S D A) : A.card ≤ m := by
  have he := (isMinimalGenerating_iff hc hD A).mp hA
  have hbound := minimalGenerators_card_le (D := D) hm
  simpa only [← he, Set.ncard_coe_finset] using hbound

private theorem generated_singleton (S : AddSubmonoid ℕ) (g : ℕ) :
    generated S ({g} : Set ℕ) = {n | gapModule (fun x => x ∈ S) g n} := by
  ext n
  change (∃ a ∈ insert 0 ({g} : Set ℕ), ∃ s ∈ S, n = a+s) ↔ gapModule _ _ _
  rw [gapModule_iff]
  constructor
  · rintro ⟨a,ha,s,hs,rfl⟩
    rcases Set.mem_insert_iff.mp ha with rfl | rfl
    · exact Or.inl (by simpa using hs)
    · exact Or.inr ⟨s,hs,rfl⟩
  · rintro (hn | ⟨s,hs,rfl⟩)
    · exact ⟨0,by simp,n,hn,(Nat.zero_add n).symm⟩
    · exact ⟨g,by simp,s,hs,rfl⟩

private theorem transfer_count {P Q : ℕ → Prop} {dp : DecidablePred P} {dq : DecidablePred Q}
    {c k : ℕ} (he : ∀ n, P n ↔ Q n) (h : c ≤ k * @leftCount P dp c) :
    c ≤ k * @leftCount Q dq c := by
  obtain rfl : P = Q := funext fun n => propext (he n)
  rwa [Subsingleton.elim dq dp]

open Classical in
private def uniform (S : AddSubmonoid ℕ) (r k : ℕ) : Prop := by
  classical
  exact 0 < k ∧ ∀ (D : Set ℕ) d (A : Finset ℕ), IsNormalizedModule S (fun n => n ∈ D) →
    IsConductor (fun n => n ∈ D) d → IsMinimalGenerating S (fun n => n ∈ D) A →
    A.card = r → d ≤ k * leftCount (fun n => n ∈ D) d

open Classical in
theorem fixed_two_generator_threshold {a b c : ℕ} (ha : 2 ≤ a) (hab : a < b)
    (cop : a.Coprime b) (hc : IsConductor (fun n => n ∈ TwoGenerator.semigroup a b) c) :
    fixedThreshold hc 2 = (if a = 2 then if b = 3 then 1 else 2 else 3) := by
  classical
  let S := TwoGenerator.semigroup a b
  have hf : IsLeast {k | uniform S 2 k} (fixedThreshold hc 2) := fixedThreshold_isLeast (r := 2) (by decide) hc
  have hg := TwoGenerator.exact_two_generator_threshold ha hab cop
  apply hf.unique
  convert hg using 1
  ext k
  change uniform S 2 k ↔ _
  constructor
  · rintro ⟨hk,h⟩
    refine ⟨hk, ?_⟩
    intro g d hgap hd
    have hanti : IsGapAntichain S (({g} : Finset ℕ) : Set ℕ) := by
      simp only [coe_singleton, IsGapAntichain, Set.mem_singleton_iff]
      exact ⟨fun a ha' => ha' ▸ hgap, fun a ha' b hb' _ _ => ha'.trans hb'.symm⟩
    have hmin := antichain_minimalGenerating hanti
    have hnorm := generated_isModule S ({g} : Set ℕ)
    have hnz : g ≠ 0 := by rintro rfl; exact hgap S.zero_mem
    rw [coe_singleton, generated_singleton] at hmin
    rw [generated_singleton] at hnorm
    exact transfer_count (fun _ => Iff.rfl) (h _ d _ hnorm hd hmin (by simp [Ne.symm hnz]))
  · rintro ⟨hk,h⟩
    refine ⟨hk, ?_⟩
    intro D d A hnorm hd hmin hcard
    obtain ⟨had, hgen⟩ := minimal_positive_antichain hc hnorm hmin hcard
    obtain ⟨hsize,hanti⟩ := mem_filter.mp had
    obtain ⟨g,hs⟩ := card_eq_one.mp (mem_powersetCard.mp hsize).2
    rw [hs,coe_singleton] at hgen hanti
    have hgap := hanti.1 g (by simp)
    rw [generated_singleton] at hgen
    subst D
    exact transfer_count (fun _ => Iff.rfl) (h g d hgap hd)

open Classical in
/-- The uniform interpretation of Question 4.13(5), expressed entirely in
terms of the remaining gaps of the admissible antichains. -/
theorem fixed_at_generator_count_iff {S : AddSubmonoid ℕ} {d r : ℕ} (hr : 0 < r)
    (hd : IsConductor (fun n => n ∈ S) d) :
    fixedThreshold hd r ≤ r ↔ ∀ A ∈ admissibleAntichains S d r, ∀ c,
      IsConductor (generated S (A : Set ℕ)) c →
      r * (gaps (generated S (A : Set ℕ)) c).card ≤ (r-1)*c := by
  classical
  have hf : IsLeast {k | uniform S r k} (fixedThreshold hd r) := fixedThreshold_isLeast hr hd
  constructor
  · intro h A hA c hc
    obtain ⟨hmin,hcard⟩ := admissible_antichain_minimal hr hA
    have hv := hf.1.2 _ c _ (generated_isModule S _) hc hmin hcard
    apply (wilf_at_generator_count_iff (generated S ↑A) c hr).mp
    exact hv.trans (Nat.mul_le_mul_right _ h)
  · intro h
    apply hf.2
    refine ⟨hr, ?_⟩
    intro D c A hnorm hc hmin hcard
    obtain ⟨ha,hd'⟩ := minimal_positive_antichain hd hnorm hmin hcard
    subst D
    apply (wilf_at_generator_count_iff (generated S ↑(A.erase 0)) c hr).mpr
    exact h _ ha c hc

/-- Translating the natural numbers by a positive t gives an unnormalized
module with conductor t and no element below its conductor. -/
theorem shifted_tail_no_threshold (S : AddSubmonoid ℕ) {t : ℕ} (ht : 0 < t) :
    (∀ x y, t ≤ x → y ∈ S → t ≤ x+y) ∧ IsConductor (t ≤ ·) t ∧
      ∀ k : ℕ, k * leftCount (t ≤ ·) t < t := by
  refine ⟨fun _ _ hx _ => by omega, isConductor_of_last_gap _ (fun _ h => h) (by omega), ?_⟩
  have he : (range t).filter (t ≤ ·) = ∅ := by
    ext n
    simp only [mem_filter, mem_range, notMem_empty, iff_false]
    omega
  intro k
  simpa [leftCount, he] using ht

open Classical in
theorem exists_maximal_fixed_threshold {m r : ℕ} (hm : 2 ≤ m) (hr : 0 < r) (hrm : r ≤ m) :
    ∃ (S : AddSubmonoid ℕ) (d : ℕ) (hc : IsConductor (fun n => n ∈ S) d),
      IsMultiplicity S m ∧ fixedThreshold hc r = m := by
  classical
  by_contra! none
  have hh := generator_refined_uniform_threshold hm hr hrm
  have impossible : m ≤ m-1 := by
    apply hh.2
    refine ⟨by omega, ?_⟩
    intro S P dec c A hS hmult hD hc hA hcard
    obtain ⟨d,hd⟩ := hS
    have hf : IsLeast {k | uniform S r k} (fixedThreshold hd r) := fixedThreshold_isLeast hr hd
    have hle : fixedThreshold hd r ≤ m :=
      hf.2 ⟨by omega, fun D _ _ hnorm _ _ _ => wilf_nonneg_at_multiplicity (P := fun n => n ∈ D) hmult hnorm⟩
    have hne := none S d hd hmult
    have hbound := hf.1.2 {n | P n} c A hD hc hA hcard
    have hb : c ≤ fixedThreshold hd r * leftCount P c := transfer_count (fun _ => Iff.rfl) hbound
    exact hb.trans (Nat.mul_le_mul_right _ (by omega))
  omega

/-- The same multiplicity gives different exact two-generator module thresholds. -/
theorem different_fixed_thresholds {m : ℕ} (hm : 4 ≤ m) :
    ∃ (S T : AddSubmonoid ℕ) (c d : ℕ) (hc : IsConductor (fun n => n ∈ S) c)
      (hd : IsConductor (fun n => n ∈ T) d),
      IsMultiplicity S m ∧ IsMultiplicity T m ∧ fixedThreshold hc 2 = m ∧ fixedThreshold hd 2 = 3 := by
  obtain ⟨S,c,hc,hs,he⟩ := exists_maximal_fixed_threshold (m := m) (r := 2)
    (by omega) (by decide) (by omega)
  have cop : m.Coprime (m+1) := Nat.coprime_self_add_right.mpr (by simp)
  let T := TwoGenerator.semigroup m (m+1)
  let F := TwoGenerator.frobenius m (m+1)
  have hF := frobeniusNumber_iff.mp (frobeniusNumber_pair cop (by omega) (by omega))
  have hd : IsConductor (fun n => n ∈ T) (F+1) := by
    apply isConductor_of_last_gap
    · intro n hn; exact hF.2 n (show F < n by omega)
    · rw [Nat.add_sub_cancel]
      exact hF.1
  refine ⟨S,T,c,F+1,hc,hd,hs,?_,he,?_⟩
  · refine ⟨by omega, TwoGenerator.mem_iff.mpr ⟨1,0,by simp⟩, ?_⟩
    intro n hn hmem
    obtain ⟨i,j,rfl⟩ := TwoGenerator.mem_iff.mp hmem
    by_cases hi : i = 0
    · subst i
      have hj : 1 ≤ j := by cases j <;> simp_all
      have := Nat.mul_le_mul_right (m+1) hj
      simp only [Nat.zero_mul, Nat.zero_add, Nat.one_mul] at *
      omega
    · have := Nat.mul_le_mul_right m (show 1 ≤ i by omega)
      simp only [Nat.one_mul] at this
      omega
  · simpa [show m ≠ 2 by omega] using fixed_two_generator_threshold (by omega : 2 ≤ m)
      (by omega : m < m+1) cop hd

end AlmironMoyanoWilf
