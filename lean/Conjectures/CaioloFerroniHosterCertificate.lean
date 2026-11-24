import Conjectures.CaioloFerroniHosterFlagPolynomials

/-! Exact coefficient certificates for the full range of the counterexample. -/

namespace CaioloFerroniHoster

open Finset
open scoped BigOperators

set_option linter.unusedSimpArgs false

private def horner (s : ℝ) : List ℚ → ℝ
  | [] => 0
  | c :: cs => (c : ℝ) + s * horner s cs

private theorem horner_nonneg {s : ℝ} (hs : 0 ≤ s) {cs : List ℚ}
    (hc : ∀ c ∈ cs, 0 ≤ c) : 0 ≤ horner s cs := by
  induction cs with
  | nil => exact le_rfl
  | cons c cs ih =>
    exact add_nonneg (by exact_mod_cast hc c (by simp))
      (mul_nonneg hs (ih fun d hd => hc d (List.mem_cons_of_mem _ hd)))

private theorem horner_pos {s : ℝ} (hs : 0 ≤ s) {c : ℚ} {cs : List ℚ}
    (hc : 0 < c) (hcs : ∀ d ∈ cs, 0 ≤ d) : 0 < horner s (c :: cs) :=
  add_pos_of_pos_of_nonneg (by exact_mod_cast hc) (mul_nonneg hs (horner_nonneg hs hcs))

private def allNonneg (cs : List ℚ) : Bool :=
  cs.all (fun c => decide (0 ≤ c))

private theorem horner_pos_of_check {s : ℝ} (hs : 0 ≤ s) {cs : List ℚ}
    (h : (cs.head?.any fun c => decide (0 < c)) && allNonneg cs) : 0 < horner s cs := by
  cases cs with
  | nil => simp at h
  | cons c cs =>
    simp only [List.head?_cons, Option.any_some, Bool.and_eq_true, decide_eq_true_eq] at h
    exact horner_pos hs h.1 fun d hd =>
      of_decide_eq_true (List.all_eq_true.mp h.2 d (List.mem_cons_of_mem _ hd))

private def g0Coeffs : List ℚ :=
  [1367432169863264385040621589, 1756970750216008289396160309, (2154920510017416552125846471 / 2),
    419535501859601903234590565, (465577778298510646104788065 / 4), (73423834057476003052825013 / 3),
    (24302828432962976793758269 / 6), 540792389903964943817209, (473844419245172318683273 / 8),
    (16146459327980125170154 / 3), 408728439651424174076, (78143123354005624468 / 3), (5579529638517449403
    / 4), (188054019289641199 / 3), (14125525080462599 / 6), (146713438001499 / 2), (15000508831547 / 8),
    (231994547245 / 6), 627541259, (46315693 / 6), 67656, (753 / 2), 1]

private def g1Coeffs : List ℚ :=
  [677031173160167651396287043, (2491120797985620458821596977 / 3), (969987378333396041585491787 / 2),
    179410511178962875621129006, (565897665010983177058164469 / 12), (28097637739182583932663940 / 3),
    (8753830942168232448045761 / 6), 182635960909072678061521, (149374672834114825152751 / 8),
    1575675721963306173058, 110469759666890432499, (38726316901744729939 / 6), (3771226464498440813 / 12),
    (38138665876923413 / 3), (2546930710916677 / 6), 11575725854897, (2029368263425 / 8), (26160757229 /
    6), 56625140, (3135209 / 6), 3054, (17 / 2)]

private def g2Coeffs : List ℚ :=
  [85823997163784007690567699, (314604943045103897253636895 / 3), (122043813666709320028185179 / 2),
    22489758976427604675083887, (70675745129548402589028065 / 12), (3496280543686613492509693 / 3),
    (1085293077047813835011645 / 6), 22560882083482775377137, (18385531634944261320373 / 8),
    (579729439781798499172 / 3), 13499800007567482064, (2357846229803337179 / 3), (457599961735233805 /
    12), (9222989808574237 / 6), (153442289627792 / 3), 1389942219036, (242833657943 / 8), (3119656703 /
    6), (13459015 / 2), (185668 / 3), (721 / 2), 1]

