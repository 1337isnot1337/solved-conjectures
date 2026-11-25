module

public import Conjectures.HKMEhrhartStarsBars
public import Conjectures.HKMEhrhartPolynomialSum
public import Mathlib.Data.Fintype.Pi

public section
namespace HKMEhrhart
open Finset
open scoped BigOperators Polynomial

variable {α : Type*} [Fintype α] [DecidableEq α]

abbrev PosCompositionOn (A : Finset α) (p : ℕ) :=
  {f : (↥A) → ℕ // ∑ i,f i=p ∧ ∀ i,1≤f i}

omit [Fintype α] [DecidableEq α] in
theorem posCompositionOn_card (A : Finset α) (hA : A.Nonempty) (p : ℕ) :
    Nat.card (PosCompositionOn A (p+1)) = p.choose (A.card-1) := by
  let e : ↥A ≃ Fin A.card := (Fintype.equivFin (↥A)).trans (finCongr (Fintype.card_coe A))
  let E : PosCompositionOn A (p+1) ≃ PositiveComposition A.card (p+1) :=
    { toFun := fun f => ⟨fun i => f.val (e.symm i), (Equiv.sum_comp e.symm f.val).trans f.property.1,
        fun i => f.property.2 _⟩
      invFun := fun f => ⟨fun i => f.val (e i), (Equiv.sum_comp e f.val).trans f.property.1,
        fun i => f.property.2 _⟩
      left_inv := fun f => Subtype.ext (funext fun i => by simp)
      right_inv := fun f => Subtype.ext (funext fun i => by simp) }
  rw [Nat.card_congr E]
  have hcard : A.card = A.card-1+1 := by have := Finset.Nonempty.card_pos hA; omega
  conv_lhs => rw [hcard]
  exact positiveComposition_card _ _

omit [DecidableEq α] in
theorem sum_supported_subtype {β : Type*} [AddCommMonoid β] [DecidableEq α]
    (A : Finset α) (f : (↥A) → β) :
    (∑ i : α, if hi : i∈A then f ⟨i,hi⟩ else 0) = ∑ j : ↥A, f j := by
  let g : α → β := fun i => if hi : i ∈ A then f ⟨i,hi⟩ else 0
  change (∑ i : α, g i) = _
  calc
    _ = ∑ i ∈ A, g i := by
      symm
      exact Finset.sum_subset (fun _ _ => Finset.mem_univ _) (fun i _ hi => by simp [g,hi])
    _ = ∑ j : ↥A, g j.val := Finset.sum_subtype _ (by simp) _
    _ = _ := Finset.sum_congr rfl (fun j _ => by simp [g,j.property])

abbrev OppositeSupports (α : Type*) :=
  {ab : Finset α × Finset α // Disjoint ab.1 ab.2 ∧ ab.1.Nonempty ∧ ab.2.Nonempty}

noncomputable instance : Fintype (OppositeSupports α) := by classical infer_instance

def natPositiveMass (z : ℤ) : ℕ := (max z 0).toNat
def natNegativeMass (z : ℤ) : ℕ := (max (-z) 0).toNat

theorem natPositiveMass_pos_iff {a : ℤ} : 0 < natPositiveMass a ↔ 0 < a := by
  unfold natPositiveMass
  omega

theorem natNegativeMass_pos_iff {a : ℤ} : 0 < natNegativeMass a ↔ a < 0 := by
  unfold natNegativeMass
  omega

theorem natPosNegMass_cast_difference (a : ℤ) :
    (natPositiveMass a:ℤ)-(natNegativeMass a:ℤ)=a := by
  unfold natPositiveMass natNegativeMass
  omega

abbrev UnclippedMassShell (α : Type*) [Fintype α] (p : ℕ) :=
  {z : α→ℤ // (∑ i, natPositiveMass (z i))=p ∧ (∑ i,natNegativeMass (z i))=p}

noncomputable instance (p : ℕ) : Fintype (UnclippedMassShell α p) := by
  classical
  let box := Finset.Icc (-(p:ℤ)) (p:ℤ)
  have hz (z : UnclippedMassShell α p) (i : α) : z.val i ∈ box := by
    have hP := Finset.single_le_sum (fun j _ => Nat.zero_le (natPositiveMass (z.val j))) (Finset.mem_univ i)
    have hN := Finset.single_le_sum (fun j _ => Nat.zero_le (natNegativeMass (z.val j))) (Finset.mem_univ i)
    rw [z.property.1] at hP
    rw [z.property.2] at hN
    have he := natPosNegMass_cast_difference (z.val i)
    unfold box
    simp only [Finset.mem_Icc]
    omega
  exact Fintype.ofInjective (fun z i => (⟨z.val i,hz z i⟩ : ↥box))
    (fun x y he => Subtype.ext (funext fun i => congrArg (fun f : α → ↥box => (f i).val) he))

/-- Positive and negative supports of a nonzero layer of the integer zero-sum lattice. -/
def shellSupports {p : ℕ} (z : UnclippedMassShell α (p+1)) : OppositeSupports α := by
  refine ⟨(Finset.univ.filter (fun i => 0 < z.val i),Finset.univ.filter (fun i => z.val i < 0)),?_⟩
  refine ⟨Finset.disjoint_left.mpr (fun i hi hj => ?_),?_,?_⟩
  · have hi' := (Finset.mem_filter.mp hi).2
    have hj' := (Finset.mem_filter.mp hj).2
    exact (lt_asymm hi') hj'
  · by_contra h
    have hm (i : α) : natPositiveMass (z.val i) = 0 := by
      apply Nat.eq_zero_of_not_pos
      intro hi
      exact h ⟨i,Finset.mem_filter.mpr ⟨Finset.mem_univ _,natPositiveMass_pos_iff.mp hi⟩⟩
    simpa [hm] using z.property.1
  · by_contra h
    have hm (i : α) : natNegativeMass (z.val i) = 0 := by
      apply Nat.eq_zero_of_not_pos
      intro hi
      exact h ⟨i,Finset.mem_filter.mpr ⟨Finset.mem_univ _,natNegativeMass_pos_iff.mp hi⟩⟩
    simpa [hm] using z.property.2

omit [DecidableEq α] in
theorem mem_shellSupports_pos {p : ℕ} (z : UnclippedMassShell α (p+1)) (i : α) :
    i ∈ (shellSupports z).val.1 ↔ 0 < z.val i := by
  simp [shellSupports]

omit [DecidableEq α] in
theorem mem_shellSupports_neg {p : ℕ} (z : UnclippedMassShell α (p+1)) (i : α) :
    i ∈ (shellSupports z).val.2 ↔ z.val i < 0 := by
  simp [shellSupports]

def packShell {p : ℕ} (z : UnclippedMassShell α (p+1)) :
    Σ a : OppositeSupports α,
      PosCompositionOn a.val.1 (p+1) × PosCompositionOn a.val.2 (p+1) := by
  refine ⟨shellSupports z,⟨fun i => natPositiveMass (z.val i.val),?_,?_⟩,
    ⟨fun i => natNegativeMass (z.val i.val),?_,?_⟩⟩
  · rw [← sum_supported_subtype]
    convert z.property.1 using 1
    apply Finset.sum_congr rfl
    intro i _
    by_cases hi : i ∈ (shellSupports z).val.1
    · simp [hi]
    · have hz : natPositiveMass (z.val i) = 0 := Nat.eq_zero_of_not_pos
        (fun hp => hi ((mem_shellSupports_pos z i).2 (natPositiveMass_pos_iff.mp hp)))
      simp [hi,hz]
  · intro i
    exact natPositiveMass_pos_iff.mpr ((mem_shellSupports_pos z i.val).1 i.property)
  · rw [← sum_supported_subtype]
    convert z.property.2 using 1
    apply Finset.sum_congr rfl
    intro i _
    by_cases hi : i ∈ (shellSupports z).val.2
    · simp [hi]
    · have hz : natNegativeMass (z.val i) = 0 := Nat.eq_zero_of_not_pos
        (fun hp => hi ((mem_shellSupports_neg z i).2 (natNegativeMass_pos_iff.mp hp)))
      simp [hi,hz]
  · intro i
    exact natNegativeMass_pos_iff.mpr ((mem_shellSupports_neg z i.val).1 i.property)

abbrev ShellData (α : Type*) (p : ℕ) :=
  Σ a : OppositeSupports α, PosCompositionOn a.val.1 p × PosCompositionOn a.val.2 p

def unpackShellCoord {p : ℕ} (d : ShellData α p) (i : α) : ℤ :=
  (if hi : i ∈ d.1.val.1 then (d.2.1.val ⟨i,hi⟩ : ℤ) else 0)
  - (if hi : i ∈ d.1.val.2 then (d.2.2.val ⟨i,hi⟩ : ℤ) else 0)

omit [Fintype α] in
theorem pos_unpackShellCoord {p : ℕ} (d : ShellData α p) (i : α) :
    natPositiveMass (unpackShellCoord d i) =
      if hi : i ∈ d.1.val.1 then d.2.1.val ⟨i,hi⟩ else 0 := by
  unfold unpackShellCoord natPositiveMass
  by_cases hP : i ∈ d.1.val.1
  · have hN : i ∉ d.1.val.2 := fun hn => Finset.disjoint_left.mp d.1.property.1 hP hn
    simp [hP,hN]
  · by_cases hN : i ∈ d.1.val.2
    · simp [hP,hN]
    · simp [hP,hN]

omit [Fintype α] in
theorem neg_unpackShellCoord {p : ℕ} (d : ShellData α p) (i : α) :
    natNegativeMass (unpackShellCoord d i) =
      if hi : i ∈ d.1.val.2 then d.2.2.val ⟨i,hi⟩ else 0 := by
  unfold unpackShellCoord natNegativeMass
  by_cases hN : i ∈ d.1.val.2
  · have hP : i ∉ d.1.val.1 := fun hp => Finset.disjoint_left.mp d.1.property.1 hp hN
    simp [hP,hN]
  · by_cases hP : i ∈ d.1.val.1
    · simp [hP,hN]
    · simp [hP,hN]

def unpackShell {p : ℕ} (d : ShellData α p) : UnclippedMassShell α p := by
  refine ⟨unpackShellCoord d,?_,?_⟩
  · simp_rw [pos_unpackShellCoord]
    rw [sum_supported_subtype,d.2.1.property.1]
  · simp_rw [neg_unpackShellCoord]
    rw [sum_supported_subtype,d.2.2.property.1]

theorem unpackShell_packShell {p : ℕ} (z : UnclippedMassShell α (p+1)) :
    unpackShell (packShell z) = z := by
  apply Subtype.ext
  funext i
  change unpackShellCoord (packShell z) i = z.val i
  rw [← natPosNegMass_cast_difference (unpackShellCoord (packShell z) i)]
  rw [pos_unpackShellCoord,neg_unpackShellCoord]
  change (((if i ∈ (shellSupports z).val.1 then natPositiveMass (z.val i) else 0) : ℕ) : ℤ)
    - (((if i ∈ (shellSupports z).val.2 then natNegativeMass (z.val i) else 0) : ℕ) : ℤ) = z.val i
  have hP : (if i ∈ (shellSupports z).val.1 then natPositiveMass (z.val i) else 0)
      = natPositiveMass (z.val i) := by
    by_cases h : i ∈ (shellSupports z).val.1
    · simp [h]
    · have h' : natPositiveMass (z.val i) = 0 := Nat.eq_zero_of_not_pos
        (fun hp => h ((mem_shellSupports_pos z i).2 (natPositiveMass_pos_iff.mp hp)))
      simp [h,h']
  have hN : (if i ∈ (shellSupports z).val.2 then natNegativeMass (z.val i) else 0)
      = natNegativeMass (z.val i) := by
    by_cases h : i ∈ (shellSupports z).val.2
    · simp [h]
    · have h' : natNegativeMass (z.val i) = 0 := Nat.eq_zero_of_not_pos
        (fun hp => h ((mem_shellSupports_neg z i).2 (natNegativeMass_pos_iff.mp hp)))
      simp [h,h']
  rw [hP,hN]
  exact natPosNegMass_cast_difference _

omit [Fintype α] in
theorem mem_support_pos_unpack {p : ℕ} (d : ShellData α p) (i : α) :
    i ∈ d.1.val.1 ↔ 0 < unpackShellCoord d i := by
  rw [← natPositiveMass_pos_iff,pos_unpackShellCoord]
  by_cases hi : i ∈ d.1.val.1
  · simp [hi,show 0 < d.2.1.val ⟨i,hi⟩ from d.2.1.property.2 _]
  · simp [hi]

omit [Fintype α] in
theorem mem_support_neg_unpack {p : ℕ} (d : ShellData α p) (i : α) :
    i ∈ d.1.val.2 ↔ unpackShellCoord d i < 0 := by
  rw [← natNegativeMass_pos_iff,neg_unpackShellCoord]
  by_cases hi : i ∈ d.1.val.2
  · simp [hi,show 0 < d.2.2.val ⟨i,hi⟩ from d.2.2.property.2 _]
  · simp [hi]

theorem unpackShell_injective {p : ℕ} :
    Function.Injective (@unpackShell α _ _ p) := by
  intro d e he
  have hc (i : α) : unpackShellCoord d i = unpackShellCoord e i :=
    congrArg (fun z : UnclippedMassShell α p => z.val i) he
  have hs : d.1 = e.1 := by
    apply Subtype.ext
    apply Prod.ext
    · ext i
      rw [mem_support_pos_unpack,mem_support_pos_unpack,hc]
    · ext i
      rw [mem_support_neg_unpack,mem_support_neg_unpack,hc]
  rcases d with ⟨a,⟨u,v⟩⟩
  rcases e with ⟨b,⟨u',v'⟩⟩
  dsimp only at hs
  subst b
  have hu : u = u' := by
    apply Subtype.ext
    funext i
    have hi := congrArg natPositiveMass (hc i.val)
    simpa [pos_unpackShellCoord,i.property] using hi
  have hv : v = v' := by
    apply Subtype.ext
    funext i
    have hi := congrArg natNegativeMass (hc i.val)
    simpa [neg_unpackShellCoord,i.property] using hi
  rw [hu,hv]

def massShell_supportEquiv (p : ℕ) : UnclippedMassShell α (p+1) ≃ ShellData α (p+1) where
  toFun := packShell
  invFun := unpackShell
  left_inv := unpackShell_packShell
  right_inv d := unpackShell_injective (unpackShell_packShell (unpackShell d))

noncomputable instance (A : Finset α) (p : ℕ) : Fintype (PosCompositionOn A p) := by
  classical
  let box := Finset.range (p+1)
  have hz (f : PosCompositionOn A p) (i : ↥A) : f.val i ∈ box := by
    have h := Finset.single_le_sum (fun j _ => Nat.zero_le (f.val j)) (Finset.mem_univ i)
    rw [f.property.1] at h
    exact Finset.mem_range.mpr (Nat.lt_succ_of_le h)
  exact Fintype.ofInjective (fun f i => (⟨f.val i,hz f i⟩ : ↥box))
    (fun x y h => Subtype.ext (funext fun i => congrArg (fun f : ↥A → ↥box => (f i).val) h))

theorem massShell_card_succ (p : ℕ) :
    Nat.card (UnclippedMassShell α (p+1)) =
      ∑ a : OppositeSupports α, p.choose (a.val.1.card-1)*p.choose (a.val.2.card-1) := by
  classical
  rw [Nat.card_congr (massShell_supportEquiv p),Nat.card_eq_fintype_card,Fintype.card_sigma]
  apply Finset.sum_congr rfl
  intro a _
  rw [Fintype.card_prod,← Nat.card_eq_fintype_card,← Nat.card_eq_fintype_card,
    posCompositionOn_card _ a.property.2.1,posCompositionOn_card _ a.property.2.2]

end HKMEhrhart
