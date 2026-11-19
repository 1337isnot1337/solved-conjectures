module

public import Conjectures.FranklCyclicGenerators
public import Conjectures.FranklLocalEnumerationCore

/-! Soundness of a checked window for the actual global cyclic family.
Literal certificates embed when the support fits. Wrapped certificates are
checked on the actual image family and require no injectivity assumption. -/
@[expose] public section

namespace FranklLocal

variable {α β : Type*} [DecidableEq α] [DecidableEq β]

theorem WeightCertificate.local_congr {G H : Finset (Finset α)} {W : Finset α}
    {w : α → ℝ} (hc : WeightCertificate H W w)
    (hlocal : localGenerators G W=localGenerators H W) : WeightCertificate G W w := by
  simpa only [WeightCertificate,boundary,compatible,hlocal] using hc

noncomputable def extendWeight (f : α → β) (w : α → ℝ) (y : β) : ℝ := by
  classical
  exact if h : ∃ x, f x=y then w (Classical.choose h) else 0

omit [DecidableEq α] [DecidableEq β] in
theorem extendWeight_apply (f : α → β) (hf : Function.Injective f) (w : α → ℝ)
    (x : α) : extendWeight f w (f x)=w x := by
  classical
  have h : ∃ z, f z=f x := ⟨x,rfl⟩
  unfold extendWeight
  rw [dite_eq_left h]
  exact congrArg w (hf (Classical.choose_spec h))

theorem image_local_certificate_transfer {G : Finset (Finset α)} {H : Finset (Finset β)}
    {W : Finset α} {w : α → ℝ} (hc : WeightCertificate G W w)
    (hw : ∀ x ∈ W, 0 ≤ w x) (hpos : ∃ x ∈ W, 0 < w x)
    (f : α → β) (hf : Function.Injective f)
    (hlocal : localGenerators H (W.image f)=
      localGenerators (imageFamily f G) (W.image f)) :
    ∃ y ∈ W.image f, Abundant (family H) y := by
  let v := extendWeight f w
  have hv : ∀ x ∈ W, v (f x)=w x := fun x _ => extendWeight_apply f hf w x
  have hcert := (hc.image f hf v hv).local_congr hlocal
  apply abundant_of_total_imbalance (w:=v)
  · intro y hy
    obtain ⟨x,hx,rfl⟩ := Finset.mem_image.mp hy
    rw [hv x hx]
    exact hw x hx
  · obtain ⟨x,hx,hxpos⟩ := hpos
    exact ⟨f x,Finset.mem_image_of_mem f hx,by simpa only [hv x hx] using hxpos⟩
  · exact weightCertificate_total hcert

theorem certificateCheck_positive {G : Finset (Finset α)} {W : Finset α}
    {w : α → ℕ} (hc : certificateCheck G W w=true) : ∃ x ∈ W, 0 < w x := by
  exact of_decide_eq_true (Bool.and_eq_true_iff.mp hc).1

end FranklLocal

namespace FranklCyclic

/-- An unwrapped literal table entry proves abundance in the entire family
whenever its w+6 point support embeds into the cycle. -/
theorem literal_certificate_global {n : ℕ} [NeZero n]
    (word : ZMod n → Finset (Fin 4)) (start : ZMod n) (w : ℕ)
    (hn : w+6 ≤ n) (weights : Fin (w+6) → ℕ)
    (hc : FranklLocal.certificateCheck (localTiles w (windowSchedule word start w))
      (windowCore w) weights=true) :
    ∃ y ∈ mappedCore start w, FranklLocal.Abundant (FranklLocal.family (generatedTiles word)) y := by
  apply FranklLocal.image_local_certificate_transfer
    (FranklLocal.certificateCheck_weightCertificate hc)
    (fun x _ => Nat.cast_nonneg (weights x))
    (f:=rawPosition start) (hf:=(positionEmbedding start hn).injective)
  · obtain ⟨x,hx,hpos⟩ := FranklLocal.certificateCheck_positive hc
    exact ⟨x,hx,by exact_mod_cast hpos⟩
  · exact local_generators_exact word start w

/-- For short cycles, evaluate the certificate on the actual modulo-n
generator image. Several literal core or boundary points may coincide. -/
theorem wrapped_certificate_global {n : ℕ} [NeZero n]
    (word : ZMod n → Finset (Fin 4)) (start : ZMod n) (w : ℕ)
    (weights : ZMod n → ℕ)
    (hc : FranklLocal.certificateCheck (mappedLocalTiles word start w)
      (mappedCore start w) weights=true) :
    ∃ y ∈ mappedCore start w, FranklLocal.Abundant (FranklLocal.family (generatedTiles word)) y :=
  FranklLocal.local_certificate_transfer (local_generators_exact word start w) hc

theorem wrapped_core_certificate_global {n : ℕ} [NeZero n]
    (word : ZMod n → Finset (Fin 4)) (start : ZMod n) (w : ℕ)
    (B : Finset (ZMod n)) (weights : ZMod n → ℕ)
    (hB : FranklLocal.boundary (mappedLocalTiles word start w) (mappedCore start w) ⊆ B)
    (hBW : Disjoint B (mappedCore start w))
    (hc : FranklLocal.coreCertificateCheck (mappedLocalTiles word start w)
      (mappedCore start w) B weights=true) :
    ∃ y ∈ mappedCore start w, FranklLocal.Abundant (FranklLocal.family (generatedTiles word)) y :=
  wrapped_certificate_global word start w weights
    (FranklLocal.coreCertificateCheck_sound hB hBW hc)

end FranklCyclic
