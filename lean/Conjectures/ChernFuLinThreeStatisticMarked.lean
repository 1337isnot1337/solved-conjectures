import Conjectures.ChernFuLinThreeStatisticWeights

/-! # Recovering the full marked distribution by length induction

A bit at a position means that the position is a left-to-right minimum. The
last set bit is the position of the global minimum. All terms of the minimum
recurrence use strictly shorter bit strings, including the term that replaces
the final (unmarked) letter of the collapsed core.
-/

namespace Conjectures.ChernFuLinThreeStatistic

open BursteinA218225

variable {R : Type*} [CommRing R]

noncomputable def scalar (F : List Bool → R) (n : ℕ) : R :=
  ∑ w : Fin n → Bool, F (List.ofFn w)

noncomputable def tails (F : List Bool → R) (n : ℕ) : R :=
  scalar F n + ∑ p ∈ Finset.antidiagonal n, scalar F p.1 * scalar F p.2

/-- The common marked recurrence, after the identification `T = R + R²`.
`iz` is the reciprocal of the right-maximum weight in the application. -/
structure MarkedRecurrence (F : List Bool → R) (t z iz : R) : Prop where
  unmarked : ∀ n, F (List.replicate n false) = 0
  singleton : F [true] = z
  first : ∀ n, F (true :: List.replicate (n+1) false) = scalar F (n+1)
  last : ∀ u, u ≠ [] → F (u ++ [true]) = t*F u*z
  middle : ∀ u, u ≠ [] → ∀ n, F (u ++ true :: List.replicate (n+1) false) =
    t*F u*scalar F (n+1) + t*iz*F (u ++ [false])*tails F (n+1)

private theorem last_mark (w : List Bool) :
    (∃ n, w = List.replicate n false) ∨ ∃ u n, w = u ++ true :: List.replicate n false := by
  induction w with
  | nil => exact Or.inl ⟨0,rfl⟩
  | cons b w ih =>
    rcases ih with ⟨n,rfl⟩ | ⟨u,n,rfl⟩
    · cases b
      · exact Or.inl ⟨n+1,rfl⟩
      · exact Or.inr ⟨[],n,rfl⟩
    · exact Or.inr ⟨b::u,n,rfl⟩

theorem marked_unique {F G : List Bool → R} {t z iz : R}
    (hF : MarkedRecurrence F t z iz) (hG : MarkedRecurrence G t z iz) : F = G := by
  suffices ∀ n w, w.length = n → F w = G w by exact funext fun w => this _ _ rfl
  intro n
  induction n using Nat.strong_induction_on with
  | h n ih =>
    have hs (k : ℕ) (hk : k<n) : scalar F k = scalar G k := by
      unfold scalar; exact Finset.sum_congr rfl fun w _ => ih k hk (List.ofFn w) List.length_ofFn
    have ht (k : ℕ) (hk : k<n) : tails F k = tails G k := by
      unfold tails; rw [hs k hk]; congr 1
      apply Finset.sum_congr rfl
      rintro ⟨a,b⟩ hab; have := Finset.mem_antidiagonal.mp hab
      change scalar F a * scalar F b = _
      rw [hs a (by omega),hs b (by omega)]
    intro w hw
    rcases last_mark w with ⟨m,rfl⟩ | ⟨u,m,rfl⟩
    · rw [hF.unmarked,hG.unmarked]
    · simp only [List.length_append,List.length_cons,List.length_replicate] at hw
      cases u with
      | nil =>
        cases m with
        | zero => exact hF.singleton.trans hG.singleton.symm
        | succ j => exact (hF.first j).trans ((hs _ (by simp at hw; omega)).trans (hG.first j).symm)
      | cons b u =>
        simp only [List.length_cons] at hw
        have hU : F (b::u) = G (b::u) := ih _ (by simp; omega) _ rfl
        cases m with
        | zero => rw [show List.replicate 0 false = [] from rfl,hF.last (b::u) (by simp),
            hG.last (b::u) (by simp),hU]
        | succ j =>
          rw [hF.middle (b::u) (by simp),hG.middle (b::u) (by simp),hU,
            hs _ (by omega),ht _ (by omega),ih ((b::u)++[false]).length (by simp; omega) _ rfl]

def markedPositions (w : List Bool) : Finset (Fin w.length) :=
  Finset.univ.filter fun i : Fin w.length => w[i.val]

noncomputable def markWeight (zClass : Bool) (w : List Bool) : WeightField :=
  if w = [] then 0 else markedWeight (if zClass then InZ else InX) (markedPositions w)

private theorem cast_marked {n m : ℕ} (h : n=m) (z : Bool) (L : Finset (Fin n)) :
    markedWeight (if z then InZ else InX) L =
      markedWeight (if z then InZ else InX) (L.map (finCongr h).toEmbedding) := by
  subst m
  have hL : L.map (finCongr (rfl : n=n)).toEmbedding = L := Finset.ext fun i => by simp
  rw [hL]

private theorem empty_fibre (L : Finset (Fin 0)) (r d : ℕ) :
    fibreCount InX L r d = fibreCount InZ L r d := by
  have h : @InX 0 = @InZ 0 := by
    funext π; apply propext
    have hno {k} (hk : 0<k) (τ : Fin k → ℕ) : ¬ ContainsPattern π τ :=
      fun ⟨f,_,_⟩ => Fin.elim0 (f ⟨0,hk⟩)
    exact ⟨fun h => ⟨hno (by decide) _,h.2⟩,fun h => ⟨hno (by decide) _,h.2⟩⟩
  rw [h]

theorem equidistributed_of_marked_recurrences {t z iz : WeightField}
    (hX : MarkedRecurrence (markWeight false) t z iz)
    (hZ : MarkedRecurrence (markWeight true) t z iz) : Equidistributed := by
  apply equidistributed_iff_markedWeight.mpr
  intro n L
  cases n with
  | zero =>
    apply congrArg (algebraMap WeightRing WeightField); apply Polynomial.ext; intro d
    apply Polynomial.ext; intro r; rw [markedPolynomial_coeff,markedPolynomial_coeff,empty_fibre]
  | succ n =>
    let w := List.ofFn fun i : Fin (n+1) => decide (i ∈ L)
    have hw : w.length = n+1 := List.length_ofFn
    have hL : (markedPositions w).map (finCongr hw).toEmbedding = L := by
      ext i; rw [Finset.mem_map]; constructor
      · rintro ⟨j,hj,rfl⟩
        change (⟨j.val,by omega⟩ : Fin (n+1)) ∈ L
        simpa only [markedPositions,Finset.mem_filter,Finset.mem_univ,
          true_and,w,List.getElem_ofFn,decide_eq_true_eq] using hj
      · intro hi; refine ⟨Fin.cast hw.symm i,?_,by simp⟩
        simpa only [markedPositions,Finset.mem_filter,Finset.mem_univ,true_and,w,List.getElem_ofFn,
          decide_eq_true_eq,Fin.val_cast,Fin.eta] using hi
    have he := congrFun (marked_unique hX hZ) w
    have hn : w ≠ [] := fun e => by simp [e] at hw
    simp only [markWeight,hn,ite_false,Bool.false_eq_true,ite_true] at he
    calc
      _ = markedWeight InX (markedPositions w) := by simpa [hL] using (cast_marked hw false (markedPositions w)).symm
      _ = markedWeight InZ (markedPositions w) := he
      _ = _ := by simpa [hL] using cast_marked hw true (markedPositions w)

end Conjectures.ChernFuLinThreeStatistic
