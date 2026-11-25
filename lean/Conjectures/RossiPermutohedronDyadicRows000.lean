module

public import Conjectures.RossiPermutohedronDyadicCertificate
public import Mathlib.Data.Fin.VecNotation

@[expose] public section
namespace RossiPermutohedron.FiniteData
open scoped Matrix

def row0 : List ℕ := [
  1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row0_eq : eulerRow 0=row0 := by
  rfl

def row1 : List ℕ := [
  1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row1_eq : eulerRow 1=row1 := by
  change eulerRow (0+1)=row1
  rw [eulerRow,row0_eq]
  all_goals rfl

def row2 : List ℕ := [
  1, 1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row2_eq : eulerRow 2=row2 := by
  change eulerRow (1+1)=row2
  rw [eulerRow,row1_eq]
  all_goals rfl

def row3 : List ℕ := [
  1, 4, 1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row3_eq : eulerRow 3=row3 := by
  change eulerRow (2+1)=row3
  rw [eulerRow,row2_eq]
  all_goals rfl

def denoms3 : Fin (1+1)→ℤ := ![
  1, 1
]
def numerators3 : Fin (1+1)→ℤ := ![
  -1, -23
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow3 : CheckedDyadicGridFromRow 1 row3 denoms3 numerators3 := by
  decide +kernel

theorem checkedGrid3 : CheckedDyadicGrid 1 denoms3 numerators3 :=
  checkedDyadicGrid_from_verified_row row3_eq signsFromRow3

def row4 : List ℕ := [
  1, 11, 11,
  1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row4_eq : eulerRow 4=row4 := by
  change eulerRow (3+1)=row4
  rw [eulerRow,row3_eq]
  all_goals rfl

def denoms4 : Fin (2+1)→ℤ := ![
  2, 1, 1
]
def numerators4 : Fin (2+1)→ℤ := ![
  -1, -3, -75
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow4 : CheckedDyadicGridFromRow 2 row4 denoms4 numerators4 := by
  decide +kernel

theorem checkedGrid4 : CheckedDyadicGrid 2 denoms4 numerators4 :=
  checkedDyadicGrid_from_verified_row row4_eq signsFromRow4

def row5 : List ℕ := [
  1, 26, 66,
  26, 1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row5_eq : eulerRow 5=row5 := by
  change eulerRow (4+1)=row5
  rw [eulerRow,row4_eq]
  all_goals rfl

def denoms5 : Fin (3+1)→ℤ := ![
  4, 1, 1, 1
]
def numerators5 : Fin (3+1)→ℤ := ![
  -1, -1, -6, -231
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow5 : CheckedDyadicGridFromRow 3 row5 denoms5 numerators5 := by
  decide +kernel

theorem checkedGrid5 : CheckedDyadicGrid 3 denoms5 numerators5 :=
  checkedDyadicGrid_from_verified_row row5_eq signsFromRow5

def row6 : List ℕ := [
  1, 57, 302,
  302, 57, 1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row6_eq : eulerRow 6=row6 := by
  change eulerRow (5+1)=row6
  rw [eulerRow,row5_eq]
  all_goals rfl

def denoms6 : Fin (4+1)→ℤ := ![
  8, 2, 1, 1, 1
]
def numerators6 : Fin (4+1)→ℤ := ![
  -1, -1, -2, -12, -681
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow6 : CheckedDyadicGridFromRow 4 row6 denoms6 numerators6 := by
  decide +kernel

theorem checkedGrid6 : CheckedDyadicGrid 4 denoms6 numerators6 :=
  checkedDyadicGrid_from_verified_row row6_eq signsFromRow6

def row7 : List ℕ := [
  1, 120, 1191,
  2416, 1191, 120,
  1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row7_eq : eulerRow 7=row7 := by
  change eulerRow (6+1)=row7
  rw [eulerRow,row6_eq]
  all_goals rfl

def denoms7 : Fin (5+1)→ℤ := ![
  16, 2, 1, 1, 1,
  1
]
def numerators7 : Fin (5+1)→ℤ := ![
  -1, -1, -1, -4, -23,
  -1967
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow7 : CheckedDyadicGridFromRow 5 row7 denoms7 numerators7 := by
  decide +kernel

theorem checkedGrid7 : CheckedDyadicGrid 5 denoms7 numerators7 :=
  checkedDyadicGrid_from_verified_row row7_eq signsFromRow7

def row8 : List ℕ := [
  1, 247, 4293,
  15619, 15619, 4293,
  247, 1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row8_eq : eulerRow 8=row8 := by
  change eulerRow (7+1)=row8
  rw [eulerRow,row7_eq]
  all_goals rfl

def denoms8 : Fin (6+1)→ℤ := ![
  32, 4, 1, 1, 1,
  1, 1
]
def numerators8 : Fin (6+1)→ℤ := ![
  -1, -1, -1, -2, -6,
  -42, -5605
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow8 : CheckedDyadicGridFromRow 6 row8 denoms8 numerators8 := by
  decide +kernel

theorem checkedGrid8 : CheckedDyadicGrid 6 denoms8 numerators8 :=
  checkedDyadicGrid_from_verified_row row8_eq signsFromRow8

def row9 : List ℕ := [
  1, 502, 14608,
  88234, 156190, 88234,
  14608, 502, 1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row9_eq : eulerRow 9=row9 := by
  change eulerRow (8+1)=row9
  rw [eulerRow,row8_eq]
  all_goals rfl

def denoms9 : Fin (7+1)→ℤ := ![
  64, 8, 2, 1, 1,
  1, 1, 1
]
def numerators9 : Fin (7+1)→ℤ := ![
  -1, -1, -1, -1, -3,
  -10, -75, -15817
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow9 : CheckedDyadicGridFromRow 7 row9 denoms9 numerators9 := by
  decide +kernel

theorem checkedGrid9 : CheckedDyadicGrid 7 denoms9 numerators9 :=
  checkedDyadicGrid_from_verified_row row9_eq signsFromRow9

def row10 : List ℕ := [
  1, 1013, 47840,
  455192, 1310354, 1310354,
  455192, 47840, 1013,
  1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row10_eq : eulerRow 10=row10 := by
  change eulerRow (9+1)=row10
  rw [eulerRow,row9_eq]
  all_goals rfl

def denoms10 : Fin (8+1)→ℤ := ![
  128, 8, 4, 2, 1,
  1, 1, 1, 1
]
def numerators10 : Fin (8+1)→ℤ := ![
  -1, -1, -1, -1, -2,
  -4, -15, -133, -44324
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow10 : CheckedDyadicGridFromRow 8 row10 denoms10 numerators10 := by
  decide +kernel

theorem checkedGrid10 : CheckedDyadicGrid 8 denoms10 numerators10 :=
  checkedDyadicGrid_from_verified_row row10_eq signsFromRow10

end RossiPermutohedron.FiniteData
