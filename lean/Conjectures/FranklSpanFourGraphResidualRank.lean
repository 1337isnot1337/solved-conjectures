module

public import Conjectures.FranklSpanFourGraphResidualCheck000
public import Conjectures.FranklSpanFourGraphResidualCheck001
public import Conjectures.FranklSpanFourGraphResidualCheck002
public import Conjectures.FranklSpanFourGraphResidualCheck003
public import Conjectures.FranklSpanFourGraphResidualCheck004
public import Conjectures.FranklSpanFourGraphResidualCheck005
public import Conjectures.FranklSpanFourGraphResidualCheck006
public import Conjectures.FranklSpanFourGraphResidualCheck007
public import Conjectures.FranklSpanFourGraphWordLists
public import Conjectures.FranklSmallCyclicResidual

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

theorem residual_rank_table_checked :
    rankTableCheck 6 leftTable residualKept residualRanks = true := by
  exact (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) leftTablePart000_rank_checked leftTablePart001_rank_checked) (Table.entriesCheck_node (by decide +kernel) leftTablePart002_rank_checked leftTablePart003_rank_checked)) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) leftTablePart004_rank_checked leftTablePart005_rank_checked) (Table.entriesCheck_node (by decide +kernel) leftTablePart006_rank_checked leftTablePart007_rank_checked))) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) leftTablePart008_rank_checked leftTablePart009_rank_checked) (Table.entriesCheck_node (by decide +kernel) leftTablePart010_rank_checked leftTablePart011_rank_checked)) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) leftTablePart012_rank_checked leftTablePart013_rank_checked) (Table.entriesCheck_node (by decide +kernel) leftTablePart014_rank_checked leftTablePart015_rank_checked)))) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) leftTablePart016_rank_checked leftTablePart017_rank_checked) (Table.entriesCheck_node (by decide +kernel) leftTablePart018_rank_checked leftTablePart019_rank_checked)) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) leftTablePart020_rank_checked leftTablePart021_rank_checked) (Table.entriesCheck_node (by decide +kernel) leftTablePart022_rank_checked leftTablePart023_rank_checked))) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) leftTablePart024_rank_checked leftTablePart025_rank_checked) (Table.entriesCheck_node (by decide +kernel) leftTablePart026_rank_checked leftTablePart027_rank_checked)) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) leftTablePart028_rank_checked leftTablePart029_rank_checked) (Table.entriesCheck_node (by decide +kernel) leftTablePart030_rank_checked leftTablePart031_rank_checked))))) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) leftTablePart032_rank_checked leftTablePart033_rank_checked) (Table.entriesCheck_node (by decide +kernel) leftTablePart034_rank_checked leftTablePart035_rank_checked)) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) leftTablePart036_rank_checked leftTablePart037_rank_checked) (Table.entriesCheck_node (by decide +kernel) leftTablePart038_rank_checked leftTablePart039_rank_checked))) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) leftTablePart040_rank_checked leftTablePart041_rank_checked) (Table.entriesCheck_node (by decide +kernel) leftTablePart042_rank_checked leftTablePart043_rank_checked)) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) leftTablePart044_rank_checked leftTablePart045_rank_checked) (Table.entriesCheck_node (by decide +kernel) leftTablePart046_rank_checked leftTablePart047_rank_checked)))) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) leftTablePart048_rank_checked leftTablePart049_rank_checked) (Table.entriesCheck_node (by decide +kernel) leftTablePart050_rank_checked leftTablePart051_rank_checked)) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) leftTablePart052_rank_checked leftTablePart053_rank_checked) (Table.entriesCheck_node (by decide +kernel) leftTablePart054_rank_checked leftTablePart055_rank_checked))) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) leftTablePart056_rank_checked leftTablePart057_rank_checked) (Table.entriesCheck_node (by decide +kernel) leftTablePart058_rank_checked leftTablePart059_rank_checked)) (Table.entriesCheck_node (by decide +kernel) (Table.entriesCheck_node (by decide +kernel) leftTablePart060_rank_checked leftTablePart061_rank_checked) (Table.entriesCheck_node (by decide +kernel) leftTablePart062_rank_checked leftTablePart063_rank_checked))))))

def rank4 (v : Assembly.Word 6) : ℕ := residualRanks.get (wordCode v)

theorem residual_rank_codes_checked :
    rankCodeCheck 6 leftTable.keys residualKept residualRanks = true :=
  rankTableCheck_sound residual_rank_table_checked

theorem residual_kept_checked :
    residualKept.keys.all (fun a => decide
      (List.ofFn (fun j : Fin 7 => letterCode (wordOfCode 7 a j)) ∈
        FranklSmallCyclic.residualEdges)) = true := by
  decide +kernel

theorem residual_rank_checked :
    FranklCyclic.rankListCheck (left4.map Assembly.edge)
      (fun e => decide
        (List.ofFn (fun j : Fin 7 => letterCode (Assembly.sevenOfEdge e j)) ∈
          FranklSmallCyclic.residualEdges)) rank4 = true := by
  apply rankCodeCheck_sound residual_rank_codes_checked
  intro a _ hkeep
  have h := List.all_eq_true.mp residual_kept_checked a (Table.contains_mem hkeep)
  simpa only [Assembly.sevenOfEdge_edge] using h

end FranklSpanFour.Graph.Certificate
