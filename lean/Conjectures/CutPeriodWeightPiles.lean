import Conjectures.CutPeriodWeightShapes
import Conjectures.CutPeriodPiles

/-! Quotient/residue bookkeeping for actual positive split lists, and two
lifting constructions. Repeating a high quotient twice changes the sum by
twice that quotient and contributes zero to the XOR. -/
namespace CutPeriod.Weight

abbrev Piece := Shape × Nat

def pieceSize (a : Piece) : Nat := 12*a.2+weight a.1
def pieceValue (a : Piece) : Nat := 8*a.2+low a.1
def Legal (ps : List Piece) : Prop := ∀ a∈ps, Admissible a.1 a.2
def sumHigh (ps : List Piece) : Nat := (ps.map Prod.snd).sum
def sumWeight (ps : List Piece) : Nat := (ps.map fun a => weight a.1).sum
def xorHigh (ps : List Piece) : Nat := CutFamily.xorList (ps.map Prod.snd)
def xorLow (ps : List Piece) : Nat := CutFamily.xorList (ps.map fun a => low a.1)
def flexibleAny (ps : List Piece) : Bool := ps.any (fun a => flexible a.1)

@[simp] theorem sumHigh_nil : sumHigh []=0 := rfl
@[simp] theorem sumWeight_nil : sumWeight []=0 := rfl
@[simp] theorem xorHigh_nil : xorHigh []=0 := rfl
@[simp] theorem xorLow_nil : xorLow []=0 := rfl
@[simp] theorem flexibleAny_nil : flexibleAny []=false := rfl
@[simp] theorem sumHigh_cons (a : Piece) (ps : List Piece) :
    sumHigh (a::ps)=a.2+sumHigh ps := rfl
@[simp] theorem sumWeight_cons (a : Piece) (ps : List Piece) :
    sumWeight (a::ps)=weight a.1+sumWeight ps := rfl
@[simp] theorem xorHigh_cons (a : Piece) (ps : List Piece) :
    xorHigh (a::ps)=a.2 ^^^ xorHigh ps := rfl
@[simp] theorem xorLow_cons (a : Piece) (ps : List Piece) :
    xorLow (a::ps)=low a.1 ^^^ xorLow ps := rfl
@[simp] theorem flexibleAny_cons (a : Piece) (ps : List Piece) :
    flexibleAny (a::ps)=(flexible a.1 || flexibleAny ps) := rfl

theorem pieceValue_div (a : Piece) : pieceValue a/8=a.2 := by
  have h := low_bound a.1
  unfold pieceValue
  omega

theorem pieceValue_mod (a : Piece) : pieceValue a%8=low a.1 := by
  have h := low_bound a.1
  unfold pieceValue
  omega

theorem piece_values (ps : List Piece) (hlegal : Legal ps) :
    (ps.map pieceSize).map value=ps.map pieceValue := by
  induction ps with
  | nil => rfl
  | cons a ps ih =>
    have ha : value (pieceSize a)=pieceValue a :=
      shape_value a.1 a.2 (hlegal a (by simp))
    have ht : Legal ps := fun b hb => hlegal b (by simp [hb])
    simp only [List.map_cons,ha,ih ht]

theorem sum_pieceSize (ps : List Piece) :
    (ps.map pieceSize).sum=12*sumHigh ps+sumWeight ps := by
  induction ps with
  | nil => rfl
  | cons a ps ih =>
    simp only [List.map_cons,List.sum_cons,ih,sumHigh_cons,sumWeight_cons,pieceSize]
    omega

theorem xor_pieceValue (ps : List Piece) :
    CutFamily.xorList (ps.map pieceValue)=8*xorHigh ps+xorLow ps := by
  have hq := CutFamily.xorList_div_eight (ps.map pieceValue)
  have hr := CutFamily.xorList_mod_eight (ps.map pieceValue)
  simp only [List.map_map,Function.comp_def,pieceValue_div] at hq
  simp only [List.map_map,Function.comp_def,pieceValue_mod] at hr
  change CutFamily.xorList (ps.map pieceValue)/8=xorHigh ps at hq
  change CutFamily.xorList (ps.map pieceValue)%8=xorLow ps at hr
  have h := Nat.mod_add_div (CutFamily.xorList (ps.map pieceValue)) 8
  omega

