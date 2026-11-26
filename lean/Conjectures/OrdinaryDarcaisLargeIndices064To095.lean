import Conjectures.OrdinaryDarcaisLargeCertificate

/-! Ordinary divisor recurrence and balanced coefficient comparisons for indices 64 through 95. -/

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 20000
set_option maxHeartbeats 3000000

private theorem mass64 : largeMass 65 = 2 * nestedSum 64 largeMass 64 := by decide +kernel
private theorem packed64 : largePacked 65 = (1+largeDigitBase) * nestedSum 64 largePacked 64 := by
  decide +kernel
private theorem sign64 : LargeSignCertificate 64 := by decide +kernel
private theorem checked64 : LargeIndexCertificate 64 := ⟨mass64,packed64,fun _ => sign64⟩

private theorem mass65 : largeMass 66 = 2 * nestedSum 65 largeMass 65 := by decide +kernel
private theorem packed65 : largePacked 66 = (1+largeDigitBase) * nestedSum 65 largePacked 65 := by
  decide +kernel
private theorem sign65 : LargeSignCertificate 65 := by decide +kernel
private theorem checked65 : LargeIndexCertificate 65 := ⟨mass65,packed65,fun _ => sign65⟩

private theorem mass66 : largeMass 67 = 2 * nestedSum 66 largeMass 66 := by decide +kernel
private theorem packed66 : largePacked 67 = (1+largeDigitBase) * nestedSum 66 largePacked 66 := by
  decide +kernel
private theorem sign66 : LargeSignCertificate 66 := by decide +kernel
private theorem checked66 : LargeIndexCertificate 66 := ⟨mass66,packed66,fun _ => sign66⟩

private theorem mass67 : largeMass 68 = 2 * nestedSum 67 largeMass 67 := by decide +kernel
private theorem packed67 : largePacked 68 = (1+largeDigitBase) * nestedSum 67 largePacked 67 := by
  decide +kernel
private theorem sign67 : LargeSignCertificate 67 := by decide +kernel
private theorem checked67 : LargeIndexCertificate 67 := ⟨mass67,packed67,fun _ => sign67⟩

private theorem mass68 : largeMass 69 = 2 * nestedSum 68 largeMass 68 := by decide +kernel
private theorem packed68 : largePacked 69 = (1+largeDigitBase) * nestedSum 68 largePacked 68 := by
  decide +kernel
private theorem sign68 : LargeSignCertificate 68 := by decide +kernel
private theorem checked68 : LargeIndexCertificate 68 := ⟨mass68,packed68,fun _ => sign68⟩

private theorem mass69 : largeMass 70 = 2 * nestedSum 69 largeMass 69 := by decide +kernel
private theorem packed69 : largePacked 70 = (1+largeDigitBase) * nestedSum 69 largePacked 69 := by
  decide +kernel
private theorem sign69 : LargeSignCertificate 69 := by decide +kernel
private theorem checked69 : LargeIndexCertificate 69 := ⟨mass69,packed69,fun _ => sign69⟩

private theorem mass70 : largeMass 71 = 2 * nestedSum 70 largeMass 70 := by decide +kernel
private theorem packed70 : largePacked 71 = (1+largeDigitBase) * nestedSum 70 largePacked 70 := by
  decide +kernel
private theorem sign70 : LargeSignCertificate 70 := by decide +kernel
private theorem checked70 : LargeIndexCertificate 70 := ⟨mass70,packed70,fun _ => sign70⟩

private theorem mass71 : largeMass 72 = 2 * nestedSum 71 largeMass 71 := by decide +kernel
private theorem packed71 : largePacked 72 = (1+largeDigitBase) * nestedSum 71 largePacked 71 := by
  decide +kernel
private theorem sign71 : LargeSignCertificate 71 := by decide +kernel
private theorem checked71 : LargeIndexCertificate 71 := ⟨mass71,packed71,fun _ => sign71⟩

private theorem mass72 : largeMass 73 = 2 * nestedSum 72 largeMass 72 := by decide +kernel
private theorem packed72 : largePacked 73 = (1+largeDigitBase) * nestedSum 72 largePacked 72 := by
  decide +kernel
private theorem sign72 : LargeSignCertificate 72 := by decide +kernel
private theorem checked72 : LargeIndexCertificate 72 := ⟨mass72,packed72,fun _ => sign72⟩

private theorem mass73 : largeMass 74 = 2 * nestedSum 73 largeMass 73 := by decide +kernel
private theorem packed73 : largePacked 74 = (1+largeDigitBase) * nestedSum 73 largePacked 73 := by
  decide +kernel
private theorem sign73 : LargeSignCertificate 73 := by decide +kernel
private theorem checked73 : LargeIndexCertificate 73 := ⟨mass73,packed73,fun _ => sign73⟩

private theorem mass74 : largeMass 75 = 2 * nestedSum 74 largeMass 74 := by decide +kernel
private theorem packed74 : largePacked 75 = (1+largeDigitBase) * nestedSum 74 largePacked 74 := by
  decide +kernel
private theorem sign74 : LargeSignCertificate 74 := by decide +kernel
private theorem checked74 : LargeIndexCertificate 74 := ⟨mass74,packed74,fun _ => sign74⟩

