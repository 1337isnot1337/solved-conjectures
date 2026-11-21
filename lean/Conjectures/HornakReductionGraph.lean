import Conjectures.HornakListTiling

/-! Structural steps for reducing arbitrary connected partitions to arm
packing and finite subset sums. -/
namespace Hornak

/-- Every noncentral connected class in a graph partition has a unique
host arm. -/
theorem partition_hosts {m p : ℕ} (arms : Fin m → ℕ) (sizes : Fin p → ℕ)
    (hpart : Partitionable arms sizes) :
    ∃ color : Vertex arms → Fin p,
      (∀ k, Fintype.card {v : Vertex arms // color v = k} = sizes k ∧
        ((graph arms).induce {v | color v = k}).Connected) ∧
      ∃ host : {k : Fin p // k ≠ color none} → Fin m,
        ∀ (k : {k : Fin p // k ≠ color none}) v, color v = k.val →
          branch v = some (host k) := by
  classical
  obtain ⟨color,hcolor⟩ := hpart
  refine ⟨color,hcolor,?_⟩
  have hhost (k : {k : Fin p // k ≠ color none}) :
      ∃ i : Fin m, ∀ v, color v = k.val → branch v = some i := by
    apply connected_piece_has_arm {v | color v = k.val}
    · change color none ≠ k.val
      exact Ne.symm k.property
    · exact (hcolor k.val).2
  choose host hhost using hhost
  exact ⟨host,hhost⟩

/-- Vertices in a specified arm are in bijection with positions along it. -/
noncomputable def armVertexEquiv {m : ℕ} (arms : Fin m → ℕ) (i : Fin m) :
    Fin (arms i) ≃ {v : Vertex arms // branch v = some i} := by
  let f : Fin (arms i) → {v : Vertex arms // branch v = some i} :=
    fun p => ⟨some ⟨i,p⟩,rfl⟩
  apply Equiv.ofBijective f
  constructor
  · intro p q h
    have hh := congrArg Subtype.val h
    have hs := Option.some.inj hh
    exact (Sigma.mk.inj_iff.mp hs).2 |> eq_of_heq
  · rintro ⟨v,hv⟩
    cases v with
    | none => simp [branch] at hv
    | some v =>
      rcases v with ⟨j,p⟩
      have hj : j=i := by simpa [branch] using hv
      subst j
      exact ⟨p,rfl⟩

/-- The total cardinality of a collection of distinct noncentral classes
hosted by one arm is at most the size of that arm. -/
theorem hosted_classes_fit {m p : ℕ} (arms : Fin m → ℕ)
    (sizes : Fin p → ℕ) (color : Vertex arms → Fin p)
    (hcard : ∀ k, Fintype.card {v : Vertex arms // color v = k} = sizes k)
    (host : {k : Fin p // k ≠ color none} → Fin m)
    (hhost : ∀ (k : {k : Fin p // k ≠ color none}) v, color v = k.val →
      branch v = some (host k)) (i : Fin m) :
    (∑ k : {k : {k : Fin p // k ≠ color none} // host k = i}, sizes k.val.val) ≤ arms i := by
  classical
  let I := {k : {k : Fin p // k ≠ color none} // host k = i}
  let V := Σ k : I, {v : Vertex arms // color v = k.val.val}
  let f : V → {v : Vertex arms // branch v = some i} := fun z =>
    ⟨z.2.val, by have h := hhost z.1.val z.2.val z.2.property; simpa [z.1.property] using h⟩
  have hinj : Function.Injective f := by
    intro x y hxy
    have hv : x.2.val = y.2.val := congrArg Subtype.val hxy
    have hk : x.1 = y.1 := by
      apply Subtype.ext
      apply Subtype.ext
      have hx := x.2.property
      have hy := y.2.property
      rw [hv] at hx
      exact hx.symm.trans hy
    cases x with
    | mk xk xv =>
      cases y with
      | mk yk yv =>
        dsimp at hk
        subst yk
        have he : xv = yv := Subtype.ext hv
        subst yv
        rfl
  have hle := Fintype.card_le_of_injective f hinj
  have hV : Fintype.card V = ∑ k : I, sizes k.val.val := by
    simp only [V, Fintype.card_sigma]
    apply Finset.sum_congr rfl
    intro k _
    exact hcard k.val.val
  have htarget : Fintype.card {v : Vertex arms // branch v = some i} = arms i := by
    simpa using (Fintype.card_congr (armVertexEquiv arms i)).symm
  rw [hV, htarget] at hle
  exact hle

/-- Every connected partition induces an arm packing of all classes
except the one containing the center. -/
theorem partition_induces_arm_packing {m p : ℕ} (arms : Fin m → ℕ) (sizes : Fin p → ℕ)
    (hpart : Partitionable arms sizes) :
    ∃ color : Vertex arms → Fin p,
      (∀ k, Fintype.card {v : Vertex arms // color v = k} = sizes k ∧
        ((graph arms).induce {v | color v = k}).Connected) ∧
      ∃ host : {k : Fin p // k ≠ color none} → Fin m,
        ∀ i : Fin m,
          (∑ k : {k : {k : Fin p // k ≠ color none} // host k = i}, sizes k.val.val) ≤ arms i := by
  obtain ⟨color,hcolor,host,hhost⟩ := partition_hosts arms sizes hpart
  refine ⟨color,hcolor,host,?_⟩
  intro i
  exact hosted_classes_fit arms sizes color (fun k => (hcolor k).1) host hhost i

end Hornak
