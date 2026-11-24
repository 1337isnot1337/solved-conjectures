import Conjectures.FanTringaliRadix

/-!
# Fan–Tringali's power-monoid length-set conjecture: all divisors under radix

The lift below applies to arbitrary reduced factors of the encoded set. It
therefore establishes preservation of the entire atomic length set, rather
than only preserving the displayed graph factorizations.
-/

open scoped Pointwise

namespace FanTringali

section RadixTransfer

variable {ι : Type*} [Fintype ι]

/-- One uniform coordinate bound for a finite lattice set. -/
def CoordinateBound (M : ℕ) (X : Finset (ι → ℕ)) : Prop := ∀ x ∈ X, ∀ i, x i ≤ M

theorem encode_image_eq_zero (b : ℕ) (hb : 0 < b) (A : Finset (ι → ℕ)) :
    A.image (encodeHom b) = 0 ↔ A=0 := by
  constructor
  · intro hA
    have hEncodedZero : 0 ∈ A.image (encodeHom b) := by rw [hA]; simp
    obtain ⟨z, hz, hz₀⟩ := Finset.mem_image.mp hEncodedZero
    have hzEq : z=0 := (encode_eq_zero_iff b hb z).mp hz₀
    have hZero : 0 ∈ A := hzEq ▸ hz
    ext x
    constructor
    · intro hx
      apply Finset.mem_zero.mpr
      apply (encode_eq_zero_iff b hb x).mp
      have hx' : encodeHom b x ∈ A.image (encodeHom b) := Finset.mem_image.mpr ⟨x,hx,rfl⟩
      rw [hA] at hx'
      exact Finset.mem_zero.mp hx'
    · intro hx
      have hx₀ := Finset.mem_zero.mp hx
      simpa only [hx₀] using hZero
  · rintro rfl
    simp [Finset.singleton_zero]

