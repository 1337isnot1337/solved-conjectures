import Conjectures.OrdinaryDarcaisRecurrenceBlocks

/-! Prove a scalar recurrence in segments. Intermediate natural-number witnesses
come from the elaborator. Each segment equation and the final multiplication
are independently checked by the kernel. -/

open Lean Elab Command

elab "check_ordinary_recurrence " index:num " step " stride:num : command => do
  let n := index.getNat
  let step := stride.getNat
  if step == 0 then throwError "the segment length must be positive"
  for packed in [false, true] do
    let stem := if packed then "packed" else "mass"
    let row := mkIdent (if packed then ``OrdinaryDarcais.largePacked else ``OrdinaryDarcais.largeMass)
    let scale ← if packed then `(1+OrdinaryDarcais.largeDigitBase) else `(2)
    let mut start := 0
    for j in [:((n+step-1)/step+1)] do
      let m := min n (j*step)
      let point := Syntax.mkNumLit (toString m)
      let value := mkIdent (.mkSimple s!"{stem}{n}at{m}")
      let eqn := mkIdent (.mkSimple s!"{stem}{n}at{m}Eq")
      let witness ← if packed then `(ordinaryPackedPartial $index $point) else `(ordinaryMassPartial $index $point)
      elabCommand (← `(private def $value : Nat := $witness))
      if j == 0 then
        elabCommand (← `(private theorem $eqn : OrdinaryDarcais.cachedNested $index $row $point = $value := by
          decide +kernel))
      else
        let oldEq := mkIdent (.mkSimple s!"{stem}{n}at{start}Eq")
        let left := Syntax.mkNumLit (toString start)
        let len := Syntax.mkNumLit (toString (m-start))
        elabCommand (← `(private theorem $eqn : OrdinaryDarcais.cachedNested $index $row $point = $value := by
          calc
            _ = OrdinaryDarcais.recurrenceSegment $index $row $left
                (OrdinaryDarcais.cachedNested $index $row $left) $len :=
              (OrdinaryDarcais.recurrenceSegment_eq $index $row $left $len).symm
            _ = $value := by rw [($oldEq)]; decide +kernel))
      start := m
    let lastEq := mkIdent (.mkSimple s!"{stem}{n}at{n}Eq")
    let finalEq := mkIdent (.mkSimple s!"{stem}{n}")
    let next := Syntax.mkNumLit (toString (n+1))
    elabCommand (← `(private theorem $finalEq : $row $next =
        $scale * OrdinaryDarcais.nestedSum $index $row $index := by
      rw [← OrdinaryDarcais.cachedNested_eq $index (by decide) $row $index, ($lastEq)]
      decide +kernel))
