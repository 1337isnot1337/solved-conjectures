import Mathlib.Data.Finset.Max
import Mathlib.Data.Finset.Prod
import Mathlib.Data.List.Rotate
import Mathlib.Tactic.NormNum

/-! The first-minimum form of the cycle lemma. -/
namespace FussCycle

def FirstMinimum (L q : ℕ) (f : ℕ → ℤ) : Prop :=
  q < L ∧ (∀ r < L, f q ≤ f r) ∧ (∀ r < q, f q < f r)

theorem existsUnique_firstMinimum (L : ℕ) (hL : 0 < L) (f : ℕ → ℤ) :
    ∃! q, FirstMinimum L q f := by
  classical
  obtain ⟨a, ha, hmin⟩ := Finset.exists_min_image (Finset.range L) f ⟨0, by simp [hL]⟩
  let s := (Finset.range L).filter (fun i => f i = f a)
  have hs : s.Nonempty := ⟨a, by simp [s, ha]⟩
  let q := s.min' hs
  have hq : q ∈ s := s.min'_mem hs
  have hqL : q < L := by simpa using (Finset.mem_filter.mp hq).1
  have hqf : f q = f a := (Finset.mem_filter.mp hq).2
  have hqmin : ∀ r < L, f q ≤ f r := by
    intro r hr
    rw [hqf]
    exact hmin r (by simpa using hr)
  have hqfirst : ∀ r < q, f q < f r := by
    intro r hr
    have hrL : r < L := lt_trans hr hqL
    have hle := hqmin r hrL
    have hne : f q ≠ f r := by
      intro heq
      have hrs : r ∈ s := by simp [s, hrL, ← hqf, ← heq]
      have := s.min'_le r hrs
      omega
    exact lt_of_le_of_ne hle hne
  refine ⟨q, ⟨hqL, hqmin, hqfirst⟩, ?_⟩
  intro r ⟨hrL, hrmin, hrfirst⟩
  rcases lt_trichotomy r q with hrq | rfl | hqr
  · exact False.elim ((not_lt_of_ge (hrmin q hqL)) (hqfirst r hrq))
  · rfl
  · exact False.elim ((not_lt_of_ge (hqmin r hrL)) (hrfirst q hqr))

def partialSum (xs : List ℤ) (q : ℕ) : ℤ := (xs.take q).sum

theorem rotated_prefix_no_wrap (xs : List ℤ) (q t : ℕ)
    (hq : q ≤ xs.length) (ht : t ≤ xs.length-q) :
    partialSum (xs.rotate q) t = partialSum xs (q+t) - partialSum xs q := by
  unfold partialSum
  rw [List.rotate_eq_drop_append_take hq, List.take_append, List.length_drop]
  have hsub : t - (xs.length-q) = 0 := by omega
  simp only [hsub, List.take_zero, List.append_nil, List.take_drop]
  have h := congrArg List.sum (List.take_append_drop q (xs.take (q+t)))
  simp only [List.take_take, Nat.min_eq_left (by omega : q ≤ q+t), List.sum_append] at h
  omega

theorem rotated_prefix_wrap (xs : List ℤ) (q t : ℕ)
    (hq : q ≤ xs.length) (ht : xs.length-q ≤ t) (htL : t ≤ xs.length) :
    partialSum (xs.rotate q) t = xs.sum - partialSum xs q +
      partialSum xs (t-(xs.length-q)) := by
  unfold partialSum
  rw [List.rotate_eq_drop_append_take hq, List.take_append, List.length_drop]
  have hdrop : (xs.drop q).take t = xs.drop q := by
    apply List.take_of_length_le
    simp only [List.length_drop]
    exact ht
  rw [hdrop, List.take_take, Nat.min_eq_left (by omega : t-(xs.length-q) ≤ q), List.sum_append]
  have h := congrArg List.sum (List.take_append_drop q xs)
  simp only [List.sum_append] at h
  omega

def GoodRotation (xs : List ℤ) (q : ℕ) : Prop :=
  q < xs.length ∧ ∀ t < xs.length, 0 ≤ partialSum (xs.rotate q) t

