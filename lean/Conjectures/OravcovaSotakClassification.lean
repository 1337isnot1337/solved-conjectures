import Conjectures.OravcovaSotakTwoParameter
import Conjectures.OravcovaSotakExceptions
import Conjectures.OravcovaSotakNormalization

/-!
# Oravcova--Sotak classification for five through eight distances

This is Theorem A of aadrianvv's `results/oravcova-sotak/PROOF.md`.
The actual graph, unbounded parameters, exact certificates, and both
directions are formalized. The four unformalized spectrum classifications
remain explicitly named hypotheses `R5`, `R6`, `R7`, and `R8`.
They are propositions, never axioms or hidden instances.
-/

namespace OravcovaSotak

open Loneliness

/-- A primitive set of `k` positive distances, represented without repetitions. -/
structure PrimitiveData (k : ℕ) (D : List ℕ) : Prop where
  length : D.length = k
  nodup : D.Nodup
  positive : ∀ d ∈ D, 0 < d
  primitive : Normalization.gcd D = 1

def NearTight (k : ℕ) (D : List ℕ) : Prop := value D < (1 : ℝ)/k

def Listed (k : ℕ) (D : List ℕ) : Prop :=
  ∃ E ∈ sporadicSets k, D.Perm E

def ProductForm (W D : List ℕ) : Prop :=
  ∃ A b : ℕ, 0 < A ∧ 0 < b ∧ D.Perm (ProductFamily.speeds W A b)

def ContainsDilation (W D : List ℕ) : Prop :=
  ∃ r : ℝ, 0 < r ∧ ∀ w ∈ W, ∃ d ∈ D, (d : ℝ) = r*(w : ℝ)

def TwoParameterForm (D : List ℕ) : Prop :=
  ∃ (v : Fin 6 → ℤ) (s t : ℝ),
    D.Perm (List.ofFn (fun i => (v i).natAbs)) ∧
    ∀ i, (v i : ℝ) = ![s,t,s+t,2*s+t,3*s+t,3*s+2*t] i

/-- R5, stated as real dilation containment and the literal sporadic table. -/
def R5 : Prop := ∀ D : List ℕ, PrimitiveData 5 D → NearTight 5 D →
  ContainsDilation [1,2,3,4] D ∨ ContainsDilation [1,3,4,7] D ∨ Listed 5 D

/-- The forward containment from R6: two dilation families, the full real
third-family parameterization with signs, and the nine sporadic sets. -/
def R6 : Prop := ∀ D : List ℕ, PrimitiveData 6 D → NearTight 6 D →
  ContainsDilation [1,2,3,4,5] D ∨ ContainsDilation [1,3,4,5,9] D ∨
  TwoParameterForm D ∨ Listed 6 D

/-- Only the forward containment from the stronger R7 classification is used. -/
def R7 : Prop := ∀ D : List ℕ, PrimitiveData 7 D → NearTight 7 D →
  (∃ s : ℕ, 0 < s ∧ D.Perm (cliqueFamily 7 s)) ∨ Listed 7 D

/-- R8, retaining all three unbounded families and all seventeen sporadic sets. -/
def R8 : Prop := ∀ D : List ℕ, PrimitiveData 8 D → NearTight 8 D →
  (∃ s : ℕ, 0 < s ∧ D.Perm (cliqueFamily 8 s)) ∨
  (∃ s : ℕ, 0 < s ∧ D.Perm (8*s :: [1,2,3,4,5,7,12])) ∨
  (∃ s : ℕ, 0 < s ∧ D.Perm (8*s :: [1,4,5,6,7,11,13])) ∨ Listed 8 D

/-- The exact lists in Theorem A, up to their irrelevant ordering. -/
def Classified (k : ℕ) (D : List ℕ) : Prop :=
  (∃ s : ℕ, 0 < s ∧ D.Perm (cliqueFamily k s)) ∨
  (k = 5 ∧ (D.Perm [1,2,3,5,8] ∨ D.Perm [1,4,5,6,7])) ∨
  (k = 7 ∧ D.Perm [1,2,3,4,5,7,12])

theorem gcd_perm {D E : List ℕ} (h : D.Perm E) :
    Normalization.gcd D = Normalization.gcd E := by
  change D.foldr Nat.gcd 0 = E.foldr Nat.gcd 0
  exact h.foldr_eq' (f := Nat.gcd) (fun x _hx y _hy z => Nat.gcd_left_comm y x z) 0

