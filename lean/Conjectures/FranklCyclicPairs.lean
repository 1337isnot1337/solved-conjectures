module

public import Conjectures.FranklCyclicCertificates
public import Conjectures.FranklFamilyShortcuts

/-! Two-neighbor pruning remains sound if boundary points identify, provided
no point identifies with a distinct point in the central core. -/
@[expose] public section

namespace FranklLocal

variable {α β : Type*} [DecidableEq α] [DecidableEq β]

def pairCertificateCheck (G : Finset (Finset α)) (g : Finset α) : Bool :=
  decide (∃ x ∈ g, ∃ y ∈ g, ∀ h ∈ G, ¬ Disjoint h g → x ∈ h ∨ y ∈ h)

theorem pairCertificateCheck_sound {G : Finset (Finset α)} {g : Finset α}
    (hc : pairCertificateCheck G g=true) :
    ∃ x ∈ g, ∃ y ∈ g, ∀ h ∈ G, ¬ Disjoint h g → x ∈ h ∨ y ∈ h :=
  of_decide_eq_true hc

theorem pairCertificateCheck_abundance {G : Finset (Finset α)} {g : Finset α}
    (hg : g ∈ G) (hc : pairCertificateCheck G g=true) :
    ∃ x ∈ g, Abundant (family G) x := by
  obtain ⟨x,hx,y,hy,hhit⟩ := pairCertificateCheck_sound hc
  rcases two_neighbor_generator_abundance hg hx hy hhit with hab | hab
  · exact ⟨x,hx,hab⟩
  · exact ⟨y,hy,hab⟩

theorem pairCertificateCheck_local_abundance {G H : Finset (Finset α)}
    {g W : Finset α} (hg : g ∈ G) (hgW : g ⊆ W)
    (hlocal : localGenerators G W=localGenerators H W)
    (hc : pairCertificateCheck H g=true) :
    ∃ x ∈ g, Abundant (family G) x := by
  obtain ⟨x,hx,y,hy,hhit⟩ := pairCertificateCheck_sound hc
  have hhitG : ∀ h ∈ G, ¬ Disjoint h g → x ∈ h ∨ y ∈ h := by
    intro h hh hmeet
    have hW : ¬ Disjoint h W := by
      intro hd
      apply hmeet
      exact Finset.disjoint_left.mpr (fun _ hz hzG => Finset.disjoint_left.mp hd hz (hgW hzG))
    have hloc : h ∈ localGenerators H W := hlocal ▸ Finset.mem_filter.mpr ⟨hh,hW⟩
    exact hhit h (Finset.mem_filter.mp hloc).1 hmeet
  rcases two_neighbor_generator_abundance hg hx hy hhitG with hab | hab
  · exact ⟨x,hx,hab⟩
  · exact ⟨y,hy,hab⟩

def SeparatesCore (f : α → β) (W : Finset α) : Prop :=
  ∀ x ∈ W, ∀ y, f y=f x → y=x

theorem pairCertificateCheck_image {G : Finset (Finset α)} {g W : Finset α}
    (f : α → β) (hf : SeparatesCore f W) (hgW : g ⊆ W)
    (hc : pairCertificateCheck G g=true) :
    pairCertificateCheck (imageFamily f G) (g.image f)=true := by
  obtain ⟨x,hx,y,hy,hhit⟩ := pairCertificateCheck_sound hc
  apply decide_eq_true
  refine ⟨f x,Finset.mem_image_of_mem f hx,f y,Finset.mem_image_of_mem f hy,?_⟩
  intro h hh hmeet
  obtain ⟨h0,hh0,rfl⟩ := Finset.mem_image.mp hh
  have hmeet0 : ¬ Disjoint h0 g := by
    intro hd
    apply hmeet
    apply Finset.disjoint_left.mpr
    intro z hzH hzG
    obtain ⟨a,ha,haz⟩ := Finset.mem_image.mp hzH
    obtain ⟨b,hb,hbz⟩ := Finset.mem_image.mp hzG
    have hab : a=b := hf b (hgW hb) a (haz.trans hbz.symm)
    exact Finset.disjoint_left.mp hd (hab ▸ ha) hb
  exact (hhit h0 hh0 hmeet0).imp (Finset.mem_image_of_mem f) (Finset.mem_image_of_mem f)

