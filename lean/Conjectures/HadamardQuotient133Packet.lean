import Conjectures.HadamardQuotient133Catalog
import Conjectures.HadamardQuotient133Margins

namespace HadamardQuotient133

open scoped BigOperators

attribute [local instance 2000] Fintype.decidableForallFintype
attribute [local instance 2000] Fintype.decidableExistsFintype

def pairedCheck {α β : Type*} (check : α → β → Bool) : List α → List β → Bool
  | [], [] => true
  | a :: rest, b :: certs => check a b && pairedCheck check rest certs
  | _, _ => false

theorem pairedCheck_sound {α β : Type*} (check : α → β → Bool)
    {inputs : List α} {certs : List β} (h : pairedCheck check inputs certs = true) :
    ∀ a ∈ inputs, ∃ b ∈ certs, check a b = true := by
  induction inputs generalizing certs with
  | nil => simp
  | cons a rest ih =>
      cases certs with
      | nil => simp [pairedCheck] at h
      | cons b certs =>
          simp only [pairedCheck, Bool.and_eq_true] at h
          intro x hx
          rcases List.mem_cons.mp hx with he | hx
          · subst x
            exact ⟨b, List.mem_cons_self, h.1⟩
          · obtain ⟨c, hc, hcheck⟩ := ih h.2 x hx
            exact ⟨c, List.mem_cons_of_mem b hc, hcheck⟩

def chunksAux {α : Type*} : ℕ → List α → List (List α)
  | 0, _ => []
  | _ + 1, [] => []
  | fuel + 1, a :: rest =>
      (a :: rest).take 16 :: chunksAux fuel ((a :: rest).drop 16)

def chunks16 {α : Type*} (l : List α) : List (List α) := chunksAux l.length l

theorem chunksAux_flatten {α : Type*} (fuel : ℕ) (l : List α)
    (hlen : l.length ≤ fuel) : (chunksAux fuel l).flatten = l := by
  induction fuel generalizing l with
  | zero =>
      have hl : l = [] := List.length_eq_zero_iff.mp (by omega)
      subst l
      rfl
  | succ fuel ih =>
      cases l with
      | nil => rfl
      | cons a rest =>
          simp only [List.length_cons] at hlen
          change (a :: rest).take 16 ++
            (chunksAux fuel ((a :: rest).drop 16)).flatten = a :: rest
          rw [ih _ (by simp only [List.length_drop, List.length_cons]; omega)]
          exact List.take_append_drop 16 (a :: rest)

theorem mem_some_chunk {α : Type*} {l : List α} {a : α} (ha : a ∈ l) :
    ∃ block ∈ chunks16 l, a ∈ block := by
  have heq : (chunks16 l).flatten = l := chunksAux_flatten l.length l le_rfl
  rw [← heq] at ha
  exact List.mem_flatten.mp ha

def catalogBatch (C : Catalog) (target : ℤ) (batch : ℕ) : Bool :=
  (List.range 32).all fun offset =>
    if batch * 32 + offset < C.size then catalogCheck C target (batch * 32 + offset)
    else true

def catalogAllCheck (C : Catalog) (target : ℤ) : Bool :=
  (List.range ((C.size + 31) / 32)).all (catalogBatch C target)

theorem catalogAllCheck_sound (C : Catalog) (target : ℤ)
    (h : catalogAllCheck C target = true) :
    ∀ i, i < C.size → catalogCheck C target i = true := by
  intro i hi
  have hb : i / 32 ∈ List.range ((C.size + 31) / 32) := by
    apply List.mem_range.mpr
    omega
  have hbatch := List.all_eq_true.mp h (i / 32) hb
  have ho : i % 32 ∈ List.range 32 := List.mem_range.mpr (by omega)
  have hcell := List.all_eq_true.mp hbatch (i % 32) ho
  have he : i / 32 * 32 + i % 32 = i := by omega
  simpa only [he, ite_eq_left hi] using hcell

def quotientExtra (C : Catalog) (endpoints : List Row) (index : ℕ) (r : Row) : Bool :=
  if C.allowed index = true then decide (r ∈ endpoints) else true

def quotientLeafCheck (C : Catalog) (endpoints : List Row) (u : Triple)
    (block : List Triple) (indices : List ℕ) : Bool :=
  assignmentsCheck key133 C (quotientExtra C endpoints)
    (block.flatMap (rowBlock u)) indices

def quotientUCheck (C : Catalog) (endpoints : List Row) (outer : List Triple)
    (u : Triple) (certs : List (List ℕ)) : Bool :=
  pairedCheck (quotientLeafCheck C endpoints u) (chunks16 outer) certs

