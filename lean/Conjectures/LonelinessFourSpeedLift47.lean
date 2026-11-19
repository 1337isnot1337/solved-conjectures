import Conjectures.LonelinessFourSpeedLiftSound
import Conjectures.LonelinessFourSpeedCertificate47
import Mathlib.Tactic.FinCases

/-! Complete folded binary-lift certificates for the retained supports modulo 47. -/

namespace Loneliness.Modular.FourSpeed.Lifts.Prime47

open FoldedSearch
set_option maxRecDepth 200000
set_option maxHeartbeats 0

def tree0 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 17 else .witness 25)) else (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 93 else .witness 45))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 47 else .witness 47)) else (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 23 else .witness 15))))) else .witness 7)) else (if b 2 then (if b 3 then .witness 23 else .allEven) else (if b 3 then .witness 17 else .witness 11))) else (if b 1 then (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 1 else .witness 1)) else (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 1 else .witness 1))) else (if b 1 then (if b 2 then (if b 3 then .witness 47 else .witness 47) else (if b 3 then .witness 49 else .witness 45)) else (if b 2 then (if b 3 then .witness 43 else .witness 47) else (if b 3 then .witness 49 else .witness 45))))) else .witness 35) else (if b 3 then .witness 41 else .witness 39)) else (if b 2 then (if b 3 then .witness 23 else .witness 29) else (if b 3 then .witness 21 else .terminal 1)))))

theorem tree0_checked : check 2 9 shortTerminal tree0 47 ![1,2,3,4]=true := by decide +kernel

def tree1 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .witness 9 else .witness 7)) else (if b 2 then (if b 3 then .witness 23 else .allEven) else (if b 3 then .witness 11 else .witness 15))) else (if b 1 then (if b 2 then (if b 3 then .witness 35 else .witness 39) else (if b 3 then .witness 45 else .witness 39)) else (if b 2 then (if b 3 then .witness 23 else .witness 27) else (if b 3 then .witness 21 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .witness 17 else .witness 15)) else (if b 2 then (if b 3 then .witness 47 else .terminal 281) else (if b 3 then .witness 21 else .witness 29))) else (if b 1 then (if b 2 then (if b 3 then .witness 69 else .witness 77) else (if b 3 then .witness 77 else .witness 77)) else (if b 2 then (if b 3 then .witness 47 else .witness 53) else (if b 3 then .witness 43 else .terminal 189))))))))))

theorem tree1_checked : check 2 9 shortTerminal tree1 47 ![1,2,3,8]=true := by decide +kernel

def tree2 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .witness 7 else .witness 11)) else (if b 2 then (if b 3 then .witness 23 else .allEven) else (if b 3 then .witness 15 else .witness 11))) else (if b 1 then (if b 2 then (if b 3 then .witness 37 else .witness 35) else (if b 3 then .witness 39 else .witness 41)) else (if b 2 then (if b 3 then .witness 23 else .witness 27) else (if b 3 then .witness 23 else .witness 21)))))

theorem tree2_checked : check 2 9 shortTerminal tree2 47 ![1,2,3,12]=true := by decide +kernel

def tree3 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .witness 9 else .witness 5)) else (if b 2 then (if b 3 then .witness 13 else .witness 15) else (if b 3 then .witness 11 else .allEven))) else (if b 1 then (if b 2 then (if b 3 then .witness 35 else .witness 43) else (if b 3 then .witness 35 else .witness 39)) else (if b 2 then (if b 3 then .witness 33 else .witness 27) else (if b 3 then .witness 21 else .witness 27)))))

theorem tree3_checked : check 2 9 shortTerminal tree3 47 ![1,2,6,8]=true := by decide +kernel

