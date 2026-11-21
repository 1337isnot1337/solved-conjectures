module

public import Mathlib.Combinatorics.Enumerative.Partition.Basic
public import Mathlib.Data.Matrix.Mul
public import Mathlib.Algebra.BigOperators.Fin
public import Mathlib.Tactic.FinCases
public import Mathlib.Tactic.IntervalCases
public import Mathlib.Tactic.NormNum
public import Lean.Elab.Print

/-!
Exact degree-six Hall-inner-product data for the Chen–Khare–Sahi counterexample.
Every matrix below is rational certificate data. Companion modules check the
certificates using Lean proof terms; no native computation is trusted.
-/

@[expose] public section

namespace ChenKhareSahi.Orthogonality

abbrev Index := Fin 11
abbrev Vector := Index → ℚ

def parts : Index → List ℕ :=
  ![[1,1,1,1,1,1], [2,1,1,1,1], [2,2,1,1], [2,2,2], [3,1,1,1], [3,2,1], [3,3], [4,1,1], [4,2], [5,1], [6]]

def partition (i : Index) : Nat.Partition 6 where
  parts := parts i
  parts_pos := by fin_cases i <;> simp [parts]
  parts_sum := by fin_cases i <;> decide

theorem partition_count_above (p : Nat.Partition 6) (k : ℕ) (hk : 6 < k) :
    p.parts.count k = 0 := by
  rw [Multiset.count_eq_zero]
  intro h
  have := Nat.Partition.le_of_mem_parts h
  omega

set_option maxHeartbeats 2000000 in
theorem six_counts_complete (c1 c2 c3 c4 c5 c6 : ℕ)
    (h : c1 + c2 * 2 + c3 * 3 + c4 * 4 + c5 * 5 + c6 * 6 = 6) :
    (c1 = 6 ∧ c2 = 0 ∧ c3 = 0 ∧ c4 = 0 ∧ c5 = 0 ∧ c6 = 0) ∨
    (c1 = 4 ∧ c2 = 1 ∧ c3 = 0 ∧ c4 = 0 ∧ c5 = 0 ∧ c6 = 0) ∨
    (c1 = 2 ∧ c2 = 2 ∧ c3 = 0 ∧ c4 = 0 ∧ c5 = 0 ∧ c6 = 0) ∨
    (c1 = 0 ∧ c2 = 3 ∧ c3 = 0 ∧ c4 = 0 ∧ c5 = 0 ∧ c6 = 0) ∨
    (c1 = 3 ∧ c2 = 0 ∧ c3 = 1 ∧ c4 = 0 ∧ c5 = 0 ∧ c6 = 0) ∨
    (c1 = 1 ∧ c2 = 1 ∧ c3 = 1 ∧ c4 = 0 ∧ c5 = 0 ∧ c6 = 0) ∨
    (c1 = 0 ∧ c2 = 0 ∧ c3 = 2 ∧ c4 = 0 ∧ c5 = 0 ∧ c6 = 0) ∨
    (c1 = 2 ∧ c2 = 0 ∧ c3 = 0 ∧ c4 = 1 ∧ c5 = 0 ∧ c6 = 0) ∨
    (c1 = 0 ∧ c2 = 1 ∧ c3 = 0 ∧ c4 = 1 ∧ c5 = 0 ∧ c6 = 0) ∨
    (c1 = 1 ∧ c2 = 0 ∧ c3 = 0 ∧ c4 = 0 ∧ c5 = 1 ∧ c6 = 0) ∨
    (c1 = 0 ∧ c2 = 0 ∧ c3 = 0 ∧ c4 = 0 ∧ c5 = 0 ∧ c6 = 1) := by
  have hb2 : c2 ≤ 3 := by omega
  have hb3 : c3 ≤ 2 := by omega
  have hb4 : c4 ≤ 1 := by omega
  have hb5 : c5 ≤ 1 := by omega
  have hb6 : c6 ≤ 1 := by omega
  interval_cases c6 <;> interval_cases c5 <;> interval_cases c4 <;>
    interval_cases c3 <;> interval_cases c2 <;> omega