private def h1Coeffs : List ℚ :=
  [677047053626088109460305403, (2491170889149312771518448505 / 3), (970003959219814520196822679 / 2),
    179413094093366356241965432, (565904455020642563526511865 / 12), (28097915410083286112718484 / 3),
    (8753901237781213988149637 / 6), 182637134318299368697975, (149375426961681064503427 / 8),
    (4727045524900177160617 / 3), 110470081476503720976, (19363199476819382390 / 3), (3771232058064119215
    / 12), (38138703590874497 / 3), (2546932285085011 / 6), (23151459886669 / 2), (2029368621809 / 8),
    (26160759077 / 6), 56625141, (3135209 / 6), 3054, (17 / 2)]

private def h2Coeffs : List ℚ :=
  [85827739133054463066849240, 104872028042938821400283439, (122047282656520888788327309 / 2),
    22490265313286509373785947, (23558995598559326558774909 / 4), (3496327668921235721684605 / 3),
    (1085304084024062329936151 / 6), 22561050422567860364974, (18385629940344730177497 / 8),
    (579731592661619136011 / 3), 13499833536385614381, (2357849968265770139 / 3), (152533466147186435 /
    4), (9222994713932893 / 6), (153442330560962 / 3), 1389942378442, (242833667255 / 8), (3119656727 /
    6), (13459015 / 2), (185668 / 3), (721 / 2), 1]

private def discCoeffs : List ℚ :=
  [11062769241414341239970603495681493737981374532130995,
    52384613061462379622599730191498004304132831988224830,
    (849881645404681876009660185789216558400136222942779442 / 9),
    99473390777645609745976385128840829321835598749690015,
    (866125219154162630907411451022885432105787247957043515 / 12),
    (707359476711026252366235403477315248401572031766866479 / 18),
    (608791558555124286021348874314012465981332202257211319 / 36),
    (53586761383931736294731217516718110506019133279770202 / 9),
    (253117330150487571220815592467418604041495196681087447 / 144),
    (15950907204291697113984145871007194367932297979504323 / 36),
    (6962209473845055753351610729914698833374344293066229 / 72),
    (166233632914699523276186475623009490990741060913601 / 9),
    (149510974089773644410323723467486497632467064797985 / 48),
    (1401004607350066225123416030269799042684438751052 / 3),
    (4507538138060800549745406926701384203557408352001 / 72),
    (45234197319765372749734455275919511133782898815 / 6),
    (52392741957608131863293862120443143051888867899 / 64), (964828393950771827897049675534486603990075487
    / 12), (515524891428672378932238398623102732978922527 / 72),
    (41706433997052943486096565195526774424657729 / 72), (1534815322763030843817210234950801224623899 /
    36), (11430310983831545271542415323267301040797 / 4), 174523577285975377444021965680604427203,
    (116567686778109840869391748405433702923 / 12), (15764432398181791431830178525848382963 / 32),
    (181996979640465605794520287171655609 / 8), (3822406243478738676762260891948551 / 4),
    (328114444222171249909412954364470 / 9), (181546002229471813323053975005277 / 144),
    (2838082390840771708276551064157 / 72), (79971619329480337918768886035 / 72),
    (1011465292225582518671370287 / 36), (365723157274372315916713483 / 576), (917494047020241396542435 /
    72), (4058457879087361588997 / 18), (27880802405382444691 / 8), (1674681938256131027 / 36),
    (4226060105265401 / 8), (180112614546883 / 36), (115350744458 / 3), (460700877 / 2), (3027529 / 3),
    (11503 / 4), 4]

private def discAugCoeffs : List ℚ :=
  [11061733404916469626152098526056073213151599377977031,
    (157146723788713245753349602821023936105603298951011742 / 3),
    (849857832871206141033307418314882239450569547179877416 / 9),
    (298414424476824217202010263179754140792326213469378625 / 3),
    (866113069651253914227629736757572343869328793406104471 / 12),
    (707351986282586104349313045090898344109320776861374687 / 18),
    (608786573940506711673308094937072250590131999597707863 / 36),
    (53586416428598838975587567798661905127025634648024785 / 9),
    (253116033789352851974058990146046815624996803978157855 / 144),
    (15950841653814806298066138776316112207752921696215891 / 36),
    (6962186378472896353144353263871287875520218214814353 / 72),
    (332466371957978886975865381420154692691177062074991 / 18),
    (149510647477911322721900628554887923227366338840405 / 48),
    (1401002117632381795205856565660066425654857431334 / 3),
    (4507531621320158606135532356956642956632712325069 / 72),
    (30156096111199609686223990170810823827250103197 / 4),
    (157178076041086158824350777643246232318921442777 / 192),
    80402304158261290463870377523421778260060329, (515524570986389928085763223006252583491954925 / 72),
    (20853206598473295002858986376503865696093531 / 36), (3069629423951221985915110247347614399061447 /
    72), (11430307377707735858145398587308774414961 / 4), (523570601896502912434748990792199627298 / 3),
    (77711776141149078305165565814856500039 / 8), (15764430041996296529294744985381825367 / 32),
    (545990876649047112441812336723974657 / 24), (11467217745753646937550353553598195 / 12),
    (2624915386704393042313282090339459 / 72), (181545993818597582139737920786679 / 144),
    (2838082297151486802624232239473 / 72), (79971617495245560354877709671 / 72),
    (2022930553174247760249409807 / 72), (365723153600332328506432747 / 576), (917494041298483639132415 /
    72), (8116915728521998110799 / 36), (27880802350092265843 / 8), (1674681936632404553 / 36),
    (12678180310641107 / 24), (180112614522979 / 36), (115350744455 / 3), (460700877 / 2), (3027529 / 3),
    (11503 / 4), 4]


