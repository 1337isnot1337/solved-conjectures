import Conjectures.LonelinessSixSpectrumFieldsSupportDefs
import Conjectures.LonelinessSixSpectrumFieldsTransform
import Conjectures.LonelinessModularSupportLists
import Conjectures.LonelinessModularMultiplicity
import Mathlib.Data.List.GetD

/-! A complete support-search certificate proves the finite prime cover
needed by the six-speed product argument. All support sizes up to six,
folded collisions, coordinate permutations, and unit scalings are retained.
The row and search checks remain explicit finite inputs. -/

namespace Loneliness.SixSpectrumFields

open Modular Modular.FourSpeed

theorem listTuple_of_length (ds : List ℕ) (hlen : ds.length = 6) :
    List.ofFn (listTuple ds) = ds := by
  apply List.ext_getElem (by simp only [List.length_ofFn, hlen])
  intro i _hi hi
  rw [List.getElem_ofFn]
  exact List.getD_eq_getElem ds 0 hi

theorem relations_of_list_perm (p : ℕ) (v w : Fin 6 → ℕ)
    (hperm : (List.ofFn v).Perm (List.ofFn w))
    (h : TwoRelations p (fun i => (w i : ℤ))) :
    TwoRelations p (fun i => (v i : ℤ)) := by
  obtain ⟨π, hπ⟩ := Multiplicity.reindex_of_ofFn_perm v w hperm
  apply relations_of_perm p π (fun i => (v i : ℤ))
  simpa only [Function.comp_def, hπ] using h

theorem supportRelationsCheck_sound (p : ℕ) (s : Finset ℕ) (v : Fin 6 → ℕ)
    (hset : (List.ofFn v).toFinset = s) (hcheck : supportRelationsCheck p s = true) :
    TwoRelations p (fun i => (v i : ℤ)) := by
  rcases supportRelationsCheck_cases p s hcheck with ⟨h6, hrow⟩ | ⟨h5, hrows⟩
  · obtain ⟨hlen, hr⟩ := listRelationsCheck_sound p (s.sort (· ≤ ·)) hrow
    apply relations_of_list_perm p v (listTuple (s.sort (· ≤ ·))) ?_ hr
    rw [listTuple_of_length _ hlen]
    exact Multiplicity.perm_support_of_length (List.ofFn v) s hset (by simp [h6])
  · obtain ⟨a, ha, hperm⟩ := Multiplicity.perm_support_cons_of_length
      (List.ofFn v) s hset (by simp [h5])
    obtain ⟨hlen, hr⟩ := listRelationsCheck_sound p (a :: s.sort (· ≤ ·)) (hrows a ha)
    apply relations_of_list_perm p v (listTuple (a :: s.sort (· ≤ ·))) ?_ hr
    simpa only [listTuple_of_length _ hlen] using hperm

theorem twoRelationsCheck_complete (p : ℕ) (v : Fin 6 → ℤ)
    (h : TwoRelations p v) : twoRelationsCheck p v = true := by
  obtain ⟨a, b, hab, ha, hb⟩ := h
  apply decide_eq_true
  exact Finset.one_lt_card.mpr
    ⟨a, Finset.mem_filter.mpr ⟨Finset.mem_univ a, ha⟩,
      b, Finset.mem_filter.mpr ⟨Finset.mem_univ b, hb⟩, hab⟩

theorem pointCheck_of_hasWitness (p : ℕ) (hp : 0 < p) (v : Fin 6 → ℕ)
    (h : HasWitness 6 p (List.ofFn v)) : pointCheck p v = true := by
  obtain ⟨t, ht⟩ := h
  rw [pointCheck, Bool.or_eq_true_eq_eq_true_or_eq_true]
  left
  apply List.any_eq_true.mpr
  exact ⟨t % p, List.mem_range.mpr (Nat.mod_lt _ hp),
    decide_eq_true ((witness_mod_time 6 p t (List.ofFn v)).mpr ht)⟩

theorem pointCheck_of_relations (p : ℕ) (v : Fin 6 → ℕ)
    (h : TwoRelations p (fun i => (v i : ℤ))) : pointCheck p v = true := by
  rw [pointCheck, Bool.or_eq_true_eq_eq_true_or_eq_true]
  exact Or.inr (twoRelationsCheck_complete p _ h)

private theorem singleton_grid_witness (p : ℕ) (hp : 2 ≤ p) :
    HasRationalWitness 1 6 p [1] := by
  refine ⟨p / 2, ?_⟩
  intro d hd
  have hd1 : d = 1 := List.mem_singleton.mp hd
  subst d
  change 1 * p ≤ 6 * folded p (p / 2 * 1)
  rw [Nat.one_mul, Nat.mul_one, folded_eq_self (by omega : 2 * (p / 2) ≤ p)]
  omega

