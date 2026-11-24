module

public import Conjectures.BenfieldLippardParity
public import Conjectures.BenfieldLippardSymmetryApery

/-! Both stable Waring-gap symmetry counterexamples, for exponents 64 and 128. -/

@[expose] public section

namespace BenfieldLippardSymmetry

open BenfieldLippardParity Finset

/-- The fourth generator is glued to the three-generator monoid with scale 17. -/
def Glued (s : Shape) (D n : ℕ) : Prop :=
  ∃ j t : ℕ, n = j * D + 17 * t ∧ s.Represented t

private theorem glued_add {s : Shape} {D m n : ℕ} (hm : Glued s D m) (hn : Glued s D n) :
    Glued s D (m + n) := by
  obtain ⟨j, t, rfl, ht⟩ := hm
  obtain ⟨j', t', rfl, ht'⟩ := hn
  exact ⟨j + j', t + t', by ring, s.represented_add ht ht'⟩

private theorem glued_of_gt (s : Shape) (D n : ℕ) (hD : D % 17 = 16)
    (hxW : s.x ≤ s.W) (hn : 16 * D + 17 * (s.W - s.x) < n) : Glued s D n := by
  let j := (17 - n % 17) % 17
  have hj : j ≤ 16 := by dsimp [j]; omega
  have hjn : j * D ≤ n := (Nat.mul_le_mul_right D hj).trans (by omega)
  have hmod : n ≡ j * D [MOD 17] := by
    change n % 17 = (j * D) % 17
    rw [Nat.mul_mod, hD]
    by_cases h : n % 17 = 0
    · simp [j, h]
    · have he : j = 17 - n % 17 := by
        dsimp [j]
        exact Nat.mod_eq_of_lt (by omega)
      have h' : j % 17 = j := Nat.mod_eq_of_lt (by omega)
      rw [h', he]
      omega
  have hd : 17 ∣ n - j * D := by
    have hh := Nat.ModEq.sub hjn le_rfl hmod (Nat.ModEq.refl (j * D))
    simpa [Nat.modEq_zero_iff_dvd] using hh
  obtain ⟨t, ht⟩ := hd
  have he : n = j * D + 17 * t := by omega
  refine ⟨j, t, he, s.represented_above ?_ hxW⟩
  have hh := Nat.mul_le_mul_right D hj
  omega

private theorem gcd_seventeen (D : ℕ) (hD : D % 17 = 16) : Nat.gcd 17 D = 1 := by
  rw [Nat.gcd_rec, hD]
  decide

private theorem glued_at (s : Shape) {D j t : ℕ} (hD : D % 17 = 16)
    (hDr : s.Represented D) (hj : j < 17) :
    Glued s D (j * D + 17 * t) ↔ s.Represented t := by
  constructor
  · rintro ⟨i, u, he, hu⟩
    have hmod : i * D ≡ j * D [MOD 17] := by
      change i * D % 17 = j * D % 17
      have h := congrArg (· % 17) he.symm
      simpa [Nat.add_mod] using h
    have hi := Nat.ModEq.cancel_right_of_coprime (gcd_seventeen D hD) hmod
    have hrem : i % 17 = j := Eq.trans hi (Nat.mod_eq_of_lt hj)
    have hi' : i = j + 17 * (i / 17) := by
      simpa only [hrem] using (Nat.mod_add_div i 17).symm
    rw [hi', Nat.add_mul, Nat.mul_assoc] at he
    have ht : t = i / 17 * D + u := by omega
    rw [ht]
    exact s.represented_add (by simpa [Nat.mul_comm] using s.represented_mul hDr (i / 17)) hu
  · exact fun h => ⟨j, t, rfl, h⟩

private theorem mem_stable_gaps {e n : ℕ} (he : 2 ≤ e) :
    n ∈ gaps e ↔ 0 < n ∧ ¬ Repr e n := by
  rw [mem_gaps_iff_never he, ← not_exists, ← stable_iff_once, stable_iff_repr]

private structure Certificate (e : ℕ) where
  shape : Shape
  hx : 17 * shape.x = 2 ^ e - 1
  hy : 17 * shape.y = 3 ^ e - 1
  hz : 17 * shape.z = 5 ^ e - 1
  h₁ : shape.x < shape.W₁
  h₂ : shape.x < shape.W₂
  hd : shape.W₁ ≠ shape.W₂
  hDmod : (17 ^ e - 1) % 17 = 16
  hD : shape.W - shape.x < 17 ^ e - 1
  hlarge : 16 * (17 ^ e - 1) + 17 * (shape.W - shape.x) < 19 ^ e - 1
  small : ∀ m : ℕ, 0 < m → m < 19 → Glued shape (17 ^ e - 1) (m ^ e - 1)

namespace Certificate

private theorem repr_iff {e : ℕ} (c : Certificate e) (n : ℕ) :
    Repr e n ↔ Glued c.shape (17 ^ e - 1) n := by
  constructor
  · intro hr
    induction hr with
    | zero => exact ⟨0, 0, by simp, c.shape.represented_zero⟩
    | @next n m _ hm ih =>
      apply glued_add ih
      by_cases h : m < 19
      · exact c.small m hm h
      · apply glued_of_gt _ _ _ c.hDmod (c.h₁.le.trans (le_max_left _ _))
        exact c.hlarge.trans_le (Nat.sub_le_sub_right (Nat.pow_le_pow_left (by omega) e) 1)
  · rintro ⟨j, t, rfl, ⟨a, b, d, rfl⟩⟩
    have hD := repr_mul (repr_gen e 17 (by decide)) j
    have hx := repr_mul (repr_gen e 2 (by decide)) a
    have hy := repr_mul (repr_gen e 3 (by decide)) b
    have hz := repr_mul (repr_gen e 5 (by decide)) d
    rw [← c.hx] at hx
    rw [← c.hy] at hy
    rw [← c.hz] at hz
    convert repr_add (repr_add (repr_add hD hx) hy) hz using 1
    unfold Shape.weight
    ring

private def frobenius {e : ℕ} (c : Certificate e) : ℕ :=
  16 * (17 ^ e - 1) + 17 * (c.shape.W - c.shape.x)

private theorem largest_gap {e : ℕ} (c : Certificate e) (he : 2 ≤ e) :
    IsGreatest (↑(gaps e) : Set ℕ) c.frobenius := by
  have hW : c.shape.x < c.shape.W := c.h₁.trans_le (le_max_left _ _)
  have hDr := c.shape.represented_above c.hD hW.le
  refine ⟨(mem_stable_gaps he).mpr ⟨by unfold frobenius; omega, ?_⟩, fun n hn => ?_⟩
  · rw [c.repr_iff, frobenius, glued_at _ c.hDmod hDr (by decide)]
    exact c.shape.W_gap c.h₁ c.h₂
  · apply le_of_not_gt
    intro h
    exact ((mem_stable_gaps he).mp hn).2
      ((c.repr_iff n).mpr (glued_of_gt _ _ _ c.hDmod hW.le h))

private theorem pair_gaps {e : ℕ} (c : Certificate e) (he : 2 ≤ e) :
    ∃ m n : ℕ, m ∈ gaps e ∧ n ∈ gaps e ∧ m + n = c.frobenius := by
  obtain ⟨m, n, hm, hn, hm', hn', hmn⟩ := c.shape.reflected_gaps c.h₁ c.h₂ c.hd
  have hDr := c.shape.represented_above c.hD (c.h₁.le.trans (le_max_left _ _))
  refine ⟨0 * (17 ^ e - 1) + 17 * m, 16 * (17 ^ e - 1) + 17 * n,
    (mem_stable_gaps he).mpr ⟨by omega, ?_⟩, (mem_stable_gaps he).mpr ⟨by omega, ?_⟩, ?_⟩
  · rw [c.repr_iff, glued_at _ c.hDmod hDr (by decide)]
    exact hm'
  · rw [c.repr_iff, glued_at _ c.hDmod hDr (by decide)]
    exact hn'
  · unfold frobenius
    omega

end Certificate

private theorem gap_defect_of_pair {e F m n : ℕ} (he : 2 ≤ e)
    (hF : IsGreatest (↑(gaps e) : Set ℕ) F) (hm : m ∈ gaps e) (hn : n ∈ gaps e)
    (hmn : m + n = F) : F + 1 < 2 * (gaps e).card := by
  classical
  let A := (range (F + 1)).filter (Repr e)
  let rev := fun a : ℕ => F - a
  have hA : ∀ x ∈ A, x ≤ F ∧ Repr e x := by simp [A]
  have hG : (range (F + 1)).filter (fun x => ¬ Repr e x) = gaps e := by
    ext x
    rw [mem_stable_gaps he]
    simp only [mem_filter, mem_range]
    refine ⟨fun h => ⟨?_, h.2⟩, fun h => ⟨Nat.lt_succ_of_le (hF.2 ((mem_stable_gaps he).mpr h)), h.2⟩⟩
    by_contra! hzero
    have hx : x = 0 := by omega
    exact h.2 (hx ▸ Repr.zero)
  have hs : A.card + (gaps e).card = F + 1 := by
    rw [← hG]
    simpa only [card_range, A] using card_filter_add_card_filter_not (s := range (F + 1)) (Repr e)
  have hinj : Set.InjOn rev ↑A := by
    intro x hx y hy hxy
    have hx' := (hA x hx).1
    have hy' := (hA y hy).1
    dsimp [rev] at hxy
    omega
  have hsub : A.image rev ⊆ gaps e := by
    intro x hx
    obtain ⟨y, hy, rfl⟩ := mem_image.mp hx
    have ⟨hyF, hyr⟩ := hA y hy
    have hFr := (mem_stable_gaps he).mp hF.1
    apply (mem_stable_gaps he).mpr
    have hre : y + rev y = F := by dsimp [rev]; omega
    refine ⟨?_, fun h => hFr.2 (hre ▸ repr_add hyr h)⟩
    by_contra! h0
    have hy' : y = F := by dsimp [rev] at h0; omega
    exact hFr.2 (hy' ▸ hyr)
  have hmiss : m ∉ A.image rev := by
    intro h
    obtain ⟨i, hi, heq⟩ := mem_image.mp h
    have ⟨hiF, hir⟩ := hA i hi
    have hin : i = n := by dsimp [rev] at heq; omega
    exact ((mem_stable_gaps he).mp hn).2 (hin ▸ hir)
  have hstrict : A.image rev ⊂ gaps e :=
    Finset.ssubset_iff_subset_ne.mpr ⟨hsub, fun heq => hmiss (heq.symm ▸ hm)⟩
  have hc := card_lt_card hstrict
  rw [card_image_of_injOn hinj] at hc
  omega

private theorem certificate_gap_defect {e : ℕ} (c : Certificate e) (he : 2 ≤ e) :
    ∃ F : ℕ, IsGreatest (↑(gaps e) : Set ℕ) F ∧ F + 1 < 2 * (gaps e).card := by
  obtain ⟨m, n, hm, hn, hmn⟩ := c.pair_gaps he
  exact ⟨c.frobenius, c.largest_gap he, gap_defect_of_pair he (c.largest_gap he) hm hn hmn⟩

private def shape_64 : Shape where
  x := (2 ^ 64 - 1) / 17
  y := (3 ^ 64 - 1) / 17
  z := (5 ^ 64 - 1) / 17
  L := 18766804522483320
  U := 55
  V := 743739614142711
  H := 60
  hx := by decide
  hy := by decide
  hz := by decide
  hV := by decide
  hU := by decide
  hVL := by decide
  hUH := by decide
  hcard := by decide
  hL := by decide
  hH := by decide
  hLmod := by decide
  hHmod := by decide
  hcop := by decide

private def shape_128 : Shape where
  x := (2 ^ 128 - 1) / 17
  y := (3 ^ 128 - 1) / 17
  z := (5 ^ 128 - 1) / 17
  L := 946318631155207323529554626079834
  U := 13945
  V := 364271084930610618508382933752617
  H := 26520
  hx := by decide
  hy := by decide
  hz := by decide
  hV := by decide
  hU := by decide
  hVL := by decide
  hUH := by decide
  hcard := by decide
  hL := by decide
  hH := by decide
  hLmod := by decide
  hHmod := by decide
  hcop := by decide

private theorem small_64 (m : ℕ) (hm : 0 < m) (h19 : m < 19) :
    Glued shape_64 (17^64-1) (m^64 - 1) := by
  interval_cases m
  · exact ⟨0, (1^64 - 1) / 17, by decide, 0, 0, 0, by decide⟩
  · exact ⟨0, (2^64 - 1) / 17, by decide, 1, 0, 0, by decide⟩
  · exact ⟨0, (3^64 - 1) / 17, by decide, 0, 1, 0, by decide⟩
  · exact ⟨0, (4^64 - 1) / 17, by decide, 18446744073709551617, 0, 0, by decide⟩
  · exact ⟨0, (5^64 - 1) / 17, by decide, 0, 0, 1, by decide⟩
  · exact ⟨0, (6^64 - 1) / 17, by decide, 3433683820292512484657849089281, 1, 0, by decide⟩
  · exact ⟨0, (7^64 - 1) / 17, by decide, 66123347538568003834069661110749696, 5328073365506112, 0, by decide⟩
  · exact ⟨0, (8^64 - 1) / 17, by decide, 340282366920938463481821351505477763073, 0, 0, by decide⟩
  · exact ⟨0, (9^64 - 1) / 17, by decide, 639147186659458730667599726699901226267648, 15475687852415008, 50, by decide⟩
  · exact ⟨0, (10^64 - 1) / 17, by decide, 542101086242752217003726400434970855712890625, 0, 1, by decide⟩
  · exact ⟨0, (11^64 - 1) / 17, by decide, 241664093496009399967012320768639121456609718016, 6914496579435219, 45, by decide⟩
  · exact ⟨0, (12^64 - 1) / 17, by decide, 63340286662973277709595970767104399094554310917377, 1, 0, by decide⟩
  · exact ⟨0, (13^64 - 1) / 17, by decide, 10628080253478339771969283777525988728378154136501504, 8701499370732513, 15, by decide⟩
  · exact ⟨0, (14^64 - 1) / 17, by decide, 1219760487635835700204697210101539824589684955241988097, 5328073365506112, 0, by decide⟩
  · exact ⟨0, (15^64 - 1) / 17, by decide, 100906898331593477124486783001815515473793074564462326272, 9447013616889499, 1, by decide⟩
  · exact ⟨0, (16^64 - 1) / 17, by decide, 6277101735386680764176071790128604879584176795969512275969, 0, 0, by decide⟩
  · exact ⟨1, 0, by decide, Shape.represented_zero _⟩
  · exact ⟨0, (18^64 - 1) / 17, by decide, 11790184577738583172160020048071977396345811318975742335364609, 15475687852415008, 50, by decide⟩

private theorem small_128 (m : ℕ) (hm : 0 < m) (h19 : m < 19) :
    Glued shape_128 (17^128-1) (m^128 - 1) := by
  interval_cases m
  · exact ⟨0, (1^128 - 1) / 17, by decide, 0, 0, 0, by decide⟩
  · exact ⟨0, (2^128 - 1) / 17, by decide, 1, 0, 0, by decide⟩
  · exact ⟨0, (3^128 - 1) / 17, by decide, 0, 1, 0, by decide⟩
  · exact ⟨0, (4^128 - 1) / 17, by decide, 340282366920938463463374607431768211457, 0, 0, by decide⟩
  · exact ⟨0, (5^128 - 1) / 17, by decide, 0, 0, 1, by decide⟩
  · exact ⟨0, (6^128 - 1) / 17, by decide, 11790184577738583171520872861412518665678211592275841109096961, 1, 0, by decide⟩
  · exact ⟨0, (7^128 - 1) / 17, by decide, 4372297220864463674842136778812597951923145223540489564035112542072832, 882227444307480621858643023882249, 1175, by decide⟩
  · exact ⟨0, (8^128 - 1) / 17, by decide, 115792089237316195423570985008687907853610267032561502502920958615344897851393, 0, 0, by decide⟩
  · exact ⟨0, (9^128 - 1) / 17, by decide, 408509126214706540973099325847064924353332831215022252782488792540740784578658052608, 440288802337909124380954531904077, 1290, by decide⟩
  · exact ⟨0, (10^128 - 1) / 17, by decide, 293873587705571876992184134305561419454666389193021880377187926569604314863681793212890625, 0, 1, by decide⟩
  · exact ⟨0, (11^128 - 1) / 17, by decide, 58401534085247972765959186672704644072828671372747047603836114935201903822020888966232266904576, 263280393306386581062748722872385, 2600, by decide⟩
  · exact ⟨0, (12^128 - 1) / 17, by decide, 4011991914547630480065053387702443812702192672319550809127252495516868241924535460134437063364082177, 1, 0, by decide⟩
  · exact ⟨0, (13^128 - 1) / 17, by decide, 112956089874376210966364664609221950798105031299441219158524021656601519581350397488523724674008298856448, 352630010255870053537075453585293, 16600, by decide⟩
  · exact ⟨0, (14^128 - 1) / 17, by decide, 1487815647197611695910312681741273570336729014375663413573340441865199913375224144878298051492668418439109633, 882227444307480621858643023882249, 1175, by decide⟩
  · exact ⟨0, (15^128 - 1) / 17, by decide, 10182202130902542456182119734191911013820813745492356444825605162892035127526462916631342484402852001876744926720, 151661994252216326303416683205282, 1571, by decide⟩
  · exact ⟨0, (16^128 - 1) / 17, by decide, 39402006196394479212279040100143613805195531359702762863371864389254409679350820878446827757387836599421972888158209, 0, 0, by decide⟩
  · exact ⟨1, 0, by decide, Shape.represented_zero _⟩
  · exact ⟨0, (18^128 - 1) / 17, by decide, 139008452377144732764939786789661303114627359934743844532577923755883137554119768772216791406892098314352406325127557488129, 440288802337909124380954531904077, 1290, by decide⟩

private def certificate_64 : Certificate 64 where
  shape := shape_64
  hx := by decide
  hy := by decide
  hz := by decide
  h₁ := by decide
  h₂ := by decide
  hd := by decide
  hDmod := by decide
  hD := by decide
  hlarge := by decide
  small := small_64

private def certificate_128 : Certificate 128 where
  shape := shape_128
  hx := by decide
  hy := by decide
  hz := by decide
  h₁ := by decide
  h₂ := by decide
  hd := by decide
  hDmod := by decide
  hD := by decide
  hlarge := by decide
  small := small_128

/-- The two strict inequality counterexamples to the proposed Frobenius symmetry. -/
theorem stable_gap_defect (e : ℕ) (he : e = 64 ∨ e = 128) :
    ∃ F : ℕ, IsGreatest (↑(gaps e) : Set ℕ) F ∧ F + 1 < 2 * (gaps e).card := by
  rcases he with rfl | rfl
  · exact certificate_gap_defect certificate_64 (by decide)
  · exact certificate_gap_defect certificate_128 (by decide)

/-- The claimed equality for power-of-two exponents in Conjecture 10.1 is false. -/
theorem not_conjecture10_1 :
    ¬ ∀ k : ℕ, 1 ≤ k → ∀ F : ℕ, IsGreatest (↑(gaps (2 ^ k)) : Set ℕ) F →
      F = 2 * (gaps (2 ^ k)).card - 1 := by
  intro h
  obtain ⟨F, hF, hlt⟩ := stable_gap_defect 64 (Or.inl rfl)
  have hk : (2 : ℕ) ^ 6 = 64 := by decide
  have he := h 6 (by decide)
  rw [hk] at he
  have hf := he F hF
  omega

/-- Both exponents also give two gaps reflected into each other around the
largest gap, contradicting the finite-domain form of Conjecture 10.2. -/
theorem reflected_stable_gaps (e : ℕ) (he : e = 64 ∨ e = 128) :
    ∃ F m n : ℕ, IsGreatest (↑(gaps e) : Set ℕ) F ∧
      m ∈ gaps e ∧ n ∈ gaps e ∧ m + n = F := by
  rcases he with rfl | rfl
  · obtain ⟨m, n, hm, hn, hmn⟩ := certificate_64.pair_gaps (by decide)
    exact ⟨_, m, n, certificate_64.largest_gap (by decide), hm, hn, hmn⟩
  · obtain ⟨m, n, hm, hn, hmn⟩ := certificate_128.pair_gaps (by decide)
    exact ⟨_, m, n, certificate_128.largest_gap (by decide), hm, hn, hmn⟩

end BenfieldLippardSymmetry
