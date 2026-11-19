import Conjectures.PackingPeriodic
import Mathlib.Data.Fin.Rev

/-! Transport the rectangular tiling through an invertible residue multiplier.
This supplies the packing and covering constructions without finite search. -/
namespace PackingFourPoint

def packingGridCenters (u v P : ℕ) (B : ZMod P) (c : Fin v × Fin u) : ZMod P :=
  B*(gridCenter u v c : ℕ)

def coveringGridCenters (u v P : ℕ) (B : ZMod P) (c : Fin v × Fin u) : ZMod P :=
  B*(gridCenter u v c+u*2 : ℕ)

theorem packing_grid_identity (u v P : ℕ) (A B : ZMod P)
    (hA : A = B*(u*2 : ℕ)) (e : (Fin v × Fin u) × (Fin 2 × Fin 2)) :
    packingGridCenters u v P B e.1 + fourOffsets A B e.2 =
      B*((gridCenter u v e.1+gridOffset u e.2 : ℕ) : ZMod P) := by
  simp only [packingGridCenters, fourOffsets, gridOffset, hA,
    Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat]
  ring

theorem packing_grid_injective (u v P : ℕ) (A B : ZMod P)
    (hA : A = B*(u*2 : ℕ)) (hB : IsUnit B) (hP : (v*2)*(u*2) ≤ P) :
    Function.Injective (fun e : (Fin v × Fin u) × (Fin 2 × Fin 2) =>
      packingGridCenters u v P B e.1 + fourOffsets A B e.2) := by
  intro e e' he
  apply grid_mod_injective u v P hP
  apply hB.mul_left_cancel
  simpa only [packing_grid_identity u v P A B hA] using he

theorem packing_grid_surjective (u v P : ℕ) [NeZero P] (A B : ZMod P)
    (hA : A = B*(u*2 : ℕ)) (hB : IsUnit B) (hP : P ≤ (v*2)*(u*2)) :
    Function.Surjective (fun e : (Fin v × Fin u) × (Fin 2 × Fin 2) =>
      packingGridCenters u v P B e.1 + fourOffsets A B e.2) := by
  intro z
  obtain ⟨U, rfl⟩ := hB
  obtain ⟨e, he⟩ := grid_mod_surjective u v P hP ((↑U⁻¹ : ZMod P)*z)
  refine ⟨e, ?_⟩
  change packingGridCenters u v P (↑U) e.1 + fourOffsets A (↑U) e.2 = z
  change ((gridCenter u v e.1+gridOffset u e.2 : ℕ) : ZMod P) = _ at he
  rw [packing_grid_identity u v P A (↑U) hA, he]
  simp

theorem covering_grid_identity (u v P : ℕ) (A B : ZMod P)
    (hA : A = -B*(u*2 : ℕ)) (e : (Fin v × Fin u) × (Fin 2 × Fin 2)) :
    coveringGridCenters u v P B e.1 + fourOffsets A B e.2 =
      B*((gridCenter u v e.1+gridOffset u (e.2.1.rev,e.2.2) : ℕ) : ZMod P) := by
  have hd : e.2.1.val + e.2.1.rev.val = 1 := by
    simp only [Fin.val_rev]
    omega
  have hd' : (e.2.1.val : ZMod P)+(e.2.1.rev.val : ZMod P) = 1 := by
    have hh := congrArg (fun n : ℕ => (n : ZMod P)) hd
    simpa only [Nat.cast_add, Nat.cast_one] using hh
  have hd'' : (e.2.1.rev.val : ZMod P) = 1-(e.2.1.val : ZMod P) := by
    rw [eq_sub_iff_add_eq]
    simpa only [add_comm] using hd'
  simp only [coveringGridCenters, fourOffsets, gridOffset, hA,
    Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat, hd'']
  ring

