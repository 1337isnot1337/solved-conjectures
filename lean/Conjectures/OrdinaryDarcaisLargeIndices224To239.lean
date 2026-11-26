import Conjectures.OrdinaryDarcaisLargeCertificate
import Conjectures.OrdinaryDarcaisCheckBlocks

/-! Ordinary divisor recurrence and balanced coefficient comparisons for indices 224 through 239. -/

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 20000
set_option maxHeartbeats 3000000

check_ordinary_recurrence 224 step 96
private theorem sign224 : LargeSignCertificate 224 := by decide +kernel
private theorem checked224 : LargeIndexCertificate 224 := ⟨mass224,packed224,fun _ => sign224⟩

check_ordinary_recurrence 225 step 96
private theorem sign225 : LargeSignCertificate 225 := by decide +kernel
private theorem checked225 : LargeIndexCertificate 225 := ⟨mass225,packed225,fun _ => sign225⟩

check_ordinary_recurrence 226 step 96
private theorem sign226 : LargeSignCertificate 226 := by decide +kernel
private theorem checked226 : LargeIndexCertificate 226 := ⟨mass226,packed226,fun _ => sign226⟩

check_ordinary_recurrence 227 step 96
private theorem sign227 : LargeSignCertificate 227 := by decide +kernel
private theorem checked227 : LargeIndexCertificate 227 := ⟨mass227,packed227,fun _ => sign227⟩

check_ordinary_recurrence 228 step 96
private theorem sign228 : LargeSignCertificate 228 := by decide +kernel
private theorem checked228 : LargeIndexCertificate 228 := ⟨mass228,packed228,fun _ => sign228⟩

check_ordinary_recurrence 229 step 96
private theorem sign229 : LargeSignCertificate 229 := by decide +kernel
private theorem checked229 : LargeIndexCertificate 229 := ⟨mass229,packed229,fun _ => sign229⟩

check_ordinary_recurrence 230 step 96
private theorem sign230 : LargeSignCertificate 230 := by decide +kernel
private theorem checked230 : LargeIndexCertificate 230 := ⟨mass230,packed230,fun _ => sign230⟩

check_ordinary_recurrence 231 step 96
private theorem sign231 : LargeSignCertificate 231 := by decide +kernel
private theorem checked231 : LargeIndexCertificate 231 := ⟨mass231,packed231,fun _ => sign231⟩

check_ordinary_recurrence 232 step 96
private theorem sign232 : LargeSignCertificate 232 := by decide +kernel
private theorem checked232 : LargeIndexCertificate 232 := ⟨mass232,packed232,fun _ => sign232⟩

check_ordinary_recurrence 233 step 96
private theorem sign233 : LargeSignCertificate 233 := by decide +kernel
private theorem checked233 : LargeIndexCertificate 233 := ⟨mass233,packed233,fun _ => sign233⟩

check_ordinary_recurrence 234 step 96
private theorem sign234 : LargeSignCertificate 234 := by decide +kernel
private theorem checked234 : LargeIndexCertificate 234 := ⟨mass234,packed234,fun _ => sign234⟩

check_ordinary_recurrence 235 step 96
private theorem sign235 : LargeSignCertificate 235 := by decide +kernel
private theorem checked235 : LargeIndexCertificate 235 := ⟨mass235,packed235,fun _ => sign235⟩

check_ordinary_recurrence 236 step 96
private theorem sign236 : LargeSignCertificate 236 := by decide +kernel
private theorem checked236 : LargeIndexCertificate 236 := ⟨mass236,packed236,fun _ => sign236⟩

check_ordinary_recurrence 237 step 96
private theorem sign237 : LargeSignCertificate 237 := by decide +kernel
private theorem checked237 : LargeIndexCertificate 237 := ⟨mass237,packed237,fun _ => sign237⟩

check_ordinary_recurrence 238 step 96
private theorem sign238 : LargeSignCertificate 238 := by decide +kernel
private theorem checked238 : LargeIndexCertificate 238 := ⟨mass238,packed238,fun _ => sign238⟩

check_ordinary_recurrence 239 step 96
private theorem sign239 : LargeSignCertificate 239 := by decide +kernel
private theorem checked239 : LargeIndexCertificate 239 := ⟨mass239,packed239,fun _ => sign239⟩

theorem ordinaryCertificates224To239 (n : ℕ) (lo : 224 ≤ n) (hi : n ≤ 239) : LargeIndexCertificate n := by
  interval_cases n
  · exact checked224
  · exact checked225
  · exact checked226
  · exact checked227
  · exact checked228
  · exact checked229
  · exact checked230
  · exact checked231
  · exact checked232
  · exact checked233
  · exact checked234
  · exact checked235
  · exact checked236
  · exact checked237
  · exact checked238
  · exact checked239

end OrdinaryDarcais
