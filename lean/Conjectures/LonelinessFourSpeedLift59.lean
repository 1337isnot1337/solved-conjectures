import Conjectures.LonelinessFourSpeedLiftSound
import Conjectures.LonelinessFourSpeedCertificate59
import Mathlib.Tactic.FinCases

/-! Complete folded binary-lift certificates for the retained supports modulo 59. -/

namespace Loneliness.Modular.FourSpeed.Lifts.Prime59

open FoldedSearch
set_option maxRecDepth 200000
set_option maxHeartbeats 0

def tree0 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 21 else .witness 29)) else (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 61 else .witness 57))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 59 else .witness 59)) else (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 31 else .witness 19))))) else .witness 9)) else (if b 2 then (if b 3 then .witness 29 else .allEven) else (if b 3 then .witness 23 else .witness 15))) else (if b 1 then (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 1 else .witness 1)) else (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 1 else .witness 1))) else (if b 1 then (if b 2 then (if b 3 then .witness 59 else .witness 59) else (if b 3 then .witness 61 else .witness 53)) else (if b 2 then (if b 3 then .witness 55 else .witness 59) else (if b 3 then .witness 61 else .witness 57))))) else .witness 43) else (if b 3 then .witness 51 else .witness 49)) else (if b 2 then (if b 3 then .witness 29 else .witness 37) else (if b 3 then .witness 27 else .terminal 1)))))

theorem tree0_checked : check 2 9 shortTerminal tree0 59 ![1,2,3,4]=true := by decide +kernel

def tree1 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 5) else (if b 3 then .witness 11 else .witness 9)) else (if b 2 then (if b 3 then .witness 29 else .allEven) else (if b 3 then .witness 15 else .witness 19))) else (if b 1 then (if b 2 then (if b 3 then .witness 43 else .witness 49) else (if b 3 then .witness 55 else .witness 49)) else (if b 2 then (if b 3 then .witness 29 else .witness 33) else (if b 3 then .witness 27 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .witness 23 else .witness 19)) else (if b 2 then (if b 3 then .witness 57 else .terminal 353) else (if b 3 then .witness 27 else .witness 37))) else (if b 1 then (if b 2 then (if b 3 then .witness 87 else .witness 97) else (if b 3 then .witness 111 else .witness 97)) else (if b 2 then (if b 3 then .witness 57 else .witness 67) else (if b 3 then .witness 53 else .terminal 237))))))))))

theorem tree1_checked : check 2 9 shortTerminal tree1 59 ![1,2,3,8]=true := by decide +kernel

def tree2 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .witness 9 else .witness 13)) else (if b 2 then (if b 3 then .witness 29 else .allEven) else (if b 3 then .witness 17 else .witness 15))) else (if b 1 then (if b 2 then (if b 3 then .witness 47 else .witness 43) else (if b 3 then .witness 49 else .witness 53)) else (if b 2 then (if b 3 then .witness 29 else .witness 33) else (if b 3 then .witness 27 else .witness 27)))))

theorem tree2_checked : check 2 9 shortTerminal tree2 59 ![1,2,3,12]=true := by decide +kernel

def tree3 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .witness 9 else .witness 11)) else (if b 2 then (if b 3 then .witness 29 else .allEven) else (if b 3 then .witness 15 else .witness 17))) else (if b 1 then (if b 2 then (if b 3 then .witness 43 else .witness 47) else (if b 3 then .witness 51 else .witness 49)) else (if b 2 then (if b 3 then .witness 29 else .witness 33) else (if b 3 then .witness 29 else .witness 27)))))

theorem tree3_checked : check 2 9 shortTerminal tree3 59 ![1,2,3,16]=true := by decide +kernel

def tree4 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 1 else .witness 1)) else (if b 2 then (if b 3 then .witness 17 else .terminal 57) else (if b 3 then .allEven else .witness 15))) else (if b 1 then (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 21) else (if b 3 then .witness 17 else .witness 3)) else (if b 2 then (if b 3 then .witness 1 else .witness 59) else (if b 3 then .witness 55 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .witness 53 else .witness 53) else (if b 3 then .witness 57 else .witness 57)) else (if b 2 then (if b 3 then .witness 55 else .witness 59) else (if b 3 then .witness 55 else .witness 57))))) else .witness 43) else (if b 3 then .witness 45 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 59) else (if b 3 then .witness 57 else .witness 3)) else (if b 2 then (if b 3 then .witness 1 else .witness 19) else (if b 3 then .witness 23 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .witness 57 else .witness 59) else (if b 3 then .witness 57 else .witness 53)) else (if b 2 then (if b 3 then .witness 57 else .witness 59) else (if b 3 then .witness 55 else .witness 55))))))) else (if b 2 then (if b 3 then .witness 29 else .witness 39) else (if b 3 then .witness 41 else .witness 27)))))

theorem tree4_checked : check 2 9 shortTerminal tree4 59 ![1,2,28,29]=true := by decide +kernel

