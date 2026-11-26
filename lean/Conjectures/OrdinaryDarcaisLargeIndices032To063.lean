import Conjectures.OrdinaryDarcaisLargeCertificate

/-! Ordinary divisor recurrence and balanced coefficient comparisons for indices 32 through 63. -/

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 20000
set_option maxHeartbeats 3000000

private theorem mass32 : largeMass 33 = 2 * nestedSum 32 largeMass 32 := by decide +kernel
private theorem packed32 : largePacked 33 = (1+largeDigitBase) * nestedSum 32 largePacked 32 := by
  decide +kernel
private theorem sign32 : LargeSignCertificate 32 := by decide +kernel
private theorem checked32 : LargeIndexCertificate 32 := ⟨mass32,packed32,fun _ => sign32⟩

private theorem mass33 : largeMass 34 = 2 * nestedSum 33 largeMass 33 := by decide +kernel
private theorem packed33 : largePacked 34 = (1+largeDigitBase) * nestedSum 33 largePacked 33 := by
  decide +kernel
private theorem sign33 : LargeSignCertificate 33 := by decide +kernel
private theorem checked33 : LargeIndexCertificate 33 := ⟨mass33,packed33,fun _ => sign33⟩

private theorem mass34 : largeMass 35 = 2 * nestedSum 34 largeMass 34 := by decide +kernel
private theorem packed34 : largePacked 35 = (1+largeDigitBase) * nestedSum 34 largePacked 34 := by
  decide +kernel
private theorem sign34 : LargeSignCertificate 34 := by decide +kernel
private theorem checked34 : LargeIndexCertificate 34 := ⟨mass34,packed34,fun _ => sign34⟩

private theorem mass35 : largeMass 36 = 2 * nestedSum 35 largeMass 35 := by decide +kernel
private theorem packed35 : largePacked 36 = (1+largeDigitBase) * nestedSum 35 largePacked 35 := by
  decide +kernel
private theorem sign35 : LargeSignCertificate 35 := by decide +kernel
private theorem checked35 : LargeIndexCertificate 35 := ⟨mass35,packed35,fun _ => sign35⟩

private theorem mass36 : largeMass 37 = 2 * nestedSum 36 largeMass 36 := by decide +kernel
private theorem packed36 : largePacked 37 = (1+largeDigitBase) * nestedSum 36 largePacked 36 := by
  decide +kernel
private theorem sign36 : LargeSignCertificate 36 := by decide +kernel
private theorem checked36 : LargeIndexCertificate 36 := ⟨mass36,packed36,fun _ => sign36⟩

private theorem mass37 : largeMass 38 = 2 * nestedSum 37 largeMass 37 := by decide +kernel
private theorem packed37 : largePacked 38 = (1+largeDigitBase) * nestedSum 37 largePacked 37 := by
  decide +kernel
private theorem sign37 : LargeSignCertificate 37 := by decide +kernel
private theorem checked37 : LargeIndexCertificate 37 := ⟨mass37,packed37,fun _ => sign37⟩

private theorem mass38 : largeMass 39 = 2 * nestedSum 38 largeMass 38 := by decide +kernel
private theorem packed38 : largePacked 39 = (1+largeDigitBase) * nestedSum 38 largePacked 38 := by
  decide +kernel
private theorem sign38 : LargeSignCertificate 38 := by decide +kernel
private theorem checked38 : LargeIndexCertificate 38 := ⟨mass38,packed38,fun _ => sign38⟩

private theorem mass39 : largeMass 40 = 2 * nestedSum 39 largeMass 39 := by decide +kernel
private theorem packed39 : largePacked 40 = (1+largeDigitBase) * nestedSum 39 largePacked 39 := by
  decide +kernel
private theorem sign39 : LargeSignCertificate 39 := by decide +kernel
private theorem checked39 : LargeIndexCertificate 39 := ⟨mass39,packed39,fun _ => sign39⟩

private theorem mass40 : largeMass 41 = 2 * nestedSum 40 largeMass 40 := by decide +kernel
private theorem packed40 : largePacked 41 = (1+largeDigitBase) * nestedSum 40 largePacked 40 := by
  decide +kernel
private theorem sign40 : LargeSignCertificate 40 := by decide +kernel
private theorem checked40 : LargeIndexCertificate 40 := ⟨mass40,packed40,fun _ => sign40⟩

private theorem mass41 : largeMass 42 = 2 * nestedSum 41 largeMass 41 := by decide +kernel
private theorem packed41 : largePacked 42 = (1+largeDigitBase) * nestedSum 41 largePacked 41 := by
  decide +kernel
private theorem sign41 : LargeSignCertificate 41 := by decide +kernel
private theorem checked41 : LargeIndexCertificate 41 := ⟨mass41,packed41,fun _ => sign41⟩

private theorem mass42 : largeMass 43 = 2 * nestedSum 42 largeMass 42 := by decide +kernel
private theorem packed42 : largePacked 43 = (1+largeDigitBase) * nestedSum 42 largePacked 42 := by
  decide +kernel
private theorem sign42 : LargeSignCertificate 42 := by decide +kernel
private theorem checked42 : LargeIndexCertificate 42 := ⟨mass42,packed42,fun _ => sign42⟩

