import Conjectures.CutPeriodWeightCoverTables

/-! Every smaller candidate value is attained by an actual allowed split.
Large quotient deficits are reduced to their parity; the two repeated high
quotients lift the finite template without changing its XOR. -/
namespace CutPeriod.Weight

theorem OneTemplate.realizes (t : OneTemplate) (w r x : Nat)
    (h : t.Valid w r) :
    ∃ p, AllowedArity p ∧ Piles p (12*x+w) (8*x+r) := by
  obtain ⟨ha,ht,hp,hw,hr⟩ := h
  have ht' : ∀ s∈t.tail, s.val<13 := by
    simpa only [List.all_eq_true,decide_eq_true_eq] using ht
  have hsplit := lift_one t.head t.tail x ha ht'
  change Piles t.word.length (12*x+templateWeight t.word)
    (8*x+templateLow t.word) at hsplit
  rw [hw,hr] at hsplit
  exact ⟨t.word.length,hp,hsplit⟩

theorem ThreeTemplate.realizes (t : ThreeTemplate) (w r x y : Nat)
    (h : t.Valid w r) :
    ∃ p, AllowedArity p ∧ Piles p (12*(x+(y+y))+w) (8*x+r) := by
  obtain ⟨ha,hb,hc,ht,hp,hw,hr⟩ := h
  have ht' : ∀ s∈t.tail, s.val<13 := by
    simpa only [List.all_eq_true,decide_eq_true_eq] using ht
  have hsplit := lift_three t.first t.second t.third t.tail x y ha hb hc ht'
  change Piles t.word.length (12*(x+(y+y))+templateWeight t.word)
    (8*x+templateLow t.word) at hsplit
  rw [hw,hr] at hsplit
  exact ⟨t.word.length,hp,hsplit⟩

theorem small_lower (n g : Nat) (hn : 0<n) (hn6 : n≤6) (hg : g<value n) :
    ∃ p, AllowedArity p ∧ Piles p n g := by
  have hvalue := small_value_bound ⟨n,by omega⟩
  change value n≤4 at hvalue
  have hg5 : g<5 := by omega
  obtain ⟨hpos,hp,hsum,hxor⟩ := small_valid ⟨n,by omega⟩ ⟨g,hg5⟩ hn hg
  have hpos' : ∀ a∈smallTemplate n g, 0<a := by
    simpa only [List.all_eq_true,decide_eq_true_eq] using hpos
  exact ⟨(smallTemplate n g).length,hp,smallTemplate n g,hpos',rfl,hsum,hxor⟩

theorem lower_option (n g : Nat) (hn : 0<n) (hg : g<value n) :
    ∃ p, AllowedArity p ∧ Piles p n g := by
  by_cases hn6 : n≤6
  · exact small_lower n g hn hn6 hg
  have hlarge : 7≤n := by omega
  obtain ⟨s,q,hq,hsize,hvalue⟩ := exists_shape n hn
  obtain ⟨hs11,hs12⟩ := nonatom_of_large s q n hlarge hq hsize
  let x := g/8
  let r : Fin 8 := ⟨g%8,Nat.mod_lt _ (by decide)⟩
  have hsplit : g=8*x+r.val := by
    dsimp only [x,r]
    omega
  have hlow := low_bound s
  have hr := r.isLt
  have hxq : x≤q := by omega
  by_cases hx0 : x=q
  · have hrlow : r.val<low s := by omega
    obtain ⟨p,hp,hpiles⟩ := OneTemplate.realizes (oneTemplate 0 s r)
      (weight s) r.val x (one_zero_valid s r hs11 hs12 hrlow)
    have hn' : 12*x+weight s=n := by omega
    have hg' : 8*x+r.val=g := hsplit.symm
    exact ⟨p,hp,by simpa only [hn',hg'] using hpiles⟩
  by_cases hx1 : x+1=q
  · obtain ⟨p,hp,hpiles⟩ := OneTemplate.realizes (oneTemplate 1 s r)
      (weight s+12) r.val x (one_one_valid s r hs11 hs12)
    have hn' : 12*x+(weight s+12)=n := by omega
    have hg' : 8*x+r.val=g := hsplit.symm
    exact ⟨p,hp,by simpa only [hn',hg'] using hpiles⟩
  have hgap : 2≤q-x := by omega
  let parity : Fin 2 := ⟨(q-x)%2,Nat.mod_lt _ (by decide)⟩
  let y := (q-x)/2-1
  have hquot : q=x+(y+y)+(2+parity.val) := by
    have hdiv := Nat.mod_add_div (q-x) 2
    have hrem := Nat.mod_lt (q-x) (by decide : 0<2)
    dsimp only [parity,y] at *
    omega
  obtain ⟨p,hp,hpiles⟩ := ThreeTemplate.realizes (threeTemplate parity s r)
    (weight s+12*(2+parity.val)) r.val x y (three_valid parity s r hs11 hs12)
  have hn' : 12*(x+(y+y))+(weight s+12*(2+parity.val))=n := by omega
  have hg' : 8*x+r.val=g := hsplit.symm
  exact ⟨p,hp,by simpa only [hn',hg'] using hpiles⟩

end CutPeriod.Weight
