module

public import Conjectures.RossiPermutohedronDyadicCertificate
public import Mathlib.Data.Fin.VecNotation
public import Conjectures.RossiPermutohedronDyadicRows000

@[expose] public section
namespace RossiPermutohedron.FiniteData
open scoped Matrix

def row11 : List ℕ := [
  1, 2036, 152637,
  2203488, 9738114, 15724248,
  9738114, 2203488, 152637,
  2036, 1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row11_eq : eulerRow 11=row11 := by
  change eulerRow (10+1)=row11
  rw [eulerRow,row10_eq]
  all_goals rfl

def denoms11 : Fin (9+1)→ℤ := ![
  128, 16, 4, 2, 1,
  1, 1, 1, 1, 1
]
def numerators11 : Fin (9+1)→ℤ := ![
  -1, -1, -1, -1, -1,
  -2, -6, -23, -231, -123573
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow11 : CheckedDyadicGridFromRow 9 row11 denoms11 numerators11 := by
  decide +kernel

theorem checkedGrid11 : CheckedDyadicGrid 9 denoms11 numerators11 :=
  checkedDyadicGrid_from_verified_row row11_eq signsFromRow11

def row12 : List ℕ := [
  1, 4083, 478271,
  10187685, 66318474, 162512286,
  162512286, 66318474, 10187685,
  478271, 4083, 1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row12_eq : eulerRow 12=row12 := by
  change eulerRow (11+1)=row12
  rw [eulerRow,row11_eq]
  all_goals rfl

def denoms12 : Fin (10+1)→ℤ := ![
  256, 32, 8, 4, 1,
  2, 1, 1, 1, 1,
  1
]
def numerators12 : Fin (10+1)→ℤ := ![
  -1, -1, -1, -1, -1,
  -3, -3, -9, -35, -398,
  -343157
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow12 : CheckedDyadicGridFromRow 10 row12 denoms12 numerators12 := by
  decide +kernel

theorem checkedGrid12 : CheckedDyadicGrid 10 denoms12 numerators12 :=
  checkedDyadicGrid_from_verified_row row12_eq signsFromRow12

def row13 : List ℕ := [
  1, 8178, 1479726,
  45533450, 423281535, 1505621508,
  2275172004, 1505621508, 423281535,
  45533450, 1479726, 8178,
  1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row13_eq : eulerRow 13=row13 := by
  change eulerRow (12+1)=row13
  rw [eulerRow,row12_eq]
  all_goals rfl

def denoms13 : Fin (11+1)→ℤ := ![
  512, 32, 8, 4, 2,
  1, 1, 1, 1, 1,
  1, 1
]
def numerators13 : Fin (11+1)→ℤ := ![
  -1, -1, -1, -1, -1,
  -1, -2, -5, -12, -51,
  -681, -950000
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow13 : CheckedDyadicGridFromRow 11 row13 denoms13 numerators13 := by
  decide +kernel

theorem checkedGrid13 : CheckedDyadicGrid 11 denoms13 numerators13 :=
  checkedDyadicGrid_from_verified_row row13_eq signsFromRow13

def row14 : List ℕ := [
  1, 16369, 4537314,
  198410786, 2571742175, 12843262863,
  27971176092, 27971176092, 12843262863,
  2571742175, 198410786, 4537314,
  16369, 1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row14_eq : eulerRow 14=row14 := by
  change eulerRow (13+1)=row14
  rw [eulerRow,row13_eq]
  all_goals rfl

def denoms14 : Fin (12+1)→ℤ := ![
  1024, 64, 16, 8, 2,
  4, 2, 1, 1, 1,
  1, 1, 1
]
def numerators14 : Fin (12+1)→ℤ := ![
  -1, -1, -1, -1, -1,
  -3, -3, -3, -6, -17,
  -75, -1160, -2623530
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow14 : CheckedDyadicGridFromRow 12 row14 denoms14 numerators14 := by
  decide +kernel

theorem checkedGrid14 : CheckedDyadicGrid 12 denoms14 numerators14 :=
  checkedDyadicGrid_from_verified_row row14_eq signsFromRow14

def row15 : List ℕ := [
  1, 32752, 13824739,
  848090912, 15041229521, 102776998928,
  311387598411, 447538817472, 311387598411,
  102776998928, 15041229521, 848090912,
  13824739, 32752, 1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row15_eq : eulerRow 15=row15 := by
  change eulerRow (14+1)=row15
  rw [eulerRow,row14_eq]
  all_goals rfl

def denoms15 : Fin (13+1)→ℤ := ![
  1024, 64, 16, 8, 4,
  2, 1, 1, 1, 1,
  1, 1, 1, 1
]
def numerators15 : Fin (13+1)→ℤ := ![
  -1, -1, -1, -1, -1,
  -1, -1, -2, -4, -8,
  -23, -110, -1967, -7230746
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow15 : CheckedDyadicGridFromRow 13 row15 denoms15 numerators15 := by
  decide +kernel

theorem checkedGrid15 : CheckedDyadicGrid 13 denoms15 numerators15 :=
  checkedDyadicGrid_from_verified_row row15_eq signsFromRow15

def row16 : List ℕ := [
  1, 65519, 41932745,
  3572085255, 85383238549, 782115518299,
  3207483178157, 6382798925475, 6382798925475,
  3207483178157, 782115518299, 85383238549,
  3572085255, 41932745, 65519,
  1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row16_eq : eulerRow 16=row16 := by
  change eulerRow (15+1)=row16
  rw [eulerRow,row15_eq]
  all_goals rfl

def denoms16 : Fin (14+1)→ℤ := ![
  2048, 128, 32, 8, 4,
  2, 1, 2, 1, 1,
  1, 1, 1, 1, 1
]
def numerators16 : Fin (14+1)→ℤ := ![
  -1, -1, -1, -1, -1,
  -1, -1, -3, -2, -5,
  -11, -31, -160, -3326, -19896140
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow16 : CheckedDyadicGridFromRow 14 row16 denoms16 numerators16 := by
  decide +kernel

theorem checkedGrid16 : CheckedDyadicGrid 14 denoms16 numerators16 :=
  checkedDyadicGrid_from_verified_row row16_eq signsFromRow16

def row17 : List ℕ := [
  1, 131054, 126781020,
  14875399450, 473353301060, 5717291972382,
  31055652948388, 83137223185370, 114890380658550,
  83137223185370, 31055652948388, 5717291972382,
  473353301060, 14875399450, 126781020,
  131054, 1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row17_eq : eulerRow 17=row17 := by
  change eulerRow (16+1)=row17
  rw [eulerRow,row16_eq]
  all_goals rfl

def denoms17 : Fin (15+1)→ℤ := ![
  4096, 128, 32, 16, 8,
  4, 2, 1, 1, 1,
  1, 1, 1, 1, 1,
  1
]
def numerators17 : Fin (15+1)→ℤ := ![
  -1, -1, -1, -1, -1,
  -1, -1, -1, -2, -3,
  -6, -14, -42, -231, -5605,
  -54671729
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow17 : CheckedDyadicGridFromRow 15 row17 denoms17 numerators17 := by
  decide +kernel

theorem checkedGrid17 : CheckedDyadicGrid 15 denoms17 numerators17 :=
  checkedDyadicGrid_from_verified_row row17_eq signsFromRow17

def row18 : List ℕ := [
  1, 262125, 382439924,
  61403313100, 2575022097600, 40457344748072,
  285997074307300, 1006709967915228, 1865385657780650,
  1865385657780650, 1006709967915228, 285997074307300,
  40457344748072, 2575022097600, 61403313100,
  382439924, 262125, 1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row18_eq : eulerRow 18=row18 := by
  change eulerRow (17+1)=row18
  rw [eulerRow,row17_eq]
  all_goals rfl

def denoms18 : Fin (16+1)→ℤ := ![
  8192, 256, 32, 16, 8,
  4, 2, 4, 2, 1,
  1, 1, 1, 1, 1,
  1, 1
]
def numerators18 : Fin (16+1)→ℤ := ![
  -1, -1, -1, -1, -1,
  -1, -1, -3, -3, -2,
  -4, -8, -18, -57, -332,
  -9425, -150058028
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow18 : CheckedDyadicGridFromRow 16 row18 denoms18 numerators18 := by
  decide +kernel

theorem checkedGrid18 : CheckedDyadicGrid 16 denoms18 numerators18 :=
  checkedDyadicGrid_from_verified_row row18_eq signsFromRow18

def row19 : List ℕ := [
  1, 524268, 1151775897,
  251732291184, 13796160184500, 278794377854832,
  2527925001876036, 11485644635009424, 27862280567093358,
  37307713155613000, 27862280567093358, 11485644635009424,
  2527925001876036, 278794377854832, 13796160184500,
  251732291184, 1151775897, 524268,
  1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row19_eq : eulerRow 19=row19 := by
  change eulerRow (18+1)=row19
  rw [eulerRow,row18_eq]
  all_goals rfl

def denoms19 : Fin (17+1)→ℤ := ![
  8192, 256, 64, 16, 8,
  4, 8, 2, 1, 1,
  1, 1, 1, 1, 1,
  1, 1, 1
]
def numerators19 : Fin (17+1)→ℤ := ![
  -1, -1, -1, -1, -1,
  -1, -3, -1, -1, -2,
  -3, -5, -10, -23, -75,
  -476, -15817, -411465352
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow19 : CheckedDyadicGridFromRow 17 row19 denoms19 numerators19 := by
  decide +kernel

theorem checkedGrid19 : CheckedDyadicGrid 17 denoms19 numerators19 :=
  checkedDyadicGrid_from_verified_row row19_eq signsFromRow19

def row20 : List ℕ := [
  1, 1048555, 3464764515,
  1026509354985, 73008517581444, 1879708669896492,
  21598596303099900, 124748182104463860, 388588260723953310,
  679562217794156938, 679562217794156938, 388588260723953310,
  124748182104463860, 21598596303099900, 1879708669896492,
  73008517581444, 1026509354985, 3464764515,
  1048555, 1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row20_eq : eulerRow 20=row20 := by
  change eulerRow (19+1)=row20
  rw [eulerRow,row19_eq]
  all_goals rfl

def denoms20 : Fin (18+1)→ℤ := ![
  16384, 512, 64, 32, 16,
  8, 4, 2, 1, 2,
  1, 1, 1, 1, 1,
  1, 1, 1, 1
]
def numerators20 : Fin (18+1)→ℤ := ![
  -1, -1, -1, -1, -1,
  -1, -1, -1, -1, -3,
  -2, -3, -6, -12, -30,
  -100, -681, -26497, -1127315946
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow20 : CheckedDyadicGridFromRow 18 row20 denoms20 numerators20 := by
  decide +kernel

theorem checkedGrid20 : CheckedDyadicGrid 18 denoms20 numerators20 :=
  checkedDyadicGrid_from_verified_row row20_eq signsFromRow20

def row21 : List ℕ := [
  1, 2097130, 10414216090,
  4168403181210, 382493246941965, 12446388300682056,
  179385804170146680, 1300365805079109480, 5119020713873609970,
  11458681306629009100, 14950368791471452636, 11458681306629009100,
  5119020713873609970, 1300365805079109480, 179385804170146680,
  12446388300682056, 382493246941965, 4168403181210,
  10414216090, 2097130, 1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row21_eq : eulerRow 21=row21 := by
  change eulerRow (20+1)=row21
  rw [eulerRow,row20_eq]
  all_goals rfl

def denoms21 : Fin (19+1)→ℤ := ![
  32768, 512, 128, 32, 16,
  8, 4, 2, 4, 1,
  2, 1, 1, 1, 1,
  1, 1, 1, 1, 1
]
def numerators21 : Fin (19+1)→ℤ := ![
  -1, -1, -1, -1, -1,
  -1, -1, -1, -3, -1,
  -3, -3, -4, -8, -15,
  -38, -133, -972, -44324, -3086355718
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow21 : CheckedDyadicGridFromRow 19 row21 denoms21 numerators21 := by
  decide +kernel

theorem checkedGrid21 : CheckedDyadicGrid 19 denoms21 numerators21 :=
  checkedDyadicGrid_from_verified_row row21_eq signsFromRow21

def row22 : List ℕ := [
  1, 4194281, 31284590870,
  16871482830550, 1987497491971605, 81180715002105741,
  1454842842001939656, 13093713503185076040, 64276307695970022450,
  181134082346647020610, 301958232385734088196, 301958232385734088196,
  181134082346647020610, 64276307695970022450, 13093713503185076040,
  1454842842001939656, 81180715002105741, 1987497491971605,
  16871482830550, 31284590870, 4194281,
  1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row22_eq : eulerRow 22=row22 := by
  change eulerRow (21+1)=row22
  rw [eulerRow,row21_eq]
  all_goals rfl

def denoms22 : Fin (20+1)→ℤ := ![
  65536, 1024, 128, 32, 16,
  8, 4, 8, 2, 4,
  4, 1, 1, 1, 1,
  1, 1, 1, 1, 1,
  1
]
def numerators22 : Fin (20+1)→ℤ := ![
  -1, -1, -1, -1, -1,
  -1, -1, -3, -1, -3,
  -5, -2, -3, -5, -9,
  -19, -48, -175, -1384, -74050,
  -8444524052
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow22 : CheckedDyadicGridFromRow 20 row22 denoms22 numerators22 := by
  decide +kernel

theorem checkedGrid22 : CheckedDyadicGrid 20 denoms22 numerators22 :=
  checkedDyadicGrid_from_verified_row row22_eq signsFromRow22

def row23 : List ℕ := [
  1, 8388584, 93941852511,
  68111623139600, 10258045633638475, 522859244868123336,
  11563972049049375189, 128027193497511642816, 774892471811506342650,
  2711209131210050520400, 5676283626749486238086, 7246997577257618116704,
  5676283626749486238086, 2711209131210050520400, 774892471811506342650,
  128027193497511642816, 11563972049049375189, 522859244868123336,
  10258045633638475, 68111623139600, 93941852511,
  8388584, 1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row23_eq : eulerRow 23=row23 := by
  change eulerRow (22+1)=row23
  rw [eulerRow,row22_eq]
  all_goals rfl

def denoms23 : Fin (21+1)→ℤ := ![
  65536, 1024, 128, 64, 16,
  32, 16, 4, 2, 4,
  1, 2, 1, 1, 1,
  1, 1, 1, 1, 1,
  1, 1
]
def numerators23 : Fin (21+1)→ℤ := ![
  -1, -1, -1, -1, -1,
  -3, -3, -1, -1, -3,
  -1, -3, -2, -4, -6,
  -11, -23, -60, -231, -1967,
  -123573, -23092305852
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow23 : CheckedDyadicGridFromRow 21 row23 denoms23 numerators23 := by
  decide +kernel

theorem checkedGrid23 : CheckedDyadicGrid 21 denoms23 numerators23 :=
  checkedDyadicGrid_from_verified_row row23_eq signsFromRow23

def row24 : List ℕ := [
  1, 16777191, 282010106381,
  274419271461131, 52652460630984375, 3332058336247871041,
  90359270750971846371, 1220805072813932520741, 9022467342263743368906,
  38735478389273100343750, 100396047731185055904546, 160755658074834738495566,
  160755658074834738495566, 100396047731185055904546, 38735478389273100343750,
  9022467342263743368906, 1220805072813932520741, 90359270750971846371,
  3332058336247871041, 52652460630984375, 274419271461131,
  282010106381, 16777191, 1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row24_eq : eulerRow 24=row24 := by
  change eulerRow (23+1)=row24
  rw [eulerRow,row23_eq]
  all_goals rfl

def denoms24 : Fin (22+1)→ℤ := ![
  131072, 2048, 256, 64, 32,
  16, 8, 4, 8, 2,
  1, 4, 1, 1, 1,
  1, 1, 1, 1, 1,
  1, 1, 1
]
def numerators24 : Fin (22+1)→ℤ := ![
  -1, -1, -1, -1, -1,
  -1, -1, -1, -3, -1,
  -1, -5, -2, -3, -4,
  -7, -13, -28, -75, -303,
  -2793, -206013, -63117665557
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow24 : CheckedDyadicGridFromRow 22 row24 denoms24 numerators24 := by
  decide +kernel

theorem checkedGrid24 : CheckedDyadicGrid 22 denoms24 numerators24 :=
  checkedDyadicGrid_from_verified_row row24_eq signsFromRow24

def row25 : List ℕ := [
  1, 33554406, 846416194536,
  1103881308184906, 269025107855605626, 21045399230106913746,
  695824003645512474376, 11392907456028953400606, 101955892318210543172751,
  531714261368950897339996, 1685388700882132120106256, 3334612565134607644610436,
  4179647109945703200884716, 3334612565134607644610436, 1685388700882132120106256,
  531714261368950897339996, 101955892318210543172751, 11392907456028953400606,
  695824003645512474376, 21045399230106913746, 269025107855605626,
  1103881308184906, 846416194536, 33554406,
  1
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem row25_eq : eulerRow 25=row25 := by
  change eulerRow (24+1)=row25
  rw [eulerRow,row24_eq]
  all_goals rfl

def denoms25 : Fin (23+1)→ℤ := ![
  262144, 2048, 256, 64, 32,
  16, 8, 16, 4, 2,
  4, 1, 2, 1, 1,
  1, 1, 1, 1, 1,
  1, 1, 1, 1
]
def numerators25 : Fin (23+1)→ℤ := ![
  -1, -1, -1, -1, -1,
  -1, -1, -3, -1, -1,
  -3, -1, -3, -2, -3,
  -5, -9, -16, -35, -95,
  -398, -3959, -343157, -172444844372
]

set_option maxRecDepth 60000 in
set_option maxHeartbeats 3000000 in
theorem signsFromRow25 : CheckedDyadicGridFromRow 23 row25 denoms25 numerators25 := by
  decide +kernel

theorem checkedGrid25 : CheckedDyadicGrid 23 denoms25 numerators25 :=
  checkedDyadicGrid_from_verified_row row25_eq signsFromRow25

end RossiPermutohedron.FiniteData
