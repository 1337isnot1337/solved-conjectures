module

public import Conjectures.McNamaraSteingrimssonBinomialRow
public import Mathlib.Tactic

@[expose] public section
namespace McNamaraSteingrimsson

def choose25Values : List ℤ :=
  [1,25,300,2300,12650,53130,177100,480700,1081575,2042975,3268760,4457400,
  5200300,5200300,4457400,3268760,2042975,1081575,480700,177100,53130,12650,
  2300,300,25,1]

theorem choose25_from_values (k : ℕ) : (Nat.choose 25 k : ℤ)=choose25Values.getD k 0 := by
  by_cases hk : k≤25
  · interval_cases k
    · rw [choose25_0]; decide
    · rw [choose25_1]; decide
    · rw [choose25_2]; decide
    · rw [choose25_3]; decide
    · rw [choose25_4]; decide
    · rw [choose25_5]; decide
    · rw [choose25_6]; decide
    · rw [choose25_7]; decide
    · rw [choose25_8]; decide
    · rw [choose25_9]; decide
    · rw [choose25_10]; decide
    · rw [choose25_11]; decide
    · rw [choose25_12]; decide
    · rw [choose25_13]; decide
    · rw [choose25_14]; decide
    · rw [choose25_15]; decide
    · rw [choose25_16]; decide
    · rw [choose25_17]; decide
    · rw [choose25_18]; decide
    · rw [choose25_19]; decide
    · rw [choose25_20]; decide
    · rw [choose25_21]; decide
    · rw [choose25_22]; decide
    · rw [choose25_23]; decide
    · rw [choose25_24]; decide
    · rw [choose25_25]; decide
  · have hlen : choose25Values.length≤k := by
      change 26≤k
      omega
    rw [Nat.choose_eq_zero_of_lt (lt_of_not_ge hk),List.getD_eq_getElem?_getD,List.getElem?_eq_none hlen]
    rfl


end McNamaraSteingrimsson
