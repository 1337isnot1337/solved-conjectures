import Conjectures.LonelinessFourSpeedCertificateAll
import Conjectures.LonelinessFourSpeedLift17
import Conjectures.LonelinessFourSpeedLift29
import Conjectures.LonelinessFourSpeedLift31
import Conjectures.LonelinessFourSpeedLift37
import Conjectures.LonelinessFourSpeedLift41
import Conjectures.LonelinessFourSpeedLift43
import Conjectures.LonelinessFourSpeedLift47
import Conjectures.LonelinessFourSpeedLift53
import Conjectures.LonelinessFourSpeedLift59
import Conjectures.LonelinessFourSpeedLift61

/-! The bounded four-speed classification obtained from the complete support
tables and checked finite folded-lift trees. Every coordinate permutation,
unit transformation, and residue choice is connected to the original speeds. -/

namespace Loneliness.Modular.FourSpeed

open Lifts

theorem lift_root_classification {m u inverse : ℕ} (hm : 1<m)
    (root : Fin 4 → ℕ) (tree : FoldedSearch.Tree 4)
    (hcheck : FoldedSearch.check 2 9 shortTerminal tree m root=true)
    (hroot : Function.Injective root)
    (v : Fin 4 → ℕ) (hpositive : ∀ i, 0<v i)
    (hprimitive : Search.Primitive v) (hlow : value (List.ofFn v)<(2/9 : ℝ))
    (hunit : (u*inverse)%m=1%m)
    (hsupport : (List.ofFn root).toFinset=
      foldedSupport m u (residueSupport m (List.ofFn v))) :
    (List.ofFn v).Perm [1,2,3,4] ∨ (List.ofFn v).Perm [1,3,4,7] := by
  obtain ⟨σ,hσ⟩ := retained_support_reindex (by omega : 0<m) v root hroot hsupport
  have hperm : (List.ofFn (v ∘ σ)).Perm (List.ofFn v) := σ.ofFn_comp_perm v
  have hprimitive' : Search.Primitive (v ∘ σ) := by
    change Normalization.gcd (List.ofFn (v ∘ σ))=1
    rw [list_gcd_eq_of_perm hperm]
    exact hprimitive
  have hlow' : value (List.ofFn (v ∘ σ))<(2/9 : ℝ) := by
    rw [CriticalFamilies.value_perm hperm]
    exact hlow
  have hrep : FoldedSearch.Represents m root (v ∘ σ) := ⟨u,inverse,hunit,hσ⟩
  rcases checked_classification hm root tree hcheck (v ∘ σ)
    (fun i => hpositive (σ i)) hrep hprimitive' hlow' with h | h
  · exact Or.inl (hperm.symm.trans h)
  · exact Or.inr (hperm.symm.trans h)

theorem retained_lifts_classification {N m u inverse : ℕ} (hm : 1<m)
    (retained : Finset (Finset ℕ)) (root : Fin N → Fin 4 → ℕ)
    (tree : Fin N → FoldedSearch.Tree 4)
    (hcheck : ∀ i, FoldedSearch.check 2 9 shortTerminal (tree i) m (root i)=true)
    (hroot : ∀ i, Function.Injective (root i))
    (hretained : retained=Finset.univ.image (fun i => (List.ofFn (root i)).toFinset))
    (v : Fin 4 → ℕ) (hpositive : ∀ i, 0<v i)
    (hprimitive : Search.Primitive v) (hlow : value (List.ofFn v)<(2/9 : ℝ))
    (hunit : (u*inverse)%m=1%m)
    (hmem : foldedSupport m u (residueSupport m (List.ofFn v))∈retained) :
    (List.ofFn v).Perm [1,2,3,4] ∨ (List.ofFn v).Perm [1,3,4,7] := by
  rw [hretained] at hmem
  obtain ⟨i,_hi,hsupport⟩ := Finset.mem_image.mp hmem
  exact lift_root_classification hm (root i) (tree i) (hcheck i) (hroot i)
    v hpositive hprimitive hlow hunit hsupport

