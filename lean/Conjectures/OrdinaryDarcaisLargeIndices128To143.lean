import Conjectures.OrdinaryDarcaisLargeCertificate

/-! Ordinary divisor recurrence and balanced coefficient comparisons for indices 128 through 143. -/

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 20000
set_option maxHeartbeats 3000000

private theorem mass128 : largeMass 129 = 2 * nestedSum 128 largeMass 128 := by decide +kernel
private theorem packed128 : largePacked 129 = (1+largeDigitBase) * nestedSum 128 largePacked 128 := by
  decide +kernel
private theorem sign128 : LargeSignCertificate 128 := by decide +kernel
private theorem checked128 : LargeIndexCertificate 128 := ⟨mass128,packed128,fun _ => sign128⟩

private theorem mass129 : largeMass 130 = 2 * nestedSum 129 largeMass 129 := by decide +kernel
private theorem packed129 : largePacked 130 = (1+largeDigitBase) * nestedSum 129 largePacked 129 := by
  decide +kernel
private theorem sign129 : LargeSignCertificate 129 := by decide +kernel
private theorem checked129 : LargeIndexCertificate 129 := ⟨mass129,packed129,fun _ => sign129⟩

private theorem mass130 : largeMass 131 = 2 * nestedSum 130 largeMass 130 := by decide +kernel
private theorem packed130 : largePacked 131 = (1+largeDigitBase) * nestedSum 130 largePacked 130 := by
  decide +kernel
private theorem sign130 : LargeSignCertificate 130 := by decide +kernel
private theorem checked130 : LargeIndexCertificate 130 := ⟨mass130,packed130,fun _ => sign130⟩

private theorem mass131 : largeMass 132 = 2 * nestedSum 131 largeMass 131 := by decide +kernel
private theorem packed131 : largePacked 132 = (1+largeDigitBase) * nestedSum 131 largePacked 131 := by
  decide +kernel
private theorem sign131 : LargeSignCertificate 131 := by decide +kernel
private theorem checked131 : LargeIndexCertificate 131 := ⟨mass131,packed131,fun _ => sign131⟩

private theorem mass132 : largeMass 133 = 2 * nestedSum 132 largeMass 132 := by decide +kernel
private theorem packed132 : largePacked 133 = (1+largeDigitBase) * nestedSum 132 largePacked 132 := by
  decide +kernel
private theorem sign132 : LargeSignCertificate 132 := by decide +kernel
private theorem checked132 : LargeIndexCertificate 132 := ⟨mass132,packed132,fun _ => sign132⟩

private theorem mass133 : largeMass 134 = 2 * nestedSum 133 largeMass 133 := by decide +kernel
private theorem packed133 : largePacked 134 = (1+largeDigitBase) * nestedSum 133 largePacked 133 := by
  decide +kernel
private theorem sign133 : LargeSignCertificate 133 := by decide +kernel
private theorem checked133 : LargeIndexCertificate 133 := ⟨mass133,packed133,fun _ => sign133⟩

private theorem mass134 : largeMass 135 = 2 * nestedSum 134 largeMass 134 := by decide +kernel
private theorem packed134 : largePacked 135 = (1+largeDigitBase) * nestedSum 134 largePacked 134 := by
  decide +kernel
private theorem sign134 : LargeSignCertificate 134 := by decide +kernel
private theorem checked134 : LargeIndexCertificate 134 := ⟨mass134,packed134,fun _ => sign134⟩

private theorem mass135 : largeMass 136 = 2 * nestedSum 135 largeMass 135 := by decide +kernel
private theorem packed135 : largePacked 136 = (1+largeDigitBase) * nestedSum 135 largePacked 135 := by
  decide +kernel
private theorem sign135 : LargeSignCertificate 135 := by decide +kernel
private theorem checked135 : LargeIndexCertificate 135 := ⟨mass135,packed135,fun _ => sign135⟩

