module

public import Conjectures.FranklSpanFourResidualTailCert00
public import Conjectures.FranklSpanFourResidualTailCert01
public import Conjectures.FranklSpanFourResidualTailCert02
public import Conjectures.FranklSpanFourResidualTailCert03
public import Conjectures.FranklSpanFourResidualTailCert04
public import Conjectures.FranklSpanFourResidualTailCert05
public import Conjectures.FranklSpanFourResidualTailCert06
public import Conjectures.FranklSpanFourResidualTailCert07
public import Conjectures.FranklSpanFourResidualTailCert08
public import Conjectures.FranklSpanFourResidualTailCert09
public import Conjectures.FranklSpanFourResidualTailCert10
public import Conjectures.FranklSpanFourResidualTailCert11
public import Conjectures.FranklSpanFourResidualTailCert12
public import Conjectures.FranklSpanFourResidualTailCert13
public import Conjectures.FranklSpanFourResidualTailCert14
public import Conjectures.FranklSpanFourResidualTailCert15
public import Conjectures.FranklSpanFourResidualTailCert16
public import Conjectures.FranklSpanFourResidualTailCert17
public import Conjectures.FranklSpanFourResidualTailCert18
public import Conjectures.FranklSpanFourResidualTailCert19
public import Conjectures.FranklSpanFourResidualTailCert20
public import Conjectures.FranklSpanFourResidualTailCert21
public import Conjectures.FranklSpanFourResidualTailCert22
public import Conjectures.FranklSpanFourResidualTailCert23
public import Conjectures.FranklSpanFourResidualTailCert24
public import Conjectures.FranklSpanFourResidualTailCert25
public import Conjectures.FranklSpanFourResidualTailCert26
public import Conjectures.FranklSpanFourResidualTailCert27
public import Conjectures.FranklSpanFourResidualTailCert28
public import Conjectures.FranklSpanFourResidualTailCert29
public import Conjectures.FranklSpanFourResidualTailCert30

/-! Every original width-five weight witness has passed the exact checker. -/
@[expose] public section

namespace FranklSpanFour.Assembly.ResidualTail

theorem entries_checked : entries.all entryCheck = true := by
  apply List.all_eq_true.mpr
  intro e he
  simp only [entries, List.mem_cons, List.not_mem_nil, or_false] at he
  rcases he with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact Certificate00.checked
  · exact Certificate01.checked
  · exact Certificate02.checked
  · exact Certificate03.checked
  · exact Certificate04.checked
  · exact Certificate05.checked
  · exact Certificate06.checked
  · exact Certificate07.checked
  · exact Certificate08.checked
  · exact Certificate09.checked
  · exact Certificate10.checked
  · exact Certificate11.checked
  · exact Certificate12.checked
  · exact Certificate13.checked
  · exact Certificate14.checked
  · exact Certificate15.checked
  · exact Certificate16.checked
  · exact Certificate17.checked
  · exact Certificate18.checked
  · exact Certificate19.checked
  · exact Certificate20.checked
  · exact Certificate21.checked
  · exact Certificate22.checked
  · exact Certificate23.checked
  · exact Certificate24.checked
  · exact Certificate25.checked
  · exact Certificate26.checked
  · exact Certificate27.checked
  · exact Certificate28.checked
  · exact Certificate29.checked
  · exact Certificate30.checked

theorem entries_checked_mem {e : Entry} (he : e ∈ entries) : entryCheck e = true :=
  List.all_eq_true.mp entries_checked e he

end FranklSpanFour.Assembly.ResidualTail
