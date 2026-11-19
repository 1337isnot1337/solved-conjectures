import Conjectures.FiniteCertificate
import Conjectures.EgyptianBounds

/-! Kernel-reduced exhaustive certificates for the finitely many small k.
The soundness proof establishes complete denominator bounds from the fraction
 equation; the certificate does not assume a numerical search is exhaustive. -/
namespace Egyptian

instance (p q x y z : Nat) : Decidable (Triple p q x y z) := by
  unfold Triple
  infer_instance

def greedyX (k : Nat) : Nat := k/5+1
def greedyY (k : Nat) : Nat := k*greedyX k / (5*greedyX k-k)+1
def greedyZ (k : Nat) : Nat :=
  k*greedyX k*greedyY k / ((5*greedyX k-k)*greedyY k-k*greedyX k)

def smallPairCheck (k x y : Nat) : Bool :=
  let d := (5*x-k)*y-k*x
  let z := k*x*y/d
  if 0<d ∧ k*x*y%d=0 ∧ y<z then
    decide (z ≤ greedyZ k ∧ (z=greedyZ k → x=greedyX k ∧ y=greedyY k))
  else true

def smallCheck (k : Nat) : Bool :=
  (List.range (3*k/5+1)).all (fun x =>
    if k<5*x then
      (List.range (2*k*x/(5*x-k)+1)).all (fun y =>
        if x<y ∧ k*x<(5*x-k)*y then smallPairCheck k x y else true)
    else true)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