def tree4 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 1 else .witness 1)) else (if b 2 then (if b 3 then .witness 13 else .terminal 45) else (if b 3 then .allEven else .witness 11))) else (if b 1 then (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 13) else (if b 3 then .witness 17 else .witness 5)) else (if b 2 then (if b 3 then .witness 1 else .witness 45) else (if b 3 then .witness 47 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .witness 45 else .witness 45) else (if b 3 then .witness 47 else .witness 49)) else (if b 2 then (if b 3 then .witness 45 else .witness 45) else (if b 3 then .witness 47 else .witness 43))))) else .witness 35) else (if b 3 then .witness 37 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 45) else (if b 3 then .witness 47 else .witness 5)) else (if b 2 then (if b 3 then .witness 1 else .witness 19) else (if b 3 then .witness 15 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .witness 49 else .witness 45) else (if b 3 then .witness 47 else .witness 45)) else (if b 2 then (if b 3 then .witness 43 else .witness 43) else (if b 3 then .witness 47 else .witness 45))))))) else (if b 2 then (if b 3 then .witness 21 else .witness 31) else (if b 3 then .witness 33 else .witness 23)))))

theorem tree4_checked : check 2 9 shortTerminal tree4 47 ![1,2,22,23]=true := by decide +kernel

def tree5 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 5) else (if b 3 then .allEven else .witness 7)) else (if b 2 then (if b 3 then .witness 17 else .witness 23) else (if b 3 then .witness 15 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .witness 23 else .witness 23) else (if b 3 then .witness 33 else .witness 29)) else (if b 2 then (if b 3 then .witness 21 else .witness 23) else (if b 3 then .witness 39 else .terminal 189)))))

theorem tree5_checked : check 2 9 shortTerminal tree5 47 ![1,3,4,5]=true := by decide +kernel

def tree6 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .allEven else .witness 7)) else (if b 2 then (if b 3 then .witness 17 else .witness 17) else (if b 3 then .witness 11 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .witness 25 else .witness 23) else (if b 3 then .witness 29 else .witness 31)) else (if b 2 then (if b 3 then .witness 41 else .witness 21) else (if b 3 then .witness 39 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .terminal 657 else .witness 11)) else (if b 2 then (if b 3 then .witness 47 else .witness 35) else (if b 3 then .witness 21 else .witness 15))) else (if b 1 then (if b 2 then (if b 3 then .witness 47 else .witness 47) else (if b 3 then .witness 59 else .witness 61)) else (if b 2 then (if b 3 then .witness 47 else .witness 43) else (if b 3 then .witness 77 else .terminal 565))))))))))

theorem tree6_checked : check 2 9 shortTerminal tree6 47 ![1,3,4,7]=true := by decide +kernel

def tree7 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .allEven else .witness 7)) else (if b 2 then (if b 3 then .witness 19 else .witness 17) else (if b 3 then .witness 9 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .witness 23 else .witness 25) else (if b 3 then .witness 29 else .witness 29)) else (if b 2 then (if b 3 then .witness 21 else .witness 45) else (if b 3 then .witness 39 else .witness 39)))))

theorem tree7_checked : check 2 9 shortTerminal tree7 47 ![1,3,4,9]=true := by decide +kernel

def tree8 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .witness 7 else .allEven)) else (if b 2 then (if b 3 then .witness 17 else .witness 19) else (if b 3 then .witness 7 else .witness 11))) else (if b 1 then (if b 2 then (if b 3 then .witness 23 else .witness 27) else (if b 3 then .witness 31 else .witness 29)) else (if b 2 then (if b 3 then .witness 23 else .witness 21) else (if b 3 then .witness 39 else .witness 41)))))

theorem tree8_checked : check 2 9 shortTerminal tree8 47 ![1,3,4,12]=true := by decide +kernel

def tree9 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .witness 7 else .allEven)) else (if b 2 then (if b 3 then .witness 19 else .witness 17) else (if b 3 then .witness 7 else .witness 9))) else (if b 1 then (if b 2 then (if b 3 then .witness 25 else .witness 23) else (if b 3 then .witness 33 else .witness 29)) else (if b 2 then (if b 3 then .witness 21 else .witness 23) else (if b 3 then .witness 39 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .witness 11 else .witness 17)) else (if b 2 then (if b 3 then .witness 37 else .witness 35) else (if b 3 then .witness 15 else .witness 17))) else (if b 1 then (if b 2 then (if b 3 then .witness 51 else .witness 47) else (if b 3 then .witness 65 else .witness 59)) else (if b 2 then (if b 3 then .witness 43 else .witness 45) else (if b 3 then .witness 77 else .witness 77))))))))))