def tree5 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .allEven else .witness 7)) else (if b 2 then (if b 3 then .witness 23 else .witness 29) else (if b 3 then .witness 19 else .witness 9))) else (if b 1 then (if b 2 then (if b 3 then .witness 29 else .witness 29) else (if b 3 then .witness 41 else .witness 37)) else (if b 2 then (if b 3 then .witness 27 else .witness 29) else (if b 3 then .witness 49 else .terminal 237)))))

theorem tree5_checked : check 2 9 shortTerminal tree5 59 ![1,3,4,5]=true := by decide +kernel

def tree6 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 5) else (if b 3 then .allEven else .witness 7)) else (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 17) else (if b 3 then .witness 1 else .witness 3)) else (if b 2 then (if b 3 then .witness 117 else .witness 21) else (if b 3 then .witness 33 else .witness 29))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 75) else (if b 3 then .witness 17 else .witness 25)) else (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .witness 47 else .terminal 19869))) else (if b 1 then (if b 2 then (if b 3 then .witness 29 else .witness 13) else (if b 3 then .witness 189 else .witness 3)) else (if b 2 then (if b 3 then .terminal 26473 else .witness 43) else (if b 3 then .witness 11 else .witness 3)))))) else (if b 3 then .witness 1 else .witness 3)) else (if b 2 then (if b 3 then .witness 31 else .witness 35) else (if b 3 then .witness 19 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .terminal 26509 else .witness 15)) else (if b 2 then (if b 3 then .witness 71 else .witness 41) else (if b 3 then .witness 47 else .witness 39))) else (if b 1 then (if b 2 then (if b 3 then .witness 19 else .witness 43) else (if b 3 then .witness 11 else .witness 3)) else (if b 2 then (if b 3 then .witness 35 else .witness 43) else (if b 3 then .witness 37 else .terminal 19987)))))))))) else .witness 23) else (if b 3 then .witness 13 else .witness 9))) else (if b 1 then (if b 2 then (if b 3 then .witness 31 else .witness 29) else (if b 3 then .witness 37 else .witness 39)) else (if b 2 then (if b 3 then .witness 51 else .witness 27) else (if b 3 then .witness 49 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 9) else (if b 3 then .terminal 825 else .witness 15)) else (if b 2 then (if b 3 then .witness 43 else .witness 43) else (if b 3 then .witness 25 else .witness 19))) else (if b 1 then (if b 2 then (if b 3 then .witness 59 else .witness 57) else (if b 3 then .witness 73 else .witness 75)) else (if b 2 then (if b 3 then .witness 59 else .witness 53) else (if b 3 then .witness 97 else .terminal 709))))))))))

theorem tree6_checked : check 2 9 shortTerminal tree6 59 ![1,3,4,7]=true := by decide +kernel

def tree7 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .allEven else .witness 7)) else (if b 2 then (if b 3 then .witness 23 else .witness 23) else (if b 3 then .witness 11 else .witness 9))) else (if b 1 then (if b 2 then (if b 3 then .witness 29 else .witness 31) else (if b 3 then .witness 37 else .witness 43)) else (if b 2 then (if b 3 then .witness 27 else .witness 57) else (if b 3 then .witness 49 else .witness 49)))))

theorem tree7_checked : check 2 9 shortTerminal tree7 59 ![1,3,4,9]=true := by decide +kernel

def tree8 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .witness 7 else .allEven)) else (if b 2 then (if b 3 then .witness 23 else .witness 23) else (if b 3 then .witness 9 else .witness 11))) else (if b 1 then (if b 2 then (if b 3 then .witness 33 else .witness 29) else (if b 3 then .witness 41 else .witness 37)) else (if b 2 then (if b 3 then .witness 27 else .witness 29) else (if b 3 then .witness 49 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 5) else (if b 3 then .witness 15 else .witness 21)) else (if b 2 then (if b 3 then .witness 47 else .witness 43) else (if b 3 then .witness 19 else .witness 21))) else (if b 1 then (if b 2 then (if b 3 then .witness 63 else .witness 57) else (if b 3 then .witness 81 else .witness 73)) else (if b 2 then (if b 3 then .witness 53 else .witness 55) else (if b 3 then .witness 97 else .witness 97))))))))))

theorem tree8_checked : check 2 9 shortTerminal tree8 59 ![1,3,4,14]=true := by decide +kernel

def tree9 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .witness 7 else .allEven)) else (if b 2 then (if b 3 then .witness 23 else .witness 25) else (if b 3 then .witness 9 else .witness 11))) else (if b 1 then (if b 2 then (if b 3 then .witness 29 else .witness 33) else (if b 3 then .witness 37 else .witness 39)) else (if b 2 then (if b 3 then .witness 29 else .witness 27) else (if b 3 then .witness 51 else .witness 49)))))

theorem tree9_checked : check 2 9 shortTerminal tree9 59 ![1,3,4,16]=true := by decide +kernel

def tree10 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .allEven) else (if b 3 then .witness 29 else .witness 5)) else (if b 2 then (if b 3 then .witness 13 else .witness 19) else (if b 3 then .witness 11 else .witness 9))) else (if b 1 then (if b 2 then (if b 3 then .witness 31 else .witness 33) else (if b 3 then .witness 29 else .witness 39)) else (if b 2 then (if b 3 then .witness 55 else .witness 49) else (if b 3 then .witness 27 else .witness 55)))))

