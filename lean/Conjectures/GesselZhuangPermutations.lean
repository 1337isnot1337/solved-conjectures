module

public import Conjectures.GesselZhuangHistoryInjective
public import Conjectures.GesselZhuangHistorySurjective
public import Mathlib.Data.Fintype.Sigma
public import Mathlib.Data.List.Permutation

/-!
# Gessel–Zhuang conjecture

The finite set of closed insertion histories is equivalent to the set of
all literal permutation words. Values are `0,…,n` internally; adding one
gives precisely the source's labels `1,…,n+1`.
-/

@[expose] public section

namespace GesselZhuang

/-- Every ordering of the `n+1` distinct labels, with no pattern restriction. -/
abbrev PermutationWord (n : ℕ) := {w : List ℕ // w.Perm (List.range (n + 1))}

noncomputable instance (n : ℕ) : Fintype (PermutationWord n) :=
  Fintype.subtype (List.range (n + 1)).permutations.toFinset
    (fun _ => by simp only [List.mem_toFinset, List.mem_permutations])

abbrev ClosedHistory (n : ℕ) := Σ p : HeightPath n 0, History p

namespace ClosedHistory

def word {n : ℕ} (H : ClosedHistory n) : PermutationWord n :=
  ⟨(History.blocks H.1 H.2).flatten, History.blocks_flatten_perm H.1 H.2⟩

theorem word_injective (n : ℕ) : Function.Injective (@word n) := by
  intro H J heq
  have hflatten := congrArg Subtype.val heq
  have hblocks : History.blocks H.1 H.2 = History.blocks J.1 J.2 := by
    obtain ⟨a, ha⟩ := List.length_eq_one_iff.mp (History.blocks_length H.1 H.2)
    obtain ⟨b, hb⟩ := List.length_eq_one_iff.mp (History.blocks_length J.1 J.2)
    have hab : a = b := by simpa only [word, ha, hb, List.flatten_cons,
      List.flatten_nil, List.append_nil] using hflatten
    rw [ha, hb, hab]
  have htotal : (⟨0, H⟩ : TotalHistory n) = ⟨0, J⟩ :=
    TotalHistory.blocks_injective n hblocks
  exact eq_of_heq (Sigma.mk.inj htotal).2

theorem word_surjective (n : ℕ) : Function.Surjective (@word n) := by
  intro w
  have hwlen : w.val.length = n + 1 := by
    simpa only [List.length_range] using w.property.length_eq
  have hwne : w.val ≠ [] := by
    intro h
    simp only [h, List.length_nil] at hwlen
    omega
  have hne : NonemptyBlocks [w.val] := by
    intro b hb
    have hb' : b = w.val := by simpa only [List.mem_singleton] using hb
    simpa only [hb'] using hwne
  have hp : [w.val].flatten.Perm (List.range (n + 1)) := by
    simpa only [List.flatten_cons, List.flatten_nil, List.append_nil] using w.property
  obtain ⟨h, p, H, hblocks⟩ := blocks_surjective [w.val] hne hp
  have hh : h = 0 := by
    have hlen := History.blocks_length p H
    rw [hblocks] at hlen
    simp only [List.length_cons, List.length_nil] at hlen
    omega
  subst h
  refine ⟨⟨p, H⟩, ?_⟩
  apply Subtype.ext
  change (History.blocks p H).flatten = w.val
  rw [hblocks]
  simp only [List.flatten_cons, List.flatten_nil, List.append_nil]

end ClosedHistory

/-- The literal all-permutation correspondence, proved in both directions. -/
noncomputable def closedHistoryPermutationEquiv (n : ℕ) :
    ClosedHistory n ≃ PermutationWord n :=
  Equiv.ofBijective ClosedHistory.word
    ⟨ClosedHistory.word_injective n, ClosedHistory.word_surjective n⟩

@[simp] theorem closedHistoryPermutationEquiv_apply (n : ℕ) (H : ClosedHistory n) :
    (closedHistoryPermutationEquiv n H).val = (History.blocks H.1 H.2).flatten := rfl

end GesselZhuang