theorem tree9_checked : check 2 9 shortTerminal tree9 47 ![1,3,4,14]=true := by decide +kernel

def tree10 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .witness 7 else .allEven)) else (if b 2 then (if b 3 then .witness 17 else .witness 19) else (if b 3 then .witness 7 else .witness 9))) else (if b 1 then (if b 2 then (if b 3 then .witness 23 else .witness 25) else (if b 3 then .witness 29 else .witness 31)) else (if b 2 then (if b 3 then .witness 23 else .witness 21) else (if b 3 then .witness 41 else .witness 39)))))

theorem tree10_checked : check 2 9 shortTerminal tree10 47 ![1,3,4,16]=true := by decide +kernel

def tree11 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .allEven else .witness 7)) else (if b 2 then (if b 3 then .witness 19 else .witness 17) else (if b 3 then .witness 9 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .witness 25 else .witness 23) else (if b 3 then .witness 29 else .witness 31)) else (if b 2 then (if b 3 then .witness 21 else .witness 21) else (if b 3 then .witness 39 else .witness 41)))))

theorem tree11_checked : check 2 9 shortTerminal tree11 47 ![1,3,4,19]=true := by decide +kernel

def tree12 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .allEven else .witness 7)) else (if b 2 then (if b 3 then .witness 17 else .witness 19) else (if b 3 then .witness 9 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .witness 23 else .witness 25) else (if b 3 then .witness 31 else .witness 29)) else (if b 2 then (if b 3 then .witness 23 else .witness 21) else (if b 3 then .witness 41 else .witness 39)))))

theorem tree12_checked : check 2 9 shortTerminal tree12 47 ![1,3,4,21]=true := by decide +kernel

def tree13 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .allEven else .witness 3)) else (if b 2 then (if b 3 then .witness 9 else .witness 13) else (if b 3 then .witness 9 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .witness 23 else .witness 25) else (if b 3 then .witness 29 else .witness 27)) else (if b 2 then (if b 3 then .witness 21 else .witness 45) else (if b 3 then .witness 39 else .witness 39)))))

theorem tree13_checked : check 2 9 shortTerminal tree13 47 ![1,3,8,9]=true := by decide +kernel

def tree14 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .allEven) else (if b 3 then .witness 7 else .witness 3)) else (if b 2 then (if b 3 then .witness 9 else .witness 11) else (if b 3 then .witness 7 else .witness 13))) else (if b 1 then (if b 2 then (if b 3 then .witness 23 else .witness 29) else (if b 3 then .witness 25 else .witness 27)) else (if b 2 then (if b 3 then .witness 23 else .witness 21) else (if b 3 then .witness 39 else .witness 45)))))

theorem tree14_checked : check 2 9 shortTerminal tree14 47 ![1,3,9,12]=true := by decide +kernel

def tree15 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .allEven) else (if b 3 then .witness 5 else .witness 3)) else (if b 2 then (if b 3 then .witness 11 else .witness 9) else (if b 3 then .witness 7 else .witness 15))) else (if b 1 then (if b 2 then (if b 3 then .witness 23 else .witness 31) else (if b 3 then .witness 25 else .witness 25)) else (if b 2 then (if b 3 then .witness 23 else .witness 21) else (if b 3 then .witness 47 else .witness 39)))))

theorem tree15_checked : check 2 9 shortTerminal tree15 47 ![1,3,9,16]=true := by decide +kernel

def tree16 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .allEven) else (if b 3 then .witness 5 else .witness 3)) else (if b 2 then (if b 3 then .witness 9 else .witness 11) else (if b 3 then .witness 13 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .witness 23 else .witness 31) else (if b 3 then .witness 27 else .witness 25)) else (if b 2 then (if b 3 then .witness 23 else .witness 21) else (if b 3 then .witness 47 else .witness 39)))))

theorem tree16_checked : check 2 9 shortTerminal tree16 47 ![1,3,9,20]=true := by decide +kernel

