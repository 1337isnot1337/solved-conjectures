import Conjectures.LiBridge
import Conjectures.LiBasic

/-!
# Five exact three-colour evaluations of Li's tree

For `r = 1, ..., 5`, this module evaluates the actual chromatic polynomial
at `(1, r, -1-r)`. It uses the general leaf-elimination theorem contributed
by aadrianvv in PR #35. The numerical update tables are untrusted data:
every entry is proved by exact arithmetic, and the graph-theoretic
leaf conditions are checked separately before the thirty steps are joined.

These evaluations supply data for elementary-coefficient interpolation.
They are not, by themselves, a coefficient-extraction theorem.
-/

open scoped BigOperators

namespace LiEvaluation

/-- The five triples `(1,r,-1-r)`, with `r = j + 1`. -/
def colorWeights (j : Fin 5) : Fin 3 → ℚ :=
  ![1, (j.val : ℚ) + 1, -((j.val : ℚ) + 2)]

/-- The exact values, in increasing order of `r`. -/
def values : Fin 5 → ℚ :=
  ![990877086, 172175555938218, 83260158020643396,
    -919551298160859490980, -475047863403291617208270]

/-- The thirty leaf removals, leaving vertex zero. -/
def leafOrder : List (Fin 31) :=
  [30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,
   14,13,12,11,10,9,15,8,7,6,5,4,3,2,1]

/-- The leaf at a numbered step. Only indices below thirty are used. -/
def leaf (i : ℕ) : Fin 31 := leafOrder.getD i 0

/-- Its parent in the actual rooted tree. -/
def parent (i : ℕ) : Fin 31 := Li.parOf (leaf i)

/-- Vertices remaining before step `i`. -/
def active (i : ℕ) : Finset (Fin 31) :=
  Finset.univ \ (leafOrder.take i).toFinset