set_option maxHeartbeats 2000000 in
theorem partition_complete : Function.Bijective partition := by
  constructor
  · decide
  · intro p
    have hzero : p.parts.count 0 = 0 := by
      rw [Multiset.count_eq_zero]
      intro h
      have := p.parts_pos h
      omega
    have hsupp : p.parts.toFinset ⊆ Finset.range 7 := by
      intro k hk
      have hk' : k ∈ p.parts := by simpa using hk
      have h := Nat.Partition.le_of_mem_parts hk'
      simp only [Finset.mem_range]
      omega
    have hsum : (∑ k ∈ Finset.range 7, p.parts.count k * k) = 6 := by
      calc
        _ = ∑ k ∈ p.parts.toFinset, p.parts.count k * k := by
          symm
          apply Finset.sum_subset hsupp
          intro k _ hnot
          have hc : p.parts.count k = 0 := by simpa using hnot
          simp [hc]
        _ = 6 := by
          simpa [smul_eq_mul, p.parts_sum] using (Finset.sum_multiset_count p.parts).symm
    norm_num [Finset.sum_range_succ] at hsum
    have hext (i : Index) (hc : ∀ k ≤ 6, (partition i).parts.count k = p.parts.count k) :
        partition i = p := by
      apply Nat.Partition.ext
      apply Multiset.ext.mpr
      intro k
      by_cases hk : k ≤ 6
      · exact hc k hk
      · rw [partition_count_above _ k (by omega), partition_count_above _ k (by omega)]
    have hcases := six_counts_complete (p.parts.count 1) (p.parts.count 2)
      (p.parts.count 3) (p.parts.count 4) (p.parts.count 5) (p.parts.count 6) hsum
    rcases hcases with h0 | h1 | h2 | h3 | h4 | h5 | h6 | h7 | h8 | h9 | h10
    · rcases h0 with ⟨h1,h2,h3,h4,h5,h6⟩
      refine ⟨0, hext 0 ?_⟩
      intro k hk
      interval_cases k <;> simp [partition, parts, hzero, h1,h2,h3,h4,h5,h6]
    · rcases h1 with ⟨h1,h2,h3,h4,h5,h6⟩
      refine ⟨1, hext 1 ?_⟩
      intro k hk
      interval_cases k <;> simp [partition, parts, hzero, h1,h2,h3,h4,h5,h6]
    · rcases h2 with ⟨h1,h2,h3,h4,h5,h6⟩
      refine ⟨2, hext 2 ?_⟩
      intro k hk
      interval_cases k <;> simp [partition, parts, hzero, h1,h2,h3,h4,h5,h6]
    · rcases h3 with ⟨h1,h2,h3,h4,h5,h6⟩
      refine ⟨3, hext 3 ?_⟩
      intro k hk
      interval_cases k <;> simp [partition, parts, hzero, h1,h2,h3,h4,h5,h6]
    · rcases h4 with ⟨h1,h2,h3,h4,h5,h6⟩
      refine ⟨4, hext 4 ?_⟩
      intro k hk
      interval_cases k <;> simp [partition, parts, hzero, h1,h2,h3,h4,h5,h6]
    · rcases h5 with ⟨h1,h2,h3,h4,h5,h6⟩
      refine ⟨5, hext 5 ?_⟩
      intro k hk
      interval_cases k <;> simp [partition, parts, hzero, h1,h2,h3,h4,h5,h6]
    · rcases h6 with ⟨h1,h2,h3,h4,h5,h6⟩
      refine ⟨6, hext 6 ?_⟩
      intro k hk
      interval_cases k <;> simp [partition, parts, hzero, h1,h2,h3,h4,h5,h6]
    · rcases h7 with ⟨h1,h2,h3,h4,h5,h6⟩
      refine ⟨7, hext 7 ?_⟩
      intro k hk
      interval_cases k <;> simp [partition, parts, hzero, h1,h2,h3,h4,h5,h6]
    · rcases h8 with ⟨h1,h2,h3,h4,h5,h6⟩
      refine ⟨8, hext 8 ?_⟩
      intro k hk
      interval_cases k <;> simp [partition, parts, hzero, h1,h2,h3,h4,h5,h6]
    · rcases h9 with ⟨h1,h2,h3,h4,h5,h6⟩
      refine ⟨9, hext 9 ?_⟩
      intro k hk
      interval_cases k <;> simp [partition, parts, hzero, h1,h2,h3,h4,h5,h6]
    · rcases h10 with ⟨h1,h2,h3,h4,h5,h6⟩
      refine ⟨10, hext 10 ?_⟩
      intro k hk
      interval_cases k <;> simp [partition, parts, hzero, h1,h2,h3,h4,h5,h6]