private theorem mass75 : largeMass 76 = 2 * nestedSum 75 largeMass 75 := by decide +kernel
private theorem packed75 : largePacked 76 = (1+largeDigitBase) * nestedSum 75 largePacked 75 := by
  decide +kernel
private theorem sign75 : LargeSignCertificate 75 := by decide +kernel
private theorem checked75 : LargeIndexCertificate 75 := ⟨mass75,packed75,fun _ => sign75⟩

private theorem mass76 : largeMass 77 = 2 * nestedSum 76 largeMass 76 := by decide +kernel
private theorem packed76 : largePacked 77 = (1+largeDigitBase) * nestedSum 76 largePacked 76 := by
  decide +kernel
private theorem sign76 : LargeSignCertificate 76 := by decide +kernel
private theorem checked76 : LargeIndexCertificate 76 := ⟨mass76,packed76,fun _ => sign76⟩

private theorem mass77 : largeMass 78 = 2 * nestedSum 77 largeMass 77 := by decide +kernel
private theorem packed77 : largePacked 78 = (1+largeDigitBase) * nestedSum 77 largePacked 77 := by
  decide +kernel
private theorem sign77 : LargeSignCertificate 77 := by decide +kernel
private theorem checked77 : LargeIndexCertificate 77 := ⟨mass77,packed77,fun _ => sign77⟩

private theorem mass78 : largeMass 79 = 2 * nestedSum 78 largeMass 78 := by decide +kernel
private theorem packed78 : largePacked 79 = (1+largeDigitBase) * nestedSum 78 largePacked 78 := by
  decide +kernel
private theorem sign78 : LargeSignCertificate 78 := by decide +kernel
private theorem checked78 : LargeIndexCertificate 78 := ⟨mass78,packed78,fun _ => sign78⟩

private theorem mass79 : largeMass 80 = 2 * nestedSum 79 largeMass 79 := by decide +kernel
private theorem packed79 : largePacked 80 = (1+largeDigitBase) * nestedSum 79 largePacked 79 := by
  decide +kernel
private theorem sign79 : LargeSignCertificate 79 := by decide +kernel
private theorem checked79 : LargeIndexCertificate 79 := ⟨mass79,packed79,fun _ => sign79⟩

private theorem mass80 : largeMass 81 = 2 * nestedSum 80 largeMass 80 := by decide +kernel
private theorem packed80 : largePacked 81 = (1+largeDigitBase) * nestedSum 80 largePacked 80 := by
  decide +kernel
private theorem sign80 : LargeSignCertificate 80 := by decide +kernel
private theorem checked80 : LargeIndexCertificate 80 := ⟨mass80,packed80,fun _ => sign80⟩

private theorem mass81 : largeMass 82 = 2 * nestedSum 81 largeMass 81 := by decide +kernel
private theorem packed81 : largePacked 82 = (1+largeDigitBase) * nestedSum 81 largePacked 81 := by
  decide +kernel
private theorem sign81 : LargeSignCertificate 81 := by decide +kernel
private theorem checked81 : LargeIndexCertificate 81 := ⟨mass81,packed81,fun _ => sign81⟩

private theorem mass82 : largeMass 83 = 2 * nestedSum 82 largeMass 82 := by decide +kernel
private theorem packed82 : largePacked 83 = (1+largeDigitBase) * nestedSum 82 largePacked 82 := by
  decide +kernel
private theorem sign82 : LargeSignCertificate 82 := by decide +kernel
private theorem checked82 : LargeIndexCertificate 82 := ⟨mass82,packed82,fun _ => sign82⟩

private theorem mass83 : largeMass 84 = 2 * nestedSum 83 largeMass 83 := by decide +kernel
private theorem packed83 : largePacked 84 = (1+largeDigitBase) * nestedSum 83 largePacked 83 := by
  decide +kernel
private theorem sign83 : LargeSignCertificate 83 := by decide +kernel
private theorem checked83 : LargeIndexCertificate 83 := ⟨mass83,packed83,fun _ => sign83⟩

private theorem mass84 : largeMass 85 = 2 * nestedSum 84 largeMass 84 := by decide +kernel
private theorem packed84 : largePacked 85 = (1+largeDigitBase) * nestedSum 84 largePacked 84 := by
  decide +kernel
private theorem sign84 : LargeSignCertificate 84 := by decide +kernel
private theorem checked84 : LargeIndexCertificate 84 := ⟨mass84,packed84,fun _ => sign84⟩

private theorem mass85 : largeMass 86 = 2 * nestedSum 85 largeMass 85 := by decide +kernel
private theorem packed85 : largePacked 86 = (1+largeDigitBase) * nestedSum 85 largePacked 85 := by
  decide +kernel
private theorem sign85 : LargeSignCertificate 85 := by decide +kernel
private theorem checked85 : LargeIndexCertificate 85 := ⟨mass85,packed85,fun _ => sign85⟩

private theorem mass86 : largeMass 87 = 2 * nestedSum 86 largeMass 86 := by decide +kernel
private theorem packed86 : largePacked 87 = (1+largeDigitBase) * nestedSum 86 largePacked 86 := by
  decide +kernel
