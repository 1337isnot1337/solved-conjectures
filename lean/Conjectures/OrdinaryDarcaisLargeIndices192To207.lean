import Conjectures.OrdinaryDarcaisLargeCertificate
import Conjectures.OrdinaryDarcaisCheckBlocks

/-! Ordinary divisor recurrence and balanced coefficient comparisons for indices 192 through 207. -/

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 20000
set_option maxHeartbeats 3000000

check_ordinary_recurrence 192 step 96
private theorem sign192 : LargeSignCertificate 192 := by decide +kernel
private theorem checked192 : LargeIndexCertificate 192 := ⟨mass192,packed192,fun _ => sign192⟩

check_ordinary_recurrence 193 step 96
private theorem sign193 : LargeSignCertificate 193 := by decide +kernel
private theorem checked193 : LargeIndexCertificate 193 := ⟨mass193,packed193,fun _ => sign193⟩

check_ordinary_recurrence 194 step 96
private theorem sign194 : LargeSignCertificate 194 := by decide +kernel
private theorem checked194 : LargeIndexCertificate 194 := ⟨mass194,packed194,fun _ => sign194⟩

check_ordinary_recurrence 195 step 96
private theorem sign195 : LargeSignCertificate 195 := by decide +kernel
private theorem checked195 : LargeIndexCertificate 195 := ⟨mass195,packed195,fun _ => sign195⟩

check_ordinary_recurrence 196 step 96
private theorem sign196 : LargeSignCertificate 196 := by decide +kernel
private theorem checked196 : LargeIndexCertificate 196 := ⟨mass196,packed196,fun _ => sign196⟩

check_ordinary_recurrence 197 step 96
private theorem sign197 : LargeSignCertificate 197 := by decide +kernel
private theorem checked197 : LargeIndexCertificate 197 := ⟨mass197,packed197,fun _ => sign197⟩

check_ordinary_recurrence 198 step 96
private theorem sign198 : LargeSignCertificate 198 := by decide +kernel
private theorem checked198 : LargeIndexCertificate 198 := ⟨mass198,packed198,fun _ => sign198⟩

check_ordinary_recurrence 199 step 96
private theorem sign199 : LargeSignCertificate 199 := by decide +kernel
private theorem checked199 : LargeIndexCertificate 199 := ⟨mass199,packed199,fun _ => sign199⟩

check_ordinary_recurrence 200 step 96
private theorem sign200 : LargeSignCertificate 200 := by decide +kernel
private theorem checked200 : LargeIndexCertificate 200 := ⟨mass200,packed200,fun _ => sign200⟩

check_ordinary_recurrence 201 step 96
private theorem sign201 : LargeSignCertificate 201 := by decide +kernel
private theorem checked201 : LargeIndexCertificate 201 := ⟨mass201,packed201,fun _ => sign201⟩

check_ordinary_recurrence 202 step 96
private theorem sign202 : LargeSignCertificate 202 := by decide +kernel
private theorem checked202 : LargeIndexCertificate 202 := ⟨mass202,packed202,fun _ => sign202⟩

check_ordinary_recurrence 203 step 96
private theorem sign203 : LargeSignCertificate 203 := by decide +kernel
private theorem checked203 : LargeIndexCertificate 203 := ⟨mass203,packed203,fun _ => sign203⟩

check_ordinary_recurrence 204 step 96
private theorem sign204 : LargeSignCertificate 204 := by decide +kernel
private theorem checked204 : LargeIndexCertificate 204 := ⟨mass204,packed204,fun _ => sign204⟩

check_ordinary_recurrence 205 step 96
private theorem sign205 : LargeSignCertificate 205 := by decide +kernel
private theorem checked205 : LargeIndexCertificate 205 := ⟨mass205,packed205,fun _ => sign205⟩

check_ordinary_recurrence 206 step 96
private theorem sign206 : LargeSignCertificate 206 := by decide +kernel
private theorem checked206 : LargeIndexCertificate 206 := ⟨mass206,packed206,fun _ => sign206⟩

check_ordinary_recurrence 207 step 96
private theorem sign207 : LargeSignCertificate 207 := by decide +kernel
private theorem checked207 : LargeIndexCertificate 207 := ⟨mass207,packed207,fun _ => sign207⟩

theorem ordinaryCertificates192To207 (n : ℕ) (lo : 192 ≤ n) (hi : n ≤ 207) : LargeIndexCertificate n := by
  interval_cases n
  · exact checked192
  · exact checked193
  · exact checked194
  · exact checked195
  · exact checked196
  · exact checked197
  · exact checked198
  · exact checked199
  · exact checked200
  · exact checked201
  · exact checked202
  · exact checked203
  · exact checked204
  · exact checked205
  · exact checked206
  · exact checked207

end OrdinaryDarcais