theorem tree10_checked : check 2 9 shortTerminal tree10 59 ![1,3,7,8]=true := by decide +kernel

def tree11 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .allEven else .witness 5)) else (if b 2 then (if b 3 then .witness 11 else .witness 17) else (if b 3 then .witness 11 else .witness 9))) else (if b 1 then (if b 2 then (if b 3 then .witness 29 else .witness 31) else (if b 3 then .witness 37 else .witness 33)) else (if b 2 then (if b 3 then .witness 27 else .witness 57) else (if b 3 then .witness 49 else .witness 49)))))

theorem tree11_checked : check 2 9 shortTerminal tree11 59 ![1,3,8,9]=true := by decide +kernel

def tree12 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .allEven) else (if b 3 then .witness 29 else .witness 3)) else (if b 2 then (if b 3 then .witness 9 else .witness 13) else (if b 3 then .witness 17 else .witness 15))) else (if b 1 then (if b 2 then (if b 3 then .witness 31 else .witness 33) else (if b 3 then .witness 29 else .witness 35)) else (if b 2 then (if b 3 then .witness 51 else .witness 53) else (if b 3 then .witness 27 else .witness 27)))))

theorem tree12_checked : check 2 9 shortTerminal tree12 59 ![1,3,11,12]=true := by decide +kernel

def tree13 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .allEven) else (if b 3 then .witness 7 else .witness 3)) else (if b 2 then (if b 3 then .witness 9 else .witness 11) else (if b 3 then .witness 15 else .witness 17))) else (if b 1 then (if b 2 then (if b 3 then .witness 31 else .witness 33) else (if b 3 then .witness 29 else .witness 35)) else (if b 2 then (if b 3 then .witness 51 else .witness 55) else (if b 3 then .witness 29 else .witness 27)))))

theorem tree13_checked : check 2 9 shortTerminal tree13 59 ![1,3,11,16]=true := by decide +kernel

def tree14 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .allEven) else (if b 3 then .witness 5 else .witness 3)) else (if b 2 then (if b 3 then .witness 9 else .witness 11) else (if b 3 then .witness 17 else .witness 15))) else (if b 1 then (if b 2 then (if b 3 then .witness 31 else .witness 33) else (if b 3 then .witness 37 else .witness 29)) else (if b 2 then (if b 3 then .witness 51 else .witness 51) else (if b 3 then .witness 27 else .witness 29)))))

theorem tree14_checked : check 2 9 shortTerminal tree14 59 ![1,3,11,26]=true := by decide +kernel

def tree15 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .allEven) else (if b 3 then .witness 7 else .witness 3)) else (if b 2 then (if b 3 then .witness 9 else .witness 11) else (if b 3 then .witness 13 else .witness 13))) else (if b 1 then (if b 2 then (if b 3 then .witness 29 else .witness 35) else (if b 3 then .witness 31 else .witness 33)) else (if b 2 then (if b 3 then .witness 29 else .witness 27) else (if b 3 then .witness 51 else .witness 49)))))

theorem tree15_checked : check 2 9 shortTerminal tree15 59 ![1,3,13,16]=true := by decide +kernel

def tree16 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .allEven) else (if b 3 then .witness 29 else .witness 3)) else (if b 2 then (if b 3 then .witness 9 else .witness 17) else (if b 3 then .witness 13 else .witness 11))) else (if b 1 then (if b 2 then (if b 3 then .witness 31 else .witness 33) else (if b 3 then .witness 29 else .witness 35)) else (if b 2 then (if b 3 then .witness 53 else .witness 49) else (if b 3 then .witness 29 else .witness 27)))))

theorem tree16_checked : check 2 9 shortTerminal tree16 59 ![1,3,15,16]=true := by decide +kernel

def tree17 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 9) else (if b 3 then .allEven else .witness 3)) else (if b 2 then (if b 3 then .witness 13 else .witness 9) else (if b 3 then .witness 13 else .witness 11))) else (if b 1 then (if b 2 then (if b 3 then .witness 29 else .witness 31) else (if b 3 then .witness 33 else .witness 33)) else (if b 2 then (if b 3 then .witness 29 else .witness 51) else (if b 3 then .witness 27 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 17) else (if b 3 then .witness 11 else .witness 5)) else (if b 2 then (if b 3 then .witness 27 else .witness 31) else (if b 3 then .witness 25 else .witness 19))) else (if b 1 then (if b 2 then (if b 3 then .witness 57 else .witness 59) else (if b 3 then .witness 67 else .witness 63)) else (if b 2 then (if b 3 then .witness 55 else .witness 59) else (if b 3 then .witness 53 else .witness 107))))))))))

theorem tree17_checked : check 2 9 shortTerminal tree17 59 ![1,3,16,17]=true := by decide +kernel

