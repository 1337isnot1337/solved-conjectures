import Conjectures.OrdinaryDarcaisLargeCertificate

/-! Ordinary divisor recurrence and balanced coefficient comparisons for indices 96 through 127. -/

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 20000
set_option maxHeartbeats 3000000

private theorem mass96 : largeMass 97 = 2 * nestedSum 96 largeMass 96 := by decide +kernel
private theorem packed96 : largePacked 97 = (1+largeDigitBase) * nestedSum 96 largePacked 96 := by
  decide +kernel
private theorem sign96 : LargeSignCertificate 96 := by decide +kernel
private theorem checked96 : LargeIndexCertificate 96 := ⟨mass96,packed96,fun _ => sign96⟩

private theorem mass97 : largeMass 98 = 2 * nestedSum 97 largeMass 97 := by decide +kernel
private theorem packed97 : largePacked 98 = (1+largeDigitBase) * nestedSum 97 largePacked 97 := by
  decide +kernel
private theorem sign97 : LargeSignCertificate 97 := by decide +kernel
private theorem checked97 : LargeIndexCertificate 97 := ⟨mass97,packed97,fun _ => sign97⟩

private theorem mass98 : largeMass 99 = 2 * nestedSum 98 largeMass 98 := by decide +kernel
private theorem packed98 : largePacked 99 = (1+largeDigitBase) * nestedSum 98 largePacked 98 := by
  decide +kernel
private theorem sign98 : LargeSignCertificate 98 := by decide +kernel
private theorem checked98 : LargeIndexCertificate 98 := ⟨mass98,packed98,fun _ => sign98⟩

private theorem mass99 : largeMass 100 = 2 * nestedSum 99 largeMass 99 := by decide +kernel
private theorem packed99 : largePacked 100 = (1+largeDigitBase) * nestedSum 99 largePacked 99 := by
  decide +kernel
private theorem sign99 : LargeSignCertificate 99 := by decide +kernel
private theorem checked99 : LargeIndexCertificate 99 := ⟨mass99,packed99,fun _ => sign99⟩

private theorem mass100 : largeMass 101 = 2 * nestedSum 100 largeMass 100 := by decide +kernel
private theorem packed100 : largePacked 101 = (1+largeDigitBase) * nestedSum 100 largePacked 100 := by
  decide +kernel
private theorem sign100 : LargeSignCertificate 100 := by decide +kernel
private theorem checked100 : LargeIndexCertificate 100 := ⟨mass100,packed100,fun _ => sign100⟩

private theorem mass101 : largeMass 102 = 2 * nestedSum 101 largeMass 101 := by decide +kernel
private theorem packed101 : largePacked 102 = (1+largeDigitBase) * nestedSum 101 largePacked 101 := by
  decide +kernel
private theorem sign101 : LargeSignCertificate 101 := by decide +kernel
private theorem checked101 : LargeIndexCertificate 101 := ⟨mass101,packed101,fun _ => sign101⟩

private theorem mass102 : largeMass 103 = 2 * nestedSum 102 largeMass 102 := by decide +kernel
private theorem packed102 : largePacked 103 = (1+largeDigitBase) * nestedSum 102 largePacked 102 := by
  decide +kernel
private theorem sign102 : LargeSignCertificate 102 := by decide +kernel
private theorem checked102 : LargeIndexCertificate 102 := ⟨mass102,packed102,fun _ => sign102⟩

private theorem mass103 : largeMass 104 = 2 * nestedSum 103 largeMass 103 := by decide +kernel
private theorem packed103 : largePacked 104 = (1+largeDigitBase) * nestedSum 103 largePacked 103 := by
  decide +kernel
private theorem sign103 : LargeSignCertificate 103 := by decide +kernel
private theorem checked103 : LargeIndexCertificate 103 := ⟨mass103,packed103,fun _ => sign103⟩

private theorem mass104 : largeMass 105 = 2 * nestedSum 104 largeMass 104 := by decide +kernel
private theorem packed104 : largePacked 105 = (1+largeDigitBase) * nestedSum 104 largePacked 104 := by
  decide +kernel
private theorem sign104 : LargeSignCertificate 104 := by decide +kernel
private theorem checked104 : LargeIndexCertificate 104 := ⟨mass104,packed104,fun _ => sign104⟩

private theorem mass105 : largeMass 106 = 2 * nestedSum 105 largeMass 105 := by decide +kernel
private theorem packed105 : largePacked 106 = (1+largeDigitBase) * nestedSum 105 largePacked 105 := by
  decide +kernel
private theorem sign105 : LargeSignCertificate 105 := by decide +kernel
private theorem checked105 : LargeIndexCertificate 105 := ⟨mass105,packed105,fun _ => sign105⟩

private theorem mass106 : largeMass 107 = 2 * nestedSum 106 largeMass 106 := by decide +kernel
private theorem packed106 : largePacked 107 = (1+largeDigitBase) * nestedSum 106 largePacked 106 := by
  decide +kernel
private theorem sign106 : LargeSignCertificate 106 := by decide +kernel
private theorem checked106 : LargeIndexCertificate 106 := ⟨mass106,packed106,fun _ => sign106⟩