private theorem mass136 : largeMass 137 = 2 * nestedSum 136 largeMass 136 := by decide +kernel
private theorem packed136 : largePacked 137 = (1+largeDigitBase) * nestedSum 136 largePacked 136 := by
  decide +kernel
private theorem sign136 : LargeSignCertificate 136 := by decide +kernel
private theorem checked136 : LargeIndexCertificate 136 := ⟨mass136,packed136,fun _ => sign136⟩

private theorem mass137 : largeMass 138 = 2 * nestedSum 137 largeMass 137 := by decide +kernel
private theorem packed137 : largePacked 138 = (1+largeDigitBase) * nestedSum 137 largePacked 137 := by
  decide +kernel
private theorem sign137 : LargeSignCertificate 137 := by decide +kernel
private theorem checked137 : LargeIndexCertificate 137 := ⟨mass137,packed137,fun _ => sign137⟩

private theorem mass138 : largeMass 139 = 2 * nestedSum 138 largeMass 138 := by decide +kernel
private theorem packed138 : largePacked 139 = (1+largeDigitBase) * nestedSum 138 largePacked 138 := by
  decide +kernel
private theorem sign138 : LargeSignCertificate 138 := by decide +kernel
private theorem checked138 : LargeIndexCertificate 138 := ⟨mass138,packed138,fun _ => sign138⟩

private theorem mass139 : largeMass 140 = 2 * nestedSum 139 largeMass 139 := by decide +kernel
private theorem packed139 : largePacked 140 = (1+largeDigitBase) * nestedSum 139 largePacked 139 := by
  decide +kernel
private theorem sign139 : LargeSignCertificate 139 := by decide +kernel
private theorem checked139 : LargeIndexCertificate 139 := ⟨mass139,packed139,fun _ => sign139⟩

private theorem mass140 : largeMass 141 = 2 * nestedSum 140 largeMass 140 := by decide +kernel
private theorem packed140 : largePacked 141 = (1+largeDigitBase) * nestedSum 140 largePacked 140 := by
  decide +kernel
private theorem sign140 : LargeSignCertificate 140 := by decide +kernel
private theorem checked140 : LargeIndexCertificate 140 := ⟨mass140,packed140,fun _ => sign140⟩

private theorem mass141 : largeMass 142 = 2 * nestedSum 141 largeMass 141 := by decide +kernel
private theorem packed141 : largePacked 142 = (1+largeDigitBase) * nestedSum 141 largePacked 141 := by
  decide +kernel
private theorem sign141 : LargeSignCertificate 141 := by decide +kernel
private theorem checked141 : LargeIndexCertificate 141 := ⟨mass141,packed141,fun _ => sign141⟩

private theorem mass142 : largeMass 143 = 2 * nestedSum 142 largeMass 142 := by decide +kernel
private theorem packed142 : largePacked 143 = (1+largeDigitBase) * nestedSum 142 largePacked 142 := by
  decide +kernel
private theorem sign142 : LargeSignCertificate 142 := by decide +kernel
private theorem checked142 : LargeIndexCertificate 142 := ⟨mass142,packed142,fun _ => sign142⟩

private theorem mass143 : largeMass 144 = 2 * nestedSum 143 largeMass 143 := by decide +kernel
private theorem packed143 : largePacked 144 = (1+largeDigitBase) * nestedSum 143 largePacked 143 := by
  decide +kernel
private theorem sign143 : LargeSignCertificate 143 := by decide +kernel
private theorem checked143 : LargeIndexCertificate 143 := ⟨mass143,packed143,fun _ => sign143⟩

theorem ordinaryCertificates128To143 (n : ℕ) (lo : 128 ≤ n) (hi : n ≤ 143) : LargeIndexCertificate n := by
  interval_cases n
  · exact checked128
  · exact checked129
  · exact checked130
  · exact checked131
  · exact checked132
  · exact checked133
  · exact checked134
  · exact checked135
  · exact checked136
  · exact checked137
  · exact checked138
  · exact checked139
  · exact checked140
  · exact checked141
  · exact checked142
  · exact checked143

end OrdinaryDarcais