def tree18 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .allEven) else (if b 3 then .witness 5 else .witness 3)) else (if b 2 then (if b 3 then .witness 13 else .witness 15) else (if b 3 then .witness 11 else .witness 9))) else (if b 1 then (if b 2 then (if b 3 then .witness 29 else .witness 33) else (if b 3 then .witness 31 else .witness 31)) else (if b 2 then (if b 3 then .witness 29 else .witness 27) else (if b 3 then .witness 53 else .witness 51)))))

theorem tree18_checked : check 2 9 shortTerminal tree18 59 ![1,3,17,20]=true := by decide +kernel

def tree19 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .allEven else .witness 3)) else (if b 2 then (if b 3 then .witness 11 else .witness 13) else (if b 3 then .witness 21 else .witness 9))) else (if b 1 then (if b 2 then (if b 3 then .witness 29 else .witness 31) else (if b 3 then .witness 33 else .witness 31)) else (if b 2 then (if b 3 then .witness 29 else .witness 53) else (if b 3 then .witness 27 else .witness 49)))))

theorem tree19_checked : check 2 9 shortTerminal tree19 59 ![1,3,20,21]=true := by decide +kernel

def tree20 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .allEven) else (if b 3 then .witness 9 else .witness 3)) else (if b 2 then (if b 3 then .witness 9 else .witness 11) else (if b 3 then .witness 9 else .witness 17))) else (if b 1 then (if b 2 then (if b 3 then .witness 31 else .witness 35) else (if b 3 then .witness 33 else .witness 29)) else (if b 2 then (if b 3 then .witness 27 else .witness 51) else (if b 3 then .witness 27 else .witness 29)))))

theorem tree20_checked : check 2 9 shortTerminal tree20 59 ![1,3,23,26]=true := by decide +kernel

def tree21 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 5) else (if b 3 then .witness 9 else .witness 5)) else (if b 2 then (if b 3 then .witness 1 else .witness 41) else (if b 3 then .witness 45 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 5) else (if b 3 then .witness 59 else .witness 5)) else (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .witness 11 else .witness 3)))))) else (if b 3 then .allEven else .witness 3)) else (if b 2 then (if b 3 then .witness 9 else .witness 11) else (if b 3 then .witness 13 else .witness 11))) else (if b 1 then (if b 2 then (if b 3 then .witness 29 else .witness 35) else (if b 3 then .witness 33 else .witness 31)) else (if b 2 then (if b 3 then .witness 29 else .witness 49) else (if b 3 then .witness 51 else .witness 27)))))

theorem tree21_checked : check 2 9 shortTerminal tree21 59 ![1,3,24,25]=true := by decide +kernel

def tree22 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .allEven else .witness 3)) else (if b 2 then (if b 3 then .witness 9 else .witness 19) else (if b 3 then .witness 17 else .witness 11))) else (if b 1 then (if b 2 then (if b 3 then .witness 31 else .witness 33) else (if b 3 then .witness 35 else .witness 29)) else (if b 2 then (if b 3 then .witness 27 else .witness 51) else (if b 3 then .witness 53 else .witness 29)))))

theorem tree22_checked : check 2 9 shortTerminal tree22 59 ![1,3,26,27]=true := by decide +kernel

def tree23 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 5) else (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 13 else .witness 21)) else (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .terminal 3587 else .witness 29))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 31 else .witness 59)) else (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 19 else .witness 11))))) else .witness 7)) else (if b 2 then (if b 3 then .witness 19 else .allEven) else (if b 3 then .witness 15 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 1 else .witness 1)) else (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 1 else .witness 1))) else (if b 1 then (if b 2 then (if b 3 then .witness 117 else .witness 61) else (if b 3 then .witness 59 else .witness 55)) else (if b 2 then (if b 3 then .witness 53 else .witness 79) else (if b 3 then .witness 59 else .witness 59))))) else .witness 27) else (if b 3 then .witness 35 else .witness 29)) else (if b 2 then (if b 3 then .witness 41 else .witness 45) else (if b 3 then .witness 37 else .terminal 709)))))

theorem tree23_checked : check 2 9 shortTerminal tree23 59 ![1,4,5,6]=true := by decide +kernel

def tree24 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .witness 29 else .witness 7)) else (if b 2 then (if b 3 then .allEven else .witness 19) else (if b 3 then .witness 11 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .witness 27 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 9) else (if b 3 then .witness 1 else .witness 59)) else (if b 2 then (if b 3 then .witness 1 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .terminal 23235) else (if b 3 then .witness 41 else .witness 17)) else (if b 2 then (if b 3 then .witness 13 else .witness 13) else (if b 3 then .witness 3 else .witness 13))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 15) else (if b 3 then .terminal 9101 else .witness 19)) else (if b 2 then (if b 3 then .witness 13 else .witness 13) else (if b 3 then .witness 3 else .witness 13)))))) else (if b 3 then .witness 1 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 13 else .witness 105)) else (if b 2 then (if b 3 then .witness 13 else .witness 131) else (if b 3 then .witness 5 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .terminal 23139 else .witness 105) else (if b 3 then .witness 105 else .witness 105)) else (if b 2 then (if b 3 then .witness 109 else .witness 131) else (if b 3 then .terminal 8983 else .witness 107))))) else .witness 61) else (if b 3 then .witness 55 else .witness 59)) else (if b 2 then (if b 3 then .witness 53 else .witness 71) else (if b 3 then .terminal 2373 else .witness 59)))))) else (if b 3 then .witness 29 else .witness 31)) else (if b 2 then (if b 3 then .witness 41 else .witness 43) else (if b 3 then .witness 37 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .witness 59 else .witness 11)) else (if b 2 then (if b 3 then .terminal 1769 else .witness 35) else (if b 3 then .witness 19 else .witness 15))) else (if b 1 then (if b 2 then (if b 3 then .witness 53 else .witness 59) else (if b 3 then .witness 59 else .witness 59)) else (if b 2 then (if b 3 then .witness 83 else .witness 85) else (if b 3 then .witness 73 else .terminal 1653))))))))))