/-- Each row is the updated parent's three weights for each of five inputs. -/
def updateTable : List (Fin 5 → Fin 3 → ℚ) := [
  ![![-1, -1, -4],
    ![-1, -4, -9],
    ![-1, -9, -16],
    ![-1, -16, -25],
    ![-1, -25, -36]],
  ![![-5, -5, 4],
    ![-13, -20, 15],
    ![-25, -51, 40],
    ![-41, -104, 85],
    ![-61, -185, 156]],
  ![![-1, -1, 20],
    ![-5, 4, 99],
    ![-11, 45, 304],
    ![-19, 176, 725],
    ![-29, 475, 1476]],
  ![![19, 19, 4],
    ![103, 188, 3],
    ![349, 879, -136],
    ![901, 2824, -785],
    ![1951, 7235, -2676]],
  ![![23, 23, -76],
    ![191, 212, -873],
    ![743, 639, -4912],
    ![2039, 464, -18625],
    ![4559, -3625, -55116]],
  ![![-53, -53, -92],
    ![-661, -1364, -1209],
    ![-4273, -12507, -5528],
    ![-18161, -66344, -12515],
    ![-58741, -252785, -5604]],
  ![![-145, -145, 212],
    ![-2573, -3740, 6075],
    ![-18035, -29403, 67120],
    ![-78859, -122704, 422525],
    ![-258389, -321725, 1869156]],
  ![![67, 67, 580],
    ![2335, 7004, 18939],
    ![37717, 147255, 189752],
    ![299821, 1374664, 1007815],
    ![1547431, 8053835, 3480684]],
  ![![647, 647, -268],
    ![25943, 42548, -28017],
    ![337007, 682407, -739888],
    ![2382479, 5230544, -8372425],
    ![11534519, 25140575, -57607596]],
  ![![379, 379, -2588],
    ![14531, -4148, -205473],
    ![-57481, -1208643, -4077656],
    ![-3141881, -23959784, -38065115],
    ![-32467021, -230365385, -220050564]],
  ![![-2209, -2209, -1516],
    ![-209621, -381884, -31149],
    ![-5286299, -12405411, 5064496],
    ![-62024899, -164827984, 135508325],
    ![-450415949, -1262587925, 1576994436]],
  ![![-3725, -3725, 8836],
    ![-413033, -481540, 1774515],
    ![-7340915, -665409, 70766840],
    ![-29319659, 293933704, 1134264415],
    ![314406511, 5632892435, 10278023244]],
  ![![5111, 5111, 14900],
    ![1292975, 2722964, 2683719],
    ![70101431, 190277775, 32025296],
    ![1428198119, 4419779024, -1323070225],
    ![15910915679, 52962148775, -35683793676]],
  ![![20011, 20011, -20444],
    ![5406683, 7953388, -12047817],
    ![222303071, 306380181, -1041516824],
    ![3096708799, 420511576, -29239885715],
    ![17278355099, -98864389985, -413238386724]],
  ![![-433, -433, -80044],
    ![-4094429, -13282268, -40080213],
    ![-735136643, -2457641259, -2114733008],
    ![-28819374139, -104572707664, -17586101875],
    ![-512102776709, -1979800158125, 489516209316]],
  ![![-1, -1, -4],
    ![-1, -4, -9],
    ![-1, -9, -16],
    ![-1, -16, -25],
    ![-1, -25, -36]],
  ![![-5, -5, 4],
    ![-13, -20, 15],
    ![-25, -51, 40],
    ![-41, -104, 85],
    ![-61, -185, 156]],
  ![![-1, -1, 20],
    ![-5, 4, 99],
    ![-11, 45, 304],
    ![-19, 176, 725],
    ![-29, 475, 1476]],
  ![![19, 19, 4],
    ![103, 188, 3],
    ![349, 879, -136],
    ![901, 2824, -785],
    ![1951, 7235, -2676]],
  ![![23, 23, -76],
    ![191, 212, -873],
    ![743, 639, -4912],
    ![2039, 464, -18625],
    ![4559, -3625, -55116]],
  ![![-53, -53, -92],
    ![-661, -1364, -1209],
    ![-4273, -12507, -5528],
    ![-18161, -66344, -12515],
    ![-58741, -252785, -5604]],
  ![![53, 53, -184],
    ![661, 2728, -3627],
    ![4273, 37521, -22112],
    ![18161, 265376, -62575],
    ![58741, 1263925, -33624]],
  ![![-131, -131, -212],
    ![-899, -5932, -10167],
    ![15409, -53517, -167176],
    ![202801, -177656, -1417685],
    ![1230301, 125585, -7935996]],
  ![![-343, -343, 524],
    ![-16099, -22132, 20493],
    ![-220693, -455301, 152432],
    ![-1595341, -4859536, -125725],
    ![-7810411, -33528475, -8135316]],
  ![![181, 181, 1372],
    ![-1639, 8788, 114693],
    ![-302869, -204783, 2703976],
    ![-4985261, -6884264, 32274385],
    ![-41663791, -79728635, 248033316]],
  ![![1553, 1553, -724],
    ![123481, 226108, -21447],
    ![2499193, 7203321, 2030608],
    ![25390121, 109156496, 59347625],
    ![168304681, 1031847625, 728354556]],
  ![![-358957, -358957, -248616664],
    ![-837969933569, -1355242933112, -14011601582457],
    ![-6788199566760347, -11132625832659459, -20518226616382112],
    ![-4856183307062326819, -8861255540564285344, -2366150513498606875],
    ![-901404424459337802329, -1775206099196841850625, 587494007434976082696]],
  ![![-1, -1, -4],
    ![-1, -4, -9],
    ![-1, -9, -16],
    ![-1, -16, -25],
    ![-1, -25, -36]],
  ![![1794785, 1794785, 497233328],
    ![10893609136397, 13552429331120, 70058007912285],
    ![169704989169008675, 189254639155210803, 205182266163821120],
    ![199103515589555399579, 230392644054671418944, 40224558729476316875],
    ![54985669892019605942069, 65682625670283148473125, -15274844193309378150096]],
  ![![-1794785, -1794785, 994466656],
    ![-10893609136397, -27104858662240, 210174023736855],
    ![-169704989169008675, -567763917465632409, 820729064655284480],
    ![-199103515589555399579, -921570576218685675776, 201122793647381584375],
    ![-54985669892019605942069, -328413128351415742365625, -91649065159856268900576]]
]

