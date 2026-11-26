import Conjectures.OrdinaryDarcaisLargeCertificate

/-! Ordinary divisor recurrence and balanced coefficient comparisons for indices 176 through 191. -/

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 20000
set_option maxHeartbeats 3000000

private theorem mass176 : largeMass 177 = 2 * nestedSum 176 largeMass 176 := by decide +kernel
private theorem packed176 : largePacked 177 = (1+largeDigitBase) * nestedSum 176 largePacked 176 := by
  decide +kernel
private theorem sign176 : LargeSignCertificate 176 := by decide +kernel
private theorem checked176 : LargeIndexCertificate 176 := ⟨mass176,packed176,fun _ => sign176⟩

private theorem mass177 : largeMass 178 = 2 * nestedSum 177 largeMass 177 := by decide +kernel
private theorem packed177 : largePacked 178 = (1+largeDigitBase) * nestedSum 177 largePacked 177 := by
  decide +kernel
private theorem sign177 : LargeSignCertificate 177 := by decide +kernel
private theorem checked177 : LargeIndexCertificate 177 := ⟨mass177,packed177,fun _ => sign177⟩

private theorem mass178 : largeMass 179 = 2 * nestedSum 178 largeMass 178 := by decide +kernel
private theorem packed178 : largePacked 179 = (1+largeDigitBase) * nestedSum 178 largePacked 178 := by
  decide +kernel
private theorem sign178 : LargeSignCertificate 178 := by decide +kernel
private theorem checked178 : LargeIndexCertificate 178 := ⟨mass178,packed178,fun _ => sign178⟩

private theorem mass179 : largeMass 180 = 2 * nestedSum 179 largeMass 179 := by decide +kernel
private theorem packed179 : largePacked 180 = (1+largeDigitBase) * nestedSum 179 largePacked 179 := by
  decide +kernel
private theorem sign179 : LargeSignCertificate 179 := by decide +kernel
private theorem checked179 : LargeIndexCertificate 179 := ⟨mass179,packed179,fun _ => sign179⟩

private theorem mass180 : largeMass 181 = 2 * nestedSum 180 largeMass 180 := by decide +kernel
private theorem packed180 : largePacked 181 = (1+largeDigitBase) * nestedSum 180 largePacked 180 := by
  decide +kernel
private theorem sign180 : LargeSignCertificate 180 := by decide +kernel
private theorem checked180 : LargeIndexCertificate 180 := ⟨mass180,packed180,fun _ => sign180⟩

private theorem mass181 : largeMass 182 = 2 * nestedSum 181 largeMass 181 := by decide +kernel
private theorem packed181 : largePacked 182 = (1+largeDigitBase) * nestedSum 181 largePacked 181 := by
  decide +kernel
private theorem sign181 : LargeSignCertificate 181 := by decide +kernel
private theorem checked181 : LargeIndexCertificate 181 := ⟨mass181,packed181,fun _ => sign181⟩

private theorem mass182 : largeMass 183 = 2 * nestedSum 182 largeMass 182 := by decide +kernel
private theorem packed182 : largePacked 183 = (1+largeDigitBase) * nestedSum 182 largePacked 182 := by
  decide +kernel
private theorem sign182 : LargeSignCertificate 182 := by decide +kernel
private theorem checked182 : LargeIndexCertificate 182 := ⟨mass182,packed182,fun _ => sign182⟩

private theorem mass183 : largeMass 184 = 2 * nestedSum 183 largeMass 183 := by decide +kernel
private theorem packed183 : largePacked 184 = (1+largeDigitBase) * nestedSum 183 largePacked 183 := by
  decide +kernel
private theorem sign183 : LargeSignCertificate 183 := by decide +kernel
private theorem checked183 : LargeIndexCertificate 183 := ⟨mass183,packed183,fun _ => sign183⟩

private theorem mass184 : largeMass 185 = 2 * nestedSum 184 largeMass 184 := by decide +kernel
private theorem packed184 : largePacked 185 = (1+largeDigitBase) * nestedSum 184 largePacked 184 := by
  decide +kernel