/-- Dominance order, checking all six nontrivial initial partial sums. -/
def dominates (i j : Index) : Prop :=
  ∀ r : Fin 7, ((parts j).take r.val).sum ≤ ((parts i).take r.val).sum

instance (i j : Index) : Decidable (dominates i j) := by
  unfold dominates
  infer_instance

theorem dominates_index (i j : Index) (h : dominates i j) : j ≤ i := by
  fin_cases i <;> fin_cases j <;> norm_num [dominates, parts, Fin.forall_fin_succ] at *

/-- The centralizer factor z_λ = ∏ a^(m_a) m_a!. -/
def zValue (i : Index) : ℚ :=
  ∏ a ∈ Finset.range 7, (a : ℚ)^((parts i).count a) * (Nat.factorial ((parts i).count a) : ℚ)

/-- The source Hall weight at the admissible parameters q=1/10, t=9/10. -/
def hallWeight (i : Index) : ℚ :=
  zValue i * ((parts i).map (fun a => (1-(1/10:ℚ)^a)/(1-(9/10:ℚ)^a))).prod

theorem hallWeight_exact : hallWeight = ![382637520, (31177872/19), (12702096/361), (46574352/6859), (13108878/271), (5340654/5149), (17964018/73441), (6479352/3439), (7919208/65341), (4499955/40951), (65934/5149)] := by
  funext i
  fin_cases i <;> norm_num [hallWeight, zValue, parts, Finset.prod_range_succ, Nat.factorial]

theorem hallWeight_positive (i : Index) : 0 < hallWeight i := by
  rw [hallWeight_exact]
  fin_cases i <;> norm_num

/-- Row i gives the monomial coefficients of the power-sum product indexed by i. -/
def powerTransition : Matrix (Fin 11) (Fin 11) ℚ :=
  ![![720, 360, 180, 90, 120, 60, 20, 30, 15, 6, 1],
    ![0, 24, 24, 18, 24, 16, 8, 12, 7, 4, 1],
    ![0, 0, 4, 6, 0, 4, 4, 2, 3, 2, 1],
    ![0, 0, 0, 6, 0, 0, 0, 0, 3, 0, 1],
    ![0, 0, 0, 0, 6, 3, 2, 6, 3, 3, 1],
    ![0, 0, 0, 0, 0, 1, 2, 0, 1, 1, 1],
    ![0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 1],
    ![0, 0, 0, 0, 0, 0, 0, 2, 1, 2, 1],
    ![0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]]

/-- Row i gives the power-sum coordinates of the i-th monomial symmetric function. -/
def monomialInPower : Matrix (Fin 11) (Fin 11) ℚ :=
  ![![(1/720), (-1/48), (1/16), (-1/48), (1/18), (-1/6), (1/18), (-1/8), (1/8), (1/5), (-1/6)],
    ![0, (1/24), (-1/4), (1/8), (-1/6), (5/6), (-1/3), (1/2), (-3/4), -1, 1],
    ![0, 0, (1/4), (-1/4), 0, -1, (1/2), (-1/4), (5/4), 1, (-3/2)],
    ![0, 0, 0, (1/6), 0, 0, 0, 0, (-1/2), 0, (1/3)],
    ![0, 0, 0, 0, (1/6), (-1/2), (1/3), (-1/2), (1/2), 1, -1],
    ![0, 0, 0, 0, 0, 1, -1, 0, -1, -1, 2],
    ![0, 0, 0, 0, 0, 0, (1/2), 0, 0, 0, (-1/2)],
    ![0, 0, 0, 0, 0, 0, 0, (1/2), (-1/2), -1, 1],
    ![0, 0, 0, 0, 0, 0, 0, 0, 1, 0, -1],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 1, -1],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]]