def quotientRowsCheck (C : Catalog) (endpoints : List Row) (outer : List Triple)
    (certs : List (List (List ℕ))) : Bool :=
  pairedCheck (quotientUCheck C endpoints outer) outer certs

theorem quotientRow_catalogued (C : Catalog) (endpoints : List Row)
    (outer : List Triple) (certs : List (List (List ℕ)))
    (houter : eligibleTriples = outer)
    (hcheck : quotientRowsCheck C endpoints outer certs = true)
    (r : Row) (hr : Feasible r) :
    ∃ index, index < C.size ∧ key133 r = C.value index ∧
      quotientExtra C endpoints index r = true := by
  obtain ⟨hu, hv⟩ := feasible_outer_mem r hr
  rw [houter] at hu hv
  obtain ⟨ucerts, _, huc⟩ := pairedCheck_sound _ hcheck (r 1) hu
  obtain ⟨block, hblock, hvblock⟩ := mem_some_chunk hv
  obtain ⟨indices, _, hleaf⟩ := pairedCheck_sound _ huc block hblock
  have hrow : r ∈ block.flatMap (rowBlock (r 1)) :=
    List.mem_flatMap.mpr ⟨r 2, hvblock, feasible_mem_rowBlock r hr⟩
  exact assignmentsCheck_sound key133 C (quotientExtra C endpoints) hleaf r hrow

theorem quotient_pair_endpoints (C : Catalog) (endpoints : List Row)
    (outer : List Triple) (certs : List (List (List ℕ)))
    (houter : eligibleTriples = outer)
    (hcatalog : catalogAllCheck C targetKey133 = true)
    (hrows : quotientRowsCheck C endpoints outer certs = true)
    (a b : Row) (ha : Feasible a) (hb : Feasible b)
    (hkey : key133 a + key133 b = targetKey133) :
    a ∈ endpoints ∧ b ∈ endpoints := by
  obtain ⟨i, hi, hia, hixa⟩ := quotientRow_catalogued C endpoints outer certs houter hrows a ha
  obtain ⟨j, hj, hjb, hjxb⟩ := quotientRow_catalogued C endpoints outer certs houter hrows b hb
  have hkeys : C.value i + C.value j = targetKey133 := by omega
  have hall := catalogAllCheck_sound C targetKey133 hcatalog
  have hgoodi := catalog_pair_forces_allowed C targetKey133 hall hi hj hkeys
  have hgoodj := catalog_pair_forces_allowed C targetKey133 hall hj hi (by omega)
  constructor
  · simpa only [quotientExtra, hgoodi, ite_true, decide_eq_true_eq] using hixa
  · simpa only [quotientExtra, hgoodj, ite_true, decide_eq_true_eq] using hjxb

def endpointRowCheck (endpoints : List Row) (survivors : List (Row × Row))
    (a : Row) : Bool :=
  endpoints.all fun b =>
    if key133 a + key133 b = targetKey133 then decide ((a, b) ∈ survivors) else true

def endpointPairsCheck (endpoints : List Row) (survivors : List (Row × Row)) : Bool :=
  endpoints.all (endpointRowCheck endpoints survivors)

theorem endpointPairsCheck_sound (endpoints : List Row) (survivors : List (Row × Row))
    (h : endpointPairsCheck endpoints survivors = true)
    {a b : Row} (ha : a ∈ endpoints) (hb : b ∈ endpoints)
    (hkey : key133 a + key133 b = targetKey133) :
    (a, b) ∈ survivors := by
  have ha' := List.all_eq_true.mp h a ha
  have hb' := List.all_eq_true.mp ha' b hb
  rw [ite_eq_left hkey] at hb'
  exact of_decide_eq_true hb'

def marginRows (thirds : List Triple) (a : Triple) (block : List Triple) : List Row :=
  block.flatMap fun b => thirds.flatMap fun c =>
    let r : Row := ![a, b, c]
    if energy21 r ≤ 2261 then [r] else []

def marginLeafCheck (C : Catalog) (source : Row) (groups : Fin 3 → List Triple)
    (a : Triple) (block : List Triple) (indices : List ℕ) : Bool :=
  assignmentsCheck (jointKey source) C (fun _ _ => true)
    (marginRows (groups 2) a block) indices

def marginACheck (C : Catalog) (source : Row) (groups : Fin 3 → List Triple)
    (a : Triple) (certs : List (List ℕ)) : Bool :=
  pairedCheck (marginLeafCheck C source groups a) (chunks16 (groups 1)) certs