private theorem g0Unshifted (q : ℝ) : gammaZero (coalescedFlag q) =
    (-1 / 4) * q ^ 4 + (1 / 3) * q ^ 5 + (1 / 3) * q ^ 6 + (-1 / 6) * q ^ 7 + (7 / 24) * q ^ 8 + (-7 / 6)
    * q ^ 9 + (5 / 6) * q ^ 10 + (5 / 6) * q ^ 11 + (9 / 4) * q ^ 12 + (31 / 6) * q ^ 13 + (23 / 3) * q ^
    14 + (49 / 6) * q ^ 15 + (269 / 24) * q ^ 16 + (55 / 6) * q ^ 17 + (55 / 6) * q ^ 18 + (43 / 6) * q ^
    19 + (9 / 2) * q ^ 20 + (5 / 2) * q ^ 21 + 1 * q ^ 22 := by
  simp only [gammaZero, gammaOne, gammaTwo, gammaOneAug, gammaTwoAug, beta,
    signedSublists, List.map_cons, List.map_nil, List.cons_append, List.nil_append,
    List.sum_cons, List.sum_nil, flagPolynomialEmpty, flagPolynomial4, flagPolynomial3,
    flagPolynomial2, flagPolynomial1, flagPolynomial43, flagPolynomial42, flagPolynomial41,
    flagPolynomial32, flagPolynomial31, flagPolynomial21, flagPolynomial432, flagPolynomial431,
    flagPolynomial421, flagPolynomial321, flagPolynomial4321]
  ring

private theorem g1Unshifted (q : ℝ) : gammaOne (coalescedFlag q) =
    (19 / 12) * q ^ 4 + (25 / 6) * q ^ 5 + (61 / 6) * q ^ 6 + (56 / 3) * q ^ 7 + (821 / 24) * q ^ 8 + (283
    / 6) * q ^ 9 + (397 / 6) * q ^ 10 + (529 / 6) * q ^ 11 + (1217 / 12) * q ^ 12 + (346 / 3) * q ^ 13 +
    (713 / 6) * q ^ 14 + (343 / 3) * q ^ 15 + (2527 / 24) * q ^ 16 + (515 / 6) * q ^ 17 + (383 / 6) * q ^
    18 + (239 / 6) * q ^ 19 + (39 / 2) * q ^ 20 + (17 / 2) * q ^ 21 := by
  simp only [gammaZero, gammaOne, gammaTwo, gammaOneAug, gammaTwoAug, beta,
    signedSublists, List.map_cons, List.map_nil, List.cons_append, List.nil_append,
    List.sum_cons, List.sum_nil, flagPolynomialEmpty, flagPolynomial4, flagPolynomial3,
    flagPolynomial2, flagPolynomial1, flagPolynomial43, flagPolynomial42, flagPolynomial41,
    flagPolynomial32, flagPolynomial31, flagPolynomial21, flagPolynomial432, flagPolynomial431,
    flagPolynomial421, flagPolynomial321, flagPolynomial4321]
  ring