/-- The Hall form in monomial coordinates. Its factorization from the source weights is checked separately. -/
def gram : Matrix (Fin 11) (Fin 11) ℚ :=
  ![![(6741860964487055649/3733726231296289), (-10236375978598826325/3733726231296289), (3240139271094938934/3733726231296289), (-10720200249/336440809), (135258626945305404/196511906910331), (-44776191966822306/196511906910331), (10970019/1395379), (-108365342733423/725136187861), (306054342/17707411), (5084064198/210856699), (-10989/5149)],
    ![(-10236375978598826325/3733726231296289), (29522944411348333194/3733726231296289), (-14168214106031977137/3733726231296289), (64321201494/336440809), (-479919080683496151/196511906910331), (230367291812684694/196511906910331), (-65820114/1395379), (463478699069856/725136187861), (-1836326052/17707411), (-25870331529/210856699), (65934/5149)],
    ![(3240139271094938934/3733726231296289), (-14168214106031977137/3733726231296289), (15561070076177075214/3733726231296289), (-122827370490/336440809), (196459097360336766/196511906910331), (-286774463208462048/196511906910331), (98730171/1395379), (-319315901234580/725136187861), (3022752249/17707411), (27220363146/210856699), (-98901/5149)],
    ![(-10720200249/336440809), (64321201494/336440809), (-122827370490/336440809), (74131536996/336440809), (-612108684/17707411), (1224217368/17707411), (-10989/5149), (612108684/17707411), (-1148635026/17707411), (-21978/5149), (21978/5149)],
    ![(135258626945305404/196511906910331), (-479919080683496151/196511906910331), (196459097360336766/196511906910331), (-612108684/17707411), (442970905223438289/196511906910331), (-156470940892568970/196511906910331), (65820114/1395379), (-452493053954235/725136187861), (1299799710/17707411), (25870331529/210856699), (-65934/5149)],
    ![(-44776191966822306/196511906910331), (230367291812684694/196511906910331), (-286774463208462048/196511906910331), (1224217368/17707411), (-156470940892568970/196511906910331), (307370492461698831/196511906910331), (-188526285/1395379), (142196168052441/725136187861), (-2599599420/17707411), (-28570394763/210856699), (131868/5149)],
    ![(10970019/1395379), (-65820114/1395379), (98730171/1395379), (-10989/5149), (65820114/1395379), (-188526285/1395379), (89796114/1395379), (-32967/5149), (32967/5149), (32967/5149), (-32967/5149)],
    ![(-108365342733423/725136187861), (463478699069856/725136187861), (-319315901234580/725136187861), (612108684/17707411), (-452493053954235/725136187861), (142196168052441/725136187861), (-32967/5149), (452493053954235/725136187861), (-1299799710/17707411), (-25870331529/210856699), (65934/5149)],
    ![(306054342/17707411), (-1836326052/17707411), (3022752249/17707411), (-1148635026/17707411), (1299799710/17707411), (-2599599420/17707411), (32967/5149), (-1299799710/17707411), (2372852394/17707411), (65934/5149), (-65934/5149)],
    ![(5084064198/210856699), (-25870331529/210856699), (27220363146/210856699), (-21978/5149), (25870331529/210856699), (-28570394763/210856699), (32967/5149), (-25870331529/210856699), (65934/5149), (25870331529/210856699), (-65934/5149)],
    ![(-10989/5149), (65934/5149), (-98901/5149), (21978/5149), (-65934/5149), (131868/5149), (-32967/5149), (65934/5149), (-65934/5149), (-65934/5149), (65934/5149)]]