def marginSourceCheck (C : Catalog) (source : Row) (groups : Fin 3 → List Triple)
    (certs : List (List (List ℕ))) : Bool :=
  pairedCheck (marginACheck C source groups) (groups 0) certs

structure MarginPacket where
  groups : Fin 3 → List Triple
  certs : List (List (List ℕ))

def marginPacketCheck (C : Catalog) (source : Row) (packet : MarginPacket) : Bool :=
  decide (∀ i, marginTriples (source i) (if i = 0 then 1 else 3) = packet.groups i) &&
    marginSourceCheck C source packet.groups packet.certs

def marginAllCheck (C : Catalog) (sources : List Row) (packets : List MarginPacket) : Bool :=
  pairedCheck (marginPacketCheck C) sources packets

theorem margin_source_catalogued (C : Catalog) (source : Row)
    (groups : Fin 3 → List Triple) (certs : List (List (List ℕ)))
    (hcheck : marginSourceCheck C source groups certs = true)
    (r : Row) (h0 : r 0 ∈ groups 0) (h1 : r 1 ∈ groups 1) (h2 : r 2 ∈ groups 2)
    (he : energy21 r ≤ 2261) :
    ∃ index, index < C.size ∧ jointKey source r = C.value index := by
  obtain ⟨acerts, _, hac⟩ := pairedCheck_sound _ hcheck (r 0) h0
  obtain ⟨block, hblock, hr1⟩ := mem_some_chunk h1
  obtain ⟨indices, _, hleaf⟩ := pairedCheck_sound _ hac block hblock
  have hrow : r ∈ marginRows (groups 2) (r 0) block := by
    apply List.mem_flatMap.mpr
    refine ⟨r 1, hr1, ?_⟩
    apply List.mem_flatMap.mpr
    refine ⟨r 2, h2, ?_⟩
    dsimp only
    rw [fin3_eta r, ite_eq_left he]
    exact List.mem_singleton.mpr rfl
  obtain ⟨index, hi, hkey, _⟩ :=
    assignmentsCheck_sound (jointKey source) C (fun _ _ => true) hleaf r hrow
  exact ⟨index, hi, hkey⟩

theorem actual_margin_catalogued (C : Catalog) (sources : List Row)
    (packets : List MarginPacket) (hcheck : marginAllCheck C sources packets = true)
    (source : Row) (hsource : source ∈ sources) (L : Fin 3 → Row)
    (hL : ∀ k i j, L k i j ∈ smallDigits)
    (hs : ∀ i j, (∑ k, L k i j) = source i j)
    (he : energy21 (project21 L) ≤ 2261) :
    ∃ index, index < C.size ∧ jointKey source (project21 L) = C.value index := by
  obtain ⟨packet, _, hp⟩ := pairedCheck_sound _ hcheck source hsource
  simp only [marginPacketCheck, Bool.and_eq_true, decide_eq_true_eq] at hp
  let m := project21 L
  have h0 := squareSum_nonneg (m 0)
  have h1 := squareSum_nonneg (m 1)
  have h2 := squareSum_nonneg (m 2)
  have he' : squareSum (m 0) + 3 * squareSum (m 1) + 3 * squareSum (m 2) ≤ 2261 := he
  dsimp only [m] at h0 h1 h2 he'
  have hm0 := project_mem_marginTriples L source hL hs 0 1 (by omega)
  have hm1 := project_mem_marginTriples L source hL hs 1 3 (by omega)
  have hm2 := project_mem_marginTriples L source hL hs 2 3 (by omega)
  have hp0 : marginTriples (source 0) 1 = packet.groups 0 := by simpa using hp.1 0
  have hp1 : marginTriples (source 1) 3 = packet.groups 1 := by simpa using hp.1 1
  have hp2 : marginTriples (source 2) 3 = packet.groups 2 := by simpa using hp.1 2
  rw [hp0] at hm0
  rw [hp1] at hm1
  rw [hp2] at hm2
  exact margin_source_catalogued C source packet.groups packet.certs hp.2 m hm0 hm1 hm2 he

theorem catalog_no_joint_pair (C : Catalog)
    (hcatalog : catalogAllCheck C targetJointKey = true)
    (hnone : ∀ index, index < C.size → C.allowed index = false)
    {i j : ℕ} (hi : i < C.size) (hj : j < C.size) :
    C.value i + C.value j ≠ targetJointKey := by
  intro hsum
  have hgood := catalog_pair_forces_allowed C targetJointKey
    (catalogAllCheck_sound C targetJointKey hcatalog) hi hj hsum
  rw [hnone i hi] at hgood
  contradiction

end HadamardQuotient133
