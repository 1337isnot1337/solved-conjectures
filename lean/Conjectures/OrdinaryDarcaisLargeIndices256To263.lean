import Conjectures.OrdinaryDarcaisLargeCertificate
import Conjectures.OrdinaryDarcaisCheckBlocks

/-! Ordinary divisor recurrence and balanced coefficient comparisons for indices 256 through 263. -/

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 20000
set_option maxHeartbeats 3000000

check_ordinary_recurrence 256 step 96
private theorem sign256 : LargeSignCertificate 256 := by decide +kernel
private theorem checked256 : LargeIndexCertificate 256 := ⟨mass256,packed256,fun _ => sign256⟩

check_ordinary_recurrence 257 step 96
private theorem sign257 : LargeSignCertificate 257 := by decide +kernel
private theorem checked257 : LargeIndexCertificate 257 := ⟨mass257,packed257,fun _ => sign257⟩

check_ordinary_recurrence 258 step 96
private theorem sign258 : LargeSignCertificate 258 := by decide +kernel
private theorem checked258 : LargeIndexCertificate 258 := ⟨mass258,packed258,fun _ => sign258⟩

check_ordinary_recurrence 259 step 96
private theorem sign259 : LargeSignCertificate 259 := by decide +kernel
private theorem checked259 : LargeIndexCertificate 259 := ⟨mass259,packed259,fun _ => sign259⟩

check_ordinary_recurrence 260 step 96
private theorem sign260 : LargeSignCertificate 260 := by decide +kernel
private theorem checked260 : LargeIndexCertificate 260 := ⟨mass260,packed260,fun _ => sign260⟩

check_ordinary_recurrence 261 step 96
private theorem sign261 : LargeSignCertificate 261 := by decide +kernel
private theorem checked261 : LargeIndexCertificate 261 := ⟨mass261,packed261,fun _ => sign261⟩

check_ordinary_recurrence 262 step 96
private theorem sign262 : LargeSignCertificate 262 := by decide +kernel
private theorem checked262 : LargeIndexCertificate 262 := ⟨mass262,packed262,fun _ => sign262⟩

check_ordinary_recurrence 263 step 96
private theorem sign263 : LargeSignCertificate 263 := by decide +kernel
private theorem checked263 : LargeIndexCertificate 263 := ⟨mass263,packed263,fun _ => sign263⟩

theorem ordinaryCertificates256To263 (n : ℕ) (lo : 256 ≤ n) (hi : n ≤ 263) : LargeIndexCertificate n := by
  interval_cases n
  · exact checked256
  · exact checked257
  · exact checked258
  · exact checked259
  · exact checked260
  · exact checked261
  · exact checked262
  · exact checked263

end OrdinaryDarcais