/-- One numerical parent-weight row. -/
def nextWeights (i : ℕ) : Fin 5 → Fin 3 → ℚ := updateTable.getD i 0

/-- The complete vertex weights after the indicated number of eliminations. -/
def stageWeights : ℕ → Fin 5 → Fin 31 → Fin 3 → ℚ
  | 0, j => fun _ => colorWeights j
  | i + 1, j => Function.update (stageWeights i j) (parent i) (nextWeights i j)

theorem active_zero : active 0 = Finset.univ := by decide

theorem active_thirty : active 30 = {0} := by decide

set_option maxRecDepth 100000 in
/-- All leaf hypotheses concern the actual graph and the actual remaining vertices. -/
theorem leaf_conditions : ∀ i : Fin 30,
    leaf i.val ∈ active i.val ∧ parent i.val ∈ active i.val ∧
    Li.T.Adj (leaf i.val) (parent i.val) ∧
    (∀ v ∈ active i.val, Li.T.Adj (leaf i.val) v → v = parent i.val) ∧
    active (i.val + 1) = (active i.val).erase (leaf i.val) := by
  decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Every numerical update is the exact three-colour leaf recurrence. -/
theorem table_correct : ∀ (i : Fin 30) (j : Fin 5) (c : Fin 3),
    nextWeights i.val j c =
      stageWeights i.val j (parent i.val) c *
        ((∑ d : Fin 3, stageWeights i.val j (leaf i.val) d) -
          stageWeights i.val j (leaf i.val) c) := by
  intro i j c
  fin_cases i <;> fin_cases j <;> fin_cases c <;>
    norm_num [nextWeights, stageWeights, updateTable, parent, leaf, leafOrder,
      Li.parOf, Li.parList, colorWeights, Function.update, Fin.sum_univ_three]

/-- The checked table gives the actual weight update used by leaf elimination. -/
theorem stageWeights_succ (i : ℕ) (hi : i < 30) (j : Fin 5) :
    Function.update (stageWeights i j) (parent i)
      (fun c => stageWeights i j (parent i) c *
        ((∑ d : Fin 3, stageWeights i j (leaf i) d) - stageWeights i j (leaf i) c)) =
      stageWeights (i + 1) j := by
  change Function.update (stageWeights i j) (parent i) _ =
    Function.update (stageWeights i j) (parent i) (nextWeights i j)
  congr 1
  funext c
  exact (table_correct ⟨i, hi⟩ j c).symm

/-- Joining the thirty genuine leaf eliminations. -/
theorem partFun_reduction (j : Fin 5) (n : ℕ) (hn : n ≤ 30) :
    LiElim.partFunOn Li.T (active 0) (stageWeights 0 j) =
      LiElim.partFunOn Li.T (active n) (stageWeights n j) := by
  induction n with
  | zero => rfl
  | succ n ih =>
    have hlt : n < 30 := by omega
    rcases leaf_conditions ⟨n, hlt⟩ with ⟨hl, hp, ha, hleaf, hactive⟩
    calc
      _ = LiElim.partFunOn Li.T (active n) (stageWeights n j) := ih (by omega)
      _ = LiElim.partFunOn Li.T ((active n).erase (leaf n))
          (Function.update (stageWeights n j) (parent n)
            (fun c => stageWeights n j (parent n) c *
              ((∑ d : Fin 3, stageWeights n j (leaf n) d) -
                stageWeights n j (leaf n) c))) :=
        LiElim.partFunOn_erase Li.T (active n) (leaf n) (parent n) hl hp ha hleaf
          (stageWeights n j)
      _ = LiElim.partFunOn Li.T (active (n + 1)) (stageWeights (n + 1) j) := by
        rw [stageWeights_succ n hlt j, ← hactive]