private theorem g2Unshifted (q : ℝ) : gammaTwo (coalescedFlag q) =
    1 * q ^ 2 + 3 * q ^ 3 + (65 / 12) * q ^ 4 + (73 / 6) * q ^ 5 + (56 / 3) * q ^ 6 + (80 / 3) * q ^ 7 +
    (887 / 24) * q ^ 8 + (265 / 6) * q ^ 9 + (313 / 6) * q ^ 10 + (173 / 3) * q ^ 11 + (709 / 12) * q ^ 12
    + (353 / 6) * q ^ 13 + (169 / 3) * q ^ 14 + (142 / 3) * q ^ 15 + (961 / 24) * q ^ 16 + (167 / 6) * q ^
    17 + (107 / 6) * q ^ 18 + (28 / 3) * q ^ 19 + (7 / 2) * q ^ 20 + 1 * q ^ 21 := by
  simp only [gammaZero, gammaOne, gammaTwo, gammaOneAug, gammaTwoAug, beta,
    signedSublists, List.map_cons, List.map_nil, List.cons_append, List.nil_append,
    List.sum_cons, List.sum_nil, flagPolynomialEmpty, flagPolynomial4, flagPolynomial3,
    flagPolynomial2, flagPolynomial1, flagPolynomial43, flagPolynomial42, flagPolynomial41,
    flagPolynomial32, flagPolynomial31, flagPolynomial21, flagPolynomial432, flagPolynomial431,
    flagPolynomial421, flagPolynomial321, flagPolynomial4321]
  ring

private theorem h1Unshifted (q : ℝ) : gammaOneAug (coalescedFlag q) =
    (23 / 12) * q ^ 4 + (11 / 3) * q ^ 5 + (32 / 3) * q ^ 6 + (121 / 6) * q ^ 7 + (869 / 24) * q ^ 8 +
    (313 / 6) * q ^ 9 + (433 / 6) * q ^ 10 + (571 / 6) * q ^ 11 + (1321 / 12) * q ^ 12 + (737 / 6) * q ^
    13 + (376 / 3) * q ^ 14 + (719 / 6) * q ^ 15 + (2599 / 24) * q ^ 16 + (527 / 6) * q ^ 17 + (389 / 6) *
    q ^ 18 + (239 / 6) * q ^ 19 + (39 / 2) * q ^ 20 + (17 / 2) * q ^ 21 := by
  simp only [gammaZero, gammaOne, gammaTwo, gammaOneAug, gammaTwoAug, beta,
    signedSublists, List.map_cons, List.map_nil, List.cons_append, List.nil_append,
    List.sum_cons, List.sum_nil, flagPolynomialEmpty, flagPolynomial4, flagPolynomial3,
    flagPolynomial2, flagPolynomial1, flagPolynomial43, flagPolynomial42, flagPolynomial41,
    flagPolynomial32, flagPolynomial31, flagPolynomial21, flagPolynomial432, flagPolynomial431,
    flagPolynomial421, flagPolynomial321, flagPolynomial4321]
  ring

private theorem h2Unshifted (q : ℝ) : gammaTwoAug (coalescedFlag q) =
    2 * q ^ 2 + 6 * q ^ 3 + (45 / 4) * q ^ 4 + (139 / 6) * q ^ 5 + (104 / 3) * q ^ 6 + (149 / 3) * q ^ 7 +
    (1547 / 24) * q ^ 8 + (463 / 6) * q ^ 9 + (523 / 6) * q ^ 10 + (275 / 3) * q ^ 11 + (363 / 4) * q ^ 12
    + (509 / 6) * q ^ 13 + (229 / 3) * q ^ 14 + (184 / 3) * q ^ 15 + (1153 / 24) * q ^ 16 + (191 / 6) * q
    ^ 17 + (107 / 6) * q ^ 18 + (28 / 3) * q ^ 19 + (7 / 2) * q ^ 20 + 1 * q ^ 21 := by
  simp only [gammaZero, gammaOne, gammaTwo, gammaOneAug, gammaTwoAug, beta,
    signedSublists, List.map_cons, List.map_nil, List.cons_append, List.nil_append,
    List.sum_cons, List.sum_nil, flagPolynomialEmpty, flagPolynomial4, flagPolynomial3,
    flagPolynomial2, flagPolynomial1, flagPolynomial43, flagPolynomial42, flagPolynomial41,
    flagPolynomial32, flagPolynomial31, flagPolynomial21, flagPolynomial432, flagPolynomial431,
    flagPolynomial421, flagPolynomial321, flagPolynomial4321]
  ring

