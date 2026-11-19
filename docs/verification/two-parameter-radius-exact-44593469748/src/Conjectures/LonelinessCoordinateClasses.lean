import Conjectures.LonelinessCoordinateSubspace
import Mathlib.SetTheory.Cardinal.Finite
import Mathlib.Data.Quot

/-! Iterated coordinate coalescence. A coordinate-free subspace of dimension
`d` in `K^n` contains a coordinate-free line with at most `n-d+1` distinct
coordinate functions up to sign. The theorem is valid over `ℚ` and `ℝ`. -/

namespace Loneliness.CoordinateSubspace

noncomputable section

variable {K ι : Type*} [Field K] [Fintype ι]

def SameCoordinate (E : Submodule K (ι → K)) (i j : ι) : Prop :=
  (∀ x ∈ E, x i = x j) ∨ (∀ x ∈ E, x i = -x j)

def coordinateSetoid (E : Submodule K (ι → K)) : Setoid ι where
  r := SameCoordinate E
  iseqv := by
    refine ⟨?_, ?_, ?_⟩
    · intro i
      exact Or.inl (fun _ _ => rfl)
    · intro i j h
      rcases h with h | h
      · exact Or.inl (fun x hx => (h x hx).symm)
      · apply Or.inr
        intro x hx
        simpa only [neg_neg] using congrArg Neg.neg (h x hx).symm
    · intro i j k hij hjk
      rcases hij with hij | hij <;> rcases hjk with hjk | hjk
      · exact Or.inl (fun x hx => (hij x hx).trans (hjk x hx))
      · exact Or.inr (fun x hx => (hij x hx).trans (hjk x hx))
      · apply Or.inr
        intro x hx
        simpa only [hjk x hx] using hij x hx
      · apply Or.inl
        intro x hx
        simpa only [hjk x hx, neg_neg] using hij x hx

def classCount (E : Submodule K (ι → K)) : ℕ := Nat.card (Quotient (coordinateSetoid E))

omit [Fintype ι] in
theorem sameCoordinate_mono {E F : Submodule K (ι → K)} (hFE : F ≤ E)
    {i j : ι} (h : SameCoordinate E i j) : SameCoordinate F i j := by
  rcases h with h | h
  · exact Or.inl (fun x hx => h x (hFE hx))
  · exact Or.inr (fun x hx => h x (hFE hx))

def restrictClasses {E F : Submodule K (ι → K)} (hFE : F ≤ E) :
    Quotient (coordinateSetoid E) → Quotient (coordinateSetoid F) :=
  Quotient.map id (fun _ _ h => sameCoordinate_mono hFE h)

omit [Fintype ι] in
theorem restrictClasses_surjective {E F : Submodule K (ι → K)} (hFE : F ≤ E) :
    Function.Surjective (restrictClasses hFE) := by
  intro q
  refine Quotient.inductionOn q ?_
  intro i
  exact ⟨Quotient.mk _ i, rfl⟩

theorem classCount_mono {E F : Submodule K (ι → K)} (hFE : F ≤ E) :
    classCount F ≤ classCount E :=
  Nat.card_le_card_of_surjective _ (restrictClasses_surjective hFE)

theorem classCount_lt_of_merge {E F : Submodule K (ι → K)} (hFE : F ≤ E)
    {i j : ι} (hbefore : ¬SameCoordinate E i j) (hafter : SameCoordinate F i j) :
    classCount F < classCount E := by
  by_contra h
  have hcard : classCount E ≤ classCount F := le_of_not_gt h
  have hinj := (restrictClasses_surjective hFE).bijective_of_nat_card_le hcard
  have heq : restrictClasses hFE (Quotient.mk (coordinateSetoid E) i) =
      restrictClasses hFE (Quotient.mk (coordinateSetoid E) j) :=
    Quotient.sound hafter
  exact hbefore (Quotient.exact (hinj.1 heq))

theorem classCount_le_card (E : Submodule K (ι → K)) : classCount E ≤ Fintype.card ι := by
  have h := Nat.card_le_card_of_surjective (Quotient.mk (coordinateSetoid E))
    Quotient.mk_surjective
  simpa only [classCount, Nat.card_eq_fintype_card] using h

theorem classCount_pos [Nonempty ι] (E : Submodule K (ι → K)) : 0 < classCount E := by
  let : Nonempty (Quotient (coordinateSetoid E)) :=
    ⟨Quotient.mk _ (Classical.choice ‹Nonempty ι›)⟩
  exact Nat.card_pos

omit [Fintype ι] in
theorem sameCoordinate_mem_span {E : Submodule K (ι → K)} {i j : ι}
    (h : SameCoordinate E i j) : coordinateForm E i ∈ Submodule.span K {coordinateForm E j} := by
  rcases h with h | h
  · apply Submodule.mem_span_singleton.mpr
    refine ⟨1, ?_⟩
    ext x
    simpa using (h x x.property).symm
  · apply Submodule.mem_span_singleton.mpr
    refine ⟨-1, ?_⟩
    ext x
    simpa using (h x x.property).symm