/-- Singleton evaluation; the proof follows `LiCompute.partFunOn_zero`
from aadrianvv's PR #35, here over the rationals. -/
lemma partFunOn_zero (w : Fin 31 → Fin 3 → ℚ) :
    LiElim.partFunOn Li.T ({0} : Finset (Fin 31)) w = w 0 0 + w 0 1 + w 0 2 := by
  classical
  let e0 : {v // v ∈ ({0} : Finset (Fin 31))} := ⟨0, Finset.mem_singleton_self 0⟩
  have e0_unique : ∀ a : {v // v ∈ ({0} : Finset (Fin 31))}, a = e0 := by
    intro a
    exact Subtype.ext (Finset.mem_singleton.mp a.2)
  have hproper : ∀ κ : {v // v ∈ ({0} : Finset (Fin 31))} → Fin 3,
      (∀ u v : {v // v ∈ ({0} : Finset (Fin 31))}, Li.T.Adj u v → κ u ≠ κ v) := by
    intro κ u v huv
    have hu : (u : Fin 31) = 0 := Finset.mem_singleton.mp u.2
    have hv : (v : Fin 31) = 0 := Finset.mem_singleton.mp v.2
    rw [hu, hv] at huv
    exact (Li.T.loopless.irrefl 0 huv).elim
  let ee : ({v // v ∈ ({0} : Finset (Fin 31))} → Fin 3) ≃ Fin 3 :=
    { toFun := fun κ => κ e0
      invFun := fun i => fun _ => i
      left_inv := fun κ => by
        funext a
        rw [e0_unique a]
      right_inv := fun i => rfl }
  rw [LiElim.partFunOn]
  trans ∑ κ : {v // v ∈ ({0} : Finset (Fin 31))} → Fin 3, w 0 (κ e0)
  · apply Finset.sum_congr rfl
    intro κ _
    rw [ite_eq_left (hproper κ)]
    have hattach : ({0} : Finset (Fin 31)).attach = {e0} := by
      ext a
      simp only [Finset.mem_attach, Finset.mem_singleton, true_iff]
      exact e0_unique a
    rw [hattach, Finset.prod_singleton]
  · rw [Fintype.sum_equiv ee _ _ ?_]
    · rw [Fin.sum_univ_three]
    · intro κ
      rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- The five final root sums. -/
theorem root_values : ∀ j : Fin 5,
    stageWeights 30 j 0 0 + stageWeights 30 j 0 1 + stageWeights 30 j 0 2 = values j := by
  intro j
  fin_cases j <;>
    norm_num [stageWeights, parent, leaf, leafOrder, Li.parOf, Li.parList,
      nextWeights, updateTable, colorWeights, values, Function.update]

/-- The full partition functions, obtained from the proved elimination chain. -/
theorem partFun_values (j : Fin 5) :
    LiElim.partFunOn Li.T Finset.univ (fun _ => colorWeights j) = values j := by
  have h := partFun_reduction j 30 (by decide)
  rw [active_zero, active_thirty, partFunOn_zero] at h
  change LiElim.partFunOn Li.T Finset.univ (fun _ => colorWeights j) = _ at h
  exact h.trans (root_values j)

/-- Exact evaluation of the actual three-variable chromatic polynomial. -/
theorem eval_chromPoly (j : Fin 5) :
    MvPolynomial.aeval (colorWeights j) (Li.chromPoly Li.T) = values j := by
  have hbridge : MvPolynomial.aeval (colorWeights j) (Li.chromPoly Li.T) =
      LiElim.partFunOn Li.T Finset.univ (fun _ => colorWeights j) := by
    rw [Li.aeval_chromPoly, Finset.sum_filter, ← LiBridge.partFunOn_univ]
  exact hbridge.trans (partFun_values j)

end LiEvaluation