theorem covering_grid_surjective (u v P : ℕ) [NeZero P] (A B : ZMod P)
    (hA : A = -B*(u*2 : ℕ)) (hB : IsUnit B) (hP : P ≤ (v*2)*(u*2)) :
    Function.Surjective (fun e : (Fin v × Fin u) × (Fin 2 × Fin 2) =>
      coveringGridCenters u v P B e.1 + fourOffsets A B e.2) := by
  intro z
  obtain ⟨U, rfl⟩ := hB
  obtain ⟨e, he⟩ := grid_mod_surjective u v P hP ((↑U⁻¹ : ZMod P)*z)
  refine ⟨(e.1, (e.2.1.rev,e.2.2)), ?_⟩
  change coveringGridCenters u v P (↑U) e.1 +
    fourOffsets A (↑U) (e.2.1.rev,e.2.2) = z
  change ((gridCenter u v e.1+gridOffset u e.2 : ℕ) : ZMod P) = _ at he
  rw [covering_grid_identity u v P A (↑U) hA (e.1,(e.2.1.rev,e.2.2))]
  simp only [Fin.rev_rev]
  rw [he]
  simp

theorem gridCenter_injective (u v : ℕ) : Function.Injective (gridCenter u v) := by
  intro c c' he
  have hh : (c, ((0 : Fin 2),(0 : Fin 2))) = (c', ((0 : Fin 2),(0 : Fin 2))) := by
    apply grid_encode_injective u v
    simpa only [gridOffset, Fin.val_zero, Nat.mul_zero, Nat.zero_add, Nat.add_zero] using he
  exact congrArg Prod.fst hh

theorem packingGridCenters_injective (u v P : ℕ) (B : ZMod P)
    (hB : IsUnit B) (hP : (v*2)*(u*2) ≤ P) :
    Function.Injective (packingGridCenters u v P B) := by
  intro c c' he
  have ht := packing_grid_injective u v P (B*(u*2 : ℕ)) B rfl hB hP
  have hh : (c, ((0 : Fin 2),(0 : Fin 2))) = (c', ((0 : Fin 2),(0 : Fin 2))) := by
    apply ht
    simpa only [fourOffsets, Fin.val_zero, Nat.cast_zero, zero_mul, add_zero] using he
  exact congrArg Prod.fst hh

theorem coveringGridCenters_injective (u v P : ℕ) (B : ZMod P)
    (hB : IsUnit B) (hP : (v*2)*(u*2) ≤ P+1) :
    Function.Injective (coveringGridCenters u v P B) := by
  intro c c' he
  have h1 := grid_encode_lt u v (c, ((1 : Fin 2),(1 : Fin 2)))
  have h2 := grid_encode_lt u v (c', ((1 : Fin 2),(1 : Fin 2)))
  simp only [gridOffset, Fin.val_one, Nat.mul_one] at h1 h2
  have hc : gridCenter u v c+u*2 < P := by omega
  have hc' : gridCenter u v c'+u*2 < P := by omega
  have hmul := hB.mul_left_cancel he
  have hmod := (ZMod.natCast_eq_natCast_iff' _ _ P).mp hmul
  simp only [Nat.mod_eq_of_lt hc, Nat.mod_eq_of_lt hc'] at hmod
  apply gridCenter_injective u v
  omega

theorem coprime_packing_period (a b : ℕ) (hab : a < b) (hcop : a.Coprime b) :
    b.Coprime (a*b+b-a) := by
  let P := a*b+b-a
  have hrel : P+a = b*(a+1) := by
    dsimp [P]
    rw [Nat.sub_add_cancel (by omega : a ≤ a*b+b)]
    ring
  have hgB := Nat.gcd_dvd_left b P
  have hgP := Nat.gcd_dvd_right b P
  have hgPa : Nat.gcd b P ∣ P+a := by
    rw [hrel]
    exact dvd_mul_of_dvd_left hgB _
  have hgA : Nat.gcd b P ∣ a := (Nat.dvd_add_iff_right hgP).mpr hgPa
  have hg1 : Nat.gcd b P ∣ 1 := by
    simpa only [hcop.gcd_eq_one] using Nat.dvd_gcd hgA hgB
  exact Nat.eq_one_of_dvd_one hg1

def oddPackingCenters (a b p q : ℕ) : Fin q × Fin (p+1) → ZMod (a*b+b-a) :=
  packingGridCenters (p+1) q (a*b+b-a) (b : ZMod (a*b+b-a))

def oddCoveringCenters (a b p q : ℕ) : Fin (q+1) × Fin (p+1) → ZMod (a*b+a+b) :=
  coveringGridCenters (p+1) (q+1) (a*b+a+b) (b : ZMod (a*b+a+b))

theorem odd_packing_residues (a b p q : ℕ)
    (ha : a = 2*p+1) (hb : b = 2*q+1) (hab : a < b) (hcop : a.Coprime b) :
    Function.Injective (oddPackingCenters a b p q) ∧
    Function.Injective (fun e : (Fin q × Fin (p+1)) × (Fin 2 × Fin 2) =>
      oddPackingCenters a b p q e.1 + fourOffsets (a : ZMod (a*b+b-a)) b e.2) := by
  let P := a*b+b-a
  have hP : P+a = a*b+b := Nat.sub_add_cancel (by omega)
  have hR : (q*2)*((p+1)*2)+1 = P := by
    have hh : (q*2)*((p+1)*2)+a+1 = a*b+b := by rw [ha, hb]; ring
    omega
  have hbw : b*((p+1)*2) = P+a := by
    calc
      b*((p+1)*2) = a*b+b := by rw [ha]; ring
      _ = P+a := hP.symm
  have hA : (a : ZMod P) = (b : ZMod P)*((p+1)*2 : ℕ) := by
    have hh := congrArg (fun n : ℕ => (n : ZMod P)) hbw
    simpa only [Nat.cast_mul, Nat.cast_add, ZMod.natCast_self, zero_add] using hh.symm
  have hB : IsUnit (b : ZMod P) :=
    (ZMod.isUnit_iff_coprime b P).mpr (coprime_packing_period a b hab hcop)
  exact ⟨packingGridCenters_injective (p+1) q P b hB (by omega),
    packing_grid_injective (p+1) q P a b hA hB (by omega)⟩

theorem odd_covering_residues (a b p q : ℕ)
    (ha : a = 2*p+1) (hb : b = 2*q+1) (hab : a < b) (hcop : a.Coprime b) :
    Function.Injective (oddCoveringCenters a b p q) ∧
    Function.Surjective (fun e : (Fin (q+1) × Fin (p+1)) × (Fin 2 × Fin 2) =>
      oddCoveringCenters a b p q e.1 + fourOffsets (a : ZMod (a*b+a+b)) b e.2) := by
  let Q := a*b+a+b
  have hQ : 0 < Q := by dsimp [Q]; omega
  let : NeZero Q := ⟨by omega⟩
  have hR : ((q+1)*2)*((p+1)*2) = Q+1 := by dsimp [Q]; rw [ha, hb]; ring
  have hbw : a+b*((p+1)*2) = Q := by dsimp [Q]; rw [ha]; ring
  have hA : (a : ZMod Q) = -(b : ZMod Q)*((p+1)*2 : ℕ) := by
    have hh := congrArg (fun n : ℕ => (n : ZMod Q)) hbw
    simp only [Nat.cast_add, Nat.cast_mul, ZMod.natCast_self] at hh
    rw [neg_mul, eq_neg_iff_add_eq_zero]
    simpa only [Nat.cast_add, Nat.cast_mul] using hh
  have hcopQ : b.Coprime Q := by
    rw [← hbw, Nat.coprime_add_mul_left_right]
    exact hcop.symm
  have hB : IsUnit (b : ZMod Q) := (ZMod.isUnit_iff_coprime b Q).mpr hcopQ
  exact ⟨coveringGridCenters_injective (p+1) (q+1) Q b hB (by omega),
    covering_grid_surjective (p+1) (q+1) Q a b hA hB (by omega)⟩

end PackingFourPoint
