import Conjectures.LonelinessModularCoverFastCounts
import Init.Data.Nat.Mod
import Init.Data.RArray

/-!
# Byte population counts

The finite table is checked by the ordinary kernel. The general split theorem
relates its low-byte count to the existing binary population count.

The recursive evaluator stops at zero and divides its argument by 256 at each
step. Its initial fuel is the input itself, so the public count has no input
bound or fuel hypothesis.
-/

namespace Loneliness.Modular.SupportSearch.Bits.Byte

set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

def byteTable : Lean.RArray ℕ :=
  (.branch 128 (.branch 64 (.branch 32 (.branch 16 (.branch 8 (.branch 4 (.branch 2 (.branch 1 (.leaf 0) (.leaf 1)) (.branch 3 (.leaf 1) (.leaf 2))) (.branch 6 (.branch 5 (.leaf 1) (.leaf 2)) (.branch 7 (.leaf 2) (.leaf 3)))) (.branch 12 (.branch 10 (.branch 9 (.leaf 1) (.leaf 2)) (.branch 11 (.leaf 2) (.leaf 3))) (.branch 14 (.branch 13 (.leaf 2) (.leaf 3)) (.branch 15 (.leaf 3) (.leaf 4))))) (.branch 24 (.branch 20 (.branch 18 (.branch 17 (.leaf 1) (.leaf 2)) (.branch 19 (.leaf 2) (.leaf 3))) (.branch 22 (.branch 21 (.leaf 2) (.leaf 3)) (.branch 23 (.leaf 3) (.leaf 4)))) (.branch 28 (.branch 26 (.branch 25 (.leaf 2) (.leaf 3)) (.branch 27 (.leaf 3) (.leaf 4))) (.branch 30 (.branch 29 (.leaf 3) (.leaf 4)) (.branch 31 (.leaf 4) (.leaf 5)))))) (.branch 48 (.branch 40 (.branch 36 (.branch 34 (.branch 33 (.leaf 1) (.leaf 2)) (.branch 35 (.leaf 2) (.leaf 3))) (.branch 38 (.branch 37 (.leaf 2) (.leaf 3)) (.branch 39 (.leaf 3) (.leaf 4)))) (.branch 44 (.branch 42 (.branch 41 (.leaf 2) (.leaf 3)) (.branch 43 (.leaf 3) (.leaf 4))) (.branch 46 (.branch 45 (.leaf 3) (.leaf 4)) (.branch 47 (.leaf 4) (.leaf 5))))) (.branch 56 (.branch 52 (.branch 50 (.branch 49 (.leaf 2) (.leaf 3)) (.branch 51 (.leaf 3) (.leaf 4))) (.branch 54 (.branch 53 (.leaf 3) (.leaf 4)) (.branch 55 (.leaf 4) (.leaf 5)))) (.branch 60 (.branch 58 (.branch 57 (.leaf 3) (.leaf 4)) (.branch 59 (.leaf 4) (.leaf 5))) (.branch 62 (.branch 61 (.leaf 4) (.leaf 5)) (.branch 63 (.leaf 5) (.leaf 6))))))) (.branch 96 (.branch 80 (.branch 72 (.branch 68 (.branch 66 (.branch 65 (.leaf 1) (.leaf 2)) (.branch 67 (.leaf 2) (.leaf 3))) (.branch 70 (.branch 69 (.leaf 2) (.leaf 3)) (.branch 71 (.leaf 3) (.leaf 4)))) (.branch 76 (.branch 74 (.branch 73 (.leaf 2) (.leaf 3)) (.branch 75 (.leaf 3) (.leaf 4))) (.branch 78 (.branch 77 (.leaf 3) (.leaf 4)) (.branch 79 (.leaf 4) (.leaf 5))))) (.branch 88 (.branch 84 (.branch 82 (.branch 81 (.leaf 2) (.leaf 3)) (.branch 83 (.leaf 3) (.leaf 4))) (.branch 86 (.branch 85 (.leaf 3) (.leaf 4)) (.branch 87 (.leaf 4) (.leaf 5)))) (.branch 92 (.branch 90 (.branch 89 (.leaf 3) (.leaf 4)) (.branch 91 (.leaf 4) (.leaf 5))) (.branch 94 (.branch 93 (.leaf 4) (.leaf 5)) (.branch 95 (.leaf 5) (.leaf 6)))))) (.branch 112 (.branch 104 (.branch 100 (.branch 98 (.branch 97 (.leaf 2) (.leaf 3)) (.branch 99 (.leaf 3) (.leaf 4))) (.branch 102 (.branch 101 (.leaf 3) (.leaf 4)) (.branch 103 (.leaf 4) (.leaf 5)))) (.branch 108 (.branch 106 (.branch 105 (.leaf 3) (.leaf 4)) (.branch 107 (.leaf 4) (.leaf 5))) (.branch 110 (.branch 109 (.leaf 4) (.leaf 5)) (.branch 111 (.leaf 5) (.leaf 6))))) (.branch 120 (.branch 116 (.branch 114 (.branch 113 (.leaf 3) (.leaf 4)) (.branch 115 (.leaf 4) (.leaf 5))) (.branch 118 (.branch 117 (.leaf 4) (.leaf 5)) (.branch 119 (.leaf 5) (.leaf 6)))) (.branch 124 (.branch 122 (.branch 121 (.leaf 4) (.leaf 5)) (.branch 123 (.leaf 5) (.leaf 6))) (.branch 126 (.branch 125 (.leaf 5) (.leaf 6)) (.branch 127 (.leaf 6) (.leaf 7)))))))) (.branch 192 (.branch 160 (.branch 144 (.branch 136 (.branch 132 (.branch 130 (.branch 129 (.leaf 1) (.leaf 2)) (.branch 131 (.leaf 2) (.leaf 3))) (.branch 134 (.branch 133 (.leaf 2) (.leaf 3)) (.branch 135 (.leaf 3) (.leaf 4)))) (.branch 140 (.branch 138 (.branch 137 (.leaf 2) (.leaf 3)) (.branch 139 (.leaf 3) (.leaf 4))) (.branch 142 (.branch 141 (.leaf 3) (.leaf 4)) (.branch 143 (.leaf 4) (.leaf 5))))) (.branch 152 (.branch 148 (.branch 146 (.branch 145 (.leaf 2) (.leaf 3)) (.branch 147 (.leaf 3) (.leaf 4))) (.branch 150 (.branch 149 (.leaf 3) (.leaf 4)) (.branch 151 (.leaf 4) (.leaf 5)))) (.branch 156 (.branch 154 (.branch 153 (.leaf 3) (.leaf 4)) (.branch 155 (.leaf 4) (.leaf 5))) (.branch 158 (.branch 157 (.leaf 4) (.leaf 5)) (.branch 159 (.leaf 5) (.leaf 6)))))) (.branch 176 (.branch 168 (.branch 164 (.branch 162 (.branch 161 (.leaf 2) (.leaf 3)) (.branch 163 (.leaf 3) (.leaf 4))) (.branch 166 (.branch 165 (.leaf 3) (.leaf 4)) (.branch 167 (.leaf 4) (.leaf 5)))) (.branch 172 (.branch 170 (.branch 169 (.leaf 3) (.leaf 4)) (.branch 171 (.leaf 4) (.leaf 5))) (.branch 174 (.branch 173 (.leaf 4) (.leaf 5)) (.branch 175 (.leaf 5) (.leaf 6))))) (.branch 184 (.branch 180 (.branch 178 (.branch 177 (.leaf 3) (.leaf 4)) (.branch 179 (.leaf 4) (.leaf 5))) (.branch 182 (.branch 181 (.leaf 4) (.leaf 5)) (.branch 183 (.leaf 5) (.leaf 6)))) (.branch 188 (.branch 186 (.branch 185 (.leaf 4) (.leaf 5)) (.branch 187 (.leaf 5) (.leaf 6))) (.branch 190 (.branch 189 (.leaf 5) (.leaf 6)) (.branch 191 (.leaf 6) (.leaf 7))))))) (.branch 224 (.branch 208 (.branch 200 (.branch 196 (.branch 194 (.branch 193 (.leaf 2) (.leaf 3)) (.branch 195 (.leaf 3) (.leaf 4))) (.branch 198 (.branch 197 (.leaf 3) (.leaf 4)) (.branch 199 (.leaf 4) (.leaf 5)))) (.branch 204 (.branch 202 (.branch 201 (.leaf 3) (.leaf 4)) (.branch 203 (.leaf 4) (.leaf 5))) (.branch 206 (.branch 205 (.leaf 4) (.leaf 5)) (.branch 207 (.leaf 5) (.leaf 6))))) (.branch 216 (.branch 212 (.branch 210 (.branch 209 (.leaf 3) (.leaf 4)) (.branch 211 (.leaf 4) (.leaf 5))) (.branch 214 (.branch 213 (.leaf 4) (.leaf 5)) (.branch 215 (.leaf 5) (.leaf 6)))) (.branch 220 (.branch 218 (.branch 217 (.leaf 4) (.leaf 5)) (.branch 219 (.leaf 5) (.leaf 6))) (.branch 222 (.branch 221 (.leaf 5) (.leaf 6)) (.branch 223 (.leaf 6) (.leaf 7)))))) (.branch 240 (.branch 232 (.branch 228 (.branch 226 (.branch 225 (.leaf 3) (.leaf 4)) (.branch 227 (.leaf 4) (.leaf 5))) (.branch 230 (.branch 229 (.leaf 4) (.leaf 5)) (.branch 231 (.leaf 5) (.leaf 6)))) (.branch 236 (.branch 234 (.branch 233 (.leaf 4) (.leaf 5)) (.branch 235 (.leaf 5) (.leaf 6))) (.branch 238 (.branch 237 (.leaf 5) (.leaf 6)) (.branch 239 (.leaf 6) (.leaf 7))))) (.branch 248 (.branch 244 (.branch 242 (.branch 241 (.leaf 4) (.leaf 5)) (.branch 243 (.leaf 5) (.leaf 6))) (.branch 246 (.branch 245 (.leaf 5) (.leaf 6)) (.branch 247 (.leaf 6) (.leaf 7)))) (.branch 252 (.branch 250 (.branch 249 (.leaf 5) (.leaf 6)) (.branch 251 (.leaf 6) (.leaf 7))) (.branch 254 (.branch 253 (.leaf 6) (.leaf 7)) (.branch 255 (.leaf 7) (.leaf 8)))))))))