theorem tree24_checked : check 2 9 shortTerminal tree24 59 ![1,4,5,9]=true := by decide +kernel

def tree25 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 1 else .witness 1)) else (if b 2 then (if b 3 then .witness 9 else .allEven) else (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 9) else (if b 3 then .witness 17 else .witness 9)) else (if b 2 then (if b 3 then .witness 1 else .witness 57) else (if b 3 then .witness 61 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .witness 57 else .witness 5) else (if b 3 then .witness 3 else .witness 175)) else (if b 2 then (if b 3 then .witness 11 else .witness 11) else (if b 3 then .witness 3 else .witness 19)))))) else (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 53) else (if b 3 then .terminal 10891 else .witness 9)) else (if b 2 then (if b 3 then .witness 1 else .witness 15) else (if b 3 then .witness 23 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .witness 21 else .witness 3) else (if b 3 then .witness 5 else .witness 13)) else (if b 2 then (if b 3 then .witness 175 else .witness 3) else (if b 3 then .witness 11 else .witness 57))))) else .witness 3)) else (if b 2 then (if b 3 then .witness 17 else .witness 17) else (if b 3 then .witness 21 else .witness 21))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 11) else (if b 3 then .witness 15 else .witness 3)) else (if b 2 then (if b 3 then .terminal 6193 else .witness 19) else (if b 3 then .witness 15 else .terminal 6197))))) else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 13) else (if b 3 then .witness 17 else .witness 5)) else (if b 2 then (if b 3 then .witness 1 else .witness 57) else (if b 3 then .witness 63 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .witness 59 else .witness 59) else (if b 3 then .witness 55 else .witness 55)) else (if b 2 then (if b 3 then .witness 53 else .witness 57) else (if b 3 then .witness 63 else .witness 57))))) else .witness 27) else (if b 3 then .witness 29 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 61) else (if b 3 then .witness 59 else .witness 5)) else (if b 2 then (if b 3 then .witness 1 else .witness 11) else (if b 3 then .witness 15 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .witness 59 else .witness 61) else (if b 3 then .witness 59 else .witness 55)) else (if b 2 then (if b 3 then .terminal 8745 else .witness 53) else (if b 3 then .witness 57 else .witness 57))))))) else (if b 2 then (if b 3 then .witness 39 else .witness 39) else (if b 3 then .witness 37 else .witness 41)))))

theorem tree25_checked : check 2 9 shortTerminal tree25 59 ![1,4,27,28]=true := by decide +kernel

def tree26 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 5) else (if b 3 then .allEven else .witness 5)) else (if b 2 then (if b 3 then .witness 15 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 9) else (if b 3 then .witness 1 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 17) else (if b 3 then .witness 49 else .witness 33)) else (if b 2 then (if b 3 then .witness 1 else .witness 47) else (if b 3 then .witness 15 else .witness 15))) else (if b 1 then (if b 2 then (if b 3 then .witness 51 else .witness 29) else (if b 3 then .witness 5 else .witness 21)) else (if b 2 then (if b 3 then .witness 11 else .witness 19) else (if b 3 then .witness 3 else .witness 49))))))) else (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 9 else .terminal 18459)) else (if b 2 then (if b 3 then .witness 165 else .witness 23) else (if b 3 then .witness 25 else .witness 31))) else (if b 1 then (if b 2 then (if b 3 then .witness 13 else .terminal 8071) else (if b 3 then .witness 5 else .witness 3)) else (if b 2 then (if b 3 then .witness 21 else .witness 35) else (if b 3 then .witness 67 else .witness 27))))) else .witness 13) else (if b 3 then .witness 25 else .witness 21))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 59) else (if b 3 then .witness 1 else .witness 11)) else (if b 2 then (if b 3 then .witness 27 else .witness 19) else (if b 3 then .terminal 3353 else .witness 11)))))) else (if b 3 then .witness 13 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 17) else (if b 3 then .witness 1 else .witness 21)) else (if b 2 then (if b 3 then .witness 1 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .witness 9 else .witness 25)) else (if b 2 then (if b 3 then .witness 29 else .witness 13) else (if b 3 then .witness 11 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .witness 9 else .terminal 21349)) else (if b 2 then (if b 3 then .witness 107 else .witness 13) else (if b 3 then .witness 11 else .witness 3)))))) else (if b 3 then .witness 1 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .witness 117 else .witness 53) else (if b 3 then .witness 69 else .witness 61)) else (if b 2 then (if b 3 then .witness 59 else .witness 67) else (if b 3 then .witness 55 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .witness 11 else .witness 33)) else (if b 2 then (if b 3 then .witness 11 else .witness 125) else (if b 3 then .witness 11 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .witness 107 else .witness 105) else (if b 3 then .witness 129 else .witness 113)) else (if b 2 then (if b 3 then .witness 107 else .witness 125) else (if b 3 then .witness 109 else .terminal 21249)))))))))) else .witness 41) else (if b 3 then .witness 47 else .witness 27)) else (if b 2 then (if b 3 then .witness 35 else .witness 39) else (if b 3 then .witness 31 else .witness 29)))))

