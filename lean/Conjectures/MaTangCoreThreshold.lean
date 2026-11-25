import Conjectures.MaTangCoreUpperUniform

/-!
# Ma–Tang's random subset-sum threshold conjecture
Finite coupling and the monotonicity of the half-coverage event.
-/
namespace MaTangCoreThreshold
open MaTangCoreOccupancy MaTangCoreRank MaTangCoreBirthday MaTangCoreUpperShift
open MaTangCoreUniformSubset MaTangCoreSetCoverage MaTangCoreFactor
open MaTangCoreUpperUniform MaTangCoreCoupling MaTangCoreMultiplicity MaTangCoreDistinct

theorem filter_partition {α : Type} (p : α → Bool) (A : List α) :
    (A.filter p).length + (A.filter fun x => !(p x)).length = A.length := by
  induction A with
  | nil => rfl
  | cons a as ih =>
    cases hp : p a <;> simp [hp] at * <;> omega

theorem available_length {α : Type} [BEq α] [LawfulBEq α]
    (A w : List α) (hA : A.Nodup) (hw : w.Nodup) (sub : ∀ a ∈ w, a ∈ A) :
    (A.filter fun a => !containsB a w).length = A.length-w.length := by
  have he : (A.filter fun a => containsB a w).length = w.length := by
    apply Nat.le_antisymm
    · apply nodup_subset_length _ _ (filter_nodup _ _ hA)
      intro a ha
      exact (containsB_true a w).mp (List.mem_filter.mp ha).2
    · exact nodup_subset_length _ _ hw (fun a ha => List.mem_filter.mpr
        ⟨sub a ha,(containsB_true a w).mpr ha⟩)
  have hh := filter_partition (fun a => containsB a w) A
  omega

