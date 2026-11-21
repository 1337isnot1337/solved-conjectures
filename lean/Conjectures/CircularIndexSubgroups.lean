import Conjectures.CircularIndexAtoms
import Mathlib.Data.ZMod.Basic
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.Tactic.Abel

/-!
# Coset representatives for the connectivity proof

Lagrange's theorem puts `index(H) • 1` in every additive subgroup of a
finite cyclic group.  The remainder of a vertex modulo this index therefore
labels its coset.  Small generator representatives make the subgroup dominate
the graph.
-/

namespace CircularIndex.Connectivity

open Finset

variable {n : ℕ} [NeZero n]

theorem cyclic_subgroup_card_product (H : AddSubgroup (ZMod n)) :
    H.index * Nat.card H = n := by
  have hn : Nat.card (ZMod n) = n := by rw [Nat.card_eq_fintype_card, ZMod.card]
  simpa only [hn] using H.index_mul_card

theorem cyclic_subgroup_index_pos (H : AddSubgroup (ZMod n)) : 0 < H.index := by
  have h := cyclic_subgroup_card_product H
  have hn := NeZero.pos n
  by_contra hnot
  have hz : H.index = 0 := by omega
  rw [hz, zero_mul] at h
  omega

theorem cyclic_subgroup_card_ge_five (H : AddSubgroup (ZMod n)) (hH : H ≠ ⊥)
    (hodd : n % 2 = 1) (hthree : n % 3 ≠ 0) : 5 ≤ Nat.card H := by
  have hpos : 0 < Nat.card H := Nat.card_pos
  have hone : Nat.card H ≠ 1 := fun h => hH (AddSubgroup.card_eq_one.mp h)
  have hprod := cyclic_subgroup_card_product H
  by_contra hsmall
  have hcases : Nat.card H = 2 ∨ Nat.card H = 3 ∨ Nat.card H = 4 := by omega
  rcases hcases with hc | hc | hc <;> rw [hc] at hprod <;> omega

omit [NeZero n] in
theorem cyclic_subgroup_index_cast_mem (H : AddSubgroup (ZMod n)) :
    (H.index : ZMod n) ∈ H := by
  simpa using H.nsmul_index_mem (1 : ZMod n)

theorem cyclic_subgroup_remainder_mem (H : AddSubgroup (ZMod n)) (x : ZMod n) :
    x - ((x.val % H.index : ℕ) : ZMod n) ∈ H := by
  have hm := H.nsmul_mem (cyclic_subgroup_index_cast_mem H) (x.val / H.index)
  have hm' : (((x.val / H.index) * H.index : ℕ) : ZMod n) ∈ H := by
    simpa only [nsmul_eq_mul, Nat.cast_mul] using hm
  have hnat : x.val % H.index + (x.val / H.index) * H.index = x.val := by
    simpa only [Nat.mul_comm H.index] using Nat.mod_add_div x.val H.index
  have heq : ((x.val % H.index : ℕ) : ZMod n) +
      (((x.val / H.index) * H.index : ℕ) : ZMod n) = x := by
    rw [← Nat.cast_add, hnat, ZMod.natCast_zmod_val]
  have hsub : x - ((x.val % H.index : ℕ) : ZMod n) =
      (((x.val / H.index) * H.index : ℕ) : ZMod n) :=
    sub_eq_iff_eq_add.mpr (heq.symm.trans (add_comm _ _))
  rw [hsub]
  exact hm'

theorem subgroup_dominates_of_coset_steps {G : SimpleGraph (ZMod n)}
    (hG : TranslationInvariant G) (H : AddSubgroup (ZMod n))
    (hsteps : ∀ r : ℕ, 0 < r → r < H.index →
      ∃ s : ZMod n, s - (r : ZMod n) ∈ H ∧ G.Adj 0 s) :
    exterior G (subgroupVertices H) = ∅ := by
  classical
  suffices h : ∀ x, x ∉ exterior G (subgroupVertices H) by
    ext x
    simp [h x]
  intro x hx
  obtain ⟨hx, hno⟩ := mem_exterior.mp hx
  have hxH : x ∉ H := by simpa using hx
  let r := x.val % H.index
  have hrlt : r < H.index := Nat.mod_lt _ (cyclic_subgroup_index_pos H)
  have hrem : x - (r : ZMod n) ∈ H := cyclic_subgroup_remainder_mem H x
  have hrpos : 0 < r := by
    by_contra hn
    have hz : r = 0 := by omega
    apply hxH
    simpa only [hz, Nat.cast_zero, sub_zero] using hrem
  obtain ⟨s, hs, hadj⟩ := hsteps r hrpos hrlt
  have hy : x - s ∈ H := by
    have h := H.sub_mem hrem hs
    convert h using 1; abel
  have hadj' : G.Adj (x - s) x := by
    simpa only [add_zero, sub_add_cancel] using (hG (x - s) 0 s).mpr hadj
  exact hno (x - s) (by simpa using hy) hadj'

end CircularIndex.Connectivity