theorem byteTable_checked : ∀ i : Fin 256, byteTable.get i.val = Fast.count i.val := by
  decide +kernel

def byteCount (n : ℕ) : ℕ := byteTable.get (n % 256)

theorem byteCount_eq (n : ℕ) : byteCount n = Fast.count (n % 256) :=
  byteTable_checked ⟨n % 256, Nat.mod_lt _ (by decide)⟩

private theorem fast_count_parity (n : ℕ) :
    Fast.count n = Fast.count (n / 2) + n % 2 := by
  refine Nat.bitCasesOn n ?_
  intro b m
  rw [Fast.count_bit, Nat.bit_div_two, Nat.bit_mod_two]
  cases b <;> rfl

theorem fast_count_split_pow (k n : ℕ) :
    Fast.count n = Fast.count (n % 2 ^ k) + Fast.count (n / 2 ^ k) := by
  induction k generalizing n with
  | zero => simp [Nat.mod_one]
  | succ k ih =>
    have htotal := fast_count_parity n
    have hlow := fast_count_parity (n % (2 * 2 ^ k))
    have hrest := ih (n / 2)
    rw [Nat.mod_mul_right_div_self, Nat.mod_mul_right_mod] at hlow
    rw [Nat.div_div_eq_div_mul] at hrest
    rw [Nat.pow_succ']
    omega

theorem fast_count_split_byte (n : ℕ) :
    Fast.count n = Fast.count (n % 256) + Fast.count (n / 256) := by
  simpa using fast_count_split_pow 8 n

def countWithFuel (fuel n : ℕ) : ℕ :=
  fuel.rec (fun _ => 0)
    (fun _ previous value =>
      if value = 0 then 0 else byteCount value + previous (value / 256)) n

theorem countWithFuel_succ (fuel n : ℕ) :
    countWithFuel (fuel + 1) n =
      if n = 0 then 0 else byteCount n + countWithFuel fuel (n / 256) := rfl

theorem countWithFuel_eq (fuel n : ℕ) (hbound : n ≤ fuel) :
    countWithFuel fuel n = Fast.count n := by
  induction fuel generalizing n with
  | zero =>
    have hn : n = 0 := by omega
    subst n
    rfl
  | succ fuel ih =>
    rw [countWithFuel_succ]
    by_cases hn : n = 0
    · simp [hn]
    · rw [ite_eq_right hn]
      have hsmall : n / 256 < n := Nat.div_lt_self (Nat.pos_of_ne_zero hn) (by decide)
      rw [byteCount_eq, ih (n / 256) (by omega)]
      exact (fast_count_split_byte n).symm

def count (n : ℕ) : ℕ := countWithFuel n n

@[simp] theorem count_zero : count 0 = 0 := rfl

theorem count_eq_fast (n : ℕ) : count n = Fast.count n :=
  countWithFuel_eq n n (Nat.le_refl n)

theorem count_eq (n : ℕ) : count n = n.bitIndices.length :=
  (count_eq_fast n).trans (Fast.count_eq n)

theorem count_step (n : ℕ) :
    count n = if n = 0 then 0 else byteCount n + count (n / 256) := by
  by_cases hn : n = 0
  · subst n
    rfl
  · simp only [ite_eq_right hn, count_eq_fast, byteCount_eq]
    exact fast_count_split_byte n

end Loneliness.Modular.SupportSearch.Bits.Byte
