import Init

/-!
# Hegyvári's conjecture: binary-mark transport

Combinatorial reductions in Sections 2–3 of the existing proof
(results/hegyvari-floor-doubling/PROOF.md). This module does not assert
the conjecture itself: the tower, floor-digit, and sumset bridges remain open.
-/
namespace HegyvariFloorDoubling

def UnboundedMarks (d : Nat → Bool) : Prop :=
  ∀ n, ∃ m, n ≤ m ∧ d m = true

def BoundedGaps (d : Nat → Bool) : Prop :=
  ∃ H : Nat, 0 < H ∧ ∀ n, ∃ m, n ≤ m ∧ m < n + H ∧ d m = true

def ForwardTransport (u v : Nat → Bool) : Prop :=
  ∃ s M N : Nat, 0 < s ∧ 0 < M ∧
    ∀ a, N ≤ a → u a = true →
      ∃ b, a + s ≤ b ∧ b < a + s + M ∧ v b = true

theorem transport_comp {u v w : Nat → Bool}
    (huv : ForwardTransport u v) (hvw : ForwardTransport v w) :
    ForwardTransport u w := by
  rcases huv with ⟨s, M, N, hs, hM, h⟩
  rcases hvw with ⟨t, K, P, ht, hK, h'⟩
  refine ⟨s + t, M + K, max N P, by omega, by omega, ?_⟩
  intro a ha hua
  have haN : N ≤ a := by omega
  have haP : P ≤ a := by omega
  rcases h a haN hua with ⟨b, hab, hbM, hbv⟩
  rcases h' b (by omega) hbv with ⟨c, hbc, hcK, hcw⟩
  exact ⟨c, by omega, by omega, hcw⟩

/-- A positive bounded forward return from every sufficiently late mark,
together with arbitrarily late marks, bounds every zero run. -/
theorem boundedGaps_of_selfTransport {u : Nat → Bool}
    (hu : UnboundedMarks u) (hret : ForwardTransport u u) :
    BoundedGaps u := by
  rcases hret with ⟨s, M, N, hs, hM, h⟩
  rcases hu N with ⟨a, haN, hua⟩
  have tail : ∀ n, a ≤ n →
      ∃ m, n ≤ m ∧ m < n + (s + M) ∧ u m = true := by
    intro n
    induction n with
    | zero =>
      intro hn
      exact ⟨a, by omega, by omega, hua⟩
    | succ n ih =>
      intro hn
      by_cases hna : a ≤ n
      · rcases ih hna with ⟨m, hnm, hm, hum⟩
        by_cases hmn : m = n
        · subst m
          rcases h n (by omega) hum with ⟨b, hb1, hb2, hub⟩
          exact ⟨b, by omega, by omega, hub⟩
        · exact ⟨m, by omega, by omega, hum⟩
      · exact ⟨a, by omega, by omega, hua⟩
  refine ⟨a + s + M, by omega, ?_⟩
  intro n
  by_cases hn : a ≤ n
  · rcases tail n hn with ⟨m, hm1, hm2, hum⟩
    exact ⟨m, hm1, by omega, hum⟩
  · exact ⟨a, by omega, by omega, hua⟩

/-- Case I of Section 3, once the two tower-derived transports are supplied. -/
theorem boundedGaps_of_two_transports {u v : Nat → Bool}
    (hu : UnboundedMarks u) (huv : ForwardTransport u v)
    (hvu : ForwardTransport v u) : BoundedGaps u :=
  boundedGaps_of_selfTransport hu (transport_comp huv hvu)

/-- In Case II, a sufficiently long run of zero digits immediately after
a mark in the first ray forces a mark at the same place in the second ray. -/
def LongRunMarkResponse (u v : Nat → Bool) : Prop :=
  ∀ K : Nat, ∃ H : Nat, K ≤ H ∧
    ∀ a, u a = true →
      (∀ j, a < j → j ≤ a + H → u j = false) → v a = true

/-- Case II, first step: combine the odd-ratio mark response with the
transport from the second ray to the first. -/
theorem boundedGaps_of_longRun_response {u v : Nat → Bool}
    (hu : UnboundedMarks u) (hvu : ForwardTransport v u)
    (hresp : LongRunMarkResponse u v) : BoundedGaps u := by
  rcases hvu with ⟨s, M, N, hs, hM, h⟩
  rcases hresp (s + M) with ⟨H, hH, hresponse⟩
  apply boundedGaps_of_selfTransport hu
  refine ⟨1, H, N, by omega, by omega, ?_⟩
  intro a ha hua
  by_cases hex : ∃ j, a + 1 ≤ j ∧ j < a + 1 + H ∧ u j = true
  · exact hex
  · have hz : ∀ j, a < j → j ≤ a + H → u j = false := by
      intro j hj1 hj2
      cases hval : u j with
      | false => rfl
      | true =>
        exact False.elim (hex ⟨j, by omega, by omega, hval⟩)
    have hva := hresponse a hua hz
    rcases h a ha hva with ⟨b, hb1, hb2, hub⟩
    exact ⟨b, by omega, by omega, hub⟩

