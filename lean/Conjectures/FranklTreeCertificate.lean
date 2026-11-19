module

public import Conjectures.FranklTreeSpan
public import Conjectures.FranklTreeRoot

@[expose] public section

/-!
# Composing exact tree-message certificates

Each multiplication and return-map reduction has a checked conic-combination
witness. All six alternating levels and every mixed triple at the root are
checked. The semantic conclusion concerns the actual three-state recursion;
the separate incidence-girth argument must identify a graph ball with that
recursion before obtaining the graph-frequency theorem.
-/

namespace FranklTreeCone

structure ProductStep where
  rays : List NatRay
  witnesses : List SpanWitness

structure ChildrenCertificate where
  steps : List ProductStep
  outgoing : List NatRay
  returnWitnesses : List SpanWitness

def finalProductRays (initial : List NatRay) : List ProductStep → List NatRay
  | [] => initial
  | step :: rest => finalProductRays step.rays rest

def productChecks (initial factors : List NatRay) : List ProductStep → Bool
  | [] => true
  | step :: rest => stepCheck initial factors step.rays step.witnesses &&
      productChecks step.rays factors rest

def childrenCheck (incoming : List NatRay) (cert : ChildrenCertificate) : Bool :=
  productChecks [(1 : NatRay)] (incoming.map natFactorMap) cert.steps &&
    returnCheck (finalProductRays [(1 : NatRay)] cert.steps)
      cert.outgoing cert.returnWitnesses

theorem productChecks_sound {initial factors : List NatRay} {steps : List ProductStep}
    (h : productChecks initial factors steps = true) {v : Message}
    (hv : v ∈ rayCone initial) (l : List Message)
    (hl : ∀ w ∈ l, w ∈ rayCone factors) (hlen : l.length = steps.length) :
    v * l.prod ∈ rayCone (finalProductRays initial steps) := by
  induction steps generalizing initial v l with
  | nil =>
      have he : l = [] := List.length_eq_zero_iff.mp hlen
      simpa [he, finalProductRays] using hv
  | cons step rest ih =>
      cases l with
      | nil => simp at hlen
      | cons w ws =>
          obtain ⟨hstep, hrest⟩ := Bool.and_eq_true_iff.mp h
          have hvw := stepCheck_sound hstep hv (hl w (by simp))
          have hws : ∀ x ∈ ws, x ∈ rayCone factors := fun x hx => hl x (by simp [hx])
          have hlen' : ws.length = rest.length := Nat.succ.inj hlen
          have hout := ih hrest hvw ws hws hlen'
          simpa only [finalProductRays, List.prod_cons, mul_assoc] using hout

/-- A complete degree certificate bounds all child lists of that degree. -/
theorem childrenCheck_sound {incoming : List NatRay} {cert : ChildrenCertificate}
    (h : childrenCheck incoming cert = true) (l : List Message)
    (hl : ∀ v ∈ l, v ∈ rayCone incoming) (hlen : l.length = cert.steps.length) :
    childrenMessage l ∈ rayCone cert.outgoing := by
  obtain ⟨hprod, hret⟩ := Bool.and_eq_true_iff.mp h
  have hone : (1 : Message) ∈ rayCone [(1 : NatRay)] := by
    have hm := castRay_mem_rayCone (rays := [(1 : NatRay)]) (r := (1 : NatRay)) (by simp)
    have hcast : castRay (1 : NatRay) = (1 : Message) := by ext i; exact Nat.cast_one
    rwa [hcast] at hm
  have hf : ∀ v ∈ l.map factorMap, v ∈ rayCone (incoming.map natFactorMap) := by
    intro v hv
    obtain ⟨w, hw, rfl⟩ := List.mem_map.mp hv
    exact factorMap_mem_rayCone (hl w hw)
  have hp := productChecks_sound hprod hone (l.map factorMap) hf (by simpa using hlen)
  exact returnCheck_sound hret (by simpa only [one_mul] using hp)

/-- A fully natural-number check of every mixed triple at the root. -/
def rootCheck (rays : List NatRay) (num den : ℕ) : Bool :=
  decide (0 < den ∧ num ≤ den ∧
    ∀ i : Fin rays.length, ∀ j : Fin rays.length, ∀ k : Fin rays.length,
      (den - num) * (natFactorMap rays[i] 0 * natFactorMap rays[j] 0 * natFactorMap rays[k] 0) +
          num * (natFactorMap rays[i] 2 * natFactorMap rays[j] 2 * natFactorMap rays[k] 2) ≤
        num * (natFactorMap rays[i] 1 * natFactorMap rays[j] 1 * natFactorMap rays[k] 1))

theorem rootCheck_ray_sound {rays : List NatRay} {num den : ℕ}
    (h : rootCheck rays num den = true) :
    ∀ a ∈ raySet rays, ∀ b ∈ raySet rays, ∀ c ∈ raySet rays,
      0 ≤ rootSlack num den a b c := by
  rintro _ ⟨a, ha, rfl⟩ _ ⟨b, hb, rfl⟩ _ ⟨c, hc, rfl⟩
  obtain ⟨i, hi, hai⟩ := List.getElem_of_mem ha
  obtain ⟨j, hj, hbj⟩ := List.getElem_of_mem hb
  obtain ⟨k, hk, hck⟩ := List.getElem_of_mem hc
  have hcheck := of_decide_eq_true h
  have hn := hcheck.2.2 ⟨i, hi⟩ ⟨j, hj⟩ ⟨k, hk⟩
  simp only [Fin.getElem_fin, hai, hbj, hck] at hn
  have hreal := (Nat.cast_le (α := ℝ)).mpr hn
  simp only [Nat.cast_add, Nat.cast_mul, Nat.cast_sub hcheck.2.1] at hreal
  have hzero := sub_nonneg.mpr hreal
  convert hzero using 1
  simp [rootSlack, natFactorMap, factorMap, castRay]
  ring