private theorem mass107 : largeMass 108 = 2 * nestedSum 107 largeMass 107 := by decide +kernel
private theorem packed107 : largePacked 108 = (1+largeDigitBase) * nestedSum 107 largePacked 107 := by
  decide +kernel
private theorem sign107 : LargeSignCertificate 107 := by decide +kernel
private theorem checked107 : LargeIndexCertificate 107 := ⟨mass107,packed107,fun _ => sign107⟩

private theorem mass108 : largeMass 109 = 2 * nestedSum 108 largeMass 108 := by decide +kernel
private theorem packed108 : largePacked 109 = (1+largeDigitBase) * nestedSum 108 largePacked 108 := by
  decide +kernel
private theorem sign108 : LargeSignCertificate 108 := by decide +kernel
private theorem checked108 : LargeIndexCertificate 108 := ⟨mass108,packed108,fun _ => sign108⟩

private theorem mass109 : largeMass 110 = 2 * nestedSum 109 largeMass 109 := by decide +kernel
private theorem packed109 : largePacked 110 = (1+largeDigitBase) * nestedSum 109 largePacked 109 := by
  decide +kernel
private theorem sign109 : LargeSignCertificate 109 := by decide +kernel
private theorem checked109 : LargeIndexCertificate 109 := ⟨mass109,packed109,fun _ => sign109⟩

private theorem mass110 : largeMass 111 = 2 * nestedSum 110 largeMass 110 := by decide +kernel
private theorem packed110 : largePacked 111 = (1+largeDigitBase) * nestedSum 110 largePacked 110 := by
  decide +kernel
private theorem sign110 : LargeSignCertificate 110 := by decide +kernel
private theorem checked110 : LargeIndexCertificate 110 := ⟨mass110,packed110,fun _ => sign110⟩

private theorem mass111 : largeMass 112 = 2 * nestedSum 111 largeMass 111 := by decide +kernel
private theorem packed111 : largePacked 112 = (1+largeDigitBase) * nestedSum 111 largePacked 111 := by
  decide +kernel
private theorem sign111 : LargeSignCertificate 111 := by decide +kernel
private theorem checked111 : LargeIndexCertificate 111 := ⟨mass111,packed111,fun _ => sign111⟩

private theorem mass112 : largeMass 113 = 2 * nestedSum 112 largeMass 112 := by decide +kernel
private theorem packed112 : largePacked 113 = (1+largeDigitBase) * nestedSum 112 largePacked 112 := by
  decide +kernel
private theorem sign112 : LargeSignCertificate 112 := by decide +kernel
private theorem checked112 : LargeIndexCertificate 112 := ⟨mass112,packed112,fun _ => sign112⟩

private theorem mass113 : largeMass 114 = 2 * nestedSum 113 largeMass 113 := by decide +kernel
private theorem packed113 : largePacked 114 = (1+largeDigitBase) * nestedSum 113 largePacked 113 := by
  decide +kernel
private theorem sign113 : LargeSignCertificate 113 := by decide +kernel
private theorem checked113 : LargeIndexCertificate 113 := ⟨mass113,packed113,fun _ => sign113⟩

private theorem mass114 : largeMass 115 = 2 * nestedSum 114 largeMass 114 := by decide +kernel
private theorem packed114 : largePacked 115 = (1+largeDigitBase) * nestedSum 114 largePacked 114 := by
  decide +kernel
private theorem sign114 : LargeSignCertificate 114 := by decide +kernel
private theorem checked114 : LargeIndexCertificate 114 := ⟨mass114,packed114,fun _ => sign114⟩

private theorem mass115 : largeMass 116 = 2 * nestedSum 115 largeMass 115 := by decide +kernel
private theorem packed115 : largePacked 116 = (1+largeDigitBase) * nestedSum 115 largePacked 115 := by
  decide +kernel
private theorem sign115 : LargeSignCertificate 115 := by decide +kernel
private theorem checked115 : LargeIndexCertificate 115 := ⟨mass115,packed115,fun _ => sign115⟩

private theorem mass116 : largeMass 117 = 2 * nestedSum 116 largeMass 116 := by decide +kernel
private theorem packed116 : largePacked 117 = (1+largeDigitBase) * nestedSum 116 largePacked 116 := by
  decide +kernel
private theorem sign116 : LargeSignCertificate 116 := by decide +kernel
private theorem checked116 : LargeIndexCertificate 116 := ⟨mass116,packed116,fun _ => sign116⟩

private theorem mass117 : largeMass 118 = 2 * nestedSum 117 largeMass 117 := by decide +kernel
private theorem packed117 : largePacked 118 = (1+largeDigitBase) * nestedSum 117 largePacked 117 := by
  decide +kernel
private theorem sign117 : LargeSignCertificate 117 := by decide +kernel
private theorem checked117 : LargeIndexCertificate 117 := ⟨mass117,packed117,fun _ => sign117⟩

private theorem mass118 : largeMass 119 = 2 * nestedSum 118 largeMass 118 := by decide +kernel
private theorem packed118 : largePacked 119 = (1+largeDigitBase) * nestedSum 118 largePacked 118 := by
  decide +kernel
