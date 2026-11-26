import Conjectures.OrdinaryDarcaisLargeCertificate
import Conjectures.OrdinaryDarcaisCheckBlocks

/-! Ordinary divisor recurrence and balanced coefficient comparisons for indices 240 through 255. -/

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 20000
set_option maxHeartbeats 3000000

check_ordinary_recurrence 240 step 96
private theorem sign240 : LargeSignCertificate 240 := by decide +kernel
private theorem checked240 : LargeIndexCertificate 240 := ⟨mass240,packed240,fun _ => sign240⟩

check_ordinary_recurrence 241 step 96
private theorem sign241 : LargeSignCertificate 241 := by decide +kernel
private theorem checked241 : LargeIndexCertificate 241 := ⟨mass241,packed241,fun _ => sign241⟩

check_ordinary_recurrence 242 step 96
private theorem sign242 : LargeSignCertificate 242 := by decide +kernel
private theorem checked242 : LargeIndexCertificate 242 := ⟨mass242,packed242,fun _ => sign242⟩

check_ordinary_recurrence 243 step 96
private theorem sign243 : LargeSignCertificate 243 := by decide +kernel
private theorem checked243 : LargeIndexCertificate 243 := ⟨mass243,packed243,fun _ => sign243⟩

check_ordinary_recurrence 244 step 96
private theorem sign244 : LargeSignCertificate 244 := by decide +kernel
private theorem checked244 : LargeIndexCertificate 244 := ⟨mass244,packed244,fun _ => sign244⟩

check_ordinary_recurrence 245 step 96
private theorem sign245 : LargeSignCertificate 245 := by decide +kernel
private theorem checked245 : LargeIndexCertificate 245 := ⟨mass245,packed245,fun _ => sign245⟩

check_ordinary_recurrence 246 step 96
private theorem sign246 : LargeSignCertificate 246 := by decide +kernel
private theorem checked246 : LargeIndexCertificate 246 := ⟨mass246,packed246,fun _ => sign246⟩

check_ordinary_recurrence 247 step 96
private theorem sign247 : LargeSignCertificate 247 := by decide +kernel
private theorem checked247 : LargeIndexCertificate 247 := ⟨mass247,packed247,fun _ => sign247⟩

check_ordinary_recurrence 248 step 96
private theorem sign248 : LargeSignCertificate 248 := by decide +kernel
private theorem checked248 : LargeIndexCertificate 248 := ⟨mass248,packed248,fun _ => sign248⟩

check_ordinary_recurrence 249 step 96
private theorem sign249 : LargeSignCertificate 249 := by decide +kernel
private theorem checked249 : LargeIndexCertificate 249 := ⟨mass249,packed249,fun _ => sign249⟩

check_ordinary_recurrence 250 step 96
private theorem sign250 : LargeSignCertificate 250 := by decide +kernel
private theorem checked250 : LargeIndexCertificate 250 := ⟨mass250,packed250,fun _ => sign250⟩

check_ordinary_recurrence 251 step 96
private theorem sign251 : LargeSignCertificate 251 := by decide +kernel
private theorem checked251 : LargeIndexCertificate 251 := ⟨mass251,packed251,fun _ => sign251⟩

check_ordinary_recurrence 252 step 96
private theorem sign252 : LargeSignCertificate 252 := by decide +kernel
private theorem checked252 : LargeIndexCertificate 252 := ⟨mass252,packed252,fun _ => sign252⟩

check_ordinary_recurrence 253 step 96
private theorem sign253 : LargeSignCertificate 253 := by decide +kernel
private theorem checked253 : LargeIndexCertificate 253 := ⟨mass253,packed253,fun _ => sign253⟩

check_ordinary_recurrence 254 step 96
private theorem sign254 : LargeSignCertificate 254 := by decide +kernel
private theorem checked254 : LargeIndexCertificate 254 := ⟨mass254,packed254,fun _ => sign254⟩

check_ordinary_recurrence 255 step 96
private theorem sign255 : LargeSignCertificate 255 := by decide +kernel
private theorem checked255 : LargeIndexCertificate 255 := ⟨mass255,packed255,fun _ => sign255⟩

theorem ordinaryCertificates240To255 (n : ℕ) (lo : 240 ≤ n) (hi : n ≤ 255) : LargeIndexCertificate n := by
  interval_cases n
  · exact checked240
  · exact checked241
  · exact checked242
  · exact checked243
  · exact checked244
  · exact checked245
  · exact checked246
  · exact checked247
  · exact checked248
  · exact checked249
  · exact checked250
  · exact checked251
  · exact checked252
  · exact checked253
  · exact checked254
  · exact checked255

end OrdinaryDarcais