theorem rootCheck_sound {rays : List NatRay} {num den : ℕ}
    (h : rootCheck rays num den = true) {x y z : Message}
    (hx : x ∈ rayCone rays) (hy : y ∈ rayCone rays) (hz : z ∈ rayCone rays)
    (htotal : 0 < rootOccupiedCount x y z + rootUnoccupiedCount x y z) :
    rootOccupiedCount x y z /
        (rootOccupiedCount x y z + rootUnoccupiedCount x y z) ≤ (num : ℝ) / den := by
  have hd := (of_decide_eq_true h).1
  exact occupation_le_of_ray_triples (raySet rays) num den (rootCheck_ray_sound h)
    hx hy hz (Nat.cast_pos.mpr hd) htotal

structure AlternatingLevel where
  point : ChildrenCertificate
  generator : ChildrenCertificate

def boundaryRays : List NatRay := [![1, 0, 0], ![0, 1, 0], ![0, 0, 1]]

def finalRayPair (pointInput generatorInput : List NatRay) :
    List AlternatingLevel → List NatRay × List NatRay
  | [] => (pointInput, generatorInput)
  | level :: rest => finalRayPair level.point.outgoing level.generator.outgoing rest

def levelChecks (k : ℕ) (pointInput generatorInput : List NatRay) : List AlternatingLevel → Bool
  | [] => true
  | level :: rest => decide (level.point.steps.length = 2 ∧ level.generator.steps.length = k - 1) &&
      childrenCheck generatorInput level.point && childrenCheck pointInput level.generator &&
      levelChecks k level.point.outgoing level.generator.outgoing rest

def highGirthTreeCheck (k : ℕ) (levels : List AlternatingLevel) : Bool :=
  decide (levels.length = 6) && levelChecks k boundaryRays boundaryRays levels &&
    rootCheck (finalRayPair boundaryRays boundaryRays levels).2 481792 1000000

/-- The semantic set of outputs of a fixed-degree branch recursion. -/
def childMessageSet (degree : ℕ) (S : Set Message) : Set Message :=
  {v | ∃ l : List Message, l.length = degree ∧ (∀ w ∈ l, w ∈ S) ∧ childrenMessage l = v}

/-- Iterate alternating point/generator branch recursions from arbitrary
boundary message sets. -/
def iterateMessageSets (k : ℕ) (points generators : Set Message) : ℕ → Set Message × Set Message
  | 0 => (points, generators)
  | n + 1 => iterateMessageSets k (childMessageSet 2 generators) (childMessageSet (k - 1) points) n

theorem levelChecks_sound {k : ℕ} {pointInput generatorInput : List NatRay}
    {levels : List AlternatingLevel} (h : levelChecks k pointInput generatorInput levels = true)
    (P G : Set Message) (hP : P ⊆ rayCone pointInput) (hG : G ⊆ rayCone generatorInput) :
    (iterateMessageSets k P G levels.length).1 ⊆
        rayCone (finalRayPair pointInput generatorInput levels).1 ∧
      (iterateMessageSets k P G levels.length).2 ⊆
        rayCone (finalRayPair pointInput generatorInput levels).2 := by
  induction levels generalizing pointInput generatorInput P G with
  | nil => exact ⟨hP, hG⟩
  | cons level rest ih =>
      obtain ⟨hprev, hrest⟩ := Bool.and_eq_true_iff.mp h
      obtain ⟨hprev, hgen⟩ := Bool.and_eq_true_iff.mp hprev
      obtain ⟨hdeg, hpoint⟩ := Bool.and_eq_true_iff.mp hprev
      have hdegree := of_decide_eq_true hdeg
      have hP' : childMessageSet 2 G ⊆ rayCone level.point.outgoing := by
        rintro _ ⟨l, hlen, hl, rfl⟩
        exact childrenCheck_sound hpoint l (fun v hv => hG (hl v hv))
          (hlen.trans hdegree.1.symm)
      have hG' : childMessageSet (k - 1) P ⊆ rayCone level.generator.outgoing := by
        rintro _ ⟨l, hlen, hl, rfl⟩
        exact childrenCheck_sound hgen l (fun v hv => hP (hl v hv))
          (hlen.trans hdegree.2.symm)
      exact ih hrest (childMessageSet 2 G) (childMessageSet (k - 1) P) hP' hG'

/-- Six certified alternating levels give the uniform numerical tree bound.
The hypotheses concern only branch messages and a positive number of root
configurations; no equal-child assumption is made. -/
theorem highGirthTreeCheck_sound {k : ℕ} {levels : List AlternatingLevel}
    (h : highGirthTreeCheck k levels = true) {x y z : Message}
    (hx : x ∈ (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) 6).2)
    (hy : y ∈ (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) 6).2)
    (hz : z ∈ (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) 6).2)
    (htotal : 0 < rootOccupiedCount x y z + rootUnoccupiedCount x y z) :
    rootOccupiedCount x y z /
        (rootOccupiedCount x y z + rootUnoccupiedCount x y z) ≤ (481792 : ℝ) / 1000000 := by
  obtain ⟨hprev, hroot⟩ := Bool.and_eq_true_iff.mp h
  obtain ⟨hlen, hlevels⟩ := Bool.and_eq_true_iff.mp hprev
  have hlen' := of_decide_eq_true hlen
  have hcones := levelChecks_sound hlevels (rayCone boundaryRays) (rayCone boundaryRays)
    (fun _ hv => hv) (fun _ hv => hv)
  rw [hlen'] at hcones
  exact rootCheck_sound hroot (hcones.2 hx) (hcones.2 hy) (hcones.2 hz) htotal

end FranklTreeCone