def tree17 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .allEven) else (if b 3 then .witness 23 else .witness 3)) else (if b 2 then (if b 3 then .witness 7 else .witness 19) else (if b 3 then .witness 15 else .witness 11))) else (if b 1 then (if b 2 then (if b 3 then .witness 25 else .witness 27) else (if b 3 then .witness 23 else .witness 29)) else (if b 2 then (if b 3 then .witness 41 else .witness 41) else (if b 3 then .witness 23 else .witness 21)))))

theorem tree17_checked : check 2 9 shortTerminal tree17 47 ![1,3,11,12]=true := by decide +kernel

def tree18 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 25) else (if b 3 then .allEven else .witness 3)) else (if b 2 then (if b 3 then .witness 7 else .witness 9) else (if b 3 then .witness 13 else .witness 11))) else (if b 1 then (if b 2 then (if b 3 then .witness 23 else .witness 25) else (if b 3 then .witness 27 else .witness 27)) else (if b 2 then (if b 3 then .witness 23 else .witness 39) else (if b 3 then .witness 21 else .witness 41)))))

theorem tree18_checked : check 2 9 shortTerminal tree18 47 ![1,3,12,13]=true := by decide +kernel

def tree19 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .allEven) else (if b 3 then .witness 5 else .witness 3)) else (if b 2 then (if b 3 then .witness 7 else .witness 9) else (if b 3 then .witness 11 else .witness 9))) else (if b 1 then (if b 2 then (if b 3 then .witness 23 else .witness 27) else (if b 3 then .witness 25 else .witness 25)) else (if b 2 then (if b 3 then .witness 23 else .witness 21) else (if b 3 then .witness 41 else .witness 39)))))

theorem tree19_checked : check 2 9 shortTerminal tree19 47 ![1,3,13,16]=true := by decide +kernel

def tree20 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .allEven else .witness 3)) else (if b 2 then (if b 3 then .witness 7 else .witness 7) else (if b 3 then .witness 21 else .witness 9))) else (if b 1 then (if b 2 then (if b 3 then .witness 23 else .witness 25) else (if b 3 then .witness 27 else .witness 25)) else (if b 2 then (if b 3 then .witness 23 else .witness 41) else (if b 3 then .witness 21 else .witness 43)))))

theorem tree20_checked : check 2 9 shortTerminal tree20 47 ![1,3,16,17]=true := by decide +kernel

def tree21 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .allEven else .witness 3)) else (if b 2 then (if b 3 then .witness 13 else .witness 7) else (if b 3 then .witness 9 else .witness 15))) else (if b 1 then (if b 2 then (if b 3 then .witness 23 else .witness 25) else (if b 3 then .witness 27 else .witness 25)) else (if b 2 then (if b 3 then .witness 23 else .witness 47) else (if b 3 then .witness 45 else .witness 21)))))

theorem tree21_checked : check 2 9 shortTerminal tree21 47 ![1,3,16,21]=true := by decide +kernel

def tree22 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 5) else (if b 3 then .witness 9 else .witness 5)) else (if b 2 then (if b 3 then .witness 1 else .witness 33) else (if b 3 then .witness 37 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 5) else (if b 3 then .witness 47 else .witness 5)) else (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .witness 11 else .witness 3)))))) else (if b 3 then .allEven else .witness 3)) else (if b 2 then (if b 3 then .witness 9 else .witness 11) else (if b 3 then .witness 9 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .witness 25 else .witness 27) else (if b 3 then .witness 29 else .witness 23)) else (if b 2 then (if b 3 then .witness 21 else .witness 21) else (if b 3 then .witness 39 else .witness 23)))))

theorem tree22_checked : check 2 9 shortTerminal tree22 47 ![1,3,18,19]=true := by decide +kernel

def tree23 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .allEven else .witness 3)) else (if b 2 then (if b 3 then .witness 9 else .witness 15) else (if b 3 then .witness 13 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .witness 23 else .witness 29) else (if b 3 then .witness 27 else .witness 25)) else (if b 2 then (if b 3 then .witness 23 else .witness 43) else (if b 3 then .witness 41 else .witness 21)))))