private theorem mass43 : largeMass 44 = 2 * nestedSum 43 largeMass 43 := by decide +kernel
private theorem packed43 : largePacked 44 = (1+largeDigitBase) * nestedSum 43 largePacked 43 := by
  decide +kernel
private theorem sign43 : LargeSignCertificate 43 := by decide +kernel
private theorem checked43 : LargeIndexCertificate 43 := ⟨mass43,packed43,fun _ => sign43⟩

private theorem mass44 : largeMass 45 = 2 * nestedSum 44 largeMass 44 := by decide +kernel
private theorem packed44 : largePacked 45 = (1+largeDigitBase) * nestedSum 44 largePacked 44 := by
  decide +kernel
private theorem sign44 : LargeSignCertificate 44 := by decide +kernel
private theorem checked44 : LargeIndexCertificate 44 := ⟨mass44,packed44,fun _ => sign44⟩

private theorem mass45 : largeMass 46 = 2 * nestedSum 45 largeMass 45 := by decide +kernel
private theorem packed45 : largePacked 46 = (1+largeDigitBase) * nestedSum 45 largePacked 45 := by
  decide +kernel
private theorem sign45 : LargeSignCertificate 45 := by decide +kernel
private theorem checked45 : LargeIndexCertificate 45 := ⟨mass45,packed45,fun _ => sign45⟩

private theorem mass46 : largeMass 47 = 2 * nestedSum 46 largeMass 46 := by decide +kernel
private theorem packed46 : largePacked 47 = (1+largeDigitBase) * nestedSum 46 largePacked 46 := by
  decide +kernel
private theorem sign46 : LargeSignCertificate 46 := by decide +kernel
private theorem checked46 : LargeIndexCertificate 46 := ⟨mass46,packed46,fun _ => sign46⟩

private theorem mass47 : largeMass 48 = 2 * nestedSum 47 largeMass 47 := by decide +kernel
private theorem packed47 : largePacked 48 = (1+largeDigitBase) * nestedSum 47 largePacked 47 := by
  decide +kernel
private theorem sign47 : LargeSignCertificate 47 := by decide +kernel
private theorem checked47 : LargeIndexCertificate 47 := ⟨mass47,packed47,fun _ => sign47⟩

private theorem mass48 : largeMass 49 = 2 * nestedSum 48 largeMass 48 := by decide +kernel
private theorem packed48 : largePacked 49 = (1+largeDigitBase) * nestedSum 48 largePacked 48 := by
  decide +kernel
private theorem sign48 : LargeSignCertificate 48 := by decide +kernel
private theorem checked48 : LargeIndexCertificate 48 := ⟨mass48,packed48,fun _ => sign48⟩

private theorem mass49 : largeMass 50 = 2 * nestedSum 49 largeMass 49 := by decide +kernel
private theorem packed49 : largePacked 50 = (1+largeDigitBase) * nestedSum 49 largePacked 49 := by
  decide +kernel
private theorem sign49 : LargeSignCertificate 49 := by decide +kernel
private theorem checked49 : LargeIndexCertificate 49 := ⟨mass49,packed49,fun _ => sign49⟩

private theorem mass50 : largeMass 51 = 2 * nestedSum 50 largeMass 50 := by decide +kernel
private theorem packed50 : largePacked 51 = (1+largeDigitBase) * nestedSum 50 largePacked 50 := by
  decide +kernel
private theorem sign50 : LargeSignCertificate 50 := by decide +kernel
private theorem checked50 : LargeIndexCertificate 50 := ⟨mass50,packed50,fun _ => sign50⟩

private theorem mass51 : largeMass 52 = 2 * nestedSum 51 largeMass 51 := by decide +kernel
private theorem packed51 : largePacked 52 = (1+largeDigitBase) * nestedSum 51 largePacked 51 := by
  decide +kernel
private theorem sign51 : LargeSignCertificate 51 := by decide +kernel
private theorem checked51 : LargeIndexCertificate 51 := ⟨mass51,packed51,fun _ => sign51⟩

private theorem mass52 : largeMass 53 = 2 * nestedSum 52 largeMass 52 := by decide +kernel
private theorem packed52 : largePacked 53 = (1+largeDigitBase) * nestedSum 52 largePacked 52 := by
  decide +kernel
private theorem sign52 : LargeSignCertificate 52 := by decide +kernel
private theorem checked52 : LargeIndexCertificate 52 := ⟨mass52,packed52,fun _ => sign52⟩

private theorem mass53 : largeMass 54 = 2 * nestedSum 53 largeMass 53 := by decide +kernel
private theorem packed53 : largePacked 54 = (1+largeDigitBase) * nestedSum 53 largePacked 53 := by
  decide +kernel
private theorem sign53 : LargeSignCertificate 53 := by decide +kernel
private theorem checked53 : LargeIndexCertificate 53 := ⟨mass53,packed53,fun _ => sign53⟩

private theorem mass54 : largeMass 55 = 2 * nestedSum 54 largeMass 54 := by decide +kernel
private theorem packed54 : largePacked 55 = (1+largeDigitBase) * nestedSum 54 largePacked 54 := by
  decide +kernel
