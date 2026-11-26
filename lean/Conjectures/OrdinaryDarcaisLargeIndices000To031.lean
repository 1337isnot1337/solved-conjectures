import Conjectures.OrdinaryDarcaisLargeCertificate

/-! Ordinary divisor recurrence and balanced coefficient comparisons for indices 0 through 31. -/

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 20000
set_option maxHeartbeats 3000000

private theorem checked0 : LargeIndexCertificate 0 := by decide +kernel

private theorem checked1 : LargeIndexCertificate 1 := by decide +kernel

private theorem checked2 : LargeIndexCertificate 2 := by decide +kernel

private theorem checked3 : LargeIndexCertificate 3 := by decide +kernel

private theorem checked4 : LargeIndexCertificate 4 := by decide +kernel

private theorem checked5 : LargeIndexCertificate 5 := by decide +kernel

private theorem checked6 : LargeIndexCertificate 6 := by decide +kernel

private theorem checked7 : LargeIndexCertificate 7 := by decide +kernel

private theorem checked8 : LargeIndexCertificate 8 := by decide +kernel

private theorem checked9 : LargeIndexCertificate 9 := by decide +kernel

private theorem checked10 : LargeIndexCertificate 10 := by decide +kernel

private theorem checked11 : LargeIndexCertificate 11 := by decide +kernel

private theorem checked12 : LargeIndexCertificate 12 := by decide +kernel

private theorem checked13 : LargeIndexCertificate 13 := by decide +kernel

private theorem checked14 : LargeIndexCertificate 14 := by decide +kernel

private theorem checked15 : LargeIndexCertificate 15 := by decide +kernel

private theorem checked16 : LargeIndexCertificate 16 := by decide +kernel

private theorem checked17 : LargeIndexCertificate 17 := by decide +kernel

private theorem checked18 : LargeIndexCertificate 18 := by decide +kernel

private theorem checked19 : LargeIndexCertificate 19 := by decide +kernel

private theorem checked20 : LargeIndexCertificate 20 := by decide +kernel

private theorem checked21 : LargeIndexCertificate 21 := by decide +kernel

private theorem checked22 : LargeIndexCertificate 22 := by decide +kernel

private theorem checked23 : LargeIndexCertificate 23 := by decide +kernel

private theorem checked24 : LargeIndexCertificate 24 := by decide +kernel

private theorem checked25 : LargeIndexCertificate 25 := by decide +kernel

private theorem mass26 : largeMass 27 = 2 * nestedSum 26 largeMass 26 := by decide +kernel
private theorem packed26 : largePacked 27 = (1+largeDigitBase) * nestedSum 26 largePacked 26 := by
  decide +kernel
private theorem sign26 : LargeSignCertificate 26 := by decide +kernel
private theorem checked26 : LargeIndexCertificate 26 := ⟨mass26,packed26,fun _ => sign26⟩

private theorem mass27 : largeMass 28 = 2 * nestedSum 27 largeMass 27 := by decide +kernel
private theorem packed27 : largePacked 28 = (1+largeDigitBase) * nestedSum 27 largePacked 27 := by
  decide +kernel
private theorem sign27 : LargeSignCertificate 27 := by decide +kernel
private theorem checked27 : LargeIndexCertificate 27 := ⟨mass27,packed27,fun _ => sign27⟩

private theorem mass28 : largeMass 29 = 2 * nestedSum 28 largeMass 28 := by decide +kernel
private theorem packed28 : largePacked 29 = (1+largeDigitBase) * nestedSum 28 largePacked 28 := by
  decide +kernel
private theorem sign28 : LargeSignCertificate 28 := by decide +kernel
private theorem checked28 : LargeIndexCertificate 28 := ⟨mass28,packed28,fun _ => sign28⟩

private theorem mass29 : largeMass 30 = 2 * nestedSum 29 largeMass 29 := by decide +kernel
private theorem packed29 : largePacked 30 = (1+largeDigitBase) * nestedSum 29 largePacked 29 := by
  decide +kernel
private theorem sign29 : LargeSignCertificate 29 := by decide +kernel
private theorem checked29 : LargeIndexCertificate 29 := ⟨mass29,packed29,fun _ => sign29⟩

private theorem mass30 : largeMass 31 = 2 * nestedSum 30 largeMass 30 := by decide +kernel
private theorem packed30 : largePacked 31 = (1+largeDigitBase) * nestedSum 30 largePacked 30 := by
  decide +kernel
private theorem sign30 : LargeSignCertificate 30 := by decide +kernel
private theorem checked30 : LargeIndexCertificate 30 := ⟨mass30,packed30,fun _ => sign30⟩

private theorem mass31 : largeMass 32 = 2 * nestedSum 31 largeMass 31 := by decide +kernel
private theorem packed31 : largePacked 32 = (1+largeDigitBase) * nestedSum 31 largePacked 31 := by
  decide +kernel
private theorem sign31 : LargeSignCertificate 31 := by decide +kernel
private theorem checked31 : LargeIndexCertificate 31 := ⟨mass31,packed31,fun _ => sign31⟩

theorem ordinaryCertificates000To031 (n : ℕ) (lo : 0 ≤ n) (hi : n ≤ 31) : LargeIndexCertificate n := by
  interval_cases n
  · exact checked0
  · exact checked1
  · exact checked2
  · exact checked3
  · exact checked4
  · exact checked5
  · exact checked6
  · exact checked7
  · exact checked8
  · exact checked9
  · exact checked10
  · exact checked11
  · exact checked12
  · exact checked13
  · exact checked14
  · exact checked15
  · exact checked16
  · exact checked17
  · exact checked18
  · exact checked19
  · exact checked20
  · exact checked21
  · exact checked22
  · exact checked23
  · exact checked24
  · exact checked25
  · exact checked26
  · exact checked27
  · exact checked28
  · exact checked29
  · exact checked30
  · exact checked31

end OrdinaryDarcais
