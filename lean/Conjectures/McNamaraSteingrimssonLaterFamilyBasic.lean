module

public import Conjectures.McNamaraSteingrimssonReplacedBlocks
public import Conjectures.McNamaraSteingrimssonFirstFamilyConverse

@[expose] public section
namespace McNamaraSteingrimsson

theorem replacedProduct_pattern_between {n A K r : ℕ}
    (miss : Fin (n+1)) {a : Equiv.Perm (Fin A)} {p : Equiv.Perm (Fin K)}
    {x : Equiv.Perm (Fin r)} (hAK : A≤K) (hrK : r≤K) (hx : ClassicalPattern x p) :
    let b := blockPermutation (replacedWidths_le miss hAK hrK) (replacedOrder miss a p x)
    ClassicalPattern (repeatedPattern n a p hAK) b ∧
      ClassicalPattern b (repeatedPattern (n+1) a p hAK) := by
  let q := replacedOrder miss a p x
  refine ⟨?_,?_⟩
  · apply classicalPattern_of_block_matches (repeatedWidths_le hAK) (replacedWidths_le miss hAK hrK)
      (repeatedOrders a p) q (skipBlockLabel miss) (skipBlockLabel_strictMono miss)
    intro i
    refine Fin.cases (motive := fun i => ClassicalPattern (repeatedOrders (n := n) a p i)
      (q (skipBlockLabel miss i))) ((classicalPattern_same_size_iff_eq a a).mpr rfl) (fun j => ?_) i
    let k := miss.succAbove j
    have hk := Fin.succAbove_ne miss j
    change ClassicalPattern p (q k.succ)
    apply (classicalPattern_cast_right (replacedWidths_present miss k hk) _ _).mp
    rw [replacedOrder_present miss k hk a p x]
    exact (classicalPattern_same_size_iff_eq _ _).mpr rfl
  · apply classicalPattern_of_block_matches (replacedWidths_le miss hAK hrK) (repeatedWidths_le hAK)
      q (repeatedOrders a p) id strictMono_id
    intro i
    refine Fin.cases (motive := fun i => ClassicalPattern (q i) (repeatedOrders (n := n+1) a p i))
      ((classicalPattern_same_size_iff_eq a a).mpr rfl) (fun j => ?_) i
    change ClassicalPattern (q j.succ) p
    by_cases hj : j=miss
    · subst j
      apply (classicalPattern_cast_left (replacedWidths_absent miss) _ _).mp
      rwa [replacedOrder_absent miss a p x]
    · apply (classicalPattern_cast_left (replacedWidths_present miss j hj) _ _).mp
      rw [replacedOrder_present miss j hj a p x]
      exact (classicalPattern_same_size_iff_eq _ _).mpr rfl

abbrev LaterOmissionData (n : ℕ) {K : ℕ} (p : Equiv.Perm (Fin K)) (r : ℕ) :=
  {j : Fin (n+1) // j≠0} × PatternDownsetAt p r

/-- Insert one proper long-block pattern at the chosen nonfirst slot. -/
noncomputable def laterOmissionMap {n A K r : ℕ}
    {a : Equiv.Perm (Fin A)} {p : Equiv.Perm (Fin K)}
    (hAK : A≤K) (hrK : r≤K) (y : LaterOmissionData n p r) :
    AbsoluteInterval (repeatedPattern n a p hAK) (repeatedPattern (n+1) a p hAK) (A+n*K+r) := by
  let j := y.1.val
  let q := replacedOrder j a p y.2.val
  let e := replacedWidths_card (A := A) (K := K) (r := r) j
  let b := blockPermutation (replacedWidths_le j hAK hrK) q
  have h := replacedProduct_pattern_between (a := a) j hAK hrK y.2.property
  exact ⟨castPermutation e b, (classicalPattern_cast_right e _ _).mpr h.1,
    (classicalPattern_cast_left e _ _).mpr h.2⟩

theorem laterOmissionMap_has_component {n A K r : ℕ}
    {a : Equiv.Perm (Fin A)} {p : Equiv.Perm (Fin K)}
    (hAK : A≤K) (hrK : r≤K) (hK : 0<K) (hp : BeginsWithMaximum p)
    (y : LaterOmissionData n p r) :
    CanonicalComponent (laterOmissionMap (a := a) hAK hrK y).val A (A+K) := by
  let j := y.1.val
  let q := replacedOrder j a p y.2.val
  let e := replacedWidths_card (A := A) (K := K) (r := r) j
  let hW := replacedWidths_le j hAK hrK
  have hne : (0 : Fin (n+1))≠j := Ne.symm y.1.property
  have he := replacedWidths_present (A := A) (K := K) (r := r) j 0 hne
  have hmax : BeginsWithMaximum (q (0 : Fin (n+1)).succ) := by
    apply (beginsWithMaximum_cast_iff he _).mp
    rwa [replacedOrder_present j 0 hne a p y.2.val]
  change CanonicalComponent (castPermutation e (blockPermutation hW q)) A (A+K)
  apply (canonicalComponent_cast_iff e _ _ _).mpr
  exact later_omission_component_at_short_width hW q hK rfl he hmax

end McNamaraSteingrimsson