theorem tree26_checked : check 2 9 shortTerminal tree26 59 ![1,5,6,7]=true := by decide +kernel

def tree27 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .allEven else .witness 5)) else (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 13) else (if b 3 then .witness 1 else .witness 3)) else (if b 2 then (if b 3 then .witness 117 else .witness 13) else (if b 3 then .witness 21 else .witness 21))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .terminal 3137) else (if b 3 then .witness 1 else .witness 3)) else (if b 2 then (if b 3 then .witness 19 else .witness 23) else (if b 3 then .witness 11 else .witness 11))))) else .witness 15) else (if b 3 then .witness 9 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .witness 41 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 5) else (if b 3 then .witness 1 else .terminal 8131)) else (if b 2 then (if b 3 then .witness 1 else .witness 59) else (if b 3 then .witness 1 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .terminal 8035 else .witness 53) else (if b 3 then .witness 61 else .witness 79)) else (if b 2 then (if b 3 then .witness 59 else .witness 59) else (if b 3 then .witness 59 else .witness 55)))))) else (if b 3 then .witness 45 else .witness 27)) else (if b 2 then (if b 3 then .witness 35 else .witness 35) else (if b 3 then .witness 31 else .witness 29)))))

theorem tree27_checked : check 2 9 shortTerminal tree27 59 ![1,5,6,11]=true := by decide +kernel

def tree28 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .allEven) else (if b 3 then .witness 21 else .witness 3)) else (if b 2 then (if b 3 then .witness 11 else .witness 7) else (if b 3 then .witness 9 else .witness 11))) else (if b 1 then (if b 2 then (if b 3 then .witness 43 else .witness 43) else (if b 3 then .witness 29 else .witness 27)) else (if b 2 then (if b 3 then .witness 55 else .witness 31) else (if b 3 then .witness 29 else .witness 33)))))

theorem tree28_checked : check 2 9 shortTerminal tree28 59 ![1,5,19,24]=true := by decide +kernel

def tree29 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 19) else (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .terminal 8311) else (if b 3 then .witness 9 else .witness 17)) else (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .terminal 8327 else .witness 21))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 31) else (if b 3 then .witness 19 else .witness 59)) else (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .witness 15 else .witness 11))))) else .witness 5)) else (if b 2 then (if b 3 then .witness 13 else .allEven) else (if b 3 then .witness 11 else .witness 5))) else (if b 1 then (if b 2 then (if b 3 then .witness 55 else .witness 35) else (if b 3 then .witness 41 else .witness 39)) else (if b 2 then (if b 3 then .witness 31 else .witness 33) else (if b 3 then .witness 27 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 17 else .witness 29)) else (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 117 else .witness 41))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 39 else .witness 119)) else (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 31 else .witness 15))))) else .witness 9)) else (if b 2 then (if b 3 then .witness 25 else .witness 9) else (if b 3 then .witness 23 else .witness 9))) else (if b 1 then (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 1 else .witness 1)) else (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 1 else .witness 1))) else (if b 1 then (if b 2 then (if b 3 then .witness 119 else .witness 119) else (if b 3 then .witness 117 else .witness 105)) else (if b 2 then (if b 3 then .witness 107 else .witness 119) else (if b 3 then .witness 117 else .terminal 9457))))) else .witness 69) else (if b 3 then .witness 81 else .witness 75)) else (if b 2 then (if b 3 then .witness 59 else .witness 67) else (if b 3 then .witness 53 else .terminal 2125))))))))))

theorem tree29_checked : check 2 9 shortTerminal tree29 59 ![1,6,7,8]=true := by decide +kernel