end FranklLocal

namespace FranklCyclic

/-- The width-w core is separated from every support position as soon as
n ≥ w+3. Only the two exterior boundary blocks can then identify. -/
theorem rawPosition_separates_core {n w : ℕ} (start : ZMod n) (hn : w+3 ≤ n) :
    FranklLocal.SeparatesCore (rawPosition start) (windowCore w) := by
  intro p hp q hqp
  have hpW := (mem_windowCore w p).mp hp
  have hpN : p.val < n := by omega
  have hmod : q.val % n=p.val := by
    have hval := congrArg ZMod.val (add_left_cancel hqp)
    simpa only [ZMod.val_natCast,Nat.mod_eq_of_lt hpN] using hval
  have hqN : q.val < n := by
    by_contra hnot
    have hnq : n ≤ q.val := by omega
    have hsub : q.val-n < n := by have hq := q.isLt; omega
    rw [Nat.mod_eq_sub_mod hnq,Nat.mod_eq_of_lt hsub] at hmod
    have hq := q.isLt
    omega
  apply Fin.ext
  rwa [Nat.mod_eq_of_lt hqN] at hmod

def centralTile (j : Fin 4) : Finset (Fin 10) := localTile 4 ⟨3,by decide⟩ j

theorem centralTile_subset_core (j : Fin 4) : centralTile j ⊆ windowCore 4 := by
  intro x hx
  obtain ⟨q,_,rfl⟩ := Finset.mem_map.mp hx
  apply (mem_windowCore 4 _).mpr
  change 3 ≤ 3+q.val ∧ 3+q.val < 4+3
  have hq := q.isLt
  omega

def windowPairCheck (word : Fin 7 → Finset (Fin 4)) : Bool :=
  decide (∃ j ∈ word ⟨3,by decide⟩,
    FranklLocal.pairCertificateCheck (localTiles 4 word) (centralTile j)=true)

theorem windowPairCheck_sound (word : Fin 7 → Finset (Fin 4))
    (hc : windowPairCheck word=true) :
    ∃ j ∈ word ⟨3,by decide⟩,
      FranklLocal.pairCertificateCheck (localTiles 4 word) (centralTile j)=true :=
  of_decide_eq_true hc

/-- The seven-letter two-neighbor check is valid for every n ≥ 7, even
though its ten-position support need not embed into the cycle. -/
theorem window_pair_certificate_global {n : ℕ} [NeZero n]
    (word : ZMod n → Finset (Fin 4)) (start : ZMod n) (hn : 7 ≤ n)
    (hc : windowPairCheck (windowSchedule word start 4)=true) :
    ∃ x ∈ mappedCore start 4, FranklLocal.Abundant (FranklLocal.family (generatedTiles word)) x := by
  obtain ⟨j,hj,hpair⟩ := windowPairCheck_sound _ hc
  have hgen : centralTile j ∈ localTiles 4 (windowSchedule word start 4) :=
    (mem_localTiles _ _ _).mpr ⟨⟨3,by decide⟩,j,hj,rfl⟩
  have himage : (centralTile j).image (rawPosition start) ∈ mappedLocalTiles word start 4 :=
    Finset.mem_image.mpr ⟨centralTile j,hgen,rfl⟩
  have hsub := Finset.image_subset_image (f:=rawPosition start) (centralTile_subset_core j)
  have hpairImage := FranklLocal.pairCertificateCheck_image (rawPosition start)
    (rawPosition_separates_core start hn) (centralTile_subset_core j) hpair
  obtain ⟨x,hx,hab⟩ := FranklLocal.pairCertificateCheck_local_abundance
    (mappedLocalTiles_subset word start 4 himage) hsub (local_generators_exact word start 4) hpairImage
  exact ⟨x,hsub hx,hab⟩

end FranklCyclic
