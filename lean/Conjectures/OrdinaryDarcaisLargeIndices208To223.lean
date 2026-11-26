import Conjectures.OrdinaryDarcaisLargeCertificate
import Conjectures.OrdinaryDarcaisCheckBlocks

/-! Ordinary divisor recurrence and balanced coefficient comparisons for indices 208 through 223. -/

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 20000
set_option maxHeartbeats 3000000

check_ordinary_recurrence 208 step 96
private theorem sign208 : LargeSignCertificate 208 := by decide +kernel
private theorem checked208 : LargeIndexCertificate 208 := ⟨mass208,packed208,fun _ => sign208⟩

check_ordinary_recurrence 209 step 96
private theorem sign209 : LargeSignCertificate 209 := by decide +kernel
private theorem checked209 : LargeIndexCertificate 209 := ⟨mass209,packed209,fun _ => sign209⟩

check_ordinary_recurrence 210 step 96
private theorem sign210 : LargeSignCertificate 210 := by decide +kernel
private theorem checked210 : LargeIndexCertificate 210 := ⟨mass210,packed210,fun _ => sign210⟩

check_ordinary_recurrence 211 step 96
private theorem sign211 : LargeSignCertificate 211 := by decide +kernel
private theorem checked211 : LargeIndexCertificate 211 := ⟨mass211,packed211,fun _ => sign211⟩

check_ordinary_recurrence 212 step 96
private theorem sign212 : LargeSignCertificate 212 := by decide +kernel
private theorem checked212 : LargeIndexCertificate 212 := ⟨mass212,packed212,fun _ => sign212⟩

check_ordinary_recurrence 213 step 96
private theorem sign213 : LargeSignCertificate 213 := by decide +kernel
private theorem checked213 : LargeIndexCertificate 213 := ⟨mass213,packed213,fun _ => sign213⟩

check_ordinary_recurrence 214 step 96
private theorem sign214 : LargeSignCertificate 214 := by decide +kernel
private theorem checked214 : LargeIndexCertificate 214 := ⟨mass214,packed214,fun _ => sign214⟩

check_ordinary_recurrence 215 step 96
private theorem sign215 : LargeSignCertificate 215 := by decide +kernel
private theorem checked215 : LargeIndexCertificate 215 := ⟨mass215,packed215,fun _ => sign215⟩

check_ordinary_recurrence 216 step 96
private theorem sign216 : LargeSignCertificate 216 := by decide +kernel
private theorem checked216 : LargeIndexCertificate 216 := ⟨mass216,packed216,fun _ => sign216⟩

check_ordinary_recurrence 217 step 96
private theorem sign217 : LargeSignCertificate 217 := by decide +kernel
private theorem checked217 : LargeIndexCertificate 217 := ⟨mass217,packed217,fun _ => sign217⟩

check_ordinary_recurrence 218 step 96
private theorem sign218 : LargeSignCertificate 218 := by decide +kernel
private theorem checked218 : LargeIndexCertificate 218 := ⟨mass218,packed218,fun _ => sign218⟩

check_ordinary_recurrence 219 step 96
private theorem sign219 : LargeSignCertificate 219 := by decide +kernel
private theorem checked219 : LargeIndexCertificate 219 := ⟨mass219,packed219,fun _ => sign219⟩

check_ordinary_recurrence 220 step 96
private theorem sign220 : LargeSignCertificate 220 := by decide +kernel
private theorem checked220 : LargeIndexCertificate 220 := ⟨mass220,packed220,fun _ => sign220⟩

check_ordinary_recurrence 221 step 96
private theorem sign221 : LargeSignCertificate 221 := by decide +kernel
private theorem checked221 : LargeIndexCertificate 221 := ⟨mass221,packed221,fun _ => sign221⟩

check_ordinary_recurrence 222 step 96
private theorem sign222 : LargeSignCertificate 222 := by decide +kernel
private theorem checked222 : LargeIndexCertificate 222 := ⟨mass222,packed222,fun _ => sign222⟩

check_ordinary_recurrence 223 step 96
private theorem sign223 : LargeSignCertificate 223 := by decide +kernel
private theorem checked223 : LargeIndexCertificate 223 := ⟨mass223,packed223,fun _ => sign223⟩

theorem ordinaryCertificates208To223 (n : ℕ) (lo : 208 ≤ n) (hi : n ≤ 223) : LargeIndexCertificate n := by
  interval_cases n
  · exact checked208
  · exact checked209
  · exact checked210
  · exact checked211
  · exact checked212
  · exact checked213
  · exact checked214
  · exact checked215
  · exact checked216
  · exact checked217
  · exact checked218
  · exact checked219
  · exact checked220
  · exact checked221
  · exact checked222
  · exact checked223

end OrdinaryDarcais