theorem xorLow_bound (ps : List Piece) : xorLow ps<8 := by
  apply CutFamily.xorList_lt_pow _ 3
  intro r hr
  obtain ⟨a,_,rfl⟩ := List.mem_map.mp hr
  exact low_bound a.1

theorem xorHigh_le (ps : List Piece) : xorHigh ps≤sumHigh ps :=
  CutFamily.xorList_le_sum (ps.map Prod.snd)

theorem xorHigh_zero_of_rigid (ps : List Piece) (hlegal : Legal ps)
    (hflex : flexibleAny ps=false) : xorHigh ps=0 := by
  induction ps with
  | nil => rfl
  | cons a ps ih =>
    change (flexible a.1 || flexibleAny ps)=false at hflex
    have ha : flexible a.1=false := by
      cases he : flexible a.1 <;> simp_all
    have ht : flexibleAny ps=false := by
      simpa [ha] using hflex
    have hq := rigid_quotient a.1 a.2 (hlegal a (by simp)) ha
    have htail : Legal ps := fun b hb => hlegal b (by simp [hb])
    rw [xorHigh_cons,hq,Nat.zero_xor,ih htail ht]

theorem realize (ps : List Piece) (hlegal : Legal ps) :
    Piles ps.length (12*sumHigh ps+sumWeight ps) (8*xorHigh ps+xorLow ps) := by
  refine ⟨ps.map pieceSize,?_,List.length_map ..,sum_pieceSize ps,?_⟩
  · intro n hn
    obtain ⟨a,_,rfl⟩ := List.mem_map.mp hn
    have hw := (weight_bounds a.1).1
    unfold pieceSize
    omega
  · rw [piece_values ps hlegal,xor_pieceValue]

theorem decompose_list (l : List Nat) (hpos : ∀ n∈l, 0<n) :
    ∃ ps : List Piece, Legal ps ∧ ps.map pieceSize=l := by
  induction l with
  | nil => exact ⟨[],by simp [Legal],rfl⟩
  | cons n ns ih =>
    obtain ⟨s,q,hlegal,hsize,_⟩ := exists_shape n (hpos n (by simp))
    obtain ⟨ps,hps,hmap⟩ := ih (fun m hm => hpos m (by simp [hm]))
    refine ⟨(s,q)::ps,?_,?_⟩
    · intro a ha
      rcases List.mem_cons.mp ha with rfl | ha
      · exact hlegal
      · exact hps a ha
    · simp only [List.map_cons,hmap]
      exact congrArg (fun m => m::ns) hsize.symm

theorem piles_decomposition {p n g : Nat} (h : Piles p n g) :
    ∃ ps : List Piece, Legal ps ∧ ps.length=p ∧
      12*sumHigh ps+sumWeight ps=n ∧ 8*xorHigh ps+xorLow ps=g := by
  obtain ⟨l,hpos,hlen,hsum,hxor⟩ := h
  obtain ⟨ps,hlegal,hmap⟩ := decompose_list l hpos
  refine ⟨ps,hlegal,?_,?_,?_⟩
  · have hm := congrArg List.length hmap
    simp only [List.length_map] at hm
    omega
  · calc
      12*sumHigh ps+sumWeight ps=(ps.map pieceSize).sum := (sum_pieceSize ps).symm
      _=l.sum := congrArg List.sum hmap
      _=n := hsum
  · calc
      8*xorHigh ps+xorLow ps=CutFamily.xorList (ps.map pieceValue) :=
        (xor_pieceValue ps).symm
      _=CutFamily.xorList ((ps.map pieceSize).map value) := by rw [piece_values ps hlegal]
      _=CutFamily.xorList (l.map value) := by rw [hmap]
      _=g := hxor

def zeroPieces (ss : List Shape) : List Piece := ss.map fun s => (s,0)
def templateWeight (ss : List Shape) : Nat := (ss.map weight).sum
def templateLow (ss : List Shape) : Nat := CutFamily.xorList (ss.map low)

