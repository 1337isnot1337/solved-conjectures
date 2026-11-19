import Conjectures.HadamardQuotient133CatalogVerified
import Conjectures.HadamardQuotient133RowsVerified
import Conjectures.HadamardQuotient133MarginsVerified
import Conjectures.HadamardQuotient133Orbits

/-!
# Exhaustive quotient-133 classification and the projected no-lift obstruction

Every bounded odd normalized row enters the checked finite catalogue.  The
actual correlation equations force the two rows into the explicit list of
32 distinct ordered pairs.  Every actual three-layer lift enters a larger
necessary-condition margin list, whose checked catalogue has no complementary
joint fingerprint.  No producer output, spectral bound, or enumeration claim
is a hypothesis of the final theorems.
-/

namespace HadamardQuotient133

open scoped BigOperators

def IsQuotientPair (a b : Row) : Prop :=
  BoundedOdd a ∧ BoundedOdd b ∧ weightedSum a = 1 ∧ weightedSum b = 1 ∧
    ∀ t, correlation133 a t + correlation133 b t = if t = 0 then 2378 else -18

theorem key133_pair_of_signatures (a b : Row)
    (h : ∀ k, signature133 a k + signature133 b k = target133 k) :
    key133 a + key133 b = targetKey133 := by
  simpa only [key133, fingerprint_target133] using
    fingerprint_pair (signature133 a) (signature133 b) target133 h

theorem quotient133_pair_mem_survivors (a b : Row)
    (ha : BoundedOdd a) (hb : BoundedOdd b)
    (hsa : weightedSum a = 1) (hsb : weightedSum b = 1)
    (hcorr : ∀ t, correlation133 a t + correlation133 b t =
      if t = 0 then 2378 else -18) :
    (a, b) ∈ Finite.survivors := by
  have hsig := signatures133_of_correlations a b hcorr
  obtain ⟨hfa, hfb⟩ := feasible_of_pair a b ha hb hsa hsb hsig
  have hkey := key133_pair_of_signatures a b hsig
  obtain ⟨hea, heb⟩ := quotient_pair_endpoints
    Finite.quotientCatalog Finite.endpoints Finite.outerTriples Finite.quotientCerts
    Finite.outer_checked Finite.quotient_catalog_checked Finite.quotient_rows_checked
    a b hfa hfb hkey
  exact endpointPairsCheck_sound Finite.endpoints Finite.survivors
    Finite.endpoints_checked hea heb hkey

theorem quotient133_pair_iff (a b : Row) :
    IsQuotientPair a b ↔ (a, b) ∈ Finite.survivors := by
  constructor
  · rintro ⟨ha, hb, hsa, hsb, hcorr⟩
    exact quotient133_pair_mem_survivors a b ha hb hsa hsb hcorr
  · intro hmem
    have hcheck := List.all_eq_true.mp Finite.survivors_checked (a, b) hmem
    have hvalid : Finite.SurvivorValid (a, b) := of_decide_eq_true hcheck
    obtain ⟨ha, hb, hsa, hsb, hsig⟩ := hvalid
    exact ⟨ha, hb, hsa, hsb, signatures133_suffice a b hsig⟩

theorem quotient133_exactly_thirty_two :
    Finite.survivors.Nodup ∧ Finite.survivors.length = 32 ∧
      ∀ a b : Row, IsQuotientPair a b ↔ (a, b) ∈ Finite.survivors :=
  ⟨Finite.survivors_nodup, Finite.survivors_length, quotient133_pair_iff⟩

theorem quotient133_no_lift (a b : Row)
    (ha : BoundedOdd a) (hb : BoundedOdd b)
    (hsa : weightedSum a = 1) (hsb : weightedSum b = 1)
    (hcorr : ∀ t, correlation133 a t + correlation133 b t =
      if t = 0 then 2378 else -18)
    (L R : Fin 3 → Row)
    (hL : ∀ k i j, L k i j ∈ smallDigits)
    (hR : ∀ k i j, R k i j ∈ smallDigits)
    (hsL : ∀ i j, (∑ k, L k i j) = a i j)
    (hsR : ∀ i j, (∑ k, R k i j) = b i j)
    (hcorr21 : ∀ t, correlation21 (project21 L) t + correlation21 (project21 R) t =
      if t = 0 then 2282 else -114) : False := by
  have hsig := signatures133_of_correlations a b hcorr
  obtain ⟨hfa, hfb⟩ := feasible_of_pair a b ha hb hsa hsb hsig
  have hkey := key133_pair_of_signatures a b hsig
  obtain ⟨hea, heb⟩ := quotient_pair_endpoints
    Finite.quotientCatalog Finite.endpoints Finite.outerTriples Finite.quotientCerts
    Finite.outer_checked Finite.quotient_catalog_checked Finite.quotient_rows_checked
    a b hfa hfb hkey
  have hsig21 := signatures21_of_correlations (project21 L) (project21 R) hcorr21
  obtain ⟨heL, heR⟩ := margin_energy_bound_of_pair L R hL hR hsig21
  obtain ⟨i, hi, hLi⟩ := actual_margin_catalogued Finite.marginCatalog Finite.endpoints
    Finite.marginPackets Finite.margins_checked a hea L hL hsL heL
  obtain ⟨j, hj, hRj⟩ := actual_margin_catalogued Finite.marginCatalog Finite.endpoints
    Finite.marginPackets Finite.margins_checked b heb R hR hsR heR
  have hkey21 := fingerprint_pair
    (signature21 (project21 L)) (signature21 (project21 R)) target21 hsig21
  change key21 (project21 L) + key21 (project21 R) = fingerprint target21 at hkey21
  have htarget := fingerprint_target21
  rw [fingerprint_target133] at htarget
  have hsum : jointKey a (project21 L) + jointKey b (project21 R) = targetJointKey := by
    dsimp [jointKey]
    omega
  exact (catalog_no_joint_pair Finite.marginCatalog Finite.margin_catalog_checked
    (by intro _ _; rfl) hi hj) (by omega)

end HadamardQuotient133