theorem tree23_checked : check 2 9 shortTerminal tree23 47 ![1,3,20,21]=true := by decide +kernel

def tree24 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 5) else (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 131) else (if b 3 then .witness 1 else .witness 7)) else (if b 2 then (if b 3 then .witness 17 else .witness 25) else (if b 3 then .witness 39 else .witness 39))) else (if b 1 then (if b 2 then (if b 3 then .witness 29 else .witness 13) else (if b 3 then .witness 35 else .terminal 4567)) else (if b 2 then (if b 3 then .terminal 4645 else .witness 5) else (if b 3 then .witness 11 else .witness 3)))))) else (if b 3 then .witness 9 else .witness 17)) else (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 9) else (if b 3 then .witness 37 else .witness 17)) else (if b 2 then (if b 3 then .witness 15 else .witness 55) else (if b 3 then .witness 23 else .witness 23))) else (if b 1 then (if b 2 then (if b 3 then .terminal 4551 else .witness 11) else (if b 3 then .witness 27 else .witness 19)) else (if b 2 then (if b 3 then .witness 13 else .witness 3) else (if b 3 then .witness 21 else .terminal 4661))))) else .witness 25))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 31) else (if b 3 then .witness 23 else .witness 47)) else (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .witness 15 else .witness 11))))) else .witness 5)) else (if b 2 then (if b 3 then .witness 15 else .allEven) else (if b 3 then .witness 13 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 17) else (if b 3 then .witness 1 else .witness 21)) else (if b 2 then (if b 3 then .witness 1 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .witness 9 else .witness 25)) else (if b 2 then (if b 3 then .witness 29 else .witness 13) else (if b 3 then .witness 85 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .witness 9 else .terminal 20781)) else (if b 2 then (if b 3 then .terminal 14769 else .witness 15) else (if b 3 then .witness 11 else .witness 3)))))) else (if b 3 then .witness 1 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 9) else (if b 3 then .witness 9 else .witness 9)) else (if b 2 then (if b 3 then .witness 13 else .witness 101) else (if b 3 then .witness 27 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .terminal 14675 else .witness 87) else (if b 3 then .witness 105 else .witness 89)) else (if b 2 then (if b 3 then .witness 85 else .witness 101) else (if b 3 then .witness 85 else .terminal 20687))))) else .witness 49) else (if b 3 then .witness 47 else .witness 43)) else (if b 2 then (if b 3 then .witness 45 else .witness 63) else (if b 3 then .witness 47 else .witness 47))))) else .witness 21) else (if b 3 then .witness 27 else .witness 23)) else (if b 2 then (if b 3 then .witness 33 else .witness 35) else (if b 3 then .witness 29 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 17 else .witness 33)) else (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .terminal 7971 else .witness 45))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 47 else .witness 95)) else (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 31 else .witness 19))))) else .witness 9)) else (if b 2 then (if b 3 then .witness 29 else .terminal 1221) else (if b 3 then .witness 23 else .witness 11))) else (if b 1 then (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 1 else .witness 1)) else (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 1 else .witness 1))) else (if b 1 then (if b 2 then (if b 3 then .terminal 7915 else .witness 93) else (if b 3 then .witness 95 else .witness 87)) else (if b 2 then (if b 3 then .witness 85 else .witness 93) else (if b 3 then .witness 95 else .witness 95))))) else .witness 43) else (if b 3 then .witness 55 else .witness 47)) else (if b 2 then (if b 3 then .witness 65 else .witness 71) else (if b 3 then .witness 59 else .terminal 1129))))))))))

theorem tree24_checked : check 2 9 shortTerminal tree24 47 ![1,4,5,6]=true := by decide +kernel

def tree25 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .witness 23 else .witness 5)) else (if b 2 then (if b 3 then .allEven else .witness 15) else (if b 3 then .witness 9 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .witness 21 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 5) else (if b 3 then .witness 1 else .witness 47)) else (if b 2 then (if b 3 then .witness 1 else .witness 37) else (if b 3 then .witness 1 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .witness 57 else .witness 49) else (if b 3 then .witness 43 else .witness 47)) else (if b 2 then (if b 3 then .witness 45 else .witness 71) else (if b 3 then .witness 47 else .witness 47)))))) else (if b 3 then .witness 23 else .witness 25)) else (if b 2 then (if b 3 then .witness 33 else .witness 35) else (if b 3 then .witness 29 else .witness 29)))))

