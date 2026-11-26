import Conjectures.OrdinaryDarcaisLargeCertificate

/-! Ordinary divisor recurrence and balanced coefficient comparisons for indices 144 through 159. -/

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 20000
set_option maxHeartbeats 3000000

private theorem mass144 : largeMass 145 = 2 * nestedSum 144 largeMass 144 := by decide +kernel
private theorem packed144 : largePacked 145 = (1+largeDigitBase) * nestedSum 144 largePacked 144 := by
  decide +kernel
private theorem sign144 : LargeSignCertificate 144 := by decide +kernel
private theorem checked144 : LargeIndexCertificate 144 := ⟨mass144,packed144,fun _ => sign144⟩

private theorem mass145 : largeMass 146 = 2 * nestedSum 145 largeMass 145 := by decide +kernel
private theorem packed145 : largePacked 146 = (1+largeDigitBase) * nestedSum 145 largePacked 145 := by
  decide +kernel
private theorem sign145 : LargeSignCertificate 145 := by decide +kernel
private theorem checked145 : LargeIndexCertificate 145 := ⟨mass145,packed145,fun _ => sign145⟩

private theorem mass146 : largeMass 147 = 2 * nestedSum 146 largeMass 146 := by decide +kernel
private theorem packed146 : largePacked 147 = (1+largeDigitBase) * nestedSum 146 largePacked 146 := by
  decide +kernel
private theorem sign146 : LargeSignCertificate 146 := by decide +kernel
private theorem checked146 : LargeIndexCertificate 146 := ⟨mass146,packed146,fun _ => sign146⟩

private theorem mass147 : largeMass 148 = 2 * nestedSum 147 largeMass 147 := by decide +kernel
private theorem packed147 : largePacked 148 = (1+largeDigitBase) * nestedSum 147 largePacked 147 := by
  decide +kernel
private theorem sign147 : LargeSignCertificate 147 := by decide +kernel
private theorem checked147 : LargeIndexCertificate 147 := ⟨mass147,packed147,fun _ => sign147⟩

private theorem mass148 : largeMass 149 = 2 * nestedSum 148 largeMass 148 := by decide +kernel
private theorem packed148 : largePacked 149 = (1+largeDigitBase) * nestedSum 148 largePacked 148 := by
  decide +kernel
private theorem sign148 : LargeSignCertificate 148 := by decide +kernel
private theorem checked148 : LargeIndexCertificate 148 := ⟨mass148,packed148,fun _ => sign148⟩

private theorem mass149 : largeMass 150 = 2 * nestedSum 149 largeMass 149 := by decide +kernel
private theorem packed149 : largePacked 150 = (1+largeDigitBase) * nestedSum 149 largePacked 149 := by
  decide +kernel
private theorem sign149 : LargeSignCertificate 149 := by decide +kernel
private theorem checked149 : LargeIndexCertificate 149 := ⟨mass149,packed149,fun _ => sign149⟩

private theorem mass150 : largeMass 151 = 2 * nestedSum 150 largeMass 150 := by decide +kernel
private theorem packed150 : largePacked 151 = (1+largeDigitBase) * nestedSum 150 largePacked 150 := by
  decide +kernel
private theorem sign150 : LargeSignCertificate 150 := by decide +kernel
private theorem checked150 : LargeIndexCertificate 150 := ⟨mass150,packed150,fun _ => sign150⟩

private theorem mass151 : largeMass 152 = 2 * nestedSum 151 largeMass 151 := by decide +kernel
private theorem packed151 : largePacked 152 = (1+largeDigitBase) * nestedSum 151 largePacked 151 := by
  decide +kernel
private theorem sign151 : LargeSignCertificate 151 := by decide +kernel
private theorem checked151 : LargeIndexCertificate 151 := ⟨mass151,packed151,fun _ => sign151⟩

private theorem mass152 : largeMass 153 = 2 * nestedSum 152 largeMass 152 := by decide +kernel
private theorem packed152 : largePacked 153 = (1+largeDigitBase) * nestedSum 152 largePacked 152 := by
  decide +kernel
