import Conjectures.CutFamily
import Mathlib.Data.Nat.Find

/-! The actual recursively defined CUT game, for any (possibly infinite) set of
allowed cuts.  Finite pile size gives a finite bound on option values, so its
mex exists without any assumption about the desired explicit formula. -/

namespace CutFamily

noncomputable def priorValue (n : Nat) (f : ∀ k, k < n → Nat) (k : Nat) : Nat :=
  if hk : k < n then f k hk else 0

theorem history_bounded (n : Nat) (f : ∀ k, k < n → Nat) :
    ∃ M, ∀ k, priorValue n f k ≤ M := by
  induction n with
  | zero =>
    exact ⟨0,by intro k; simp [priorValue]⟩
  | succ n ih =>
    let f' : ∀ k, k < n → Nat := fun k hk => f k (by omega)
    obtain ⟨M,hM⟩ := ih f'
    refine ⟨M+f n (by omega),?_⟩
    intro k
    by_cases hk : k < n
    · have hh := hM k
      simp only [priorValue,dite_eq_left hk] at hh
      have hk' : k < n+1 := by omega
      simp only [priorValue,dite_eq_left hk']
      dsimp [f'] at hh
      omega
    · by_cases he : k=n
      · subst k
        simp only [priorValue,dite_eq_left (Nat.lt_succ_self n)]
        omega
      · have hk' : ¬ k < n+1 := by omega
        simp only [priorValue,dite_eq_right hk']
        omega

theorem sum_values_bounded (f : Nat → Nat) (M : Nat) (hM : ∀ k, f k ≤ M)
    (l : List Nat) : (l.map f).sum ≤ l.length*M := by
  induction l with
  | nil => simp
  | cons k l ih =>
    have hk := hM k
    simp only [List.map_cons,List.sum_cons,List.length_cons]
    nlinarith

theorem exists_nonoption (cuts : Set Nat) (n : Nat) (f : ∀ k, k < n → Nat) :
    ∃ v, ¬ OptionValue cuts (priorValue n f) n v := by
  obtain ⟨M,hM⟩ := history_bounded n f
  refine ⟨n*M+1,?_⟩
  rintro ⟨l,hpos,hlen,hcut,hsum,hxor⟩
  have he := excess_identity l hpos
  have hlenle : l.length ≤ n := by omega
  have hv := xorList_le_sum (l.map (priorValue n f))
  have hs := sum_values_bounded (priorValue n f) M hM l
  have hm := Nat.mul_le_mul_right M hlenle
  omega

noncomputable def gameStep (cuts : Set Nat) (n : Nat) (f : ∀ k, k < n → Nat) : Nat := by
  classical
  exact Nat.find (exists_nonoption cuts n f)

theorem gameStep_mex (cuts : Set Nat) (n : Nat) (f : ∀ k, k < n → Nat) :
    IsMex (OptionValue cuts (priorValue n f) n) (gameStep cuts n f) := by
  classical
  constructor
  · exact Nat.find_spec (exists_nonoption cuts n f)
  · intro v hv
    by_contra hh
    exact Nat.find_min (exists_nonoption cuts n f) hv hh

noncomputable def gameValue (cuts : Set Nat) (n : Nat) : Nat :=
  Nat.strongRecOn n (gameStep cuts)

theorem gameValue_rec (cuts : Set Nat) (n : Nat) :
    gameValue cuts n = gameStep cuts n (fun k _ => gameValue cuts k) := by
  exact Nat.strongRecOn_eq (gameStep cuts) n

theorem gameValue_mex (cuts : Set Nat) : SatisfiesMex cuts (gameValue cuts) := by
  intro n _
  have hop : OptionValue cuts (priorValue n (fun k _ => gameValue cuts k)) n =
      OptionValue cuts (gameValue cuts) n := by
    funext v
    apply propext
    constructor
    all_goals
      rintro ⟨l,hpos,hlen,hcut,hsum,hxor⟩
      have hmap : l.map (priorValue n (fun k _ => gameValue cuts k)) =
          l.map (gameValue cuts) := by
        apply List.map_congr_left
        intro k hk
        have hkn : k < n := by
          rw [← hsum]
          exact part_lt_sum l hpos hlen k hk
        simp only [priorValue,dite_eq_left hkn]
      refine ⟨l,hpos,hlen,hcut,hsum,?_⟩
    · rw [← hmap]
      exact hxor
    · rw [hmap]
      exact hxor
  rw [gameValue_rec]
  rw [← hop]
  exact gameStep_mex cuts n _

#print axioms gameValue_mex

end CutFamily
