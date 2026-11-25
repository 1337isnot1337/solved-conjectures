module

public import Conjectures.McNamaraSteingrimssonRepeatedActualFactors

@[expose] public section
namespace McNamaraSteingrimsson

/-- Removing the exceptional long factor leaves exactly `n` full long
factors. This identifies the exact size contributed by the exceptional
slot, even if the initial short factor is not full. -/
theorem repeatedFactor_sizes {n K d : ℕ} {w : Fin (n+2)→ℕ}
    (miss : Fin (n+1)) (hcard : Fintype.card (BlockPosition w)=d)
    (hfull : ∀ j : Fin (n+1), j≠miss → w j.succ=K) :
    d=w 0 + n*K + w miss.succ := by
  classical
  let others := (Finset.univ : Finset (Fin (n+1))).erase miss
  have hsum : ∑ j ∈ others,w j.succ = n*K := by
    calc
      _ = ∑ _j ∈ others,K := by
        apply Finset.sum_congr rfl
        intro j hj
        exact hfull j (Finset.mem_erase.mp hj).1
      _ = n*K := by
        simp [others,Finset.card_erase_of_mem]
  have hc := Finset.sum_erase_add (s := (Finset.univ : Finset (Fin (n+1))))
    (fun j => w j.succ) (Finset.mem_univ miss)
  change (∑ j ∈ others,w j.succ) + w miss.succ = ∑ j : Fin (n+1),w j.succ at hc
  rw [card_blockPosition,Fin.sum_univ_succ,← hc,hsum] at hcard
  omega

/-- At an interior rank, a later exceptional block contributes a
nonempty proper subpattern of size exactly the relative rank. For
the first exceptional block, the two initial factors together have
the corresponding two-summand size. -/
theorem repeatedFactor_rank_cases {n A K r : ℕ} {w : Fin (n+2)→ℕ}
    (miss : Fin (n+1)) (hr : 0<r) (hK : r<K)
    (hcard : Fintype.card (BlockPosition w)=A+n*K+r)
    (hfull : ∀ j : Fin (n+1), j≠miss → w j.succ=K)
    (hhead : miss≠0 → w 0=A) :
    (miss=0 ∧ w 0+w (0 : Fin (n+1)).succ=A+r) ∨
      (miss≠0 ∧ w 0=A ∧ w miss.succ=r ∧ 0<w miss.succ ∧ w miss.succ<K) := by
  have he := repeatedFactor_sizes miss hcard hfull
  by_cases hm : miss=0
  · left
    rw [hm] at he
    exact ⟨hm,by omega⟩
  · right
    have hh := hhead hm
    have hw : w miss.succ=r := by omega
    exact ⟨hm,hh,hw,hw.symm ▸ hr,hw.symm ▸ hK⟩

end McNamaraSteingrimsson
