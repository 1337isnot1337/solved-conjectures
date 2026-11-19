import Conjectures.LonelinessModularMultiplicity
import Mathlib.Data.Finset.Sym
import Mathlib.Data.Multiset.Sort

/-! Exact finite multiplicity representatives for arbitrary support deficits.

Every support value occurs once. The remaining entries form an unordered
tuple over the same support. Sorting the resulting multiset gives one
representative of each list permutation class. Repeated coordinates remain
present throughout; no injectivity assumption is imposed on a tuple.
-/

namespace Loneliness.Modular.SupportMultiplicity

/-- Add one copy of every support value to the specified extra multiset. -/
def representative {k : ℕ} (s : Finset ℕ) (extra : Sym ℕ k) : List ℕ :=
  (s.val + (extra : Multiset ℕ)).sort (· ≤ ·)

/-- All multiplicity classes of length `n` with exactly the support `s`. -/
def representatives (n : ℕ) (s : Finset ℕ) : Finset (List ℕ) :=
  if s.card ≤ n then
    (s.sym (n - s.card)).image (representative s)
  else ∅

theorem representative_length {k : ℕ} (s : Finset ℕ) (extra : Sym ℕ k) :
    (representative s extra).length = s.card + k := by
  change ((s.val + (extra : Multiset ℕ)).sort (· ≤ ·)).length = s.val.card + k
  rw [Multiset.length_sort, Multiset.card_add, Sym.card_coe]

theorem representative_sorted {k : ℕ} (s : Finset ℕ) (extra : Sym ℕ k) :
    (representative s extra).Pairwise (· ≤ ·) :=
  Multiset.pairwise_sort _ _

theorem representative_support {k : ℕ} (s : Finset ℕ) (extra : Sym ℕ k)
    (hextra : extra ∈ s.sym k) : (representative s extra).toFinset = s := by
  ext a
  simp only [representative, List.mem_toFinset, Multiset.mem_sort,
    Multiset.mem_add, Finset.mem_val, Sym.mem_coe]
  exact ⟨fun h => h.elim id (Finset.mem_sym_iff.mp hextra a), Or.inl⟩

/-- Removing the first copy of each support value leaves an arbitrary
extra multiset. This covers every deficit, including zero. -/
theorem exists_perm_representative {n : ℕ} (l : List ℕ) (s : Finset ℕ)
    (hset : l.toFinset = s) (hlen : l.length = n) :
    ∃ r ∈ representatives n s, l.Perm r := by
  obtain ⟨extra, hperm⟩ := (List.dedup_sublist l).exists_perm_append
  have hbase_length : l.dedup.length = s.card := by
    rw [← List.card_toFinset, hset]
  have htotal := hperm.length_eq
  rw [List.length_append, hbase_length, hlen] at htotal
  have hcard : s.card ≤ n := by omega
  have hextra_length : extra.length = n - s.card := by omega
  let e : Sym ℕ (n - s.card) :=
    ⟨(extra : Multiset ℕ), by simpa only [Multiset.coe_card] using hextra_length⟩
  have he : e ∈ s.sym (n - s.card) := by
    apply Finset.mem_sym_iff.mpr
    intro a ha
    have haextra : a ∈ extra := ha
    have hal : a ∈ l := hperm.mem_iff.mpr (List.mem_append.mpr (Or.inr haextra))
    rw [← hset]
    exact List.mem_toFinset.mpr hal
  have hbase : (l.dedup : Multiset ℕ) = s.val := by
    simpa only [List.toFinset_val] using congrArg Finset.val hset
  have hmultiset : (l : Multiset ℕ) = s.val + (extra : Multiset ℕ) := by
    have h := Multiset.coe_eq_coe.mpr hperm
    change (l : Multiset ℕ) = (l.dedup : Multiset ℕ) + (extra : Multiset ℕ) at h
    rwa [hbase] at h
  refine ⟨representative s e, ?_, ?_⟩
  · rw [representatives, ite_eq_left hcard]
    exact Finset.mem_image.mpr ⟨e, he, rfl⟩
  · apply Multiset.coe_eq_coe.mp
    rw [representative, Multiset.sort_eq]
    exact hmultiset

