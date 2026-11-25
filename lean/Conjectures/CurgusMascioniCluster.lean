import Mathlib.Topology.Sequences
import Mathlib.Topology.Instances.ENNReal.Lemmas
import Mathlib.Topology.MetricSpace.Pseudo.Basic
import Mathlib.Analysis.Normed.Group.Basic
import Mathlib.Topology.MetricSpace.ProperSpace

namespace CurgusMascioniCluster

open Filter Set
open scoped ENNReal Topology

theorem distance_subseq {I E : Type*} [Finite I] [PseudoEMetricSpace E] (x : ℕ → I → E) :
    ∃ (s : ℕ → ℕ) (L : I → I → ℝ≥0∞), StrictMono s ∧
      (∀ i j, Tendsto (fun n => edist (x (s n) i) (x (s n) j)) atTop (𝓝 (L i j))) ∧
      Equivalence (fun i j => L i j ≠ ⊤) := by
  let D (n : ℕ) (i j : I) := edist (x n i) (x n j)
  obtain ⟨L,s,hs,ht⟩ := CompactSpace.tendsto_subseq D
  have ht' (i j : I) : Tendsto (fun n => edist (x (s n) i) (x (s n) j))
      atTop (𝓝 (L i j)) := by
    have hi := (tendsto_pi_nhds.mp ht) i
    exact (tendsto_pi_nhds.mp hi) j
  refine ⟨s,L,hs,ht',⟨?_,?_,?_⟩⟩
  · intro i
    have hz : Tendsto (fun n => edist (x (s n) i) (x (s n) i)) atTop (𝓝 (0 : ℝ≥0∞)) := by
      simpa only [edist_self] using tendsto_const_nhds
    rw [tendsto_nhds_unique (ht' i i) hz]
    exact ENNReal.zero_ne_top
  · intro i j hij
    have eq : L j i = L i j := tendsto_nhds_unique (ht' j i)
      (by simpa only [edist_comm (x (s _) i) (x (s _) j)] using ht' i j)
    rwa [eq]
  · intro i j k hij hjk
    have htadd : Tendsto (fun n => edist (x (s n) i) (x (s n) j) +
        edist (x (s n) j) (x (s n) k)) atTop (𝓝 (L i j + L j k)) :=
      (ht' i j).add (ht' j k)
    have hle := le_of_tendsto_of_tendsto' (ht' i k) htadd
      (fun n => edist_triangle (x (s n) i) (x (s n) j) (x (s n) k))
    exact ne_top_of_le_ne_top (ENNReal.add_ne_top.mpr ⟨hij,hjk⟩) hle

theorem centered_subseq {I E : Type*} [Finite I] [NormedAddCommGroup E] [ProperSpace E]
    (x : ℕ → I → E) (c : I → I) (L : I → ℝ≥0∞)
    (hL : ∀ i, Tendsto (fun n => edist (x n i) (x n (c i))) atTop (𝓝 (L i)))
    (hfin : ∀ i, L i ≠ ⊤) :
    ∃ (s : ℕ → ℕ) (w : I → E), StrictMono s ∧
      ∀ i, Tendsto (fun n => x (s n) i - x (s n) (c i)) atTop (𝓝 (w i)) := by
  let u (n : ℕ) (i : I) := x n i - x n (c i)
  let C (i : I) := Metric.closedBall (0 : E) ((L i).toReal + 1)
  have hset : Set.pi Set.univ C = {v : I → E | ∀ i, v i ∈ C i} := by ext v; simp
  have hc : IsCompact (Set.pi Set.univ C) := by
    rw [hset]
    exact isCompact_pi_infinite fun i => isCompact_closedBall (0 : E) ((L i).toReal+1)
  have hC : ∀ᶠ n in atTop, u n ∈ Set.pi Set.univ C := by
    have hB (i : I) : ∀ᶠ n in atTop, u n i ∈ C i := by
      have ht := (ENNReal.tendsto_toReal (hfin i)).comp (hL i)
      have ht' : Tendsto (fun n => dist (x n i) (x n (c i))) atTop (𝓝 (L i).toReal) := by
        simpa [Function.comp_def, dist_edist] using ht
      have he := ht'.eventually (gt_mem_nhds (lt_add_of_pos_right ((L i).toReal) zero_lt_one))
      filter_upwards [he] with n hn
      simpa only [C, u, Metric.mem_closedBall, dist_zero_right, ← dist_eq_norm] using hn.le
    simpa only [Set.mem_pi, Set.mem_univ, true_implies] using (eventually_all.mpr hB)
  obtain ⟨w,_,s,hs,ht⟩ := hc.tendsto_subseq' hC.frequently
  exact ⟨s,w,hs,fun i => (tendsto_pi_nhds.mp ht) i⟩

/-- Simultaneous finite cluster decomposition for labelled root sequences. -/
theorem cluster_subseq {I E : Type*} [Finite I] [NormedAddCommGroup E] [ProperSpace E]
    (x : ℕ → I → E) :
    ∃ (s : ℕ → ℕ) (L : I → I → ℝ≥0∞) (c : I → I) (w : I → E), StrictMono s ∧
      (∀ i j, Tendsto (fun n => edist (x (s n) i) (x (s n) j)) atTop (𝓝 (L i j))) ∧
      (∀ i j, c i = c j ↔ L i j ≠ ⊤) ∧
      (∀ i, L i (c i) ≠ ⊤) ∧
      ∀ i, Tendsto (fun n => x (s n) i - x (s n) (c i)) atTop (𝓝 (w i)) := by
  obtain ⟨s,L,hs,hL,hE⟩ := distance_subseq x
  let S : Setoid I := ⟨_,hE⟩
  let c (i : I) := (Quotient.mk S i).out
  have hc (i : I) : L i (c i) ≠ ⊤ := by
    apply hE.symm
    exact Quotient.exact (Quotient.out_eq (Quotient.mk S i))
  have hcent (i j : I) : c i = c j ↔ L i j ≠ ⊤ := by
    constructor
    · intro h
      have hi := hc i
      rw [h] at hi
      exact hE.trans hi (hE.symm (hc j))
    · intro h
      exact congrArg Quotient.out (Quotient.sound (s := S) h)
  obtain ⟨t,w,ht,hw⟩ := centered_subseq (fun n => x (s n)) c (fun i => L i (c i))
    (fun i => hL i (c i)) hc
  refine ⟨s ∘ t,L,c,w,hs.comp ht,?_,hcent,hc,hw⟩
  intro i j
  exact (hL i j).comp ht.tendsto_atTop

end CurgusMascioniCluster
