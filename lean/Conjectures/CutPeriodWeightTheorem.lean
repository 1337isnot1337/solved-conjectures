import Conjectures.CutPeriodWeightCollision
import Conjectures.CutPeriodWeightLower
import Conjectures.CutPeriodMex
import Conjectures.CutFamilyGame

/-! Identification of both actual recursive CUT games and their exact
arithmetic-period parameters, using the finite quotient/residue certificates. -/
namespace CutPeriod.Weight

theorem gameA_mex : CutFamily.SatisfiesMex cutsA value := by
  intro n hn
  constructor
  · intro h
    rcases (optionsA_iff n (value n)).mp h with h | h | h
    · exact no_collision 2 n (by omega) hn h
    · exact no_collision 3 n (by omega) hn h
    · exact no_collision 9 n (by omega) hn h
  · intro g hg
    obtain ⟨p,hp,hpiles⟩ := lower_option n g hn hg
    apply (optionsA_iff n g).mpr
    rcases hp with rfl | rfl | rfl
    · exact Or.inl hpiles
    · exact Or.inr (Or.inl hpiles)
    · exact Or.inr (Or.inr hpiles)

theorem gameB_mex : CutFamily.SatisfiesMex cutsB value := by
  intro n hn
  constructor
  · intro h
    rcases (optionsB_iff n (value n)).mp h with h | h | h | h
    · exact no_collision 2 n (by omega) hn h
    · exact no_collision 3 n (by omega) hn h
    · exact no_collision 8 n (by omega) hn h
    · exact no_collision 9 n (by omega) hn h
  · intro g hg
    have hA := (gameA_mex n hn).2 g hg
    apply (optionsB_iff n g).mpr
    rcases (optionsA_iff n g).mp hA with h | h | h
    · exact Or.inl h
    · exact Or.inr (Or.inl h)
    · exact Or.inr (Or.inr (Or.inr h))

theorem gameValue_zero (cuts : Set Nat) : CutFamily.gameValue cuts 0=0 := by
  rw [CutFamily.gameValue_rec]
  apply CutFamily.mex_unique (CutFamily.gameStep_mex cuts 0 _)
  constructor
  · rintro ⟨l,hpos,hlen,_,hsum,_⟩
    have h := CutFamily.excess_identity l hpos
    omega
  · intro v hv
    omega

theorem game_eq_candidate (cuts : Set Nat) (h : CutFamily.SatisfiesMex cuts value) :
    CutFamily.gameValue cuts=value := by
  funext n
  by_cases hn : n=0
  · subst n
    rw [gameValue_zero]
    decide
  · exact CutFamily.grundy_unique cuts _ _ (CutFamily.gameValue_mex cuts) h n (by omega)

theorem gameA_value : CutFamily.gameValue cutsA=value := game_eq_candidate cutsA gameA_mex
theorem gameB_value : CutFamily.gameValue cutsB=value := game_eq_candidate cutsB gameB_mex

def AdditivePeriodFrom (f : Nat → Nat) (start period saltus : Nat) : Prop :=
  ∀ n, start≤n → f (n+period)=f n+saltus

def ExactArithmeticParameters (f : Nat → Nat) : Prop :=
  AdditivePeriodFrom f 7 12 8 ∧
    (∀ start period saltus, 0<period → AdditivePeriodFrom f start period saltus → 12≤period) ∧
    (∀ start saltus, AdditivePeriodFrom f start 12 saltus → saltus=8) ∧
    (∀ start, AdditivePeriodFrom f start 12 8 ↔ 7≤start)

theorem candidate_exact_parameters : ExactArithmeticParameters value :=
  ⟨candidate_period,candidate_least_period,candidate_saltus,candidate_least_start⟩

theorem gameA_parameters : ExactArithmeticParameters (CutFamily.gameValue cutsA) := by
  rw [gameA_value]
  exact candidate_exact_parameters

theorem gameB_parameters : ExactArithmeticParameters (CutFamily.gameValue cutsB) := by
  rw [gameB_value]
  exact candidate_exact_parameters

/-- Both actual games have the candidate function, least eventual period
twelve, saltus eight, and earliest period-twelve start at pile seven. -/
theorem both_games_exact :
    CutFamily.gameValue cutsA=value ∧ CutFamily.gameValue cutsB=value ∧
      ExactArithmeticParameters (CutFamily.gameValue cutsA) ∧
      ExactArithmeticParameters (CutFamily.gameValue cutsB) :=
  ⟨gameA_value,gameB_value,gameA_parameters,gameB_parameters⟩

#print axioms both_games_exact
end CutPeriod.Weight