def tree30 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 17 else .witness 3)) else (if b 2 then (if b 3 then .witness 5 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 29) else (if b 3 then .witness 9 else .witness 3)) else (if b 2 then (if b 3 then .witness 9 else .witness 13) else (if b 3 then .witness 9 else .witness 109))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .terminal 6905) else (if b 3 then .terminal 6901 else .witness 3)) else (if b 2 then (if b 3 then .witness 27 else .witness 15) else (if b 3 then .witness 11 else .witness 11)))))) else (if b 3 then .allEven else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 13) else (if b 3 then .witness 9 else .witness 5)) else (if b 2 then (if b 3 then .witness 1 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .witness 29 else .witness 7)) else (if b 2 then (if b 3 then .witness 11 else .witness 5) else (if b 3 then .witness 3 else .witness 65))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .witness 43 else .witness 7)) else (if b 2 then (if b 3 then .witness 11 else .witness 5) else (if b 3 then .witness 3 else .witness 225)))))) else (if b 3 then .witness 59 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .terminal 7091 else .witness 57) else (if b 3 then .witness 53 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 125) else (if b 3 then .witness 89 else .witness 7)) else (if b 2 then (if b 3 then .witness 3 else .witness 11) else (if b 3 then .witness 11 else .witness 5))) else (if b 1 then (if b 2 then (if b 3 then .witness 115 else .witness 125) else (if b 3 then .witness 107 else .witness 107)) else (if b 2 then (if b 3 then .terminal 25495 else .witness 111) else (if b 3 then .witness 105 else .witness 107))))))) else (if b 2 then (if b 3 then .witness 59 else .witness 77) else (if b 3 then .witness 59 else .witness 55))))) else .witness 37) else (if b 3 then .witness 35 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 9) else (if b 3 then .witness 13 else .witness 7)) else (if b 2 then (if b 3 then .terminal 19483 else .witness 5) else (if b 3 then .witness 3 else .witness 9))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 9) else (if b 3 then .witness 13 else .witness 7)) else (if b 2 then (if b 3 then .witness 31 else .witness 5) else (if b 3 then .witness 3 else .witness 9)))))) else (if b 3 then .witness 59 else .witness 5)) else (if b 2 then (if b 3 then .witness 1 else .witness 11) else (if b 3 then .witness 7 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .witness 53 else .witness 75) else (if b 3 then .witness 59 else .witness 57)) else (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 9) else (if b 3 then .witness 9 else .witness 7)) else (if b 2 then (if b 3 then .witness 5 else .witness 87) else (if b 3 then .witness 109 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .terminal 19365 else .witness 107) else (if b 3 then .witness 105 else .witness 105)) else (if b 2 then (if b 3 then .witness 109 else .witness 127) else (if b 3 then .witness 109 else .witness 111))))) else .witness 55) else (if b 3 then .witness 59 else .terminal 6617))))))) else (if b 2 then (if b 3 then .witness 27 else .witness 33) else (if b 3 then .witness 47 else .witness 29)))))

theorem tree30_checked : check 2 9 shortTerminal tree30 59 ![1,6,26,27]=true := by decide +kernel

def tree31 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .allEven else .witness 19)) else (if b 2 then (if b 3 then .witness 11 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 9) else (if b 3 then .witness 3 else .terminal 8547)) else (if b 2 then (if b 3 then .terminal 8563 else .witness 9) else (if b 3 then .witness 21 else .witness 17))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 59) else (if b 3 then .witness 3 else .witness 7)) else (if b 2 then (if b 3 then .witness 19 else .witness 15) else (if b 3 then .witness 59 else .witness 11)))))) else (if b 3 then .witness 11 else .witness 5))) else (if b 1 then (if b 2 then (if b 3 then .witness 55 else .witness 31) else (if b 3 then .witness 37 else .witness 33)) else (if b 2 then (if b 3 then .witness 27 else .witness 43) else (if b 3 then .witness 39 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .witness 7 else .witness 7)) else (if b 2 then (if b 3 then .witness 23 else .witness 59) else (if b 3 then .witness 19 else .witness 9))) else (if b 1 then (if b 2 then (if b 3 then .witness 59 else .witness 59) else (if b 3 then .witness 73 else .witness 67)) else (if b 2 then (if b 3 then .witness 53 else .witness 59) else (if b 3 then .witness 75 else .terminal 2597))))))))))

theorem tree31_checked : check 2 9 shortTerminal tree31 59 ![1,7,8,9]=true := by decide +kernel

def tree32 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .witness 19 else .allEven)) else (if b 2 then (if b 3 then .witness 13 else .witness 11) else (if b 3 then .witness 5 else .witness 5))) else (if b 1 then (if b 2 then (if b 3 then .witness 31 else .witness 31) else (if b 3 then .witness 33 else .witness 35)) else (if b 2 then (if b 3 then .witness 27 else .witness 29) else (if b 3 then .witness 39 else .witness 55)))))

theorem tree32_checked : check 2 9 shortTerminal tree32 59 ![1,7,8,18]=true := by decide +kernel

def tree33 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 13) else (if b 3 then .allEven else .witness 3)) else (if b 2 then (if b 3 then .witness 9 else .witness 7) else (if b 3 then .witness 5 else .witness 13))) else (if b 1 then (if b 2 then (if b 3 then .witness 31 else .witness 53) else (if b 3 then .witness 35 else .witness 33)) else (if b 2 then (if b 3 then .witness 45 else .witness 29) else (if b 3 then .witness 27 else .witness 27)))))

theorem tree33_checked : check 2 9 shortTerminal tree33 59 ![1,7,16,23]=true := by decide +kernel