@[simp] theorem length_zeroPieces (ss : List Shape) :
    (zeroPieces ss).length=ss.length := List.length_map ..

@[simp] theorem sumHigh_zeroPieces (ss : List Shape) : sumHigh (zeroPieces ss)=0 := by
  induction ss with
  | nil => rfl
  | cons s ss ih =>
    change 0+sumHigh (zeroPieces ss)=0
    omega

@[simp] theorem xorHigh_zeroPieces (ss : List Shape) : xorHigh (zeroPieces ss)=0 := by
  induction ss with
  | nil => rfl
  | cons s ss ih =>
    change 0 ^^^ xorHigh (zeroPieces ss)=0
    simpa using ih

@[simp] theorem sumWeight_zeroPieces (ss : List Shape) :
    sumWeight (zeroPieces ss)=templateWeight ss := by
  simp [sumWeight,zeroPieces,templateWeight,List.map_map,Function.comp_def]

@[simp] theorem xorLow_zeroPieces (ss : List Shape) :
    xorLow (zeroPieces ss)=templateLow ss := by
  simp [xorLow,zeroPieces,templateLow,List.map_map,Function.comp_def]

theorem legal_zeroPieces (ss : List Shape) (hs : ∀ s∈ss, s.val<13) :
    Legal (zeroPieces ss) := by
  intro a ha
  obtain ⟨s,hs',rfl⟩ := List.mem_map.mp ha
  exact admissible_zero s (hs s hs')

theorem lift_one (a : Shape) (tail : List Shape) (x : Nat)
    (ha : a.val<11) (ht : ∀ s∈tail, s.val<13) :
    Piles (a::tail).length
      (12*x+templateWeight (a::tail)) (8*x+templateLow (a::tail)) := by
  have hlegal : Legal ((a,x)::zeroPieces tail) := by
    intro p hp
    rcases List.mem_cons.mp hp with rfl | hp
    · exact admissible_ray a x ha
    · exact legal_zeroPieces tail ht p hp
  have h := realize ((a,x)::zeroPieces tail) hlegal
  simpa only [List.length_cons,length_zeroPieces,sumHigh_cons,sumHigh_zeroPieces,
    Nat.add_zero,xorHigh_cons,xorHigh_zeroPieces,Nat.xor_zero,sumWeight_cons,
    sumWeight_zeroPieces,xorLow_cons,xorLow_zeroPieces,templateWeight,
    templateLow,List.map_cons,List.sum_cons,CutFamily.xorList] using h

theorem lift_three (a b c : Shape) (tail : List Shape) (x y : Nat)
    (ha : a.val<11) (hb : b.val<11) (hc : c.val<11)
    (ht : ∀ s∈tail, s.val<13) :
    Piles (a::b::c::tail).length
      (12*(x+(y+y))+templateWeight (a::b::c::tail))
      (8*x+templateLow (a::b::c::tail)) := by
  have hlegal : Legal ((a,x)::(b,y)::(c,y)::zeroPieces tail) := by
    intro p hp
    rcases List.mem_cons.mp hp with rfl | hp
    · exact admissible_ray a x ha
    rcases List.mem_cons.mp hp with rfl | hp
    · exact admissible_ray b y hb
    rcases List.mem_cons.mp hp with rfl | hp
    · exact admissible_ray c y hc
    · exact legal_zeroPieces tail ht p hp
  have h := realize ((a,x)::(b,y)::(c,y)::zeroPieces tail) hlegal
  simpa only [List.length_cons,length_zeroPieces,sumHigh_cons,sumHigh_zeroPieces,
    Nat.add_zero,xorHigh_cons,xorHigh_zeroPieces,Nat.xor_zero,Nat.xor_self,
    sumWeight_cons,sumWeight_zeroPieces,xorLow_cons,xorLow_zeroPieces,
    templateWeight,templateLow,List.map_cons,List.sum_cons,CutFamily.xorList] using h

end CutPeriod.Weight