theorem tree25_checked : check 2 9 shortTerminal tree25 47 ![1,4,5,9]=true := by decide +kernel

def tree26 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 1) else (if b 3 then .witness 1 else .witness 1)) else (if b 2 then (if b 3 then .witness 9 else .allEven) else (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 81) else (if b 3 then .witness 13 else .witness 3)) else (if b 2 then (if b 3 then .witness 17 else .witness 17) else (if b 3 then .witness 13 else .witness 13))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 11) else (if b 3 then .witness 39 else .witness 3)) else (if b 2 then (if b 3 then .terminal 4937 else .witness 11) else (if b 3 then .witness 15 else .witness 11))))) else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 13) else (if b 3 then .witness 9 else .witness 5)) else (if b 2 then (if b 3 then .witness 1 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .terminal 12867 else .witness 7)) else (if b 2 then (if b 3 then .witness 29 else .witness 5) else (if b 3 then .witness 3 else .witness 37))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .witness 19 else .witness 7)) else (if b 2 then (if b 3 then .witness 11 else .witness 5) else (if b 3 then .witness 3 else .terminal 12889)))))) else (if b 3 then .witness 45 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .witness 15 else .witness 7)) else (if b 2 then (if b 3 then .witness 5 else .witness 83) else (if b 3 then .terminal 12961 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .witness 87 else .witness 89) else (if b 3 then .witness 87 else .terminal 12795)) else (if b 2 then (if b 3 then .witness 93 else .witness 101) else (if b 3 then .witness 113 else .witness 85))))) else .witness 43) else (if b 3 then .witness 47 else .witness 47)) else (if b 2 then (if b 3 then .witness 45 else .witness 71) else (if b 3 then .witness 45 else .witness 47))))) else .witness 23) else (if b 3 then .witness 21 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 47) else (if b 3 then .witness 49 else .witness 5)) else (if b 2 then (if b 3 then .witness 1 else .witness 11) else (if b 3 then .witness 15 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .witness 43 else .witness 47) else (if b 3 then .witness 49 else .witness 47)) else (if b 2 then (if b 3 then .witness 45 else .witness 45) else (if b 3 then .witness 51 else .witness 47))))))) else (if b 2 then (if b 3 then .witness 31 else .witness 31) else (if b 3 then .witness 29 else .witness 33)))))

theorem tree26_checked : check 2 9 shortTerminal tree26 47 ![1,4,21,22]=true := by decide +kernel

def tree27 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .allEven else .witness 5)) else (if b 2 then (if b 3 then .witness 13 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 9) else (if b 3 then .witness 3 else .terminal 2123)) else (if b 2 then (if b 3 then .terminal 2107 else .witness 9) else (if b 3 then .witness 21 else .witness 17))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 47) else (if b 3 then .witness 3 else .witness 7)) else (if b 2 then (if b 3 then .witness 23 else .witness 15) else (if b 3 then .witness 47 else .witness 11)))))) else (if b 3 then .witness 11 else .witness 5))) else (if b 1 then (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 13) else (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 9) else (if b 3 then .witness 7 else .witness 179)) else (if b 2 then (if b 3 then .witness 85 else .witness 9) else (if b 3 then .witness 33 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 9) else (if b 3 then .witness 7 else .witness 23)) else (if b 2 then (if b 3 then .witness 19 else .witness 9) else (if b 3 then .terminal 11005 else .witness 3))))) else .witness 17)) else (if b 2 then (if b 3 then .witness 1 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .witness 9 else .witness 25)) else (if b 2 then (if b 3 then .witness 21 else .witness 13) else (if b 3 then .witness 101 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .witness 9 else .terminal 11741)) else (if b 2 then (if b 3 then .witness 87 else .witness 15) else (if b 3 then .witness 11 else .witness 3)))))) else (if b 3 then .witness 15 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 9) else (if b 3 then .witness 103 else .witness 9)) else (if b 2 then (if b 3 then .witness 27 else .witness 9) else (if b 3 then .witness 19 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .witness 85 else .witness 87) else (if b 3 then .witness 103 else .witness 87)) else (if b 2 then (if b 3 then .witness 85 else .witness 113) else (if b 3 then .witness 89 else .terminal 10911))))) else .witness 45) else (if b 3 then .witness 53 else .witness 49)) else (if b 2 then (if b 3 then .witness 47 else .witness 55) else (if b 3 then .witness 43 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .witness 7 else .witness 7)) else (if b 2 then (if b 3 then .witness 11 else .witness 101) else (if b 3 then .witness 21 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .witness 181 else .witness 91) else (if b 3 then .witness 105 else .witness 89)) else (if b 2 then (if b 3 then .witness 85 else .witness 101) else (if b 3 then .witness 85 else .terminal 11665)))))))))) else .witness 33) else (if b 3 then .witness 37 else .witness 21)) else (if b 2 then (if b 3 then .witness 27 else .witness 31) else (if b 3 then .witness 25 else .witness 23)))))