/-- Every enumerated representative has the asserted length and exact
support, and its coordinates are sorted. -/
theorem representatives_spec {n : ℕ} {s : Finset ℕ} {r : List ℕ}
    (hr : r ∈ representatives n s) :
    r.length = n ∧ r.toFinset = s ∧ r.Pairwise (· ≤ ·) := by
  by_cases hcard : s.card ≤ n
  · rw [representatives, ite_eq_left hcard] at hr
    obtain ⟨extra, hextra, rfl⟩ := Finset.mem_image.mp hr
    refine ⟨?_, representative_support s extra hextra, representative_sorted s extra⟩
    rw [representative_length]
    omega
  · simp only [representatives, ite_eq_right hcard, Finset.notMem_empty] at hr

/-- The finite family is exactly the sorted lists of the specified length
and support. In particular, it neither drops smaller supports nor invents
extra support values. -/
theorem mem_representatives_iff {n : ℕ} {s : Finset ℕ} {r : List ℕ} :
    r ∈ representatives n s ↔
      r.length = n ∧ r.toFinset = s ∧ r.Pairwise (· ≤ ·) := by
  constructor
  · exact representatives_spec
  · rintro ⟨hlen, hset, hsorted⟩
    obtain ⟨r', hr', hperm⟩ := exists_perm_representative r s hset hlen
    have heq : r = r' := hperm.eq_of_pairwise' hsorted (representatives_spec hr').2.2
    rwa [heq]

/-- Two members cannot represent the same multiplicities with different
coordinate orders: sorting has removed those duplicate cases. -/
theorem representatives_unique {n : ℕ} {s : Finset ℕ} {r r' : List ℕ}
    (hr : r ∈ representatives n s) (hr' : r' ∈ representatives n s)
    (hperm : r.Perm r') : r = r' :=
  hperm.eq_of_pairwise' (representatives_spec hr).2.2 (representatives_spec hr').2.2

theorem exists_perm_representative_iff {n : ℕ} {s : Finset ℕ} {l : List ℕ} :
    (∃ r ∈ representatives n s, l.Perm r) ↔ l.length = n ∧ l.toFinset = s := by
  constructor
  · rintro ⟨r, hr, hperm⟩
    have hs := representatives_spec hr
    exact ⟨hperm.length_eq.trans hs.1,
      (List.toFinset_eq_of_perm l r hperm).trans hs.2.1⟩
  · rintro ⟨hlen, hset⟩
    exact exists_perm_representative l s hset hlen

/-- Read a representative list as a tuple of its asserted length. -/
def tuple {n : ℕ} (r : List ℕ) (hlen : r.length = n) : Fin n → ℕ :=
  fun i => r.get (Fin.cast hlen.symm i)

theorem ofFn_tuple {n : ℕ} (r : List ℕ) (hlen : r.length = n) :
    List.ofFn (tuple r hlen) = r := by
  subst n
  exact List.ofFn_get r

/-- Finite multiplicity coverage yields an actual coordinate permutation,
even when several coordinates have the same value. -/
theorem tuple_reindex {n : ℕ} (v : Fin n → ℕ) (s : Finset ℕ)
    (hset : (List.ofFn v).toFinset = s) :
    ∃ r ∈ representatives n s, ∃ hlen : r.length = n,
      ∃ σ : Equiv.Perm (Fin n), ∀ i, v (σ i) = tuple r hlen i := by
  obtain ⟨r, hr, hperm⟩ := exists_perm_representative (n := n) (List.ofFn v) s hset (by simp)
  have hlen := (representatives_spec hr).1
  obtain ⟨σ, hσ⟩ := Multiplicity.reindex_of_ofFn_perm v (tuple r hlen) (by
    rw [ofFn_tuple]
    exact hperm)
  exact ⟨r, hr, hlen, σ, hσ⟩

end Loneliness.Modular.SupportMultiplicity
