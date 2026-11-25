module
public import Conjectures.LassalleSmallRows00
public import Conjectures.LassalleSmallRows01
public import Conjectures.LassalleSmallRows02
public import Conjectures.LassalleSmallRows03
public import Conjectures.LassalleSmallRows04
public import Conjectures.LassalleSmallRows05
public import Conjectures.LassalleSmallRows06
public import Conjectures.LassalleSmallRows07
public import Conjectures.LassalleSmallRows08
public import Conjectures.LassalleSmallRows09
public import Conjectures.LassalleSmallRows10
public import Conjectures.LassalleSmallRows11
public import Conjectures.LassalleSmallRows12
public import Conjectures.LassalleSmallRows13
public import Conjectures.LassalleSmallRows14
public import Conjectures.LassalleSmallRows15

@[expose] public section
namespace LassalleRefinement

theorem quotientRow_strict_through_53 (k a : ℕ) (hk : k<54)
    (ha : 0<a) (hi : a<2*k) :
    quotientRow k (a-1)*quotientRow k (a+1)<quotientRow k a^2 := by
  apply quotientRow_strict_of_checked_row candidate_inverse_all_checked hk ha hi
  have hp : 1≤k := by omega
  by_cases h0 : k<24
  · exact candidateRowsChecked_at small_rows_00 (by omega) h0
  by_cases h1 : k<31
  · exact candidateRowsChecked_at small_rows_01 (by omega) h1
  by_cases h2 : k<36
  · exact candidateRowsChecked_at small_rows_02 (by omega) h2
  by_cases h3 : k<40
  · exact candidateRowsChecked_at small_rows_03 (by omega) h3
  by_cases h4 : k<43
  · exact candidateRowsChecked_at small_rows_04 (by omega) h4
  by_cases h5 : k<44
  · exact candidateRowsChecked_at small_rows_05 (by omega) h5
  by_cases h6 : k<45
  · exact candidateRowsChecked_at small_rows_06 (by omega) h6
  by_cases h7 : k<46
  · exact candidateRowsChecked_at small_rows_07 (by omega) h7
  by_cases h8 : k<47
  · exact candidateRowsChecked_at small_rows_08 (by omega) h8
  by_cases h9 : k<48
  · exact candidateRowsChecked_at small_rows_09 (by omega) h9
  by_cases h10 : k<49
  · exact candidateRowsChecked_at small_rows_10 (by omega) h10
  by_cases h11 : k<50
  · exact candidateRowsChecked_at small_rows_11 (by omega) h11
  by_cases h12 : k<51
  · exact candidateRowsChecked_at small_rows_12 (by omega) h12
  by_cases h13 : k<52
  · exact candidateRowsChecked_at small_rows_13 (by omega) h13
  by_cases h14 : k<53
  · exact candidateRowsChecked_at small_rows_14 (by omega) h14
  exact candidateRowsChecked_at small_rows_15 (by omega) hk

end LassalleRefinement
