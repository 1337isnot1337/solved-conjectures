module

public import Conjectures.McNamaraSteingrimssonLaterFamilyBasic

@[expose] public section
namespace McNamaraSteingrimsson

theorem replacedOrder_full_beginsWithMaximum {n A K r : ℕ} (j i : Fin (n+1)) (hi : i≠j)
    (a : Equiv.Perm (Fin A)) {p : Equiv.Perm (Fin K)} (hp : BeginsWithMaximum p)
    (x : Equiv.Perm (Fin r)) : BeginsWithMaximum (replacedOrder j a p x i.succ) := by
  have h := replacedWidths_present (A := A) (K := K) (r := r) j i hi
  apply (beginsWithMaximum_cast_iff h _).mp
  rwa [replacedOrder_present j i hi a p x]

/-- The exceptional slot and the actual inserted permutation can both
be read back from the resulting middle permutation. -/
theorem laterOmissionMap_injective {n A K r : ℕ}
    {a : Equiv.Perm (Fin A)} {p : Equiv.Perm (Fin K)}
    (hAK : A<K) (hr : 0<r) (hrK : r<K) (hp : BeginsWithMaximum p) :
    Function.Injective (laterOmissionMap (n := n) (a := a) (p := p) hAK.le hrK.le) := by
  rintro ⟨j,x⟩ ⟨k,y⟩ h
  let w := replacedWidths j.val A K r
  let v := replacedWidths k.val A K r
  let q := replacedOrder j.val a p x.val
  let z := replacedOrder k.val a p y.val
  let hB := replacedWidths_le j.val hAK.le hrK.le
  let hC := replacedWidths_le k.val hAK.le hrK.le
  let eW := replacedWidths_card (A := A) (K := K) (r := r) j.val
  let eV := replacedWidths_card (A := A) (K := K) (r := r) k.val
  have he : castPermutation eW (blockPermutation hB q)=
    castPermutation eV (blockPermutation hC z) := congrArg Subtype.val h
  have hjk : j.val=k.val := later_omission_indices_unique hB hC q z eW eV j.val k.val hAK hr hrK
    rfl rfl (replacedWidths_absent j.val) (replacedWidths_absent k.val)
    (fun i hi => replacedWidths_present j.val i hi)
    (fun i hi => replacedWidths_present k.val i hi)
    (fun i hi => replacedOrder_full_beginsWithMaximum j.val i hi a hp x.val)
    (fun i hi => replacedOrder_full_beginsWithMaximum k.val i hi a hp y.val) he
  have hindex : j=k := Subtype.ext hjk
  subst k
  have hQ : replacedOrder j.val a p x.val=replacedOrder j.val a p y.val := by
    exact blockPermutation_orders_injective hB hC (castPermutation_injective eW he)
  have hR := congrArg (fun e : BlockOrder w =>
    castPermutation (replacedWidths_absent (A := A) (K := K) (r := r) j.val) (e j.val.succ)) hQ
  change castPermutation (replacedWidths_absent j.val) (replacedOrder j.val a p x.val j.val.succ)=
    castPermutation (replacedWidths_absent j.val) (replacedOrder j.val a p y.val j.val.succ) at hR
  rw [replacedOrder_absent,replacedOrder_absent] at hR
  exact Prod.ext rfl (Subtype.ext hR)

end McNamaraSteingrimsson