theorem productForm_of_dilation (k : ℕ) (D W : List ℕ)
    (hD : PrimitiveData k D) (hone : 1 ∈ W) (hW : W.Nodup)
    (hlen : W.length+1 = k) (h : ContainsDilation W D) : ProductForm W D := by
  obtain ⟨r,hr,hsub⟩ := h
  obtain ⟨A,hA,hsubA⟩ := real_dilation_integer W D hone r hr hsub
  obtain ⟨b,hb,hperm⟩ := complete_scaled_subset D W A hA
    (hD.length.trans hlen.symm) hW hD.positive hsubA
  exact ⟨A,b,hA,hb,hperm⟩

theorem twoParameterForm_integer (D : List ℕ) (h : TwoParameterForm D) :
    ∃ s t : ℤ, D.Perm (formDistances sixForms s t) := by
  obtain ⟨v,s,t,hperm,he⟩ := h
  have h0 : (v 0 : ℝ) = s := he 0
  have h1 : (v 1 : ℝ) = t := he 1
  have h2 : v 2 = v 0+v 1 := by
    have hR : (v 2 : ℝ) = (v 0 : ℝ)+(v 1 : ℝ) := by rw [h0,h1]; exact he 2
    exact_mod_cast hR
  have h3 : v 3 = 2*v 0+v 1 := by
    have hR : (v 3 : ℝ) = 2*(v 0 : ℝ)+(v 1 : ℝ) := by rw [h0,h1]; exact he 3
    exact_mod_cast hR
  have h4 : v 4 = 3*v 0+v 1 := by
    have hR : (v 4 : ℝ) = 3*(v 0 : ℝ)+(v 1 : ℝ) := by rw [h0,h1]; exact he 4
    exact_mod_cast hR
  have h5 : v 5 = 3*v 0+2*v 1 := by
    have hR : (v 5 : ℝ) = 3*(v 0 : ℝ)+2*(v 1 : ℝ) := by rw [h0,h1]; exact he 5
    exact_mod_cast hR
  have heq : List.ofFn (fun i => (v i).natAbs) = formDistances sixForms (v 0) (v 1) := by
    simp only [formDistances, sixForms, List.map_cons, List.map_nil, linearValue,
      one_mul, zero_mul, add_zero, zero_add]
    change [(v 0).natAbs,(v 1).natAbs,(v 2).natAbs,(v 3).natAbs,(v 4).natAbs,(v 5).natAbs] = _
    rw [h2,h3,h4,h5]
  exact ⟨v 0,v 1,heq ▸ hperm⟩

theorem nearTight_of_not_colorable (k : ℕ) (hk : 0 < k) (D : List ℕ)
    (h : ¬(graph D).Colorable k) : NearTight k D := by
  apply lt_of_not_ge
  intro hv
  exact h (DistanceColoring.colorable_of_value D k hk hv)

/-- The product-family phase-grid bound removes every nontrivial dilation
and forces the extra distance to be divisible by the color count. -/
theorem product_reduced (k : ℕ) (hk : 4 ≤ k) (D W : List ℕ)
    (hD : PrimitiveData k D) (hv : NearTight k D)
    (hW : Normalization.gcd W = 1) (hres : ∀ w ∈ W, w%k ≠ 0)
    (hform : ProductForm W D) :
    ∃ s : ℕ, 0 < s ∧ D.Perm (k*s :: W) := by
  obtain ⟨A,b,hA,hb,hperm⟩ := hform
  have hprim : Normalization.gcd (ProductFamily.speeds W A b) = 1 := by
    rw [← gcd_perm hperm]
    exact hD.primitive
  have hbelow : value (ProductFamily.speeds W A b) < (1 : ℝ)/k := by
    rw [← CriticalFamilies.value_perm hperm]
    exact hv
  obtain ⟨hAone,s,hs,hbs⟩ := ProductFamily.below_threshold_parameters k hk
    W hW hres A b hA hb hprim hbelow
  refine ⟨s,by omega,hperm.trans ?_⟩
  subst A
  subst b
  simp [ProductFamily.speeds]

theorem listed_classified_or_colorable (k : ℕ) (hk : k ∈ [5,6,7,8])
    (D : List ℕ) (hlisted : Listed k D) :
    Classified k D ∨ (graph D).Colorable k := by
  classical
  obtain ⟨E,hE,hperm⟩ := hlisted
  by_cases he : Exceptional k E
  · left
    rcases he with ⟨hk,he | he⟩ | ⟨hk,he⟩
    · exact Or.inr (Or.inl ⟨hk,Or.inl (he ▸ hperm)⟩)
    · exact Or.inr (Or.inl ⟨hk,Or.inr (he ▸ hperm)⟩)
    · exact Or.inr (Or.inr ⟨hk,he ▸ hperm⟩)
  · right
    exact colorable_perm hperm.symm (sporadic_colorable k hk E hE he)