private theorem small_certificate_0 : (0 : Nat)%5 ≠ 1 → smallCheck 0=true := by decide
private theorem small_certificate_1 : (1 : Nat)%5 ≠ 1 → smallCheck 1=true := by decide
private theorem small_certificate_2 : (2 : Nat)%5 ≠ 1 → smallCheck 2=true := by decide
private theorem small_certificate_3 : (3 : Nat)%5 ≠ 1 → smallCheck 3=true := by decide
private theorem small_certificate_4 : (4 : Nat)%5 ≠ 1 → smallCheck 4=true := by decide
private theorem small_certificate_5 : (5 : Nat)%5 ≠ 1 → smallCheck 5=true := by decide
private theorem small_certificate_6 : (6 : Nat)%5 ≠ 1 → smallCheck 6=true := by decide
private theorem small_certificate_7 : (7 : Nat)%5 ≠ 1 → smallCheck 7=true := by decide
private theorem small_certificate_8 : (8 : Nat)%5 ≠ 1 → smallCheck 8=true := by decide
private theorem small_certificate_9 : (9 : Nat)%5 ≠ 1 → smallCheck 9=true := by decide
private theorem small_certificate_10 : (10 : Nat)%5 ≠ 1 → smallCheck 10=true := by decide
private theorem small_certificate_11 : (11 : Nat)%5 ≠ 1 → smallCheck 11=true := by decide
private theorem small_certificate_12 : (12 : Nat)%5 ≠ 1 → smallCheck 12=true := by decide
private theorem small_certificate_13 : (13 : Nat)%5 ≠ 1 → smallCheck 13=true := by decide
private theorem small_certificate_14 : (14 : Nat)%5 ≠ 1 → smallCheck 14=true := by decide
private theorem small_certificate_15 : (15 : Nat)%5 ≠ 1 → smallCheck 15=true := by decide
private theorem small_certificate_16 : (16 : Nat)%5 ≠ 1 → smallCheck 16=true := by decide
private theorem small_certificate_17 : (17 : Nat)%5 ≠ 1 → smallCheck 17=true := by decide
private theorem small_certificate_18 : (18 : Nat)%5 ≠ 1 → smallCheck 18=true := by decide
private theorem small_certificate_19 : (19 : Nat)%5 ≠ 1 → smallCheck 19=true := by decide
private theorem small_certificate_20 : (20 : Nat)%5 ≠ 1 → smallCheck 20=true := by decide
private theorem small_certificate_21 : (21 : Nat)%5 ≠ 1 → smallCheck 21=true := by decide
private theorem small_certificate_22 : (22 : Nat)%5 ≠ 1 → smallCheck 22=true := by decide
private theorem small_certificate_23 : (23 : Nat)%5 ≠ 1 → smallCheck 23=true := by decide
private theorem small_certificate_24 : (24 : Nat)%5 ≠ 1 → smallCheck 24=true := by decide
private theorem small_certificate_25 : (25 : Nat)%5 ≠ 1 → smallCheck 25=true := by decide
private theorem small_certificate_26 : (26 : Nat)%5 ≠ 1 → smallCheck 26=true := by decide
private theorem small_certificate_27 : (27 : Nat)%5 ≠ 1 → smallCheck 27=true := by decide
private theorem small_certificate_28 : (28 : Nat)%5 ≠ 1 → smallCheck 28=true := by decide
private theorem small_certificate_29 : (29 : Nat)%5 ≠ 1 → smallCheck 29=true := by decide
private theorem small_certificate_30 : (30 : Nat)%5 ≠ 1 → smallCheck 30=true := by decide
private theorem small_certificate_31 : (31 : Nat)%5 ≠ 1 → smallCheck 31=true := by decide
private theorem small_certificate_32 : (32 : Nat)%5 ≠ 1 → smallCheck 32=true := by decide
private theorem small_certificate_33 : (33 : Nat)%5 ≠ 1 → smallCheck 33=true := by decide
private theorem small_certificate_34 : (34 : Nat)%5 ≠ 1 → smallCheck 34=true := by decide
private theorem small_certificate_35 : (35 : Nat)%5 ≠ 1 → smallCheck 35=true := by decide
private theorem small_certificate_36 : (36 : Nat)%5 ≠ 1 → smallCheck 36=true := by decide
private theorem small_certificate_37 : (37 : Nat)%5 ≠ 1 → smallCheck 37=true := by decide
private theorem small_certificate_38 : (38 : Nat)%5 ≠ 1 → smallCheck 38=true := by decide
private theorem small_certificate_39 : (39 : Nat)%5 ≠ 1 → smallCheck 39=true := by decide
private theorem small_certificate_40 : (40 : Nat)%5 ≠ 1 → smallCheck 40=true := by decide
private theorem small_certificate_41 : (41 : Nat)%5 ≠ 1 → smallCheck 41=true := by decide
private theorem small_certificate_42 : (42 : Nat)%5 ≠ 1 → smallCheck 42=true := by decide
private theorem small_certificate_43 : (43 : Nat)%5 ≠ 1 → smallCheck 43=true := by decide
private theorem small_certificate_44 : (44 : Nat)%5 ≠ 1 → smallCheck 44=true := by decide
private theorem small_certificate_45 : (45 : Nat)%5 ≠ 1 → smallCheck 45=true := by decide
private theorem small_certificate_46 : (46 : Nat)%5 ≠ 1 → smallCheck 46=true := by decide
private theorem small_certificate_47 : (47 : Nat)%5 ≠ 1 → smallCheck 47=true := by decide
private theorem small_certificate_48 : (48 : Nat)%5 ≠ 1 → smallCheck 48=true := by decide
private theorem small_certificate_49 : (49 : Nat)%5 ≠ 1 → smallCheck 49=true := by decide
private theorem small_certificate_50 : (50 : Nat)%5 ≠ 1 → smallCheck 50=true := by decide
private theorem small_certificate_51 : (51 : Nat)%5 ≠ 1 → smallCheck 51=true := by decide
private theorem small_certificate_52 : (52 : Nat)%5 ≠ 1 → smallCheck 52=true := by decide
private theorem small_certificate_53 : (53 : Nat)%5 ≠ 1 → smallCheck 53=true := by decide
private theorem small_certificate_54 : (54 : Nat)%5 ≠ 1 → smallCheck 54=true := by decide
private theorem small_certificate_55 : (55 : Nat)%5 ≠ 1 → smallCheck 55=true := by decide
private theorem small_certificate_56 : (56 : Nat)%5 ≠ 1 → smallCheck 56=true := by decide
private theorem small_certificate_57 : (57 : Nat)%5 ≠ 1 → smallCheck 57=true := by decide
private theorem small_certificate_58 : (58 : Nat)%5 ≠ 1 → smallCheck 58=true := by decide
private theorem small_certificate_59 : (59 : Nat)%5 ≠ 1 → smallCheck 59=true := by decide
private theorem small_certificate_60 : (60 : Nat)%5 ≠ 1 → smallCheck 60=true := by decide
private theorem small_certificate_61 : (61 : Nat)%5 ≠ 1 → smallCheck 61=true := by decide
private theorem small_certificate_62 : (62 : Nat)%5 ≠ 1 → smallCheck 62=true := by decide
private theorem small_certificate_63 : (63 : Nat)%5 ≠ 1 → smallCheck 63=true := by decide
private theorem small_certificate_64 : (64 : Nat)%5 ≠ 1 → smallCheck 64=true := by decide
private theorem small_certificate_65 : (65 : Nat)%5 ≠ 1 → smallCheck 65=true := by decide
private theorem small_certificate_66 : (66 : Nat)%5 ≠ 1 → smallCheck 66=true := by decide
private theorem small_certificate_67 : (67 : Nat)%5 ≠ 1 → smallCheck 67=true := by decide
private theorem small_certificate_68 : (68 : Nat)%5 ≠ 1 → smallCheck 68=true := by decide
private theorem small_certificate_69 : (69 : Nat)%5 ≠ 1 → smallCheck 69=true := by decide
private theorem small_certificate_70 : (70 : Nat)%5 ≠ 1 → smallCheck 70=true := by decide
private theorem small_certificate_71 : (71 : Nat)%5 ≠ 1 → smallCheck 71=true := by decide
private theorem small_certificate_72 : (72 : Nat)%5 ≠ 1 → smallCheck 72=true := by decide
private theorem small_certificate_73 : (73 : Nat)%5 ≠ 1 → smallCheck 73=true := by decide
private theorem small_certificate_74 : (74 : Nat)%5 ≠ 1 → smallCheck 74=true := by decide
private theorem small_certificate_75 : (75 : Nat)%5 ≠ 1 → smallCheck 75=true := by decide
private theorem small_certificate_76 : (76 : Nat)%5 ≠ 1 → smallCheck 76=true := by decide
private theorem small_certificate_77 : (77 : Nat)%5 ≠ 1 → smallCheck 77=true := by decide
private theorem small_certificate_78 : (78 : Nat)%5 ≠ 1 → smallCheck 78=true := by decide
private theorem small_certificate_79 : (79 : Nat)%5 ≠ 1 → smallCheck 79=true := by decide
private theorem small_certificate_80 : (80 : Nat)%5 ≠ 1 → smallCheck 80=true := by decide
private theorem small_certificate_81 : (81 : Nat)%5 ≠ 1 → smallCheck 81=true := by decide
private theorem small_certificate_82 : (82 : Nat)%5 ≠ 1 → smallCheck 82=true := by decide
private theorem small_certificate_83 : (83 : Nat)%5 ≠ 1 → smallCheck 83=true := by decide
private theorem small_certificate_84 : (84 : Nat)%5 ≠ 1 → smallCheck 84=true := by decide
private theorem small_certificate_85 : (85 : Nat)%5 ≠ 1 → smallCheck 85=true := by decide
private theorem small_certificate_86 : (86 : Nat)%5 ≠ 1 → smallCheck 86=true := by decide
private theorem small_certificate_87 : (87 : Nat)%5 ≠ 1 → smallCheck 87=true := by decide
private theorem small_certificate_88 : (88 : Nat)%5 ≠ 1 → smallCheck 88=true := by decide
private theorem small_certificate_89 : (89 : Nat)%5 ≠ 1 → smallCheck 89=true := by decide
private theorem small_certificate_90 : (90 : Nat)%5 ≠ 1 → smallCheck 90=true := by decide
private theorem small_certificate_91 : (91 : Nat)%5 ≠ 1 → smallCheck 91=true := by decide
private theorem small_certificate_92 : (92 : Nat)%5 ≠ 1 → smallCheck 92=true := by decide
private theorem small_certificate_93 : (93 : Nat)%5 ≠ 1 → smallCheck 93=true := by decide
private theorem small_certificate_94 : (94 : Nat)%5 ≠ 1 → smallCheck 94=true := by decide
private theorem small_certificate_95 : (95 : Nat)%5 ≠ 1 → smallCheck 95=true := by decide
private theorem small_certificate_96 : (96 : Nat)%5 ≠ 1 → smallCheck 96=true := by decide
private theorem small_certificate_97 : (97 : Nat)%5 ≠ 1 → smallCheck 97=true := by decide
private theorem small_certificate_98 : (98 : Nat)%5 ≠ 1 → smallCheck 98=true := by decide
private theorem small_certificate_99 : (99 : Nat)%5 ≠ 1 → smallCheck 99=true := by decide