private theorem sign86 : LargeSignCertificate 86 := by decide +kernel
private theorem checked86 : LargeIndexCertificate 86 := ⟨mass86,packed86,fun _ => sign86⟩

private theorem mass87 : largeMass 88 = 2 * nestedSum 87 largeMass 87 := by decide +kernel
private theorem packed87 : largePacked 88 = (1+largeDigitBase) * nestedSum 87 largePacked 87 := by
  decide +kernel
private theorem sign87 : LargeSignCertificate 87 := by decide +kernel
private theorem checked87 : LargeIndexCertificate 87 := ⟨mass87,packed87,fun _ => sign87⟩

private theorem mass88 : largeMass 89 = 2 * nestedSum 88 largeMass 88 := by decide +kernel
private theorem packed88 : largePacked 89 = (1+largeDigitBase) * nestedSum 88 largePacked 88 := by
  decide +kernel
private theorem sign88 : LargeSignCertificate 88 := by decide +kernel
private theorem checked88 : LargeIndexCertificate 88 := ⟨mass88,packed88,fun _ => sign88⟩

private theorem mass89 : largeMass 90 = 2 * nestedSum 89 largeMass 89 := by decide +kernel
private theorem packed89 : largePacked 90 = (1+largeDigitBase) * nestedSum 89 largePacked 89 := by
  decide +kernel
private theorem sign89 : LargeSignCertificate 89 := by decide +kernel
private theorem checked89 : LargeIndexCertificate 89 := ⟨mass89,packed89,fun _ => sign89⟩

private theorem mass90 : largeMass 91 = 2 * nestedSum 90 largeMass 90 := by decide +kernel
private theorem packed90 : largePacked 91 = (1+largeDigitBase) * nestedSum 90 largePacked 90 := by
  decide +kernel
private theorem sign90 : LargeSignCertificate 90 := by decide +kernel
private theorem checked90 : LargeIndexCertificate 90 := ⟨mass90,packed90,fun _ => sign90⟩

private theorem mass91 : largeMass 92 = 2 * nestedSum 91 largeMass 91 := by decide +kernel
private theorem packed91 : largePacked 92 = (1+largeDigitBase) * nestedSum 91 largePacked 91 := by
  decide +kernel
private theorem sign91 : LargeSignCertificate 91 := by decide +kernel
private theorem checked91 : LargeIndexCertificate 91 := ⟨mass91,packed91,fun _ => sign91⟩

private theorem mass92 : largeMass 93 = 2 * nestedSum 92 largeMass 92 := by decide +kernel
private theorem packed92 : largePacked 93 = (1+largeDigitBase) * nestedSum 92 largePacked 92 := by
  decide +kernel
private theorem sign92 : LargeSignCertificate 92 := by decide +kernel
private theorem checked92 : LargeIndexCertificate 92 := ⟨mass92,packed92,fun _ => sign92⟩

private theorem mass93 : largeMass 94 = 2 * nestedSum 93 largeMass 93 := by decide +kernel
private theorem packed93 : largePacked 94 = (1+largeDigitBase) * nestedSum 93 largePacked 93 := by
  decide +kernel
private theorem sign93 : LargeSignCertificate 93 := by decide +kernel
private theorem checked93 : LargeIndexCertificate 93 := ⟨mass93,packed93,fun _ => sign93⟩

private theorem mass94 : largeMass 95 = 2 * nestedSum 94 largeMass 94 := by decide +kernel
private theorem packed94 : largePacked 95 = (1+largeDigitBase) * nestedSum 94 largePacked 94 := by
  decide +kernel
private theorem sign94 : LargeSignCertificate 94 := by decide +kernel
private theorem checked94 : LargeIndexCertificate 94 := ⟨mass94,packed94,fun _ => sign94⟩

private theorem mass95 : largeMass 96 = 2 * nestedSum 95 largeMass 95 := by decide +kernel
private theorem packed95 : largePacked 96 = (1+largeDigitBase) * nestedSum 95 largePacked 95 := by
  decide +kernel
private theorem sign95 : LargeSignCertificate 95 := by decide +kernel
private theorem checked95 : LargeIndexCertificate 95 := ⟨mass95,packed95,fun _ => sign95⟩

theorem ordinaryCertificates064To095 (n : ℕ) (lo : 64 ≤ n) (hi : n ≤ 95) : LargeIndexCertificate n := by
  interval_cases n
  · exact checked64
  · exact checked65
  · exact checked66
  · exact checked67
  · exact checked68
  · exact checked69
  · exact checked70
  · exact checked71
  · exact checked72
  · exact checked73
  · exact checked74
  · exact checked75
  · exact checked76
  · exact checked77
  · exact checked78
  · exact checked79
  · exact checked80
  · exact checked81
  · exact checked82
  · exact checked83
  · exact checked84
  · exact checked85
  · exact checked86
  · exact checked87
  · exact checked88
  · exact checked89
  · exact checked90
  · exact checked91
  · exact checked92
  · exact checked93
  · exact checked94
  · exact checked95

end OrdinaryDarcais
