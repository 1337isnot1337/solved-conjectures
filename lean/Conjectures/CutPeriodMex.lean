import Conjectures.CutPeriodLowerCertificate

/-! Transfer universal automata certificates to the actual CUT splitting rules. -/
namespace CutPeriod
open BinaryAutomata CutFamily

def cutsA : Set Nat := {1,2,8}
def cutsB : Set Nat := {1,2,7,8}

theorem optionValue_iff (cuts : Set Nat) (n g : Nat) :
    OptionValue cuts value n g ↔ ∃ p, 2≤p ∧ p-1∈cuts ∧ Piles p n g := by
  constructor
  · rintro ⟨l,hpos,hlen,hcut,hsum,hxor⟩
    exact ⟨l.length,hlen,hcut,l,hpos,rfl,hsum,hxor⟩
  · rintro ⟨p,hp,hcut,l,hpos,hlen,hsum,hxor⟩
    exact ⟨l,hpos,by omega,by simpa only [hlen] using hcut,hsum,hxor⟩

theorem optionsA_iff (n g : Nat) : OptionValue cutsA value n g ↔
    Piles 2 n g ∨ Piles 3 n g ∨ Piles 9 n g := by
  rw [optionValue_iff]
  constructor
  · rintro ⟨p,hp,hcut,hpiles⟩
    have hcases : p=2 ∨ p=3 ∨ p=9 := by
      simp only [cutsA,Set.mem_insert_iff,Set.mem_singleton_iff] at hcut
      omega
    rcases hcases with rfl | rfl | rfl
    · exact Or.inl hpiles
    · exact Or.inr (Or.inl hpiles)
    · exact Or.inr (Or.inr hpiles)
  · rintro (h | h | h)
    · exact ⟨2,by decide,by simp [cutsA],h⟩
    · exact ⟨3,by decide,by simp [cutsA],h⟩
    · exact ⟨9,by decide,by simp [cutsA],h⟩

theorem optionsB_iff (n g : Nat) : OptionValue cutsB value n g ↔
    Piles 2 n g ∨ Piles 3 n g ∨ Piles 8 n g ∨ Piles 9 n g := by
  rw [optionValue_iff]
  constructor
  · rintro ⟨p,hp,hcut,hpiles⟩
    have hcases : p=2 ∨ p=3 ∨ p=8 ∨ p=9 := by
      simp only [cutsB,Set.mem_insert_iff,Set.mem_singleton_iff] at hcut
      omega
    rcases hcases with rfl | rfl | rfl | rfl
    · exact Or.inl hpiles
    · exact Or.inr (Or.inl hpiles)
    · exact Or.inr (Or.inr (Or.inl hpiles))
    · exact Or.inr (Or.inr (Or.inr hpiles))
  · rintro (h | h | h | h)
    · exact ⟨2,by decide,by simp [cutsB],h⟩
    · exact ⟨3,by decide,by simp [cutsB],h⟩
    · exact ⟨8,by decide,by simp [cutsB],h⟩
    · exact ⟨9,by decide,by simp [cutsB],h⟩

/-- The two universal error-language checks imply the mex equations for all
positive pile sizes. Both certificates are explicit hypotheses until checked. -/
theorem mex_of_error_languages {Q : Type} (cuts : Set Nat) (options : DFA Q)
    (hoptions : ∀ w, options.accepts w=true ↔
      OptionValue cuts value (decodeHigh sizeBit w) (decodeHigh valueBit w))
    (hcollision : ∀ w, (GraphCertificate.machine.accepts w && options.accepts w)=false)
    (hmissing : ∀ w, (LowerCertificate.machine.accepts w && !options.accepts w)=false) :
    SatisfiesMex cuts value := by
  intro n hn
  constructor
  · intro hop
    obtain ⟨w,hwN,hwG⟩ := exists_encoding n (value n)
    have hg : GraphCertificate.machine.accepts w=true :=
      (GraphCertificate.correct w).mpr (by rw [hwN,hwG]; exact ⟨hn,rfl⟩)
    have ho : options.accepts w=true :=
      (hoptions w).mpr (by rw [hwN,hwG]; exact hop)
    have hbad := hcollision w
    simp only [hg,ho,Bool.true_and] at hbad
    contradiction
  · intro g hg
    obtain ⟨w,hwN,hwG⟩ := exists_encoding n g
    have hl : LowerCertificate.machine.accepts w=true :=
      (LowerCertificate.correct w).mpr (by rw [hwN,hwG]; exact ⟨hn,hg⟩)
    have hbad := hmissing w
    rw [hl,Bool.true_and] at hbad
    have ho : options.accepts w=true := by cases heq : options.accepts w <;> simp_all
    have hop := (hoptions w).mp ho
    simpa only [hwN,hwG] using hop

#print axioms mex_of_error_languages
end CutPeriod