theorem small_certificate : ∀ k : Fin 100, k.val%5 ≠ 1 → smallCheck k.val=true :=
  FiniteCertificate.checked_list_rows [⟨0,small_certificate_0⟩,⟨1,small_certificate_1⟩,⟨2,small_certificate_2⟩,⟨3,small_certificate_3⟩,⟨4,small_certificate_4⟩,⟨5,small_certificate_5⟩,⟨6,small_certificate_6⟩,⟨7,small_certificate_7⟩,⟨8,small_certificate_8⟩,⟨9,small_certificate_9⟩,⟨10,small_certificate_10⟩,⟨11,small_certificate_11⟩,⟨12,small_certificate_12⟩,⟨13,small_certificate_13⟩,⟨14,small_certificate_14⟩,⟨15,small_certificate_15⟩,⟨16,small_certificate_16⟩,⟨17,small_certificate_17⟩,⟨18,small_certificate_18⟩,⟨19,small_certificate_19⟩,⟨20,small_certificate_20⟩,⟨21,small_certificate_21⟩,⟨22,small_certificate_22⟩,⟨23,small_certificate_23⟩,⟨24,small_certificate_24⟩,⟨25,small_certificate_25⟩,⟨26,small_certificate_26⟩,⟨27,small_certificate_27⟩,⟨28,small_certificate_28⟩,⟨29,small_certificate_29⟩,⟨30,small_certificate_30⟩,⟨31,small_certificate_31⟩,⟨32,small_certificate_32⟩,⟨33,small_certificate_33⟩,⟨34,small_certificate_34⟩,⟨35,small_certificate_35⟩,⟨36,small_certificate_36⟩,⟨37,small_certificate_37⟩,⟨38,small_certificate_38⟩,⟨39,small_certificate_39⟩,⟨40,small_certificate_40⟩,⟨41,small_certificate_41⟩,⟨42,small_certificate_42⟩,⟨43,small_certificate_43⟩,⟨44,small_certificate_44⟩,⟨45,small_certificate_45⟩,⟨46,small_certificate_46⟩,⟨47,small_certificate_47⟩,⟨48,small_certificate_48⟩,⟨49,small_certificate_49⟩,⟨50,small_certificate_50⟩,⟨51,small_certificate_51⟩,⟨52,small_certificate_52⟩,⟨53,small_certificate_53⟩,⟨54,small_certificate_54⟩,⟨55,small_certificate_55⟩,⟨56,small_certificate_56⟩,⟨57,small_certificate_57⟩,⟨58,small_certificate_58⟩,⟨59,small_certificate_59⟩,⟨60,small_certificate_60⟩,⟨61,small_certificate_61⟩,⟨62,small_certificate_62⟩,⟨63,small_certificate_63⟩,⟨64,small_certificate_64⟩,⟨65,small_certificate_65⟩,⟨66,small_certificate_66⟩,⟨67,small_certificate_67⟩,⟨68,small_certificate_68⟩,⟨69,small_certificate_69⟩,⟨70,small_certificate_70⟩,⟨71,small_certificate_71⟩,⟨72,small_certificate_72⟩,⟨73,small_certificate_73⟩,⟨74,small_certificate_74⟩,⟨75,small_certificate_75⟩,⟨76,small_certificate_76⟩,⟨77,small_certificate_77⟩,⟨78,small_certificate_78⟩,⟨79,small_certificate_79⟩,⟨80,small_certificate_80⟩,⟨81,small_certificate_81⟩,⟨82,small_certificate_82⟩,⟨83,small_certificate_83⟩,⟨84,small_certificate_84⟩,⟨85,small_certificate_85⟩,⟨86,small_certificate_86⟩,⟨87,small_certificate_87⟩,⟨88,small_certificate_88⟩,⟨89,small_certificate_89⟩,⟨90,small_certificate_90⟩,⟨91,small_certificate_91⟩,⟨92,small_certificate_92⟩,⟨93,small_certificate_93⟩,⟨94,small_certificate_94⟩,⟨95,small_certificate_95⟩,⟨96,small_certificate_96⟩,⟨97,small_certificate_97⟩,⟨98,small_certificate_98⟩,⟨99,small_certificate_99⟩] (by decide)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem small_valid_certificate : ∀ k : Fin 100, 3≤k.val → k.val%5 ≠ 1 →
    Triple 5 k.val (greedyX k.val) (greedyY k.val) (greedyZ k.val) := by decide