private theorem sign118 : LargeSignCertificate 118 := by decide +kernel
private theorem checked118 : LargeIndexCertificate 118 := ⟨mass118,packed118,fun _ => sign118⟩

private theorem mass119 : largeMass 120 = 2 * nestedSum 119 largeMass 119 := by decide +kernel
private theorem packed119 : largePacked 120 = (1+largeDigitBase) * nestedSum 119 largePacked 119 := by
  decide +kernel
private theorem sign119 : LargeSignCertificate 119 := by decide +kernel
private theorem checked119 : LargeIndexCertificate 119 := ⟨mass119,packed119,fun _ => sign119⟩

private theorem mass120 : largeMass 121 = 2 * nestedSum 120 largeMass 120 := by decide +kernel
private theorem packed120 : largePacked 121 = (1+largeDigitBase) * nestedSum 120 largePacked 120 := by
  decide +kernel
private theorem sign120 : LargeSignCertificate 120 := by decide +kernel
private theorem checked120 : LargeIndexCertificate 120 := ⟨mass120,packed120,fun _ => sign120⟩

private theorem mass121 : largeMass 122 = 2 * nestedSum 121 largeMass 121 := by decide +kernel
private theorem packed121 : largePacked 122 = (1+largeDigitBase) * nestedSum 121 largePacked 121 := by
  decide +kernel
private theorem sign121 : LargeSignCertificate 121 := by decide +kernel
private theorem checked121 : LargeIndexCertificate 121 := ⟨mass121,packed121,fun _ => sign121⟩

private theorem mass122 : largeMass 123 = 2 * nestedSum 122 largeMass 122 := by decide +kernel
private theorem packed122 : largePacked 123 = (1+largeDigitBase) * nestedSum 122 largePacked 122 := by
  decide +kernel
private theorem sign122 : LargeSignCertificate 122 := by decide +kernel
private theorem checked122 : LargeIndexCertificate 122 := ⟨mass122,packed122,fun _ => sign122⟩

private theorem mass123 : largeMass 124 = 2 * nestedSum 123 largeMass 123 := by decide +kernel
private theorem packed123 : largePacked 124 = (1+largeDigitBase) * nestedSum 123 largePacked 123 := by
  decide +kernel
private theorem sign123 : LargeSignCertificate 123 := by decide +kernel
private theorem checked123 : LargeIndexCertificate 123 := ⟨mass123,packed123,fun _ => sign123⟩

private theorem mass124 : largeMass 125 = 2 * nestedSum 124 largeMass 124 := by decide +kernel
private theorem packed124 : largePacked 125 = (1+largeDigitBase) * nestedSum 124 largePacked 124 := by
  decide +kernel
private theorem sign124 : LargeSignCertificate 124 := by decide +kernel
private theorem checked124 : LargeIndexCertificate 124 := ⟨mass124,packed124,fun _ => sign124⟩

private theorem mass125 : largeMass 126 = 2 * nestedSum 125 largeMass 125 := by decide +kernel
private theorem packed125 : largePacked 126 = (1+largeDigitBase) * nestedSum 125 largePacked 125 := by
  decide +kernel
private theorem sign125 : LargeSignCertificate 125 := by decide +kernel
private theorem checked125 : LargeIndexCertificate 125 := ⟨mass125,packed125,fun _ => sign125⟩

private theorem mass126 : largeMass 127 = 2 * nestedSum 126 largeMass 126 := by decide +kernel
private theorem packed126 : largePacked 127 = (1+largeDigitBase) * nestedSum 126 largePacked 126 := by
  decide +kernel
private theorem sign126 : LargeSignCertificate 126 := by decide +kernel
private theorem checked126 : LargeIndexCertificate 126 := ⟨mass126,packed126,fun _ => sign126⟩

private theorem mass127 : largeMass 128 = 2 * nestedSum 127 largeMass 127 := by decide +kernel
private theorem packed127 : largePacked 128 = (1+largeDigitBase) * nestedSum 127 largePacked 127 := by
  decide +kernel
private theorem sign127 : LargeSignCertificate 127 := by decide +kernel
private theorem checked127 : LargeIndexCertificate 127 := ⟨mass127,packed127,fun _ => sign127⟩

theorem ordinaryCertificates096To127 (n : ℕ) (lo : 96 ≤ n) (hi : n ≤ 127) : LargeIndexCertificate n := by
  interval_cases n
  · exact checked96
  · exact checked97
  · exact checked98
  · exact checked99
  · exact checked100
  · exact checked101
  · exact checked102
  · exact checked103
  · exact checked104
  · exact checked105
  · exact checked106
  · exact checked107
  · exact checked108
  · exact checked109
  · exact checked110
  · exact checked111
  · exact checked112
  · exact checked113
  · exact checked114
  · exact checked115
  · exact checked116
  · exact checked117
  · exact checked118
  · exact checked119
  · exact checked120
  · exact checked121
  · exact checked122
  · exact checked123
  · exact checked124
  · exact checked125
  · exact checked126
  · exact checked127

end OrdinaryDarcais