theorem firstMinimum_goodRotation (xs : List ℤ) (hs : xs.sum = -1)
    (q : ℕ) (hq : FirstMinimum xs.length q (partialSum xs)) : GoodRotation xs q := by
  obtain ⟨hqL, hmin, hfirst⟩ := hq
  refine ⟨hqL, ?_⟩
  intro t ht
  by_cases hnowrap : t ≤ xs.length-q
  · rw [rotated_prefix_no_wrap xs q t (by omega) hnowrap]
    by_cases hqplus : q+t < xs.length
    · have hm := hmin (q+t) hqplus
      omega
    · have hqpos : 0 < q := by omega
      have hf := hfirst 0 hqpos
      have hzero : partialSum xs 0 = 0 := by simp [partialSum]
      have hfull : partialSum xs (q+t) = -1 := by
        have heq : q+t = xs.length := by omega
        simp [partialSum, heq, hs]
      omega
  · have hwrap : xs.length-q ≤ t := by omega
    rw [rotated_prefix_wrap xs q t (by omega) hwrap (by omega), hs]
    have hr : t-(xs.length-q) < q := by omega
    have hf := hfirst (t-(xs.length-q)) hr
    omega

theorem goodRotation_firstMinimum (xs : List ℤ) (hs : xs.sum = -1)
    (q : ℕ) (hq : GoodRotation xs q) : FirstMinimum xs.length q (partialSum xs) := by
  obtain ⟨hqL, hgood⟩ := hq
  refine ⟨hqL, ?_, ?_⟩
  · intro r hr
    by_cases hqr : q ≤ r
    · have ht : r-q < xs.length := by omega
      have h := hgood (r-q) ht
      rw [rotated_prefix_no_wrap xs q (r-q) (by omega) (by omega)] at h
      have heq : q+(r-q) = r := by omega
      rw [heq] at h
      omega
    · have hrq : r < q := by omega
      have ht : xs.length-q+r < xs.length := by omega
      have h := hgood (xs.length-q+r) ht
      rw [rotated_prefix_wrap xs q (xs.length-q+r) (by omega) (by omega) (by omega), hs] at h
      have heq : xs.length-q+r-(xs.length-q) = r := by omega
      rw [heq] at h
      omega
  · intro r hrq
    have ht : xs.length-q+r < xs.length := by omega
    have h := hgood (xs.length-q+r) ht
    rw [rotated_prefix_wrap xs q (xs.length-q+r) (by omega) (by omega) (by omega), hs] at h
    have heq : xs.length-q+r-(xs.length-q) = r := by omega
    rw [heq] at h
    omega

theorem cycle_lemma (xs : List ℤ) (hne : xs ≠ []) (hs : xs.sum = -1) :
    ∃! q, GoodRotation xs q := by
  have hL : 0 < xs.length := List.length_pos_iff.mpr hne
  obtain ⟨q, hq, huniq⟩ := existsUnique_firstMinimum xs.length hL (partialSum xs)
  exact ⟨q, firstMinimum_goodRotation xs hs q hq,
    fun r hr => huniq r (goodRotation_firstMinimum xs hs r hr)⟩

theorem no_nontrivial_rotation (xs : List ℤ) (hs : xs.sum = -1)
    (q : ℕ) (hq0 : 0 < q) (hqL : q < xs.length) : xs.rotate q ≠ xs := by
  intro heq
  have hne : xs ≠ [] := by intro h; simp [h] at hqL
  obtain ⟨g, hg, huniq⟩ := cycle_lemma xs hne hs
  have hL : 0 < xs.length := by omega
  have hrot : xs.rotate ((q+g) % xs.length) = xs.rotate g := by
    rw [List.rotate_mod, ← List.rotate_rotate, heq]
  have hg' : GoodRotation xs ((q+g) % xs.length) := by
    refine ⟨Nat.mod_lt _ hL, ?_⟩
    rw [hrot]
    exact hg.2
  have he : (q+g) % xs.length = g := huniq _ hg'
  have hgL := hg.1
  by_cases hsmall : q+g < xs.length
  · rw [Nat.mod_eq_of_lt hsmall] at he
    omega
  · have hge : xs.length ≤ q+g := by omega
    have hrem : q+g-xs.length < xs.length := by omega
    rw [Nat.mod_eq_sub_mod hge, Nat.mod_eq_of_lt hrem] at he
    omega

theorem rotations_injective (xs : List ℤ) (hs : xs.sum = -1) :
    Function.Injective (fun i : Fin xs.length => xs.rotate i.val) := by
  intro i j hij
  apply Fin.ext
  rcases lt_trichotomy i.val j.val with hlt | heq | hgt
  · have hrot : xs.rotate (j.val-i.val) = xs := by
      apply List.rotate_injective i.val
      change (xs.rotate (j.val-i.val)).rotate i.val = xs.rotate i.val
      rw [List.rotate_rotate, Nat.sub_add_cancel (le_of_lt hlt)]
      exact hij.symm
    exact False.elim (no_nontrivial_rotation xs hs (j.val-i.val) (by omega) (by omega) hrot)
  · exact heq
  · have hrot : xs.rotate (i.val-j.val) = xs := by
      apply List.rotate_injective j.val
      change (xs.rotate (i.val-j.val)).rotate j.val = xs.rotate j.val
      rw [List.rotate_rotate, Nat.sub_add_cancel (le_of_lt hgt)]
      exact hij
    exact False.elim (no_nontrivial_rotation xs hs (i.val-j.val) (by omega) (by omega) hrot)