theorem prepend_sample_iff {α : Type} [BEq α] [LawfulBEq α]
    (A : List α) (hA : A.Nodup) (k : Nat) (a : α) (w : List α) :
    a::w ∈ distinctWords A (k+1) ↔
      w ∈ distinctWords A k ∧ a ∈ A.filter (fun b => !containsB b w) := by
  rw [distinctWord_cons_iff A hA k a w]
  simp only [List.mem_filter,Bool.not_eq_true']
  constructor
  · intro ⟨ha,ht⟩
    obtain ⟨hm,hn⟩ := (distinctWords_mem _ _ _).mp ht
    obtain ⟨hl,hs⟩ := (mem_words _ _ _).mp hm
    refine ⟨(distinctWords_mem _ _ _).mpr ⟨(mem_words _ _ _).mpr ⟨hl,?_⟩,hn⟩,
      ha,(containsB_false a w).mpr ?_⟩
    · exact fun b hb => ((erase_mem_iff_ne A hA a b).mp (hs b hb)).1
    · exact fun hb => ((erase_mem_iff_ne A hA a a).mp (hs a hb)).2 rfl
  · intro ⟨ht,ha,hf⟩
    obtain ⟨hm,hn⟩ := (distinctWords_mem _ _ _).mp ht
    obtain ⟨hl,hs⟩ := (mem_words _ _ _).mp hm
    refine ⟨ha,(distinctWords_mem _ _ _).mpr ⟨(mem_words _ _ _).mpr ⟨hl,?_⟩,hn⟩⟩
    intro b hb
    exact (erase_mem_iff_ne A hA a b).mpr
      ⟨hs b hb,fun e => ((containsB_false a w).mp hf) (e ▸ hb)⟩

def prepend {α : Type} (p : List α × α) : List α := p.2 :: p.1

theorem prepend_inj {α : Type} (p q : List α × α) (h : prepend p = prepend q) :
    p = q := by
  obtain ⟨ha,hw⟩ := List.cons.inj h
  exact Prod.ext hw ha

theorem count_after_prepend {α : Type} [BEq α] [LawfulBEq α]
    (A : List α) (hA : A.Nodup) (k : Nat) (p : List α → Bool)
    (mono : ∀ a w, p w = true → p (a::w) = true) :
    (distinctWords A (k+1)).length = (distinctWords A k).length*(A.length-k) ∧
    ((distinctWords A k).filter p).length*(A.length-k) ≤
      ((distinctWords A (k+1)).filter p).length := by
  let D := distinctWords A k
  let D' := distinctWords A (k+1)
  let good := D.filter p
  let F (w : List α) := A.filter fun a => !containsB a w
  have hF (w : List α) (hw : w ∈ D) : (F w).length = A.length-k := by
    obtain ⟨hm,hn⟩ := (distinctWords_mem _ _ _).mp hw
    obtain ⟨hl,hs⟩ := (mem_words _ _ _).mp hm
    rw [available_length A w hA hn hs,hl]
  have hI : (taggedFibers D F).length = D'.length := by
    apply card_of_bijection _ _
      (taggedFibers_nodup _ _ (distinctWords_nodup A k hA) (fun _ _ => filter_nodup _ A hA))
      (distinctWords_nodup A (k+1) hA) prepend
    · intro u hu
      exact (prepend_sample_iff A hA k u.2 u.1).mpr ((taggedFibers_mem _ _ u).mp hu)
    · intro u _ v _ h
      exact prepend_inj u v h
    · intro v hv
      cases v with
      | nil =>
        have h := (mem_words _ _ _).mp ((distinctWords_mem _ _ _).mp hv).1
        simp at h
      | cons a w =>
        exact ⟨(w,a),(taggedFibers_mem _ _ _).mpr
          ((prepend_sample_iff A hA k a w).mp hv),rfl⟩
  constructor
  · rw [← hI, taggedFibers_length D F _ hF]
  · have hL := taggedFibers_length good F (A.length-k) (fun w hw => hF w (List.mem_filter.mp hw).1)
    rw [← hL,← List.length_map (f := prepend)]
    apply nodup_subset_length _ _ (nodup_map_of_injective_on prepend _
      (taggedFibers_nodup _ _ (filter_nodup _ _ (distinctWords_nodup A k hA))
        (fun _ _ => filter_nodup _ A hA)) (fun u _ v _ h => prepend_inj u v h))
    intro v hv
    obtain ⟨u,hu,rfl⟩ := List.mem_map.mp hv
    obtain ⟨hg,havail⟩ := (taggedFibers_mem _ _ u).mp hu
    obtain ⟨hd,hp⟩ := List.mem_filter.mp hg
    exact List.mem_filter.mpr ⟨(prepend_sample_iff A hA k u.2 u.1).mpr ⟨hd,havail⟩,mono _ _ hp⟩

theorem coveredB_prepend {α : Type} [BEq α] [LawfulBEq α] (g : TranslationData α)
    (A : List α) (cA : ∀ a, a ∈ A) (a : α) (w : List α) :
    coveredB g A w = true → coveredB g A (a::w) = true := by
  rw [coveredB_spec g A cA,coveredB_spec g A cA]
  intro h x
  exact List.mem_append.mpr (Or.inl (h x))

theorem ordered_half_succ {α : Type} [BEq α] [LawfulBEq α] (g : TranslationData α)
    (A : List α) (hA : A.Nodup) (cA : ∀ a, a ∈ A) (k : Nat)
    (h : (distinctWords A k).length ≤ 2*((distinctWords A k).filter (coveredB g A)).length) :
    (distinctWords A (k+1)).length ≤
      2*((distinctWords A (k+1)).filter (coveredB g A)).length := by
  obtain ⟨den,num⟩ := count_after_prepend A hA k (coveredB g A) (coveredB_prepend g A cA)
  rw [den]
  calc
    _ ≤ (2*((distinctWords A k).filter (coveredB g A)).length)*(A.length-k) :=
      Nat.mul_le_mul_right _ h
    _ = 2*(((distinctWords A k).filter (coveredB g A)).length*(A.length-k)) := Nat.mul_assoc ..
    _ ≤ _ := Nat.mul_le_mul_left _ num

def HalfCoverage {α : Type} [BEq α] (g : TranslationData α) (A : List α) (k : Nat) : Prop :=
    (kSubsets A k).length ≤ 2*((kSubsets A k).filter (coveredB g A)).length

theorem halfCoverage_iff_ordered {α : Type} [BEq α] [LawfulBEq α]
    (g : TranslationData α) (A : List α) (hA : A.Nodup) (cA : ∀ a, a ∈ A)
    (ha : ∀ x y z, g.add (g.add x y) z = g.add x (g.add y z)) (k : Nat) :
    HalfCoverage g A k ↔
      (distinctWords A k).length ≤ 2*((distinctWords A k).filter (coveredB g A)).length := by
  rw [HalfCoverage, ordered_subset_count A k hA, filtered_subset_count A k hA _ (coveredB_perm g A cA ha),
    ← Nat.mul_assoc]
  exact ⟨Nat.mul_le_mul_right _,fun h => Nat.le_of_mul_le_mul_right h (falling_pos k k (Nat.le_refl _))⟩

/-- The actual unordered half-coverage proportion is nondecreasing at its cutoff. -/
theorem halfCoverage_mono {α : Type} [BEq α] [LawfulBEq α]
    (g : TranslationData α) (A : List α) (hA : A.Nodup) (cA : ∀ a, a ∈ A)
    (ha : ∀ x y z, g.add (g.add x y) z = g.add x (g.add y z)) (k l : Nat)
    (hle : k ≤ l) (h : HalfCoverage g A k) : HalfCoverage g A l := by
  induction hle with
  | refl => exact h
  | step hl ih =>
    apply (halfCoverage_iff_ordered g A hA cA ha _).mpr
    exact ordered_half_succ g A hA cA _ ((halfCoverage_iff_ordered g A hA cA ha _).mp ih)

end MaTangCoreThreshold

