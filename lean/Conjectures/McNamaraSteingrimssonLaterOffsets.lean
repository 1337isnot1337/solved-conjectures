module

public import Conjectures.McNamaraSteingrimssonFirstOmission
public import Mathlib.Order.Interval.Finset.Fin

@[expose] public section
namespace McNamaraSteingrimsson

theorem blockOffset_tail_eq {s : ℕ} (w : Fin (s+1)→ℕ) (i : Fin s) :
    blockOffset w i.succ=w 0+∑ j ∈ Finset.Iio i,w j.succ := by
  have h : (Finset.univ.filter (· < i) : Finset (Fin s))=Finset.Iio i := by
    ext j
    simp
  unfold blockOffset
  rw [Finset.sum_filter,Fin.sum_univ_succ,ite_eq_left (Fin.succ_pos i)]
  simp only [Fin.succ_lt_succ_iff]
  rw [← Finset.sum_filter,h]

/-- A long block before the exceptional slot starts on the original
arithmetic grid. A block after the exceptional slot has shift equal
to the exceptional width. -/
theorem blockOffset_one_exception {n K : ℕ} (w : Fin (n+2)→ℕ) (miss j : Fin (n+1))
    (hw : ∀ k : Fin (n+1), k≠miss → w k.succ=K) :
    blockOffset w j.succ=w 0+
      (if miss<j then (j.val-1)*K+w miss.succ else j.val*K) := by
  rw [blockOffset_tail_eq]
  congr 1
  by_cases h : miss<j
  · rw [ite_eq_left h]
    have hm : miss∈Finset.Iio j := Finset.mem_Iio.mpr h
    have hs := Finset.sum_erase_add (s := Finset.Iio j) (fun k => w k.succ) hm
    rw [← hs]
    congr 1
    calc
      _ = ∑ _k ∈ (Finset.Iio j).erase miss,K := by
        apply Finset.sum_congr rfl
        intro k hk
        exact hw k (Finset.mem_erase.mp hk).1
      _ = _ := by simp [Finset.card_erase_of_mem hm,Fin.card_Iio]
  · rw [ite_eq_right h]
    calc
      _ = ∑ _k ∈ Finset.Iio j,K := by
        apply Finset.sum_congr rfl
        intro k hk
        exact hw k (fun he => h (he ▸ Finset.mem_Iio.mp hk))
      _ = _ := by simp [Fin.card_Iio]

end McNamaraSteingrimsson