set_option maxRecDepth 8192 in
set_option maxHeartbeats 2000000 in
private theorem shiftedGamma (s : ℝ) :
    let f := coalescedFlag (s + 17)
    gammaZero f = horner s g0Coeffs ∧
    gammaOne f = horner s g1Coeffs ∧
    gammaTwo f = horner s g2Coeffs ∧
    gammaOneAug f = horner s h1Coeffs ∧
    gammaTwoAug f = horner s h2Coeffs := by
  dsimp only
  refine ⟨?_, ?_, ?_, ?_, ?_⟩ <;>
    simp only [g0Unshifted, g1Unshifted, g2Unshifted, h1Unshifted, h2Unshifted,
      horner, g0Coeffs, g1Coeffs, g2Coeffs, h1Coeffs, h2Coeffs] <;> ring

set_option maxRecDepth 8192 in
set_option maxHeartbeats 3000000 in
private theorem shiftedDiscriminants (s : ℝ) :
    let f := coalescedFlag (s + 17)
    4 * gammaZero f * gammaTwo f - (gammaOne f) ^ 2 = horner s discCoeffs ∧
    4 * gammaZero f * gammaTwoAug f - (gammaOneAug f) ^ 2 =
      horner s discAugCoeffs := by
  obtain ⟨h0, h1, h2, ha1, ha2⟩ := shiftedGamma s
  dsimp only
  rw [h0, h1, h2, ha1, ha2]
  constructor <;>
    simp only [horner, g0Coeffs, g1Coeffs, g2Coeffs, h1Coeffs, h2Coeffs,
      discCoeffs, discAugCoeffs] <;> ring

theorem gamma_signs (q : ℝ) (hq : 17 ≤ q) :
    let f := coalescedFlag q
    0 < gammaTwo f ∧ 0 < gammaTwoAug f ∧
    0 < 4 * gammaZero f * gammaTwo f - (gammaOne f) ^ 2 ∧
    0 < 4 * gammaZero f * gammaTwoAug f - (gammaOneAug f) ^ 2 := by
  let s := q - 17
  have hs : 0 ≤ s := sub_nonneg.mpr hq
  have he : s + 17 = q := sub_add_cancel _ _
  obtain ⟨_, _, h2, _, ha2⟩ := shiftedGamma s
  obtain ⟨hd, hda⟩ := shiftedDiscriminants s
  rw [he] at h2 ha2 hd hda
  dsimp only
  rw [hd, hda, h2, ha2]
  exact ⟨horner_pos_of_check hs (by decide +kernel),
    horner_pos_of_check hs (by decide +kernel),
    horner_pos_of_check hs (by decide +kernel),
    horner_pos_of_check hs (by decide +kernel)⟩

theorem positive_gamma_quartic {a b c : ℝ} (hc : 0 < c)
    (hd : 0 < 4 * a * c - b ^ 2) (x : ℝ) :
    0 < a * (1 + x) ^ 4 + b * x * (1 + x) ^ 2 + c * x ^ 2 := by
  by_cases hx : x = -1
  · simpa [hx]
  have hne : 1 + x ≠ 0 := by intro h; apply hx; linarith
  have hp : 0 < (1 + x) ^ 4 := by
    rw [show (4 : ℕ) = 2 * 2 by decide, pow_mul]
    exact sq_pos_of_ne_zero (pow_ne_zero _ hne)
  have h := add_pos_of_nonneg_of_pos (sq_nonneg (2 * c * x + b * (1 + x) ^ 2))
    (mul_pos hd hp)
  have he : (2 * c * x + b * (1 + x) ^ 2) ^ 2 +
      (4 * a * c - b ^ 2) * (1 + x) ^ 4 =
      (4 * c) * (a * (1 + x) ^ 4 + b * x * (1 + x) ^ 2 + c * x ^ 2) := by ring
  rw [he] at h
  exact pos_of_mul_pos_right h (by positivity)

theorem coalescedChow_pos (q : ℝ) (hq : 17 ≤ q) (x : ℝ) :
    0 < dualChow (coalescedFlag q) x := by
  obtain ⟨h2, _, hd, _⟩ := gamma_signs q hq
  rw [dualChow_gamma]
  exact positive_gamma_quartic h2 hd x

theorem coalescedAug_factor (q : ℝ) (hq : 17 ≤ q) :
    ∃ f : ℝ → ℝ, (∀ x, 0 < f x) ∧
      ∀ x, dualRightAugmented (coalescedFlag q) x = (1 + x) * f x := by
  obtain ⟨_, h2, _, hd⟩ := gamma_signs q hq
  exact ⟨_, positive_gamma_quartic h2 hd, dualRightAugmented_gamma _⟩

end CaioloFerroniHoster
