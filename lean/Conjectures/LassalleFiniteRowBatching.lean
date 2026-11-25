module

public import Conjectures.LassalleFiniteRowSoundness

@[expose] public section
namespace LassalleRefinement

def candidateRowsChecked (l h : ℕ) : Prop :=
  (List.range (h-l)).all (fun i => rowTriplesStrict (candidateRow (l+i))) = true

theorem candidateRowsChecked_at {l h : ℕ} (hv : candidateRowsChecked l h)
    {k : ℕ} (hl : l≤k) (hh : k<h) : rowTriplesStrict (candidateRow k)=true := by
  have hv' := List.all_eq_true.mp hv (k-l) (List.mem_range.mpr (by omega))
  rw [show l+(k-l)=k by omega] at hv'
  exact hv'

theorem candidate_inverse_all_checked : inverseCandidateChecked := by
  unfold inverseCandidateChecked
  decide +kernel

end LassalleRefinement