/-- Rows are the proposed monic, dominance-triangular Macdonald coefficients. -/
def macdonald : Matrix (Fin 11) (Fin 11) ℚ :=
  ![![1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![(1428675/940951), 1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![(453765921/866272969), (6133/9271), 1, 0, 0, 0, 0, 0, 0, 0, 0],
    ![(2554145/110760637), (3498/83629), (11/91), 1, 0, 0, 0, 0, 0, 0, 0],
    ![(3211230/12914707), (40960116/90402949), (11/91), 0, 1, 0, 0, 0, 0, 0, 0],
    ![(7071630576/83840415031), (16948123528/83840415031), (42326036/91230049), (318/919), (318/919), 1, 0, 0, 0, 0, 0],
    ![(28479825/16776538909), (5271057/894505339), (22534998/894505339), (1221/90181), (1221/90181), (111/991), 1, 0, 0, 0, 0],
    ![(278009490/12873608293), (6776048946/90115258051), (11710591353/90115258051), (1221/90181), (330589243/990277561), (111/991), 0, 1, 0, 0, 0],
    ![(3036505527/1172467231663), (85624094886/8207270621641), (322645301044/8207270621641), (27053496033/90189787051), (33472197/827429239), (1143098/9092629), (11/91), (11/91), 1, 0, 0],
    ![(887598581265/900925390131949), (4999783078356/900925390131949), (241518651477/9900279012439), (235868430798/9900279012439), (367106648997/9900279012439), (1135261302718/9900279012439), (1020201/9901081), (2220300018/9990190729), (1111/9991), 1, 0],
    ![(18403419863961/990010080100087561), (152246473420041/990010080100087561), (1259493552838521/990010080100087561), (10419446664391401/990010080100087561), (1371589850631/999001089909271), (11346788764311/999001089909271), (101303312301191/999001089909271), (1234554321/99990100081), (10213131201/99990100081), (111111/999991), 1]]

/-- Row i pairs each monomial basis vector with the i-th proposed Macdonald polynomial. -/
def dual : Matrix (Fin 11) (Fin 11) ℚ :=
  ![![(6741860964487055649/3733726231296289), (-10236375978598826325/3733726231296289), (3240139271094938934/3733726231296289), (-10720200249/336440809), (135258626945305404/196511906910331), (-44776191966822306/196511906910331), (10970019/1395379), (-108365342733423/725136187861), (306054342/17707411), (5084064198/210856699), (-10989/5149)],
    ![0, (62389241973184581/16661806087861), (-41272054904707263/16661806087861), (798167636721/5589334481), (-6769010791179/4844956699), (724632929685756/876937162519), (-8984445561/254997721), (7370402949/17878069), (-22787136918/294175499), (-80999271/940951), (818181/85541)],
    ![0, 0, (660477595976289/312724541809), (-79837951161969/312724541809), (-79837951161969/312724541809), (-251175149512560/312724541809), (718755644880/16459186411), (-29962593582831/312724541809), (34761330886689/312724541809), (996776888229/16459186411), (-195119804880/16459186411)],
    ![0, 0, 0, (8758288539/47736379), 0, (-2785135755402/43869732301), (10683187119/2308933279), (10683187119/2308933279), (-192309068523231/3992145639391), (1420469194320/210112928389), (5617576800/2308933279)],
    ![0, 0, 0, 0, (8013154149/5566069), (-2548183019382/5115217411), (9774286929/269221969), (-8018350461/18875341), (88201855071/1717656031), (8018927829/90402949), (-9791199/993439)],
    ![0, 0, 0, 0, 0, (71535713999031/83840415031), (-216556147323/2265957163), (-216556147323/2265957163), (-7056148405680/83840415031), (-4811939169129/83840415031), (36603206640/2265957163)],
    ![0, 0, 0, 0, 0, 0, (8893079019/173195659), 0, (-97823869209/15760804969), (-71856078473520/15618957724279), (-697133368800/171636898069)],
    ![0, 0, 0, 0, 0, 0, 0, (8083079829/18986149), (-88913878119/1727739559), (-8010908901171/90115258051), (9781407801/990277561)],
    ![0, 0, 0, 0, 0, 0, 0, 0, (793095122114361/8207270621641), (-88192241083881/8207270621641), (-782512624080/90189787051)],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, (80101078102808829/900925390131949), (-97804296602199/9900279012439)],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (9780331855923297801/990010080100087561)]]