/-- Pure modular normalization uses absence of a grid witness, without a
real loneliness hypothesis. Thus it covers the full finite residue domain. -/
theorem support_normalization_of_no_witness (p : ℕ) (hp : 2 ≤ p)
    (inv : ℕ → ℕ)
    (hinv : ∀ a, 0 < a → 2 * a ≤ p → (a * inv a) % p = 1 % p)
    (ds : List ℕ) (hlen : ds.length = 6) (hmod : ∀ d ∈ ds, d % p ≠ 0)
    (hno : ¬ HasWitness 6 p ds) :
    ∃ u inverse : ℕ, (u * inverse) % p = 1 % p ∧
      SupportLists.Survivor 6 6 p inv (foldedSupport p u (residueSupport p ds)) := by
  have hp0 : 0 < p := by omega
  have hne : ds ≠ [] := by intro hz; simp only [hz, List.length_nil] at hlen; omega
  let original := residueSupport p ds
  have horiginal : FoldedSupport p original := residueSupport_valid hp0 ds hmod
  have hpos : 0 < original.card := residueSupport_card_pos (m := p) hne
  obtain ⟨u, inverse, hunit, hmem⟩ := coveredSupports_complete hp hpos inv hinv
    original horiginal rfl
  let s := foldedSupport p u original
  have hs : FoldedSupport p s := foldedSupport_valid hp0 hunit horiginal
  have hcard : s.card = original.card := foldedSupport_card hp0 hunit horiginal
  have hstructure : 1 ∈ s ∧ (original.card = 1 ∨ PairNormalized p inv s) := by
    by_cases hsingle : original.card = 1
    · have hb : s ∈ boundedSupports p original.card := by
        simpa only [coveredSupports, hsingle, ite_true] using hmem
      exact ⟨(mem_boundedSupports_iff.mp hb).2.2, Or.inl hsingle⟩
    · have hb : s ∈ normalizedSupports p original.card inv := by
        simpa only [coveredSupports, ite_eq_right hsingle] using hmem
      have hh := mem_normalizedSupports_iff.mp hb
      exact ⟨hh.2.2.1, Or.inr hh.2.2.2⟩
  have hnow : ¬ HasRationalWitness 1 6 p (s.sort (· ≤ ·)) := by
    intro hw
    obtain ⟨t, ht⟩ := transformed_support_witness hp0 hunit ds hw
    apply hno
    refine ⟨t, ?_⟩
    intro d hd
    simpa only [Nat.one_mul] using ht d hd
  have hcardtwo : 2 ≤ s.card := by
    by_contra h
    have hcardone : s.card = 1 := by omega
    obtain ⟨a, ha⟩ := Finset.card_eq_one.mp hcardone
    have ha1 : a = 1 := by
      have hh := hstructure.1
      rw [ha, Finset.mem_singleton] at hh
      exact hh.symm
    have heq : s = {1} := by simpa only [ha1] using ha
    apply hnow
    simpa [heq] using singleton_grid_witness p hp
  have hpair : PairNormalized p inv s := hstructure.2.resolve_left (by omega)
  have hcover : InitialSupport.times p ⊆ s.biUnion (InitialSupport.badTimes 6 p) :=
    (SupportLists.covers_times_iff_no_rational_witness 6 p hp0 s ⟨1, hstructure.1⟩).mpr hnow
  refine ⟨u, inverse, hunit, hs, hcardtwo, ?_, hstructure.1, hpair, hcover⟩
  have hupper := residueSupport_card_le p ds
  rw [hcard]
  simpa only [hlen] using hupper

/-- Complete checked support masks and their multiplicity checks prove the
exact nonzero raw-residue cover used by the prime-product theorem. -/
theorem primeTriangleCover_of_checked_supports {N : ℕ} (p : ℕ) (hp : p.Prime)
    (inv : ℕ → ℕ)
    (hinv : ∀ a, 0 < a → 2 * a ≤ p → (a * inv a) % p = 1 % p)
    (rows : Fin N → ℕ)
    (hrows : ∀ i, supportRelationsCheck p (SupportSearch.Bits.decode (rows i)) = true)
    (trees : ℕ → SupportSearch.Tree)
    (hcheck : ∀ b, 2 ≤ b → 2 * b ≤ p →
      SupportSearch.check (InitialSupport.badTimes 6 p)
        (InitialSupport.pairCompatible p inv b) (SupportLists.terminal rows) (trees b)
        (InitialSupport.selected b) (InitialSupport.available p inv b)
        (InitialSupport.uncovered 6 p b) 4 = true) : PrimeTriangleCover p := by
  classical
  intro r hpositive
  let v : Fin 6 → ℕ := fun i => (r i).val
  by_cases hw : HasWitness 6 p (List.ofFn v)
  · exact pointCheck_of_hasWitness p hp.pos v hw
  · have hmod : ∀ d ∈ List.ofFn v, d % p ≠ 0 := by
      intro d hd
      obtain ⟨i, rfl⟩ := List.mem_ofFn.mp hd
      rw [Nat.mod_eq_of_lt (r i).isLt]
      exact Nat.ne_of_gt (hpositive i)
    obtain ⟨u, inverse, hunit, hsurvivor⟩ := support_normalization_of_no_witness p hp.two_le
      inv hinv (List.ofFn v) (by simp) hmod hw
    obtain ⟨index, hsupport⟩ := SupportLists.checked_survivor_mem 6 6 p (by decide)
      inv rows trees hcheck _ hsurvivor
    let w : Fin 6 → ℕ := fun i => folded p (u * v i)
    have hset : (List.ofFn w).toFinset = foldedSupport p u (residueSupport p (List.ofFn v)) := by
      simpa only [List.map_ofFn, Function.comp_def] using
        (transformed_support_eq p u hp.pos (List.ofFn v)).symm
    have hrow : supportRelationsCheck p
        (foldedSupport p u (residueSupport p (List.ofFn v))) = true := by
      rw [hsupport]
      exact hrows index
    have hrelations := supportRelationsCheck_sound p _ w hset hrow
    exact pointCheck_of_relations p v (relations_of_folded_unit p hp u inverse hunit v hrelations)

end Loneliness.SixSpectrumFields
