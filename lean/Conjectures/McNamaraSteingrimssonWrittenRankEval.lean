module

public import Conjectures.McNamaraSteingrimssonWrittenRank
public import Conjectures.McNamaraSteingrimssonRankRows

@[expose] public section
namespace McNamaraSteingrimsson

def writtenRankNum (r : ℕ) : ℤ :=
  1628*piValues.getD r 0 +
    ((List.range 42).map (fun k => alphaValues.getD k 0 * choose25Values.getD (r-k) 0)).sum

private theorem list_sum_range (f : ℕ→ℤ) (n : ℕ) :
    (∑ k ∈ Finset.range n,f k)=((List.range n).map f).sum := by
  induction n with
  | zero => simp
  | succ n ih => simp [Finset.sum_range_succ,List.range_succ,ih]

theorem writtenRankCard_exact_arithmetic (r : ℕ) (hr : 42≤r) (hrK : r<67) :
    (writtenRankCard r : ℤ)=writtenRankNum r := by
  rw [writtenRankCard_convolution r hr hrK,Nat.cast_add,Nat.cast_mul,Nat.cast_sum]
  rw [show (Nat.card (PatternDownsetAt writtenLong r) : ℤ)=piValues.getD r 0 from
    actual_pi_downset_row r (by omega)]
  unfold writtenRankNum
  push_cast
  congr 1
  calc
    (∑ k : Fin writtenShortLength,
      (Nat.card (PatternDownsetAt writtenShort k.val) : ℤ) * (Nat.choose 25 (r-k.val) : ℤ)) =
        ∑ k : Fin writtenShortLength,alphaValues.getD k.val 0 * choose25Values.getD (r-k.val) 0 := by
      apply Finset.sum_congr rfl
      intro k _
      by_cases hk : 3≤k.val
      · rw [show (Nat.card (PatternDownsetAt writtenShort k.val) : ℤ)=alphaValues.getD k.val 0 from
          actual_alpha_downset_row k.val hk,choose25_from_values]
      · have hz : Nat.choose 25 (r-k.val)=0 := Nat.choose_eq_zero_of_lt (by omega)
        rw [← choose25_from_values,hz]
        simp
    _ = ∑ k ∈ Finset.range writtenShortLength,alphaValues.getD k 0 * choose25Values.getD (r-k) 0 :=
      Fin.sum_univ_eq_sum_range (fun k : ℕ =>
        alphaValues.getD k 0 * choose25Values.getD (r-k) 0) writtenShortLength
    _ = _ := by rw [writtenShortLength_eq,list_sum_range]

end McNamaraSteingrimsson