theorem classified_of_not_colorable
    (hR5 : R5) (hR6 : R6) (hR7 : R7) (hR8 : R8)
    (k : ℕ) (hk : k ∈ [5,6,7,8]) (D : List ℕ) (hD : PrimitiveData k D)
    (hnot : ¬(graph D).Colorable k) : Classified k D := by
  have hkpos : 0 < k := by
    simp at hk
    omega
  have hv := nearTight_of_not_colorable k hkpos D hnot
  have hlisted (hl : Listed k D) : Classified k D := by
    rcases listed_classified_or_colorable k hk D hl with h | h
    · exact h
    · exact False.elim (hnot h)
  simp at hk
  rcases hk with rfl | rfl | rfl | rfl
  · rcases hR5 D hD hv with h | h | h
    · have hf := productForm_of_dilation 5 D [1,2,3,4] hD (by decide) (by decide) (by decide) h
      obtain ⟨s,hs,hperm⟩ := product_reduced 5 (by decide) D [1,2,3,4] hD hv
        (by decide) (by decide) hf
      exact Or.inl ⟨s,hs,hperm⟩
    · have hf := productForm_of_dilation 5 D [1,3,4,7] hD (by decide) (by decide) (by decide) h
      obtain ⟨s,hs,hperm⟩ := product_reduced 5 (by decide) D [1,3,4,7] hD hv
        (by decide) (by decide) hf
      exact False.elim (hnot (colorable_perm hperm.symm (A5_family s hs)))
    · exact hlisted h
  · rcases hR6 D hD hv with h | h | h | h
    · have hf := productForm_of_dilation 6 D [1,2,3,4,5] hD (by decide) (by decide) (by decide) h
      obtain ⟨s,hs,hperm⟩ := product_reduced 6 (by decide) D [1,2,3,4,5] hD hv
        (by decide) (by decide) hf
      exact Or.inl ⟨s,hs,hperm⟩
    · have hf := productForm_of_dilation 6 D [1,3,4,5,9] hD (by decide) (by decide) (by decide) h
      obtain ⟨s,hs,hperm⟩ := product_reduced 6 (by decide) D [1,3,4,5,9] hD hv
        (by decide) (by decide) hf
      exact False.elim (hnot (colorable_perm hperm.symm (A6_family s hs)))
    · obtain ⟨s,t,hperm⟩ := twoParameterForm_integer D h
      have hcop : Int.gcd s t = 1 := primitive_form_parameters sixForms s t
        ((gcd_perm hperm).symm.trans hD.primitive)
      have hz : 0 ∉ formDistances sixForms s t := by
        intro hzero
        have hpos := hD.positive 0 (hperm.mem_iff.mpr hzero)
        omega
      exact False.elim (hnot (colorable_perm hperm.symm
        (two_parameter_colorable s t hcop (hperm.nodup hD.nodup) hz)))
    · exact hlisted h
  · rcases hR7 D hD hv with h | h
    · exact Or.inl h
    · exact hlisted h
  · rcases hR8 D hD hv with h | ⟨s,hs,hperm⟩ | ⟨s,hs,hperm⟩ | h
    · exact Or.inl h
    · exact False.elim (hnot (colorable_perm hperm.symm (W2_family s hs)))
    · exact False.elim (hnot (colorable_perm hperm.symm (W3_family s hs)))
    · exact hlisted h

/-- The forward examples, including the entire unbounded clique family,
are unconditional and do not use R5--R8. -/
theorem classified_chromaticNumber (k : ℕ) (hk : 2 ≤ k) (D : List ℕ)
    (h : Classified k D) : (graph D).chromaticNumber = (k : ℕ∞)+1 := by
  rcases h with ⟨s,hs,hperm⟩ | ⟨rfl,hperm | hperm⟩ | ⟨rfl,hperm⟩
  · rw [graph_eq_of_perm hperm]
    exact cliqueFamily_chromaticNumber k s hk hs
  · rw [graph_eq_of_perm hperm]
    exact exceptional5a_chromaticNumber
  · rw [graph_eq_of_perm hperm]
    exact exceptional5b_chromaticNumber
  · rw [graph_eq_of_perm hperm]
    exact exceptional7_chromaticNumber