private theorem sign184 : LargeSignCertificate 184 := by decide +kernel
private theorem checked184 : LargeIndexCertificate 184 := ⟨mass184,packed184,fun _ => sign184⟩

private theorem mass185 : largeMass 186 = 2 * nestedSum 185 largeMass 185 := by decide +kernel
private theorem packed185 : largePacked 186 = (1+largeDigitBase) * nestedSum 185 largePacked 185 := by
  decide +kernel
private theorem sign185 : LargeSignCertificate 185 := by decide +kernel
private theorem checked185 : LargeIndexCertificate 185 := ⟨mass185,packed185,fun _ => sign185⟩

private theorem mass186 : largeMass 187 = 2 * nestedSum 186 largeMass 186 := by decide +kernel
private theorem packed186 : largePacked 187 = (1+largeDigitBase) * nestedSum 186 largePacked 186 := by
  decide +kernel
private theorem sign186 : LargeSignCertificate 186 := by decide +kernel
private theorem checked186 : LargeIndexCertificate 186 := ⟨mass186,packed186,fun _ => sign186⟩

private theorem mass187 : largeMass 188 = 2 * nestedSum 187 largeMass 187 := by decide +kernel
private theorem packed187 : largePacked 188 = (1+largeDigitBase) * nestedSum 187 largePacked 187 := by
  decide +kernel
private theorem sign187 : LargeSignCertificate 187 := by decide +kernel
private theorem checked187 : LargeIndexCertificate 187 := ⟨mass187,packed187,fun _ => sign187⟩

private theorem mass188 : largeMass 189 = 2 * nestedSum 188 largeMass 188 := by decide +kernel
private theorem packed188 : largePacked 189 = (1+largeDigitBase) * nestedSum 188 largePacked 188 := by
  decide +kernel
private theorem sign188 : LargeSignCertificate 188 := by decide +kernel
private theorem checked188 : LargeIndexCertificate 188 := ⟨mass188,packed188,fun _ => sign188⟩

private theorem mass189 : largeMass 190 = 2 * nestedSum 189 largeMass 189 := by decide +kernel
private theorem packed189 : largePacked 190 = (1+largeDigitBase) * nestedSum 189 largePacked 189 := by
  decide +kernel
private theorem sign189 : LargeSignCertificate 189 := by decide +kernel
private theorem checked189 : LargeIndexCertificate 189 := ⟨mass189,packed189,fun _ => sign189⟩

private theorem mass190 : largeMass 191 = 2 * nestedSum 190 largeMass 190 := by decide +kernel
private theorem packed190 : largePacked 191 = (1+largeDigitBase) * nestedSum 190 largePacked 190 := by
  decide +kernel
private theorem sign190 : LargeSignCertificate 190 := by decide +kernel
private theorem checked190 : LargeIndexCertificate 190 := ⟨mass190,packed190,fun _ => sign190⟩

private theorem mass191 : largeMass 192 = 2 * nestedSum 191 largeMass 191 := by decide +kernel
private theorem packed191 : largePacked 192 = (1+largeDigitBase) * nestedSum 191 largePacked 191 := by
  decide +kernel
private theorem sign191 : LargeSignCertificate 191 := by decide +kernel
private theorem checked191 : LargeIndexCertificate 191 := ⟨mass191,packed191,fun _ => sign191⟩

theorem ordinaryCertificates176To191 (n : ℕ) (lo : 176 ≤ n) (hi : n ≤ 191) : LargeIndexCertificate n := by
  interval_cases n
  · exact checked176
  · exact checked177
  · exact checked178
  · exact checked179
  · exact checked180
  · exact checked181
  · exact checked182
  · exact checked183
  · exact checked184
  · exact checked185
  · exact checked186
  · exact checked187
  · exact checked188
  · exact checked189
  · exact checked190
  · exact checked191

end OrdinaryDarcais