/-- Upper bound on the second denominator from the strict ordering. -/
theorem second_denominator_upper {p q x y z : Nat} (hp : 0<p) (hq : 0<q)
    (ht : Triple p q x y z) : (p*x-q)*y < 2*q*x := by
  obtain ⟨t,b,e,htpos,hbpos,hepos,hqt,hb,hty,hez,heq⟩ := triple_residuals hp hq ht
  have hlt : e*y<e*z := Nat.mul_lt_mul_of_pos_left ht.2.2.1 hepos
  rw [hez] at hlt
  have heb : e<b := Nat.lt_of_mul_lt_mul_right hlt
  have htdef : t=p*x-q := by omega
  rw [← htdef]
  nlinarith only [hty,heb,hb]

/-- Every actual triple occurs within the certificate's two finite loops. -/
theorem small_check_sound {k x y z : Nat} (hk : 0<k) (hcheck : smallCheck k=true)
    (ht : Triple 5 k x y z) :
    z ≤ greedyZ k ∧ (z=greedyZ k → x=greedyX k ∧ y=greedyY k) := by
  obtain ⟨t,b,e,htpos,hbpos,hepos,hqt,hb,hty,hez,heq⟩ := triple_residuals (by decide : 0<5) hk ht
  have htdef : t=5*x-k := by omega
  have hfirst : k<5*x := by omega
  have hxu := first_denominator_upper hk ht
  have hxrange : x∈List.range (3*k/5+1) := by
    apply List.mem_range.mpr
    have hh : x ≤ 3*k/5 := (Nat.le_div_iff_mul_le (by decide : 0<5)).mpr (by omega)
    omega
  have hyu := second_denominator_upper (by decide : 0<5) hk ht
  have hyrange : y∈List.range (2*k*x/(5*x-k)+1) := by
    apply List.mem_range.mpr
    have hpos : 0<5*x-k := by omega
    have hh : y≤2*k*x/(5*x-k) := (Nat.le_div_iff_mul_le hpos).mpr (by nlinarith only [hyu])
    omega
  have hdiv : (5*x-k)*y-k*x=e := by rw [← htdef, ← hb,hty]; omega
  have hez' : k*x*y=e*z := by rw [← hb,hez]
  have hzdiv : k*x*y/((5*x-k)*y-k*x)=z := by
    rw [hdiv,hez',Nat.mul_div_cancel_left _ hepos]
  have hzmod : k*x*y%((5*x-k)*y-k*x)=0 := by rw [hdiv,hez']; simp
  have hxcheck := List.all_eq_true.mp hcheck x hxrange
  simp only [hfirst,ite_eq_left] at hxcheck
  have hycheck := List.all_eq_true.mp hxcheck y hyrange
  have hyguard : x<y ∧ k*x<(5*x-k)*y := ⟨ht.2.1,by rw [←htdef,←hb,hty];omega⟩
  rw [ite_eq_left hyguard] at hycheck
  have hguard : 0<(5*x-k)*y-k*x ∧ k*x*y%((5*x-k)*y-k*x)=0 ∧
      y<k*x*y/((5*x-k)*y-k*x) := ⟨by rw [hdiv]; exact hepos,hzmod,by rw [hzdiv]; exact ht.2.2.1⟩
  dsimp only [smallPairCheck] at hycheck
  rw [ite_eq_left hguard] at hycheck
  simpa only [hzdiv,decide_eq_true_eq] using hycheck

theorem small_optimal {k : Nat} (hk : 0<k) (hu : k<100) (hr : k%5≠1) :
    ∀ x y z, Triple 5 k x y z →
      z≤greedyZ k ∧ (z=greedyZ k → x=greedyX k ∧ y=greedyY k) := by
  intro x y z ht
  exact small_check_sound hk (small_certificate ⟨k,hu⟩ hr) ht

#print axioms small_optimal
end Egyptian