theorem coalescence_decreases_classes [LinearOrder K] [IsStrictOrderedRing K]
    [Infinite K] [Nonempty ι] (E : Submodule K (ι → K))
    (hfree : CoordinateFree E) (hdim : 2 ≤ Module.finrank K E) :
    ∃ F : Submodule K (ι → K), F ≤ E ∧
      Module.finrank K F + 1 = Module.finrank K E ∧ CoordinateFree F ∧
      classCount F < classCount E := by
  obtain ⟨a, b, ε, F, hab, hnonparallel, hε, hFE, hdimF, hfreeF, hFeq⟩ :=
    coordinate_coalescence E hfree hdim
  refine ⟨F, hFE, hdimF, hfreeF, classCount_lt_of_merge hFE (i := a) (j := b) ?_ ?_⟩
  · exact fun h => hnonparallel (sameCoordinate_mem_span h)
  · have hrel (x : ι → K) (hx : x ∈ F) : x a = ε * x b := by
      rw [hFeq] at hx
      exact sub_eq_zero.mp hx.2
    rcases hε with rfl | rfl
    · exact Or.inl (by simpa using hrel)
    · exact Or.inr (by simpa using hrel)

theorem coordinateFree_finrank_pos [Nonempty ι] {E : Submodule K (ι → K)}
    (hfree : CoordinateFree E) : 0 < Module.finrank K E := by
  obtain ⟨i⟩ := ‹Nonempty ι›
  obtain ⟨x, hx, hxi⟩ := hfree i
  apply Module.finrank_pos_iff_exists_ne_zero.mpr
  refine ⟨⟨x, hx⟩, ?_⟩
  intro hz
  apply hxi
  exact congrArg (fun y : E => (y : ι → K) i) hz

theorem exists_coordinate_free_line [LinearOrder K] [IsStrictOrderedRing K]
    [Infinite K] [Nonempty ι] (E : Submodule K (ι → K)) (hfree : CoordinateFree E) :
    ∃ F : Submodule K (ι → K), F ≤ E ∧ Module.finrank K F = 1 ∧ CoordinateFree F ∧
      classCount F + Module.finrank K E ≤ classCount E + 1 := by
  have main : ∀ n : ℕ, ∀ E : Submodule K (ι → K), Module.finrank K E = n →
      CoordinateFree E →
      ∃ F : Submodule K (ι → K), F ≤ E ∧ Module.finrank K F = 1 ∧ CoordinateFree F ∧
        classCount F + Module.finrank K E ≤ classCount E + 1 := by
    intro n
    induction n using Nat.strong_induction_on with
    | h n ih =>
      intro E hn hfree
      have hnpos : 0 < n := by rw [← hn]; exact coordinateFree_finrank_pos hfree
      by_cases hn₁ : n = 1
      · exact ⟨E, le_rfl, by omega, hfree, by omega⟩
      · have hn₂ : 2 ≤ Module.finrank K E := by omega
        obtain ⟨F, hFE, hFdim, hFfree, hFcount⟩ := coalescence_decreases_classes E hfree hn₂
        have hlt : Module.finrank K F < n := by omega
        obtain ⟨G, hGF, hGdim, hGfree, hGcount⟩ := ih (Module.finrank K F) hlt F rfl hFfree
        exact ⟨G, hGF.trans hFE, hGdim, hGfree, by omega⟩
  exact main (Module.finrank K E) E rfl hfree

theorem exists_coordinate_free_line_card [LinearOrder K] [IsStrictOrderedRing K]
    [Infinite K] [Nonempty ι] (E : Submodule K (ι → K)) (hfree : CoordinateFree E) :
    ∃ F : Submodule K (ι → K), F ≤ E ∧ Module.finrank K F = 1 ∧ CoordinateFree F ∧
      classCount F ≤ Fintype.card ι - Module.finrank K E + 1 := by
  obtain ⟨F, hFE, hFdim, hFfree, hcount⟩ := exists_coordinate_free_line E hfree
  have hEcount := classCount_le_card E
  have hFpos := classCount_pos F
  exact ⟨F, hFE, hFdim, hFfree, by omega⟩

theorem absolute_values_card_le_classCount [LinearOrder K] [IsStrictOrderedRing K]
    {E : Submodule K (ι → K)} {v : ι → K} (hv : v ∈ E) :
    Nat.card (Set.range (fun i => |v i|)) ≤ classCount E := by
  let f : ι → Set.range (fun i => |v i|) := fun i => ⟨|v i|, ⟨i, rfl⟩⟩
  have hf (i j : ι) (h : SameCoordinate E i j) : f i = f j := by
    apply Subtype.ext
    rcases h with h | h
    · exact congrArg abs (h v hv)
    · simpa only [abs_neg] using congrArg abs (h v hv)
  let qf : Quotient (coordinateSetoid E) → Set.range (fun i => |v i|) := Quotient.lift f hf
  have hsurj : Function.Surjective qf := by
    rintro ⟨a, i, rfl⟩
    exact ⟨Quotient.mk _ i, rfl⟩
  exact Nat.card_le_card_of_surjective qf hsurj

theorem exists_vector_few_absolute_values [LinearOrder K] [IsStrictOrderedRing K]
    [Infinite K] [Nonempty ι] (E : Submodule K (ι → K)) (hfree : CoordinateFree E) :
    ∃ v ∈ E, (∀ i, v i ≠ 0) ∧
      Nat.card (Set.range (fun i => |v i|)) ≤ Fintype.card ι - Module.finrank K E + 1 := by
  obtain ⟨F, hFE, hFdim, hFfree, hcount⟩ := exists_coordinate_free_line_card E hfree
  obtain ⟨v, hv⟩ := Module.Dual.exists_forall_ne_zero_of_forall_exists (coordinateForm F)
    (fun i => by
      obtain ⟨x, hx, hxi⟩ := hFfree i
      exact ⟨⟨x, hx⟩, hxi⟩)
  exact ⟨v, hFE v.property, hv, (absolute_values_card_le_classCount v.property).trans hcount⟩

end

end Loneliness.CoordinateSubspace
