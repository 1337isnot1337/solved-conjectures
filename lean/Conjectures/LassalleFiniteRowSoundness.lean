module

public import Conjectures.LassalleFiniteRowModel

@[expose] public section
namespace LassalleRefinement

def candidateRow (k : ℕ) : List ℤ :=
  (List.range (2*k+1)).map fun a => quotientCandidate k a

def rowTriplesStrict : List ℤ → Bool
  | a::b::c::xs => decide (a*c<b^2) && rowTriplesStrict (b::c::xs)
  | _ => true

theorem rowTriplesStrict_at (xs : List ℤ) (h : rowTriplesStrict xs = true)
    (a : ℕ) (ha : a+2<xs.length) :
    xs[a]*(xs[a+2]) < xs[a+1]^2 := by
  induction a generalizing xs with
  | zero =>
    obtain _ | ⟨x, _ | ⟨y, _ | ⟨z, ys⟩⟩⟩ := xs
    · exact (Nat.not_lt_zero _ ha).elim
    · have hh : 2<1 := ha
      omega
    · have hh : 2<2 := ha
      omega
    · simp_all [rowTriplesStrict]
  | succ a ih =>
    obtain _ | ⟨x, _ | ⟨y, _ | ⟨z, ys⟩⟩⟩ := xs
    · simp at ha
    · simp at ha
    · simp at ha
    · have hnew : rowTriplesStrict (y::z::ys)=true := by
        simpa [rowTriplesStrict] using (Bool.and_eq_true_iff.mp h).2
      have hidx : a+2 < (y::z::ys).length := by simpa using ha
      simpa using ih _ hnew hidx

theorem candidateRow_length (k : ℕ) : (candidateRow k).length=2*k+1 := by simp [candidateRow]

theorem quotientRow_strict_of_checked_row
    (hi : inverseCandidateChecked) {k a : ℕ} (hk : k<54) (ha : 0<a) (hb : a<2*k)
    (h : rowTriplesStrict (candidateRow k)=true) :
    quotientRow k (a-1)*quotientRow k (a+1)<quotientRow k a^2 := by
  have hidx : a-1+2<(candidateRow k).length := by rw [candidateRow_length]; omega
  have h₀ := rowTriplesStrict_at _ h (a-1) hidx
  simp only [candidateRow,List.getElem_map,List.getElem_range] at h₀
  have e₁ : a-1+2=a+1 := by omega
  have e₂ : a-1+1=a := by omega
  rwa [e₁,e₂,quotientCandidate_eq hi _ _ hk,quotientCandidate_eq hi _ _ hk,
    quotientCandidate_eq hi _ _ hk] at h₀

end LassalleRefinement
