import Conjectures.OrdinaryDarcaisLargeCertificate

/-! Ordinary divisor recurrence and balanced coefficient comparisons for indices 160 through 175. -/

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 20000
set_option maxHeartbeats 3000000

private theorem mass160 : largeMass 161 = 2 * nestedSum 160 largeMass 160 := by decide +kernel
private theorem packed160 : largePacked 161 = (1+largeDigitBase) * nestedSum 160 largePacked 160 := by
  decide +kernel
private theorem sign160 : LargeSignCertificate 160 := by decide +kernel
private theorem checked160 : LargeIndexCertificate 160 := ⟨mass160,packed160,fun _ => sign160⟩

private theorem mass161 : largeMass 162 = 2 * nestedSum 161 largeMass 161 := by decide +kernel
private theorem packed161 : largePacked 162 = (1+largeDigitBase) * nestedSum 161 largePacked 161 := by
  decide +kernel
private theorem sign161 : LargeSignCertificate 161 := by decide +kernel
private theorem checked161 : LargeIndexCertificate 161 := ⟨mass161,packed161,fun _ => sign161⟩

private theorem mass162 : largeMass 163 = 2 * nestedSum 162 largeMass 162 := by decide +kernel
private theorem packed162 : largePacked 163 = (1+largeDigitBase) * nestedSum 162 largePacked 162 := by
  decide +kernel
private theorem sign162 : LargeSignCertificate 162 := by decide +kernel
private theorem checked162 : LargeIndexCertificate 162 := ⟨mass162,packed162,fun _ => sign162⟩

private theorem mass163 : largeMass 164 = 2 * nestedSum 163 largeMass 163 := by decide +kernel
private theorem packed163 : largePacked 164 = (1+largeDigitBase) * nestedSum 163 largePacked 163 := by
  decide +kernel
private theorem sign163 : LargeSignCertificate 163 := by decide +kernel
private theorem checked163 : LargeIndexCertificate 163 := ⟨mass163,packed163,fun _ => sign163⟩

private theorem mass164 : largeMass 165 = 2 * nestedSum 164 largeMass 164 := by decide +kernel
private theorem packed164 : largePacked 165 = (1+largeDigitBase) * nestedSum 164 largePacked 164 := by
  decide +kernel
private theorem sign164 : LargeSignCertificate 164 := by decide +kernel
private theorem checked164 : LargeIndexCertificate 164 := ⟨mass164,packed164,fun _ => sign164⟩

private theorem mass165 : largeMass 166 = 2 * nestedSum 165 largeMass 165 := by decide +kernel
private theorem packed165 : largePacked 166 = (1+largeDigitBase) * nestedSum 165 largePacked 165 := by
  decide +kernel
private theorem sign165 : LargeSignCertificate 165 := by decide +kernel
private theorem checked165 : LargeIndexCertificate 165 := ⟨mass165,packed165,fun _ => sign165⟩

private theorem mass166 : largeMass 167 = 2 * nestedSum 166 largeMass 166 := by decide +kernel
private theorem packed166 : largePacked 167 = (1+largeDigitBase) * nestedSum 166 largePacked 166 := by
  decide +kernel
private theorem sign166 : LargeSignCertificate 166 := by decide +kernel
private theorem checked166 : LargeIndexCertificate 166 := ⟨mass166,packed166,fun _ => sign166⟩

private theorem mass167 : largeMass 168 = 2 * nestedSum 167 largeMass 167 := by decide +kernel
private theorem packed167 : largePacked 168 = (1+largeDigitBase) * nestedSum 167 largePacked 167 := by
  decide +kernel
private theorem sign167 : LargeSignCertificate 167 := by decide +kernel
private theorem checked167 : LargeIndexCertificate 167 := ⟨mass167,packed167,fun _ => sign167⟩

private theorem mass168 : largeMass 169 = 2 * nestedSum 168 largeMass 168 := by decide +kernel
private theorem packed168 : largePacked 169 = (1+largeDigitBase) * nestedSum 168 largePacked 168 := by
  decide +kernel