def tree34 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 15) else (if b 3 then .witness 13 else .witness 3)) else (if b 2 then (if b 3 then .witness 5 else .allEven) else (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 9) else (if b 3 then .witness 17 else .witness 9)) else (if b 2 then (if b 3 then .witness 1 else .terminal 18923) else (if b 3 then .witness 57 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .witness 61 else .witness 5) else (if b 3 then .witness 13 else .terminal 27447)) else (if b 2 then (if b 3 then .witness 11 else .witness 11) else (if b 3 then .witness 3 else .witness 19)))))) else (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .terminal 19041) else (if b 3 then .witness 61 else .witness 9)) else (if b 2 then (if b 3 then .witness 1 else .witness 15) else (if b 3 then .witness 7 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .witness 5 else .witness 35) else (if b 3 then .witness 5 else .witness 13)) else (if b 2 then (if b 3 then .terminal 27423 else .witness 3) else (if b 3 then .witness 11 else .witness 29))))) else .witness 3)) else (if b 2 then (if b 3 then .witness 9 else .witness 9) else (if b 3 then .witness 13 else .witness 41))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 27) else (if b 3 then .witness 7 else .witness 3)) else (if b 2 then (if b 3 then .witness 7 else .witness 11) else (if b 3 then .witness 7 else .witness 111))))) else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .witness 33 else .witness 29) else (if b 3 then .witness 27 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 59) else (if b 3 then .witness 45 else .witness 5)) else (if b 2 then (if b 3 then .witness 7 else .witness 7) else (if b 3 then .witness 7 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .witness 55 else .witness 59) else (if b 3 then .witness 73 else .witness 59)) else (if b 2 then (if b 3 then .witness 73 else .witness 57) else (if b 3 then .witness 53 else .terminal 7561))))))) else (if b 2 then (if b 3 then .witness 33 else .witness 33) else (if b 3 then .witness 49 else .witness 35)))))

theorem tree34_checked : check 2 9 shortTerminal tree34 59 ![1,8,25,26]=true := by decide +kernel

def root : Fin 35 → (Fin 4 → ℕ) :=
  ![![1,2,3,4],
    ![1,2,3,8],
    ![1,2,3,12],
    ![1,2,3,16],
    ![1,2,28,29],
    ![1,3,4,5],
    ![1,3,4,7],
    ![1,3,4,9],
    ![1,3,4,14],
    ![1,3,4,16],
    ![1,3,7,8],
    ![1,3,8,9],
    ![1,3,11,12],
    ![1,3,11,16],
    ![1,3,11,26],
    ![1,3,13,16],
    ![1,3,15,16],
    ![1,3,16,17],
    ![1,3,17,20],
    ![1,3,20,21],
    ![1,3,23,26],
    ![1,3,24,25],
    ![1,3,26,27],
    ![1,4,5,6],
    ![1,4,5,9],
    ![1,4,27,28],
    ![1,5,6,7],
    ![1,5,6,11],
    ![1,5,19,24],
    ![1,6,7,8],
    ![1,6,26,27],
    ![1,7,8,9],
    ![1,7,8,18],
    ![1,7,16,23],
    ![1,8,25,26]]

def tree : Fin 35 → Tree 4 :=
  ![tree0,tree1,tree2,tree3,tree4,tree5,tree6,tree7,tree8,tree9,tree10,tree11,tree12,tree13,tree14,tree15,tree16,tree17,tree18,tree19,tree20,tree21,tree22,tree23,tree24,tree25,tree26,tree27,tree28,tree29,tree30,tree31,tree32,tree33,tree34]

theorem all_checked (i : Fin 35) :
    check 2 9 shortTerminal (tree i) 59 (root i)=true := by
  fin_cases i
  · exact tree0_checked
  · exact tree1_checked
  · exact tree2_checked
  · exact tree3_checked
  · exact tree4_checked
  · exact tree5_checked
  · exact tree6_checked
  · exact tree7_checked
  · exact tree8_checked
  · exact tree9_checked
  · exact tree10_checked
  · exact tree11_checked
  · exact tree12_checked
  · exact tree13_checked
  · exact tree14_checked
  · exact tree15_checked
  · exact tree16_checked
  · exact tree17_checked
  · exact tree18_checked
  · exact tree19_checked
  · exact tree20_checked
  · exact tree21_checked
  · exact tree22_checked
  · exact tree23_checked
  · exact tree24_checked
  · exact tree25_checked
  · exact tree26_checked
  · exact tree27_checked
  · exact tree28_checked
  · exact tree29_checked
  · exact tree30_checked
  · exact tree31_checked
  · exact tree32_checked
  · exact tree33_checked
  · exact tree34_checked

theorem roots_injective : ∀ i : Fin 35, Function.Injective (root i) := by decide +kernel

theorem retained_eq : FourSpeed.Prime59.retained=
    Finset.univ.image (fun i => (List.ofFn (root i)).toFinset) := by decide +kernel

end Loneliness.Modular.FourSpeed.Lifts.Prime59