private theorem sign54 : LargeSignCertificate 54 := by decide +kernel
private theorem checked54 : LargeIndexCertificate 54 := ⟨mass54,packed54,fun _ => sign54⟩

private theorem mass55 : largeMass 56 = 2 * nestedSum 55 largeMass 55 := by decide +kernel
private theorem packed55 : largePacked 56 = (1+largeDigitBase) * nestedSum 55 largePacked 55 := by
  decide +kernel
private theorem sign55 : LargeSignCertificate 55 := by decide +kernel
private theorem checked55 : LargeIndexCertificate 55 := ⟨mass55,packed55,fun _ => sign55⟩

private theorem mass56 : largeMass 57 = 2 * nestedSum 56 largeMass 56 := by decide +kernel
private theorem packed56 : largePacked 57 = (1+largeDigitBase) * nestedSum 56 largePacked 56 := by
  decide +kernel
private theorem sign56 : LargeSignCertificate 56 := by decide +kernel
private theorem checked56 : LargeIndexCertificate 56 := ⟨mass56,packed56,fun _ => sign56⟩

private theorem mass57 : largeMass 58 = 2 * nestedSum 57 largeMass 57 := by decide +kernel
private theorem packed57 : largePacked 58 = (1+largeDigitBase) * nestedSum 57 largePacked 57 := by
  decide +kernel
private theorem sign57 : LargeSignCertificate 57 := by decide +kernel
private theorem checked57 : LargeIndexCertificate 57 := ⟨mass57,packed57,fun _ => sign57⟩

private theorem mass58 : largeMass 59 = 2 * nestedSum 58 largeMass 58 := by decide +kernel
private theorem packed58 : largePacked 59 = (1+largeDigitBase) * nestedSum 58 largePacked 58 := by
  decide +kernel
private theorem sign58 : LargeSignCertificate 58 := by decide +kernel
private theorem checked58 : LargeIndexCertificate 58 := ⟨mass58,packed58,fun _ => sign58⟩

private theorem mass59 : largeMass 60 = 2 * nestedSum 59 largeMass 59 := by decide +kernel
private theorem packed59 : largePacked 60 = (1+largeDigitBase) * nestedSum 59 largePacked 59 := by
  decide +kernel
private theorem sign59 : LargeSignCertificate 59 := by decide +kernel
private theorem checked59 : LargeIndexCertificate 59 := ⟨mass59,packed59,fun _ => sign59⟩

private theorem mass60 : largeMass 61 = 2 * nestedSum 60 largeMass 60 := by decide +kernel
private theorem packed60 : largePacked 61 = (1+largeDigitBase) * nestedSum 60 largePacked 60 := by
  decide +kernel
private theorem sign60 : LargeSignCertificate 60 := by decide +kernel
private theorem checked60 : LargeIndexCertificate 60 := ⟨mass60,packed60,fun _ => sign60⟩

private theorem mass61 : largeMass 62 = 2 * nestedSum 61 largeMass 61 := by decide +kernel
private theorem packed61 : largePacked 62 = (1+largeDigitBase) * nestedSum 61 largePacked 61 := by
  decide +kernel
private theorem sign61 : LargeSignCertificate 61 := by decide +kernel
private theorem checked61 : LargeIndexCertificate 61 := ⟨mass61,packed61,fun _ => sign61⟩

private theorem mass62 : largeMass 63 = 2 * nestedSum 62 largeMass 62 := by decide +kernel
private theorem packed62 : largePacked 63 = (1+largeDigitBase) * nestedSum 62 largePacked 62 := by
  decide +kernel
private theorem sign62 : LargeSignCertificate 62 := by decide +kernel
private theorem checked62 : LargeIndexCertificate 62 := ⟨mass62,packed62,fun _ => sign62⟩

private theorem mass63 : largeMass 64 = 2 * nestedSum 63 largeMass 63 := by decide +kernel
private theorem packed63 : largePacked 64 = (1+largeDigitBase) * nestedSum 63 largePacked 63 := by
  decide +kernel
private theorem sign63 : LargeSignCertificate 63 := by decide +kernel
private theorem checked63 : LargeIndexCertificate 63 := ⟨mass63,packed63,fun _ => sign63⟩

theorem ordinaryCertificates032To063 (n : ℕ) (lo : 32 ≤ n) (hi : n ≤ 63) : LargeIndexCertificate n := by
  interval_cases n
  · exact checked32
  · exact checked33
  · exact checked34
  · exact checked35
  · exact checked36
  · exact checked37
  · exact checked38
  · exact checked39
  · exact checked40
  · exact checked41
  · exact checked42
  · exact checked43
  · exact checked44
  · exact checked45
  · exact checked46
  · exact checked47
  · exact checked48
  · exact checked49
  · exact checked50
  · exact checked51
  · exact checked52
  · exact checked53
  · exact checked54
  · exact checked55
  · exact checked56
  · exact checked57
  · exact checked58
  · exact checked59
  · exact checked60
  · exact checked61
  · exact checked62
  · exact checked63

end OrdinaryDarcais
