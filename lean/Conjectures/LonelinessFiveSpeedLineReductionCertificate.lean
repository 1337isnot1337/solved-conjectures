import Conjectures.LonelinessFiveSpeedLineReduction00
import Conjectures.LonelinessFiveSpeedLineReduction01
import Conjectures.LonelinessFiveSpeedLineReduction02
import Conjectures.LonelinessFiveSpeedLineReduction03
import Conjectures.LonelinessFiveSpeedLineReduction04
import Conjectures.LonelinessFiveSpeedLineReduction05
import Conjectures.LonelinessFiveSpeedLineReduction06
import Conjectures.LonelinessFiveSpeedLineReduction07
import Conjectures.LonelinessFiveSpeedLineReduction08
import Conjectures.LonelinessFiveSpeedLineReductionMapCertificate

namespace Loneliness.FiveSpeedCertificate

theorem allLineTables_checked (k : Fin 9) :
    lineTableCheck boundedMaps (canonicalMaps k)
      (planeParameterForms k) (lineCertificates k) = true := by
  fin_cases k
  · exact lineTable_0_checked
  · exact lineTable_1_checked
  · exact lineTable_2_checked
  · exact lineTable_3_checked
  · exact lineTable_4_checked
  · exact lineTable_5_checked
  · exact lineTable_6_checked
  · exact lineTable_7_checked
  · exact lineTable_8_checked

theorem every_parameter_form_checked (k : Fin 9)
    (h : ThreeIntegerVector) (hmem : h ∈ planeParameterForms k) :
    ∃ certificate ∈ lineCertificates k,
      lineCaseCheck boundedMaps (canonicalMaps k) h certificate = true :=
  lineTableCheck_mem boundedMaps (canonicalMaps k) (planeParameterForms k)
    (lineCertificates k) (allLineTables_checked k) hmem

end Loneliness.FiveSpeedCertificate