theorem tree27_checked : check 2 9 shortTerminal tree27 47 ![1,5,6,7]=true := by decide +kernel

def tree28 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .allEven else .witness 5)) else (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 9) else (if b 3 then .terminal 1747 else .witness 3)) else (if b 2 then (if b 3 then .witness 9 else .witness 9) else (if b 3 then .witness 17 else .witness 17))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 55) else (if b 3 then .witness 9 else .witness 17)) else (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .witness 23 else .witness 39))) else (if b 1 then (if b 2 then (if b 3 then .witness 13 else .witness 13) else (if b 3 then .witness 39 else .witness 5)) else (if b 2 then (if b 3 then .terminal 15171 else .witness 27) else (if b 3 then .witness 11 else .witness 3)))))) else (if b 3 then .witness 31 else .witness 3)) else (if b 2 then (if b 3 then .witness 15 else .witness 19) else (if b 3 then .witness 11 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .terminal 15077 else .witness 7)) else (if b 2 then (if b 3 then .witness 39 else .witness 17) else (if b 3 then .witness 23 else .witness 25))) else (if b 1 then (if b 2 then (if b 3 then .witness 11 else .witness 55) else (if b 3 then .witness 13 else .witness 3)) else (if b 2 then (if b 3 then .witness 19 else .witness 27) else (if b 3 then .witness 21 else .witness 39)))))))))) else .witness 13) else (if b 3 then .witness 7 else .witness 5))) else (if b 1 then (if b 2 then (if b 3 then .witness 33 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 5) else (if b 3 then .witness 17 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 9) else (if b 3 then .witness 7 else .witness 13)) else (if b 2 then (if b 3 then .witness 9 else .witness 9) else (if b 3 then .witness 3 else .witness 25))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 9) else (if b 3 then .witness 7 else .witness 15)) else (if b 2 then (if b 3 then .witness 9 else .witness 9) else (if b 3 then .witness 3 else .terminal 20405))))))) else (if b 2 then (if b 3 then .witness 1 else .witness 47) else (if b 3 then .witness 3 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 7) else (if b 3 then .witness 9 else .witness 101)) else (if b 2 then (if b 3 then .witness 9 else .witness 69) else (if b 3 then .witness 5 else .witness 3))) else (if b 1 then (if b 2 then (if b 3 then .witness 85 else .witness 85) else (if b 3 then .witness 87 else .witness 101)) else (if b 2 then (if b 3 then .witness 85 else .witness 85) else (if b 3 then .terminal 20311 else .witness 89))))) else .witness 45) else (if b 3 then .witness 49 else .witness 57)) else (if b 2 then (if b 3 then .witness 47 else .witness 47) else (if b 3 then .terminal 5273 else .witness 43)))))) else (if b 3 then .witness 35 else .witness 21)) else (if b 2 then (if b 3 then .witness 27 else .witness 29) else (if b 3 then .witness 25 else .witness 23)))))

theorem tree28_checked : check 2 9 shortTerminal tree28 47 ![1,5,6,11]=true := by decide +kernel

