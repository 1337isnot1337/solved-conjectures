import Conjectures.LonelinessFourSpeedCertificate
import Mathlib.Data.Finset.Dedup
import Mathlib.Data.List.FinRange
import Mathlib.Logic.Equiv.Basic

/-! Recovering multiplicities and coordinate order from folded supports.
Distinct integer speeds can have equal folded residues. The size-one deficit
lemma handles exactly one repeated residue in a support of cardinality n-1.
-/

namespace Loneliness.Modular.Multiplicity

theorem perm_support_of_length (l : List ℕ) (s : Finset ℕ)
    (hset : l.toFinset=s) (hlen : l.length=s.card) :
    l.Perm (s.sort (·≤·)) := by
  have hlen' : l.dedup.length=l.length := by
    rw [←List.card_toFinset,hset,hlen]
  have hn : l.Nodup := List.nodup_iff_length_dedup_eq.mpr hlen'
  exact List.perm_of_nodup_nodup_toFinset_eq hn (s.sort_nodup (·≤·))
    (by simpa only [Finset.sort_toFinset] using hset)

/-- If a list has exactly one more entry than its support, it consists of
the support once and one extra copy of a support member. -/
theorem perm_support_cons_of_length (l : List ℕ) (s : Finset ℕ)
    (hset : l.toFinset=s) (hlen : l.length=s.card+1) :
    ∃ a∈s, l.Perm (a::s.sort (·≤·)) := by
  obtain ⟨extra,hperm⟩ := (List.dedup_sublist l).exists_perm_append
  have hdedlen : l.dedup.length=s.card := by rw [←List.card_toFinset,hset]
  have hextralen : extra.length=1 := by
    have hp := hperm.length_eq
    rw [List.length_append,hdedlen,hlen] at hp
    omega
  obtain ⟨a,rfl⟩ := List.length_eq_one_iff.mp hextralen
  have ha : a∈s := by
    have hmem : a∈l := hperm.mem_iff.mpr (by simp)
    simpa only [←hset,List.mem_toFinset] using hmem
  have hdedperm : l.dedup.Perm (s.sort (·≤·)) :=
    List.perm_of_nodup_nodup_toFinset_eq (List.nodup_dedup l) (s.sort_nodup (·≤·))
      (by simp only [List.toFinset_dedup,Finset.sort_toFinset,hset])
  refine ⟨a,ha,?_⟩
  exact (hperm.trans List.perm_append_comm).trans (hdedperm.cons a)

theorem ten_entries_nine_support (l : List ℕ) (s : Finset ℕ)
    (hset : l.toFinset=s) (hlen : l.length=10) (hcard : s.card=9) :
    ∃ a∈s, l.Perm (a::s.sort (·≤·)) :=
  perm_support_cons_of_length l s hset (by omega)

private theorem card_fiber_eq_countP {n : ℕ} (f : Fin n → ℕ) (a : ℕ) :
    Fintype.card {i : Fin n // f i=a} =
      (List.ofFn f).countP (fun z => decide (z=a)) := by
  rw [Fintype.card_subtype,List.ofFn_eq_map,List.countP_map]
  simpa only [List.toFinset_finRange,Function.comp_def] using
    (List.nodup_finRange n).card_eq_countP (P:=fun i => f i=a)

/-- A list permutation gives an actual coordinate permutation even when
coordinates repeat. Equal fiber cardinalities provide the bijection. -/
theorem reindex_of_ofFn_perm {n : ℕ} (f g : Fin n → ℕ)
    (hperm : (List.ofFn f).Perm (List.ofFn g)) :
    ∃ σ : Equiv.Perm (Fin n), ∀ i, f (σ i)=g i := by
  classical
  have hcard (a : ℕ) : Fintype.card {i : Fin n // f i=a} =
      Fintype.card {i : Fin n // g i=a} := by
    rw [card_fiber_eq_countP,card_fiber_eq_countP]
    exact List.Perm.countP_eq (fun z => decide (z=a)) hperm
  let fiberEquiv (a : ℕ) : {i : Fin n // g i=a} ≃ {i : Fin n // f i=a} :=
    Fintype.equivOfCardEq (hcard a).symm
  refine ⟨Equiv.ofFiberEquiv fiberEquiv,?_⟩
  intro i
  exact Equiv.ofFiberEquiv_map fiberEquiv i

theorem folded_tuple_reindex {n : ℕ} (m u : ℕ) (v root : Fin n → ℕ)
    (hperm : (List.ofFn (fun i => folded m (u*v i))).Perm (List.ofFn root)) :
    ∃ σ : Equiv.Perm (Fin n), ∀ i, folded m (u*v (σ i))=root i :=
  reindex_of_ofFn_perm (fun i => folded m (u*v i)) root hperm

end Loneliness.Modular.Multiplicity