private theorem sign152 : LargeSignCertificate 152 := by decide +kernel
private theorem checked152 : LargeIndexCertificate 152 := ⟨mass152,packed152,fun _ => sign152⟩

private theorem mass153 : largeMass 154 = 2 * nestedSum 153 largeMass 153 := by decide +kernel
private theorem packed153 : largePacked 154 = (1+largeDigitBase) * nestedSum 153 largePacked 153 := by
  decide +kernel
private theorem sign153 : LargeSignCertificate 153 := by decide +kernel
private theorem checked153 : LargeIndexCertificate 153 := ⟨mass153,packed153,fun _ => sign153⟩

private theorem mass154 : largeMass 155 = 2 * nestedSum 154 largeMass 154 := by decide +kernel
private theorem packed154 : largePacked 155 = (1+largeDigitBase) * nestedSum 154 largePacked 154 := by
  decide +kernel
private theorem sign154 : LargeSignCertificate 154 := by decide +kernel
private theorem checked154 : LargeIndexCertificate 154 := ⟨mass154,packed154,fun _ => sign154⟩

private theorem mass155 : largeMass 156 = 2 * nestedSum 155 largeMass 155 := by decide +kernel
private theorem packed155 : largePacked 156 = (1+largeDigitBase) * nestedSum 155 largePacked 155 := by
  decide +kernel
private theorem sign155 : LargeSignCertificate 155 := by decide +kernel
private theorem checked155 : LargeIndexCertificate 155 := ⟨mass155,packed155,fun _ => sign155⟩

private theorem mass156 : largeMass 157 = 2 * nestedSum 156 largeMass 156 := by decide +kernel
private theorem packed156 : largePacked 157 = (1+largeDigitBase) * nestedSum 156 largePacked 156 := by
  decide +kernel
private theorem sign156 : LargeSignCertificate 156 := by decide +kernel
private theorem checked156 : LargeIndexCertificate 156 := ⟨mass156,packed156,fun _ => sign156⟩

private theorem mass157 : largeMass 158 = 2 * nestedSum 157 largeMass 157 := by decide +kernel
private theorem packed157 : largePacked 158 = (1+largeDigitBase) * nestedSum 157 largePacked 157 := by
  decide +kernel
private theorem sign157 : LargeSignCertificate 157 := by decide +kernel
private theorem checked157 : LargeIndexCertificate 157 := ⟨mass157,packed157,fun _ => sign157⟩

private theorem mass158 : largeMass 159 = 2 * nestedSum 158 largeMass 158 := by decide +kernel
private theorem packed158 : largePacked 159 = (1+largeDigitBase) * nestedSum 158 largePacked 158 := by
  decide +kernel
private theorem sign158 : LargeSignCertificate 158 := by decide +kernel
private theorem checked158 : LargeIndexCertificate 158 := ⟨mass158,packed158,fun _ => sign158⟩

private theorem mass159 : largeMass 160 = 2 * nestedSum 159 largeMass 159 := by decide +kernel
private theorem packed159 : largePacked 160 = (1+largeDigitBase) * nestedSum 159 largePacked 159 := by
  decide +kernel
private theorem sign159 : LargeSignCertificate 159 := by decide +kernel
private theorem checked159 : LargeIndexCertificate 159 := ⟨mass159,packed159,fun _ => sign159⟩

theorem ordinaryCertificates144To159 (n : ℕ) (lo : 144 ≤ n) (hi : n ≤ 159) : LargeIndexCertificate n := by
  interval_cases n
  · exact checked144
  · exact checked145
  · exact checked146
  · exact checked147
  · exact checked148
  · exact checked149
  · exact checked150
  · exact checked151
  · exact checked152
  · exact checked153
  · exact checked154
  · exact checked155
  · exact checked156
  · exact checked157
  · exact checked158
  · exact checked159

end OrdinaryDarcais