noncomputable def goodIndex (xs : List ℤ) : ℕ :=
  if h : xs ≠ [] ∧ xs.sum = -1 then Classical.choose (cycle_lemma xs h.1 h.2) else 0

theorem goodIndex_good (xs : List ℤ) (hne : xs ≠ []) (hs : xs.sum = -1) :
    GoodRotation xs (goodIndex xs) := by
  rw [goodIndex, dite_eq_left ⟨hne, hs⟩]
  exact (Classical.choose_spec (cycle_lemma xs hne hs)).1

theorem goodIndex_unique (xs : List ℤ) (hne : xs ≠ []) (hs : xs.sum = -1)
    (q : ℕ) (hq : GoodRotation xs q) : goodIndex xs = q := by
  have hu := (Classical.choose_spec (cycle_lemma xs hne hs)).2
  rw [goodIndex, dite_eq_left ⟨hne, hs⟩]
  exact (hu q hq).symm

theorem canonical_good (xs : List ℤ) (hne : xs ≠ []) (hs : xs.sum = -1) :
    GoodRotation (xs.rotate (goodIndex xs)) 0 := by
  have hg := goodIndex_good xs hne hs
  refine ⟨?_, ?_⟩
  · simpa using (List.length_pos_iff.mpr hne)
  · simpa using hg.2

noncomputable def goodWords (S : Finset (List ℤ)) : Finset (List ℤ) := by
  classical
  exact S.filter fun xs => GoodRotation xs 0

theorem rotation_count (S : Finset (List ℤ)) (L : ℕ) (hL : 0 < L)
    (hlen : ∀ xs ∈ S, xs.length = L)
    (hsum : ∀ xs ∈ S, xs.sum = -1)
    (hclosed : ∀ xs ∈ S, ∀ q, xs.rotate q ∈ S) :
    S.card = (goodWords S).card * L := by
  classical
  let T := goodWords S
  have hc : S.card = (T ×ˢ Finset.range L).card := by
    apply Finset.card_bij (fun xs _ => (xs.rotate (goodIndex xs), goodIndex xs))
    · intro xs hxs
      have hn : xs ≠ [] := by
        intro h
        have hxlen := hlen xs hxs
        simp [h] at hxlen
        omega
      have hg := goodIndex_good xs hn (hsum xs hxs)
      simp only [Finset.mem_product, Finset.mem_filter, Finset.mem_range, T, goodWords]
      exact ⟨⟨hclosed xs hxs _, canonical_good xs hn (hsum xs hxs)⟩, by simpa [hlen xs hxs] using hg.1⟩
    · intro a ha b hb he
      have hindex : goodIndex a = goodIndex b := congrArg Prod.snd he
      have hwords : a.rotate (goodIndex a) = b.rotate (goodIndex b) := congrArg Prod.fst he
      rw [hindex] at hwords
      exact List.rotate_injective _ hwords
    · rintro ⟨w,q⟩ hp
      obtain ⟨hw, hq⟩ := Finset.mem_product.mp hp
      obtain ⟨hwS, hwgood⟩ := Finset.mem_filter.mp (show w ∈ S.filter (fun xs => GoodRotation xs 0) from hw)
      have hqL : q < L := Finset.mem_range.mp hq
      let xs := w.rotate (L-q)
      have hxsS : xs ∈ S := hclosed w hwS _
      have hxslen : xs.length = L := hlen xs hxsS
      have hxssum : xs.sum = -1 := hsum xs hxsS
      have hxsne : xs ≠ [] := by intro he; simp [he] at hxslen; omega
      have hrot : xs.rotate q = w := by
        dsimp [xs]
        rw [List.rotate_rotate]
        have heq : L-q+q = w.length := by rw [hlen w hwS]; omega
        rw [heq, List.rotate_length]
      have hgood : GoodRotation xs q := by
        refine ⟨by omega, ?_⟩
        rw [hrot]
        intro t ht
        simpa using hwgood.2 t (by simpa [hxslen, hlen w hwS] using ht)
      have hidx := goodIndex_unique xs hxsne hxssum q hgood
      refine ⟨xs, hxsS, ?_⟩
      simp [hidx, hrot]
  simpa [T, Finset.card_product] using hc

end FussCycle