private theorem sign168 : LargeSignCertificate 168 := by decide +kernel
private theorem checked168 : LargeIndexCertificate 168 := ⟨mass168,packed168,fun _ => sign168⟩

private theorem mass169 : largeMass 170 = 2 * nestedSum 169 largeMass 169 := by decide +kernel
private theorem packed169 : largePacked 170 = (1+largeDigitBase) * nestedSum 169 largePacked 169 := by
  decide +kernel
private theorem sign169 : LargeSignCertificate 169 := by decide +kernel
private theorem checked169 : LargeIndexCertificate 169 := ⟨mass169,packed169,fun _ => sign169⟩

private theorem mass170 : largeMass 171 = 2 * nestedSum 170 largeMass 170 := by decide +kernel
private theorem packed170 : largePacked 171 = (1+largeDigitBase) * nestedSum 170 largePacked 170 := by
  decide +kernel
private theorem sign170 : LargeSignCertificate 170 := by decide +kernel
private theorem checked170 : LargeIndexCertificate 170 := ⟨mass170,packed170,fun _ => sign170⟩

private theorem mass171 : largeMass 172 = 2 * nestedSum 171 largeMass 171 := by decide +kernel
private theorem packed171 : largePacked 172 = (1+largeDigitBase) * nestedSum 171 largePacked 171 := by
  decide +kernel
private theorem sign171 : LargeSignCertificate 171 := by decide +kernel
private theorem checked171 : LargeIndexCertificate 171 := ⟨mass171,packed171,fun _ => sign171⟩

private theorem mass172 : largeMass 173 = 2 * nestedSum 172 largeMass 172 := by decide +kernel
private theorem packed172 : largePacked 173 = (1+largeDigitBase) * nestedSum 172 largePacked 172 := by
  decide +kernel
private theorem sign172 : LargeSignCertificate 172 := by decide +kernel
private theorem checked172 : LargeIndexCertificate 172 := ⟨mass172,packed172,fun _ => sign172⟩

private theorem mass173 : largeMass 174 = 2 * nestedSum 173 largeMass 173 := by decide +kernel
private theorem packed173 : largePacked 174 = (1+largeDigitBase) * nestedSum 173 largePacked 173 := by
  decide +kernel
private theorem sign173 : LargeSignCertificate 173 := by decide +kernel
private theorem checked173 : LargeIndexCertificate 173 := ⟨mass173,packed173,fun _ => sign173⟩

private theorem mass174 : largeMass 175 = 2 * nestedSum 174 largeMass 174 := by decide +kernel
private theorem packed174 : largePacked 175 = (1+largeDigitBase) * nestedSum 174 largePacked 174 := by
  decide +kernel
private theorem sign174 : LargeSignCertificate 174 := by decide +kernel
private theorem checked174 : LargeIndexCertificate 174 := ⟨mass174,packed174,fun _ => sign174⟩

private theorem mass175 : largeMass 176 = 2 * nestedSum 175 largeMass 175 := by decide +kernel
private theorem packed175 : largePacked 176 = (1+largeDigitBase) * nestedSum 175 largePacked 175 := by
  decide +kernel
private theorem sign175 : LargeSignCertificate 175 := by decide +kernel
private theorem checked175 : LargeIndexCertificate 175 := ⟨mass175,packed175,fun _ => sign175⟩

theorem ordinaryCertificates160To175 (n : ℕ) (lo : 160 ≤ n) (hi : n ≤ 175) : LargeIndexCertificate n := by
  interval_cases n
  · exact checked160
  · exact checked161
  · exact checked162
  · exact checked163
  · exact checked164
  · exact checked165
  · exact checked166
  · exact checked167
  · exact checked168
  · exact checked169
  · exact checked170
  · exact checked171
  · exact checked172
  · exact checked173
  · exact checked174
  · exact checked175

end OrdinaryDarcais