def tree29 : Tree 4 := .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .terminal 2483) else (if b 3 then .witness 33 else .witness 9)) else (if b 2 then (if b 3 then .witness 21 else .witness 3) else (if b 3 then .witness 17 else .terminal 2499))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 31) else (if b 3 then .witness 87 else .witness 15)) else (if b 2 then (if b 3 then .witness 7 else .witness 3) else (if b 3 then .witness 7 else .witness 7))))) else .witness 3)) else (if b 2 then (if b 3 then .allEven else .witness 11) else (if b 3 then .witness 7 else .witness 5))) else (if b 1 then (if b 2 then (if b 3 then .witness 27 else .witness 27) else (if b 3 then .witness 35 else .witness 31)) else (if b 2 then (if b 3 then .witness 27 else .witness 25) else (if b 3 then .witness 21 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 5) else (if b 3 then .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .terminal 17375) else (if b 3 then .witness 13 else .witness 17)) else (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .witness 33 else .terminal 15523))) else (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 39) else (if b 3 then .terminal 17405 else .witness 31)) else (if b 2 then (if b 3 then .witness 1 else .witness 3) else (if b 3 then .witness 15 else .witness 15))))) else .witness 7)) else (if b 2 then (if b 3 then .witness 47 else .witness 7) else (if b 3 then .witness 11 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .witness 55 else .branch (fun b => (if b 0 then (if b 1 then (if b 2 then (if b 3 then .witness 1 else .witness 9) else (if b 3 then .witness 1 else .terminal 17469)) else (if b 2 then (if b 3 then .witness 1 else .witness 95) else (if b 3 then .witness 1 else .witness 7))) else (if b 1 then (if b 2 then (if b 3 then .terminal 17311 else .witness 95) else (if b 3 then .witness 85 else .witness 107)) else (if b 2 then (if b 3 then .witness 87 else .witness 95) else (if b 3 then .terminal 15429 else .witness 97)))))) else (if b 3 then .witness 61 else .witness 63)) else (if b 2 then (if b 3 then .witness 47 else .witness 47) else (if b 3 then .witness 43 else .witness 47))))))))))

theorem tree29_checked : check 2 9 shortTerminal tree29 47 ![1,6,7,13]=true := by decide +kernel

def root : Fin 30 → (Fin 4 → ℕ) :=
  ![![1,2,3,4],
    ![1,2,3,8],
    ![1,2,3,12],
    ![1,2,6,8],
    ![1,2,22,23],
    ![1,3,4,5],
    ![1,3,4,7],
    ![1,3,4,9],
    ![1,3,4,12],
    ![1,3,4,14],
    ![1,3,4,16],
    ![1,3,4,19],
    ![1,3,4,21],
    ![1,3,8,9],
    ![1,3,9,12],
    ![1,3,9,16],
    ![1,3,9,20],
    ![1,3,11,12],
    ![1,3,12,13],
    ![1,3,13,16],
    ![1,3,16,17],
    ![1,3,16,21],
    ![1,3,18,19],
    ![1,3,20,21],
    ![1,4,5,6],
    ![1,4,5,9],
    ![1,4,21,22],
    ![1,5,6,7],
    ![1,5,6,11],
    ![1,6,7,13]]

def tree : Fin 30 → Tree 4 :=
  ![tree0,tree1,tree2,tree3,tree4,tree5,tree6,tree7,tree8,tree9,tree10,tree11,tree12,tree13,tree14,tree15,tree16,tree17,tree18,tree19,tree20,tree21,tree22,tree23,tree24,tree25,tree26,tree27,tree28,tree29]

theorem all_checked (i : Fin 30) :
    check 2 9 shortTerminal (tree i) 47 (root i)=true := by
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

theorem roots_injective : ∀ i : Fin 30, Function.Injective (root i) := by decide +kernel

theorem retained_eq : FourSpeed.Prime47.retained=
    Finset.univ.image (fun i => (List.ofFn (root i)).toFinset) := by decide +kernel

end Loneliness.Modular.FourSpeed.Lifts.Prime47