/-- Every reduced binary factorization of an encoded bounded set lifts to a
binary factorization of the original lattice set. Both lifted factors are
subsets of the original set. -/
theorem radix_divisors_lift (b M : ℕ) (hb : 2*M < b) (X : Finset (ι → ℕ))
    (hX : CoordinateBound M X) (hX₀ : 0 ∈ X) (A B : Finset ℕ)
    (hA : 0 ∈ A) (hB : 0 ∈ B) (hAB : A+B=X.image (encodeHom b)) :
    ∃ A' B' : Finset (ι → ℕ),
      0 ∈ A' ∧ 0 ∈ B' ∧ A' ⊆ X ∧ B' ⊆ X ∧
      A'.image (encodeHom b) = A ∧ B'.image (encodeHom b) = B ∧ A'+B'=X := by
  let A' := X.filter fun x => encodeHom b x ∈ A
  let B' := X.filter fun x => encodeHom b x ∈ B
  have hA'X : A' ⊆ X := Finset.filter_subset _ _
  have hB'X : B' ⊆ X := Finset.filter_subset _ _
  have hImage : ∀ D : Finset ℕ, D ⊆ X.image (encodeHom b) →
      (X.filter fun x => encodeHom b x ∈ D).image (encodeHom b) = D := by
    intro D hD
    ext n
    constructor
    · intro hn
      obtain ⟨x, hx, rfl⟩ := Finset.mem_image.mp hn
      exact (Finset.mem_filter.mp hx).2
    · intro hn
      obtain ⟨x, hx, he⟩ := Finset.mem_image.mp (hD hn)
      exact Finset.mem_image.mpr ⟨x, Finset.mem_filter.mpr ⟨hx, by simpa only [he] using hn⟩, he⟩
  have hImageA : A'.image (encodeHom b) = A := hImage A (by
    rw [← hAB]
    exact left_subset_sum hB)
  have hImageB : B'.image (encodeHom b) = B := hImage B (by
    rw [← hAB]
    exact right_subset_sum hA)
  have hA'₀ : 0 ∈ A' := Finset.mem_filter.mpr ⟨hX₀, by simpa using hA⟩
  have hB'₀ : 0 ∈ B' := Finset.mem_filter.mpr ⟨hX₀, by simpa using hB⟩
  have hInjSum : ∀ x ∈ A', ∀ y ∈ B', ∀ z ∈ X,
      encodeHom b (x+y) = encodeHom b z → x+y=z := by
    intro x hx y hy z hz he
    apply encode_injective_bounded b (by omega) (x+y) z _ _ he
    · intro i
      have hxi := hX x (hA'X hx) i
      have hyi := hX y (hB'X hy) i
      change x i + y i < b
      omega
    · intro i
      have hzi := hX z hz i
      omega
  refine ⟨A', B', hA'₀, hB'₀, hA'X, hB'X, hImageA, hImageB, ?_⟩
  ext z
  constructor
  · intro hz
    obtain ⟨x, hx, y, hy, rfl⟩ := Finset.mem_add.mp hz
    have hEncoded : encodeHom b (x+y) ∈ X.image (encodeHom b) := by
      rw [map_add, ← hAB]
      exact Finset.add_mem_add (Finset.mem_filter.mp hx).2 (Finset.mem_filter.mp hy).2
    obtain ⟨w, hw, he⟩ := Finset.mem_image.mp hEncoded
    have hEq := hInjSum x hx y hy w hw he.symm
    exact hEq ▸ hw
  · intro hz
    have hEncoded : encodeHom b z ∈ A+B := by
      rw [hAB]
      exact Finset.mem_image.mpr ⟨z,hz,rfl⟩
    obtain ⟨a, ha, c, hc, he⟩ := Finset.mem_add.mp hEncoded
    rw [← hImageA] at ha
    rw [← hImageB] at hc
    obtain ⟨x, hx, rfl⟩ := Finset.mem_image.mp ha
    obtain ⟨y, hy, rfl⟩ := Finset.mem_image.mp hc
    exact Finset.mem_add.mpr ⟨x,hx,y,hy,hInjSum x hx y hy z hz (by simpa only [map_add] using he)⟩

theorem radix_atom_iff (b M : ℕ) (hb : 2*M < b) (X : Finset (ι → ℕ))
    (hX : CoordinateBound M X) : Atom (X.image (encodeHom b)) ↔ Atom X := by
  have hb₀ : 0 < b := by omega
  constructor
  · intro hAtom
    have hX₀ : 0 ∈ X := by
      obtain ⟨x, hx, he⟩ := Finset.mem_image.mp hAtom.1
      have hx₀ := (encode_eq_zero_iff b hb₀ x).mp he
      exact hx₀ ▸ hx
    refine ⟨hX₀, ?_, ?_⟩
    · intro hZero
      exact hAtom.2.1 ((encode_image_eq_zero b hb₀ X).mpr hZero)
    · intro A B hA hB hAB
      have hImage : A.image (encodeHom b) + B.image (encodeHom b) = X.image (encodeHom b) := by
        rw [← Finset.image_add (encodeHom b), hAB]
      have hImageA₀ : 0 ∈ A.image (encodeHom b) := by
        exact Finset.mem_image.mpr ⟨0,hA,(encodeHom b).map_zero⟩
      have hImageB₀ : 0 ∈ B.image (encodeHom b) := by
        exact Finset.mem_image.mpr ⟨0,hB,(encodeHom b).map_zero⟩
      rcases hAtom.2.2 _ _ hImageA₀ hImageB₀ hImage with hZero | hZero
      · exact Or.inl ((encode_image_eq_zero b hb₀ A).mp hZero)
      · exact Or.inr ((encode_image_eq_zero b hb₀ B).mp hZero)
  · intro hAtom
    refine ⟨?_, ?_, ?_⟩
    · exact Finset.mem_image.mpr ⟨0,hAtom.1,(encodeHom b).map_zero⟩
    · intro hZero
      exact hAtom.2.1 ((encode_image_eq_zero b hb₀ X).mp hZero)
    · intro A B hA hB hAB
      obtain ⟨A',B',hA'₀,hB'₀,_,_,hImageA,hImageB,hSum⟩ :=
        radix_divisors_lift b M hb X hX hAtom.1 A B hA hB hAB
      rcases hAtom.2.2 A' B' hA'₀ hB'₀ hSum with hZero | hZero
      · left
        rw [← hImageA, hZero]
        simp [Finset.singleton_zero]
      · right
        rw [← hImageB, hZero]
        simp [Finset.singleton_zero]

end RadixTransfer

section Lists

variable {α β : Type*} [DecidableEq α] [DecidableEq β] [AddMonoid α] [AddMonoid β]

omit [DecidableEq β] [AddMonoid β] in
theorem factor_subset_list_sum {L : List (Finset α)}
    (hZero : ∀ A ∈ L, 0 ∈ A) {A : Finset α} (hA : A ∈ L) : A ⊆ L.sum := by
  induction L with
  | nil => simp at hA
  | cons B L ih =>
    have hB₀ := hZero B (List.mem_cons_self)
    have hL₀ : ∀ C ∈ L, 0 ∈ C := fun C hC => hZero C (List.mem_cons_of_mem _ hC)
    rcases List.mem_cons.mp hA with rfl | hA
    · exact left_subset_sum (zero_mem_list_sum hL₀)
    · exact (ih hL₀ hA).trans (right_subset_sum hB₀)

theorem image_list_sum (f : α →+ β) (L : List (Finset α)) :
    (L.map (fun A => A.image f)).sum = L.sum.image f := by
  induction L with
  | nil => simp [Finset.singleton_zero]
  | cons A L ih =>
    simp only [List.map_cons, List.sum_cons, ih, Finset.image_add f]

end Lists

section LengthTransfer

variable {ι : Type*} [Fintype ι]

theorem radix_lift_factorization (b M : ℕ) (hb : 2*M < b) (L : List (Finset ℕ))
    (X : Finset (ι → ℕ)) (hX : CoordinateBound M X) (hX₀ : 0 ∈ X)
    (hAtom : ∀ A ∈ L, Atom A) (hSum : L.sum = X.image (encodeHom b)) :
    ∃ K : List (Finset (ι → ℕ)),
      (∀ A ∈ K, Atom A) ∧ K.sum=X ∧ K.length=L.length := by
  induction L generalizing X with
  | nil =>
    have hImage : X.image (encodeHom b) = 0 := by simpa only [List.sum_nil] using hSum.symm
    have hZero := (encode_image_eq_zero b (by omega) X).mp hImage
    exact ⟨[], by simp, by simpa only [List.sum_nil] using hZero.symm, rfl⟩
  | cons A L ih =>
    have hA := hAtom A List.mem_cons_self
    have hL : ∀ B ∈ L, Atom B := fun B hB => hAtom B (List.mem_cons_of_mem _ hB)
    have hL₀ : 0 ∈ L.sum := zero_mem_list_sum (fun B hB => (hL B hB).1)
    have hAL : A+L.sum = X.image (encodeHom b) := by simpa only [List.sum_cons] using hSum
    obtain ⟨A',B',hA'₀,hB'₀,hA'X,hB'X,hImageA,hImageB,hSum'⟩ :=
      radix_divisors_lift b M hb X hX hX₀ A L.sum hA.1 hL₀ hAL
    have hBoundA : CoordinateBound M A' := fun x hx i => hX x (hA'X hx) i
    have hBoundB : CoordinateBound M B' := fun x hx i => hX x (hB'X hx) i
    have hA' : Atom A' := (radix_atom_iff b M hb A' hBoundA).mp (by rw [hImageA]; exact hA)
    obtain ⟨K,hKAtom,hKSum,hKLen⟩ := ih B' hBoundB hB'₀ hL hImageB.symm
    refine ⟨A'::K, ?_, ?_, ?_⟩
    · intro D hD
      rcases List.mem_cons.mp hD with rfl | hD
      · exact hA'
      · exact hKAtom D hD
    · rw [List.sum_cons, hKSum, hSum']
    · simp only [List.length_cons, hKLen]

/-- Radix encoding preserves the complete set of atomic factorization lengths. -/
theorem radix_lengths (b M : ℕ) (hb : 2*M < b) (X : Finset (ι → ℕ))
    (hX : CoordinateBound M X) (hX₀ : 0 ∈ X) :
    Lengths (X.image (encodeHom b)) = Lengths X := by
  ext n
  constructor
  · rintro ⟨L,hAtom,hSum,hLen⟩
    obtain ⟨K,hKAtom,hKSum,hKLen⟩ := radix_lift_factorization b M hb L X hX hX₀ hAtom hSum
    exact ⟨K,hKAtom,hKSum,hKLen.trans hLen⟩
  · rintro ⟨L,hAtom,hSum,hLen⟩
    refine ⟨L.map (fun A => A.image (encodeHom b)), ?_, ?_, ?_⟩
    · intro B hB
      obtain ⟨A,hA,rfl⟩ := List.mem_map.mp hB
      apply (radix_atom_iff b M hb A ?_).mpr (hAtom A hA)
      intro x hx i
      apply hX x _ i
      rw [← hSum]
      exact factor_subset_list_sum (fun D hD => (hAtom D hD).1) hA hx
    · rw [image_list_sum, hSum]
    · simpa only [List.length_map] using hLen

/-- An arbitrary finite lattice set containing zero has an integer realization
with exactly the same atomic length set. -/
theorem exists_nat_same_lengths (X : Finset (ι → ℕ)) (hX₀ : 0 ∈ X) :
    ∃ Y : Finset ℕ, 0 ∈ Y ∧ Lengths Y = Lengths X := by
  let M : ℕ := X.sup (fun x => (Finset.univ : Finset ι).sup x)
  have hBound : CoordinateBound M X := by
    intro x hx i
    exact Finset.le_sup_of_le hx (Finset.le_sup (Finset.mem_univ i))
  refine ⟨X.image (encodeHom (2*M+1)), ?_, ?_⟩
  · exact Finset.mem_image.mpr ⟨0,hX₀,(encodeHom (2*M+1)).map_zero⟩
  · exact radix_lengths (2*M+1) M (by omega) X hBound hX₀

end LengthTransfer

end FanTringali