theorem retained_prime_classification {p u inverse : ℕ} (hp : p∈checkedPrimes)
    (v : Fin 4 → ℕ) (hpositive : ∀ i, 0<v i)
    (hprimitive : Search.Primitive v) (hlow : value (List.ofFn v)<(2/9 : ℝ))
    (hunit : (u*inverse)%p=1%p)
    (hmem : foldedSupport p u (residueSupport p (List.ofFn v))∈retainedFor p) :
    (List.ofFn v).Perm [1,2,3,4] ∨ (List.ofFn v).Perm [1,3,4,7] := by
  simp only [checkedPrimes,Finset.mem_insert,Finset.mem_singleton] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact retained_lifts_classification (by decide) Prime17.retained
      Lifts.Prime17.root Lifts.Prime17.tree Lifts.Prime17.all_checked
      Lifts.Prime17.roots_injective Lifts.Prime17.retained_eq
      v hpositive hprimitive hlow hunit (by simpa [retainedFor] using hmem)
  · exact retained_lifts_classification (by decide) Prime29.retained
      Lifts.Prime29.root Lifts.Prime29.tree Lifts.Prime29.all_checked
      Lifts.Prime29.roots_injective Lifts.Prime29.retained_eq
      v hpositive hprimitive hlow hunit (by simpa [retainedFor] using hmem)
  · exact retained_lifts_classification (by decide) Prime31.retained
      Lifts.Prime31.root Lifts.Prime31.tree Lifts.Prime31.all_checked
      Lifts.Prime31.roots_injective Lifts.Prime31.retained_eq
      v hpositive hprimitive hlow hunit (by simpa [retainedFor] using hmem)
  · exact retained_lifts_classification (by decide) Prime37.retained
      Lifts.Prime37.root Lifts.Prime37.tree Lifts.Prime37.all_checked
      Lifts.Prime37.roots_injective Lifts.Prime37.retained_eq
      v hpositive hprimitive hlow hunit (by simpa [retainedFor] using hmem)
  · exact retained_lifts_classification (by decide) Prime41.retained
      Lifts.Prime41.root Lifts.Prime41.tree Lifts.Prime41.all_checked
      Lifts.Prime41.roots_injective Lifts.Prime41.retained_eq
      v hpositive hprimitive hlow hunit (by simpa [retainedFor] using hmem)
  · exact retained_lifts_classification (by decide) Prime43.retained
      Lifts.Prime43.root Lifts.Prime43.tree Lifts.Prime43.all_checked
      Lifts.Prime43.roots_injective Lifts.Prime43.retained_eq
      v hpositive hprimitive hlow hunit (by simpa [retainedFor] using hmem)
  · exact retained_lifts_classification (by decide) Prime47.retained
      Lifts.Prime47.root Lifts.Prime47.tree Lifts.Prime47.all_checked
      Lifts.Prime47.roots_injective Lifts.Prime47.retained_eq
      v hpositive hprimitive hlow hunit (by simpa [retainedFor] using hmem)
  · exact retained_lifts_classification (by decide) Prime53.retained
      Lifts.Prime53.root Lifts.Prime53.tree Lifts.Prime53.all_checked
      Lifts.Prime53.roots_injective Lifts.Prime53.retained_eq
      v hpositive hprimitive hlow hunit (by simpa [retainedFor] using hmem)
  · exact retained_lifts_classification (by decide) Prime59.retained
      Lifts.Prime59.root Lifts.Prime59.tree Lifts.Prime59.all_checked
      Lifts.Prime59.roots_injective Lifts.Prime59.retained_eq
      v hpositive hprimitive hlow hunit (by simpa [retainedFor] using hmem)
  · exact retained_lifts_classification (by decide) Prime61.retained
      Lifts.Prime61.root Lifts.Prime61.tree Lifts.Prime61.all_checked
      Lifts.Prime61.roots_injective Lifts.Prime61.retained_eq
      v hpositive hprimitive hlow hunit (by simpa [retainedFor] using hmem)

/-- Complete classification below `2/9` for positive primitive four-speed
tuples whose coordinates are at most the separately proved cutoff `5832`. -/
theorem bounded_four_speed_classification (v : Fin 4 → ℕ)
    (hpositive : ∀ i, 0<v i) (hbound : ∀ i, v i≤5832)
    (hprimitive : Search.Primitive v) (hlow : value (List.ofFn v)<(2/9 : ℝ)) :
    (List.ofFn v).Perm [1,2,3,4] ∨ (List.ofFn v).Perm [1,3,4,7] := by
  have hposList : ∀ d∈List.ofFn v, 0<d := by
    intro d hd
    obtain ⟨i,rfl⟩ := List.mem_ofFn.mp hd
    exact hpositive i
  have hboundList : ∀ d∈List.ofFn v, d≤5832 := by
    intro d hd
    obtain ⟨i,rfl⟩ := List.mem_ofFn.mp hd
    exact hbound i
  obtain ⟨p,hp,u,inverse,hunit,hmem⟩ := bounded_four_speed_residue_cover
    (List.ofFn v) (by simp) hposList hboundList hlow
  exact retained_prime_classification hp v hpositive hprimitive hlow hunit hmem

/-- List form of the bounded classification, preserving the literal input
order up to the permutation in the conclusion. -/
theorem bounded_four_speed_list_classification (ds : List ℕ) (hlen : ds.length=4)
    (hpositive : ∀ d∈ds, 0<d) (hbound : ∀ d∈ds, d≤5832)
    (hprimitive : Normalization.gcd ds=1) (hlow : value ds<(2/9 : ℝ)) :
    ds.Perm [1,2,3,4] ∨ ds.Perm [1,3,4,7] := by
  let v : Fin 4 → ℕ := fun i => ds.get (Fin.cast hlen.symm i)
  have hv : List.ofFn v=ds := by
    exact (List.ofFn_congr hlen ds.get).symm.trans (List.ofFn_get ds)
  have hmem (i : Fin 4) : v i∈ds := by
    rw [←hv]
    exact List.mem_ofFn.mpr ⟨i,rfl⟩
  have hp : Search.Primitive v := by
    change Normalization.gcd (List.ofFn v)=1
    rwa [hv]
  have hlow' : value (List.ofFn v)<(2/9 : ℝ) := by rwa [hv]
  have h := bounded_four_speed_classification v (fun i => hpositive (v i) (hmem i))
    (fun i => hbound (v i) (hmem i)) hp hlow'
  rwa [hv] at h

end Loneliness.Modular.FourSpeed
