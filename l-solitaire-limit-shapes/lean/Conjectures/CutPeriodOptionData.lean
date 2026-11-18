-- Numerical DFA definitions; actual-option semantics is checked separately.
import Conjectures.BinaryAutomata
namespace CutPeriod.OptionData
open BinaryAutomata
def rowA (idx : Nat) : Array Nat := (if idx<14 then (if idx<7 then (if idx<3 then (if idx<1 then #[0,1,2,3] else (if idx<2 then #[1,1,1,1] else #[4,5,6,7])) else (if idx<5 then (if idx<4 then #[1,1,8,1] else #[6,9,6,10]) else (if idx<6 then #[11,12,13,14] else #[6,6,6,6]))) else (if idx<10 then (if idx<8 then #[6,15,6,16] else (if idx<9 then #[17,1,18,3] else #[10,6,6,6])) else (if idx<12 then (if idx<11 then #[6,6,6,6] else #[4,19,20,7]) else (if idx<13 then #[1,1,21,1] else #[6,20,6,6])))) else (if idx<21 then (if idx<17 then (if idx<15 then #[11,22,23,14] else (if idx<16 then #[6,24,6,25] else #[6,6,6,10])) else (if idx<19 then (if idx<18 then #[17,1,26,3] else #[4,27,9,7]) else (if idx<20 then #[11,3,13,14] else #[10,6,6,6]))) else (if idx<24 then (if idx<22 then #[17,1,18,3] else (if idx<23 then #[1,1,8,1] else #[6,20,6,6])) else (if idx<26 then (if idx<25 then #[6,24,6,25] else #[6,6,6,10]) else (if idx<27 then #[4,27,9,7] else #[11,3,13,14])))))
def finalA (idx : Nat) : Bool := (if idx<14 then (if idx<7 then (if idx<3 then false else (if idx<5 then (if idx<4 then false else true) else (if idx<6 then false else true))) else (if idx<10 then (if idx<8 then true else (if idx<9 then false else true)) else (if idx<12 then (if idx<11 then false else true) else (if idx<13 then false else true)))) else (if idx<21 then (if idx<17 then (if idx<15 then true else (if idx<16 then true else false)) else (if idx<19 then (if idx<18 then false else true) else (if idx<20 then true else false))) else (if idx<24 then (if idx<22 then true else (if idx<23 then true else false)) else (if idx<26 then (if idx<25 then false else true) else false))))
def machineA : DFA (Fin 28) := {
  step := fun q d => Fin.ofNat 28 ((rowA q.val)[d.val]!)
  start := 0
  final := fun q => finalA q.val
}
def rowB (idx : Nat) : Array Nat := (if idx<14 then (if idx<7 then (if idx<3 then (if idx<1 then #[0,1,2,3] else (if idx<2 then #[1,1,1,1] else #[4,5,6,7])) else (if idx<5 then (if idx<4 then #[1,1,8,1] else #[6,9,6,10]) else (if idx<6 then #[11,12,13,14] else #[6,6,6,6]))) else (if idx<10 then (if idx<8 then #[6,15,6,16] else (if idx<9 then #[17,1,18,3] else #[10,6,6,6])) else (if idx<12 then (if idx<11 then #[6,6,6,6] else #[4,19,20,7]) else (if idx<13 then #[1,1,21,1] else #[6,20,6,6])))) else (if idx<21 then (if idx<17 then (if idx<15 then #[11,22,23,14] else (if idx<16 then #[6,24,6,25] else #[6,6,6,10])) else (if idx<19 then (if idx<18 then #[17,1,26,3] else #[4,27,9,7]) else (if idx<20 then #[11,3,13,14] else #[10,6,6,6]))) else (if idx<24 then (if idx<22 then #[17,1,18,3] else (if idx<23 then #[1,1,8,1] else #[6,20,6,6])) else (if idx<26 then (if idx<25 then #[6,24,6,25] else #[6,6,6,10]) else (if idx<27 then #[4,27,9,7] else #[11,3,13,14])))))
def finalB (idx : Nat) : Bool := (if idx<14 then (if idx<7 then (if idx<3 then false else (if idx<5 then (if idx<4 then false else true) else (if idx<6 then false else true))) else (if idx<10 then (if idx<8 then true else (if idx<9 then false else true)) else (if idx<12 then (if idx<11 then false else true) else (if idx<13 then false else true)))) else (if idx<21 then (if idx<17 then (if idx<15 then true else (if idx<16 then true else false)) else (if idx<19 then (if idx<18 then false else true) else (if idx<20 then true else false))) else (if idx<24 then (if idx<22 then true else (if idx<23 then true else false)) else (if idx<26 then (if idx<25 then false else true) else false))))
def machineB : DFA (Fin 28) := {
  step := fun q d => Fin.ofNat 28 ((rowB q.val)[d.val]!)
  start := 0
  final := fun q => finalB q.val
}
end CutPeriod.OptionData