/-- Exact values of the monomial basis at the eleven partition input vectors. -/
def evaluationMatrix : Matrix Index Index ℚ :=
  ![![1, 30, 90, 20, 60, 120, 15, 60, 30, 30, 6],
    ![0, 12, 78, 28, 60, 192, 38, 132, 92, 148, 68],
    ![0, 0, 52, 40, 40, 280, 97, 176, 210, 266, 130],
    ![0, 0, 0, 64, 0, 384, 192, 192, 384, 384, 192],
    ![0, 0, 36, 28, 36, 240, 84, 264, 276, 744, 732],
    ![0, 0, 0, 36, 0, 288, 251, 216, 578, 862, 794],
    ![0, 0, 0, 0, 0, 0, 729, 0, 1458, 1458, 1458],
    ![0, 0, 0, 16, 0, 168, 129, 264, 546, 2058, 4098],
    ![0, 0, 0, 0, 0, 0, 512, 0, 1280, 2176, 4160],
    ![0, 0, 0, 0, 0, 0, 125, 0, 650, 3130, 15626],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 46656]]

/-- An exact left inverse for the finite evaluation certificate. -/
def evaluationInverse : Matrix Index Index ℚ :=
  ![![1, (-5/2), (5/4), (-5/72), (10/9), (-5/9), (5/162), (-5/12), (5/72), (1/9), (-5/324)],
    ![0, (1/12), (-1/8), (1/72), 0, (1/18), (-1/243), (-1/72), (-1/144), (1/180), (-13/19440)],
    ![0, 0, (1/12), (-5/288), (-5/54), (-1/54), (1/486), (7/108), (1/864), (-1/45), (31/9720)],
    ![0, 0, 0, (23/288), 0, (-5/36), (13/1296), (1/18), (1/64), (-17/720), (29/8640)],
    ![0, 0, (-1/12), (13/864), (13/108), (1/108), (-1/1944), (-1/12), (1/1728), (31/1080), (-109/25920)],
    ![0, 0, 0, (-7/576), 0, (1/36), (-41/11664), (-1/72), (-7/3456), (13/2160), (-433/466560)],
    ![0, 0, 0, 0, 0, 0, (25/1944), 0, (-31/1728), (7/1080), (-227/233280)],
    ![0, 0, 0, (5/1728), 0, (-1/108), (1/432), (1/108), (-1/864), (-1/240), (59/77760)],
    ![0, 0, 0, 0, 0, 0, (-77/11664), 0, (1/96), (-1/240), (157/233280)],
    ![0, 0, 0, 0, 0, 0, (5/5832), 0, (-5/3456), (1/1080), (-97/466560)],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (1/46656)]]

theorem parts_sorted (i : Index) : (parts i).Pairwise (fun a b => b ≤ a) := by
  fin_cases i <;> decide

/- Materialize the defining equations in their owning module.
Sibling modules must import these checked equations, rather than create them independently. -/
open Lean Elab Command in
run_cmd do
  liftTermElabM do
    for name in #[
      ``ChenKhareSahi.Orthogonality.Index,
      ``ChenKhareSahi.Orthogonality.Vector,
      ``ChenKhareSahi.Orthogonality.parts,
      ``ChenKhareSahi.Orthogonality.partition,
      ``ChenKhareSahi.Orthogonality.dominates,
      ``ChenKhareSahi.Orthogonality.zValue,
      ``ChenKhareSahi.Orthogonality.hallWeight,
      ``ChenKhareSahi.Orthogonality.powerTransition,
      ``ChenKhareSahi.Orthogonality.monomialInPower,
      ``ChenKhareSahi.Orthogonality.gram,
      ``ChenKhareSahi.Orthogonality.macdonald,
      ``ChenKhareSahi.Orthogonality.dual,
      ``ChenKhareSahi.Orthogonality.evaluationMatrix,
      ``ChenKhareSahi.Orthogonality.evaluationInverse] do
      discard <| Lean.Meta.getEqnsFor? name

end ChenKhareSahi.Orthogonality