/-- An integer ray obtained by doubling and adding one binary digit. -/
def BinaryStep (f : Nat → Nat) (d : Nat → Bool) : Prop :=
  ∀ n, f (n + 1) = 2 * f n + (if d n then 1 else 0)

theorem binaryStep_lower {f : Nat → Nat} {d : Nat → Bool}
    (h : BinaryStep f d) (a H : Nat) :
    2 ^ H * f a ≤ f (a + H) := by
  induction H with
  | zero => simp
  | succ H ih =>
    calc
      2 ^ (H + 1) * f a = 2 * (2 ^ H * f a) := by
        rw [Nat.pow_succ]
        ac_rfl
      _ ≤ 2 * f (a + H) := Nat.mul_le_mul_left 2 ih
      _ ≤ f (a + (H + 1)) := by
        rw [← Nat.add_assoc, h]
        omega

theorem zeroRun_expansion {f : Nat → Nat} {d : Nat → Bool}
    (h : BinaryStep f d) (a H : Nat)
    (hz : ∀ j, a ≤ j → j < a + H → d j = false) :
    f (a + H) = 2 ^ H * f a := by
  induction H with
  | zero => simp
  | succ H ih =>
    have he := ih (fun j hj1 hj2 => hz j hj1 (by omega))
    have hlast : d (a + H) = false := hz (a + H) (by omega) (by omega)
    calc
      f (a + (H + 1)) = 2 * f (a + H) := by
        rw [← Nat.add_assoc, h, hlast]
        simp
      _ = 2 ^ (H + 1) * f a := by
        rw [he, Nat.pow_succ]
        ac_rfl

/-- The odd-integer-ratio digit argument in Section 3, abstracted to integer
rays with the exact floor-multiplication carry bounds. The real floor-to-ray
identification is not included here. -/
theorem oddMultiplier_response {f g : Nat → Nat} {u v : Nat → Bool}
    {l : Nat} (hl : l % 2 = 1)
    (hf : BinaryStep f u) (hg : BinaryStep g v)
    (bounds : ∀ n, l * f n ≤ g n ∧ g n < l * f n + l) :
    LongRunMarkResponse u v := by
  intro K
  let H := K + l
  have hp : ∀ n : Nat, n + 1 ≤ 2 ^ n := by
    intro n
    induction n with
    | zero => decide
    | succ n ih =>
      rw [Nat.pow_succ]
      omega
  have hHL : l ≤ 2 ^ H := by
    have h := hp H
    omega
  refine ⟨H, by omega, ?_⟩
  intro a hua hz
  have hfeq := zeroRun_expansion hf (a + 1) H
    (fun j hj1 hj2 => hz j (by omega) (by omega))
  have hlower := binaryStep_lower hg (a + 1) H
  have hupper := (bounds (a + 1 + H)).2
  have hge := (bounds (a + 1)).1
  have hstart : g (a + 1) = l * f (a + 1) := by
    by_cases heq : g (a + 1) = l * f (a + 1)
    · exact heq
    · have hs : l * f (a + 1) + 1 ≤ g (a + 1) := by omega
      have hm := Nat.mul_le_mul_left (2 ^ H) hs
      rw [Nat.mul_add, Nat.mul_one] at hm
      have hreorder : l * (2 ^ H * f (a + 1)) =
          2 ^ H * (l * f (a + 1)) := by ac_rfl
      rw [hfeq, hreorder] at hupper
      omega
  have hfa := hf a
  rw [hua] at hfa
  simp at hfa
  have hfmod : f (a + 1) % 2 = 1 := by omega
  have hgmod : g (a + 1) % 2 = 1 := by
    rw [hstart, Nat.mul_mod, hl, hfmod]
  have hga := hg a
  cases hv : v a with
  | false =>
    rw [hv] at hga
    simp at hga
    omega
  | true => rfl

theorem boundedGaps_of_oddMultiplier {f g : Nat → Nat} {u v : Nat → Bool}
    {l : Nat} (hl : l % 2 = 1) (hf : BinaryStep f u) (hg : BinaryStep g v)
    (bounds : ∀ n, l * f n ≤ g n ∧ g n < l * f n + l)
    (hu : UnboundedMarks u) (hvu : ForwardTransport v u) :
    BoundedGaps u :=
  boundedGaps_of_longRun_response hu hvu (oddMultiplier_response hl hf hg bounds)

end HegyvariFloorDoubling