/-- The full stated equivalence, conditional only on the four explicitly
named spectrum classifications. -/
theorem theorem_A_relative
    (hR5 : R5) (hR6 : R6) (hR7 : R7) (hR8 : R8)
    (k : ℕ) (hk : k ∈ [5,6,7,8]) (D : List ℕ) (hD : PrimitiveData k D) :
    (graph D).chromaticNumber = (k : ℕ∞)+1 ↔ Classified k D := by
  constructor
  · intro h
    have hnot := (SimpleGraph.chromaticNumber_eq_iff_colorable_not_colorable.mp h).2
    exact classified_of_not_colorable hR5 hR6 hR7 hR8 k hk D hD hnot
  · exact classified_chromaticNumber k (by
      simp at hk
      omega) D

/-- Every primitive distance set outside the classified list is
`k`-colorable, with no bound on its largest distance. -/
theorem other_sets_colorable_relative
    (hR5 : R5) (hR6 : R6) (hR7 : R7) (hR8 : R8)
    (k : ℕ) (hk : k ∈ [5,6,7,8]) (D : List ℕ) (hD : PrimitiveData k D)
    (h : ¬Classified k D) : (graph D).Colorable k := by
  by_contra hn
  exact h (classified_of_not_colorable hR5 hR6 hR7 hR8 k hk D hD hn)

/-- The exceptional family in Oravcova--Sotak Conjecture 2.7. -/
def osFamily (m : ℕ) : List ℕ := 4*m :: (2*m+1) :: List.range' 1 (2*m-1)

/-- Conjecture 2.7 follows with an actual clique witness in its third case. -/
theorem oravcova_sotak_relative
    (hR5 : R5) (hR6 : R6) (hR7 : R7) (hR8 : R8)
    (k : ℕ) (hk : k ∈ [5,6,7,8]) (D : List ℕ) (hD : PrimitiveData k D)
    (hchrom : (graph D).chromaticNumber = (k : ℕ∞)+1) :
    D.Perm [1,4,5,6,7] ∨
    (∃ m : ℕ, 0 < m ∧ D.Perm (osFamily m)) ∨
    ∃ S : Finset ℤ, (graph D).IsNClique k S := by
  have hk2 : 2 ≤ k := by
    simp at hk
    omega
  have hc := (theorem_A_relative hR5 hR6 hR7 hR8 k hk D hD).mp hchrom
  rcases hc with ⟨s,_hs,hperm⟩ | ⟨rfl,hperm | hperm⟩ | ⟨rfl,hperm⟩
  · obtain ⟨S,hS⟩ := cliqueFamily_has_clique k s hk2
    exact Or.inr (Or.inr ⟨S,by rwa [graph_eq_of_perm hperm]⟩)
  · exact Or.inr (Or.inl ⟨2,by decide,hperm.trans (by decide +kernel)⟩)
  · exact Or.inl hperm
  · exact Or.inr (Or.inl ⟨3,by decide,hperm.trans (by decide +kernel)⟩)

theorem classified_not_triangleFree (k : ℕ) (hk : 3 ≤ k) (D : List ℕ)
    (h : Classified k D) : ¬(graph D).CliqueFree 3 := by
  rcases h with ⟨s,_hs,hperm⟩ | ⟨rfl,hperm | hperm⟩ | ⟨rfl,hperm⟩
  · rw [graph_eq_of_perm hperm]
    apply DistanceColoring.not_triangleFree_of_additive _ 1 1 (by decide) (by decide)
    · exact cliqueFamily_mem k s 1 (by omega) (by omega) (by omega)
    · exact cliqueFamily_mem k s 1 (by omega) (by omega) (by omega)
    · exact cliqueFamily_mem k s 2 (by omega) (by omega) (by omega)
  · rw [graph_eq_of_perm hperm]
    exact DistanceColoring.not_triangleFree_of_additive _ 1 1
      (by decide) (by decide) (by decide) (by decide) (by decide)
  · rw [graph_eq_of_perm hperm]
    exact DistanceColoring.not_triangleFree_of_additive _ 1 4
      (by decide) (by decide) (by decide) (by decide) (by decide)
  · rw [graph_eq_of_perm hperm]
    exact DistanceColoring.not_triangleFree_of_additive _ 1 1
      (by decide) (by decide) (by decide) (by decide) (by decide)

/-- Zhu's triangle-free coloring consequence for each of the four sizes. -/
theorem triangle_free_colorable_relative
    (hR5 : R5) (hR6 : R6) (hR7 : R7) (hR8 : R8)
    (k : ℕ) (hk : k ∈ [5,6,7,8]) (D : List ℕ) (hD : PrimitiveData k D)
    (hfree : (graph D).CliqueFree 3) : (graph D).Colorable k := by
  by_contra hnot
  have hc := classified_of_not_colorable hR5 hR6 hR7 hR8 k hk D hD hnot
  apply classified_not_triangleFree k ?_ D hc hfree
  simp at hk
  omega

end OravcovaSotak
