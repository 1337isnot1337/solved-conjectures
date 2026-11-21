import Conjectures.ChenKhareSahiCone
import Conjectures.ChenKhareSahiProducts

namespace ChenKhareSahi

abbrev SymFun := ℝ → ℝ → ℝ → ℝ
abbrev Partition := ℕ × ℕ × ℕ

inductive MonoCone (n : ℕ) : SymFun → Prop
  | zero : MonoCone n (fun _ _ _ => 0)
  | basis (p : Partition) : p ∈ partitions n → MonoCone n (fun x y z => realP p x y z)
  | add {f g} : MonoCone n f → MonoCone n g → MonoCone n (fun x y z => f x y z + g x y z)
  | scale (a : ℝ) {f} : 0 ≤ a → MonoCone n f → MonoCone n (fun x y z => a * f x y z)

theorem MonoCone.list_sum (n : ℕ) (ps : List Partition) (coeff : Partition → ℝ)
    (hp : ∀ p ∈ ps, p ∈ partitions n) (hc : ∀ p ∈ ps, 0 ≤ coeff p) :
    MonoCone n (fun x y z => (ps.map (fun p => coeff p * realP p x y z)).sum) := by
  induction ps with
  | nil => exact MonoCone.zero
  | cons p ps ih =>
    have hps : ∀ p ∈ ps, p ∈ partitions n := fun p h => hp p (by simp [h])
    have hcs : ∀ p ∈ ps, 0 ≤ coeff p := fun p h => hc p (by simp [h])
    have hfirst := MonoCone.scale (coeff p) (hc p (by simp)) (MonoCone.basis p (hp p (by simp)))
    simpa only [List.map_cons, List.sum_cons] using MonoCone.add hfirst (ih hps hcs)


theorem ReducedCone.zero : ReducedCone (fun _ _ _ => 0) := by
  have h := ReducedCone.scale 0 (by norm_num) (ReducedCone.monomial (6,0,0) (by simp [partitions]))
  simpa using h

theorem MonoCone.to_reduced {f : SymFun} (hf : MonoCone 6 f) : ReducedCone f := by
  induction hf with
  | zero => exact ReducedCone.zero
  | basis p hp => exact ReducedCone.monomial p hp
  | add hf hg ihf ihg => exact ReducedCone.add ihf ihg
  | scale a ha hf ih => exact ReducedCone.scale a ha ih

theorem MonoCone.one_cover (n : ℕ) (hn : 2 ≤ n) (hmax : n ≤ 6)
    (e : Partition × Partition) (he : e ∈ covers n) {f : SymFun} (hf : MonoCone (6-n) f) :
    ReducedCone (fun x y z => realD e.1 e.2 x y z * f x y z) := by
  induction hf with
  | zero => simpa using ReducedCone.zero
  | basis p hp => exact ReducedCone.one n e p hn hmax he hp
  | add hf hg ihf ihg =>
    convert ReducedCone.add ihf ihg using 1
    funext x y z
    ring
  | scale a ha hf ih =>
    convert ReducedCone.scale a ha ih using 1
    funext x y z
    ring

theorem MonoCone.two_covers (n m : ℕ) (hn : 2 ≤ n) (hm : 2 ≤ m) (hmax : n+m ≤ 6)
    (e f : Partition × Partition) (he : e ∈ covers n) (hf : f ∈ covers m)
    {g : SymFun} (hg : MonoCone (6-n-m) g) :
    ReducedCone (fun x y z => realD e.1 e.2 x y z * realD f.1 f.2 x y z * g x y z) := by
  induction hg with
  | zero => simpa using ReducedCone.zero
  | basis p hp => exact ReducedCone.two n m e f p hn hm hmax he hf hp
  | add hg hj ihg ihj =>
    convert ReducedCone.add ihg ihj using 1
    funext x y z
    ring
  | scale a ha hg ih =>
    convert ReducedCone.scale a ha ih using 1
    funext x y z
    ring

theorem MonoCone.three_covers (n m k : ℕ) (hn : 2 ≤ n) (hm : 2 ≤ m) (hk : 2 ≤ k) (hmax : n+m+k ≤ 6)
    (e f g : Partition × Partition) (he : e ∈ covers n) (hf : f ∈ covers m) (hg : g ∈ covers k)
    {v : SymFun} (hv : MonoCone 0 v) :
    ReducedCone (fun x y z => realD e.1 e.2 x y z * realD f.1 f.2 x y z * realD g.1 g.2 x y z * v x y z) := by
  induction hv with
  | zero => simpa using ReducedCone.zero
  | basis p hp =>
    have hp' : p = (0,0,0) := by simpa [partitions] using hp
    subst p
    have h := ReducedCone.three n m k e f g hn hm hk hmax he hf hg
    simpa [realP, realM, orbit, Finset.sum_insert, Finset.sum_singleton] using h
  | add hv hw ihv ihw =>
    convert ReducedCone.add ihv ihw using 1
    funext x y z
    ring
  | scale a ha hv ih =>
    convert ReducedCone.scale a ha ih using 1
    funext x y z
    ring


theorem MonoCone.mul_of_basis (n m : ℕ)
    (hbasis : ∀ p ∈ partitions n, ∀ q ∈ partitions m,
      MonoCone (n+m) (fun x y z => realP p x y z * realP q x y z))
    {f g : SymFun} (hf : MonoCone n f) (hg : MonoCone m g) :
    MonoCone (n+m) (fun x y z => f x y z * g x y z) := by
  induction hf with
  | zero => simpa using (MonoCone.zero (n := n+m))
  | basis p hp =>
    induction hg with
    | zero => simpa using (MonoCone.zero (n := n+m))
    | basis q hq => exact hbasis p hp q hq
    | add hg hh ihg ihh =>
      convert MonoCone.add ihg ihh using 1
      funext x y z
      ring
    | scale a ha hg ih =>
      convert MonoCone.scale a ha ih using 1
      funext x y z
      ring
  | add hf hh ihf ihh =>
    convert MonoCone.add ihf ihh using 1
    funext x y z
    ring
  | scale a ha hf ih =>
    convert MonoCone.scale a ha ih using 1
    funext x y z
    ring


inductive WordCone : ℕ → SymFun → Prop
  | mono {n f} : MonoCone n f → WordCone n f
  | cover (n m : ℕ) (e : Partition × Partition) {f : SymFun} :
      2 ≤ n → e ∈ covers n → WordCone m f →
      WordCone (n+m) (fun x y z => realD e.1 e.2 x y z * f x y z)
  | add {n f g} : WordCone n f → WordCone n g → WordCone n (fun x y z => f x y z + g x y z)
  | scale {n f} (a : ℝ) : 0 ≤ a → WordCone n f → WordCone n (fun x y z => a * f x y z)

theorem WordCone.three_prefix (n m k t : ℕ) (hn : 2 ≤ n) (hm : 2 ≤ m) (hk : 2 ≤ k)
    (htotal : n+m+k+t = 6) (e f g : Partition × Partition)
    (he : e ∈ covers n) (hf : f ∈ covers m) (hg : g ∈ covers k)
    {v : SymFun} (hv : WordCone t v) :
    ReducedCone (fun x y z => realD e.1 e.2 x y z * realD f.1 f.2 x y z * realD g.1 g.2 x y z * v x y z) := by
  induction hv with
  | @mono t v hv =>
    have ht : t=0 := by omega
    cases ht
    exact MonoCone.three_covers n m k hn hm hk (by omega) e f g he hf hg hv
  | @cover a b q w ha hq hw ih => omega
  | @add t v w hv hw ihv ihw =>
    have htotal' : n+m+k+t = 6 := htotal
    convert ReducedCone.add (ihv htotal') (ihw htotal') using 1
    funext x y z
    ring
  | @scale t v a ha hv ih =>
    have htotal' : n+m+k+t = 6 := htotal
    convert ReducedCone.scale a ha (ih htotal') using 1
    funext x y z
    ring


theorem WordCone.two_prefix (n m t : ℕ) (hn : 2 ≤ n) (hm : 2 ≤ m)
    (htotal : n+m+t = 6) (e f : Partition × Partition)
    (he : e ∈ covers n) (hf : f ∈ covers m) {v : SymFun} (hv : WordCone t v) :
    ReducedCone (fun x y z => realD e.1 e.2 x y z * realD f.1 f.2 x y z * v x y z) := by
  induction hv with
  | @mono t v hv =>
    have ht : t = 6-n-m := by omega
    cases ht
    exact MonoCone.two_covers n m hn hm (by omega) e f he hf hv
  | @cover k t g v hk hg hv ih =>
    have ht : n+m+k+t = 6 := by omega
    have h := WordCone.three_prefix n m k t hn hm hk ht e f g he hf hg hv
    convert h using 1
    funext x y z
    ring
  | @add t v w hv hw ihv ihw =>
    convert ReducedCone.add (ihv htotal) (ihw htotal) using 1
    funext x y z
    ring
  | @scale t v a ha hv ih =>
    convert ReducedCone.scale a ha (ih htotal) using 1
    funext x y z
    ring

theorem WordCone.one_prefix (n t : ℕ) (hn : 2 ≤ n) (htotal : n+t = 6)
    (e : Partition × Partition) (he : e ∈ covers n) {v : SymFun} (hv : WordCone t v) :
    ReducedCone (fun x y z => realD e.1 e.2 x y z * v x y z) := by
  induction hv with
  | @mono t v hv =>
    have ht : t = 6-n := by omega
    cases ht
    exact MonoCone.one_cover n hn (by omega) e he hv
  | @cover m t f v hm hf hv ih =>
    have ht : n+m+t = 6 := by omega
    have h := WordCone.two_prefix n m t hn hm ht e f he hf hv
    convert h using 1
    funext x y z
    ring
  | @add t v w hv hw ihv ihw =>
    convert ReducedCone.add (ihv htotal) (ihw htotal) using 1
    funext x y z
    ring
  | @scale t v a ha hv ih =>
    convert ReducedCone.scale a ha (ih htotal) using 1
    funext x y z
    ring

theorem WordCone.to_reduced {t : ℕ} {v : SymFun} (hv : WordCone t v) (ht : t = 6) : ReducedCone v := by
  induction hv with
  | mono hv =>
    cases ht
    exact hv.to_reduced
  | @cover n t e v hn he hv ih => exact WordCone.one_prefix n t hn (by omega) e he hv
  | add hv hw ihv ihw => exact ReducedCone.add (ihv ht) (ihw ht)
  | scale a ha hv ih => exact ReducedCone.scale a ha (ih ht)


theorem MonoCone.mul (n m : ℕ) (h : n+m ≤ 6) {f g : SymFun}
    (hf : MonoCone n f) (hg : MonoCone m g) :
    MonoCone (n+m) (fun x y z => f x y z * g x y z) := by
  apply MonoCone.mul_of_basis n m ?_ hf hg
  intro p hp q hq
  have hs := MonoCone.list_sum (n+m) (partitions (n+m)) (realCoeff p q)
    (fun _ h => h) (fun r _ => realCoeff_nonnegative p q r)
  convert hs using 1
  funext x y z
  exact product_decomposition n m h p q hp hq x y z


theorem WordCone.mul_mono {n : ℕ} {f : SymFun} (hf : WordCone n f) :
    ∀ m : ℕ, ∀ g : SymFun, n+m ≤ 6 → MonoCone m g →
      WordCone (n+m) (fun x y z => f x y z * g x y z) := by
  induction hf with
  | @mono n f hf =>
    intro m g h hg
    exact WordCone.mono (MonoCone.mul n m h hf hg)
  | @cover a b e f ha he hf ih =>
    intro m g h hg
    have hw := ih m g (by omega) hg
    have hr := WordCone.cover a (b+m) e ha he hw
    have hi : a + (b+m) = (a+b)+m := by omega
    rw [hi] at hr
    convert hr using 1
    funext x y z
    ring
  | @add n f h hf hh ihf ihh =>
    intro m g ht hg
    convert WordCone.add (ihf m g ht hg) (ihh m g ht hg) using 1
    funext x y z
    ring
  | @scale n f a ha hf ih =>
    intro m g ht hg
    convert WordCone.scale a ha (ih m g ht hg) using 1
    funext x y z
    ring

theorem WordCone.mul {n : ℕ} {f : SymFun} (hf : WordCone n f) :
    ∀ m : ℕ, ∀ g : SymFun, n+m ≤ 6 → WordCone m g →
      WordCone (n+m) (fun x y z => f x y z * g x y z) := by
  induction hf with
  | @mono n f hf =>
    intro m g h hg
    have hr := hg.mul_mono n f (by omega) hf
    have hi : m+n = n+m := by omega
    rw [hi] at hr
    convert hr using 1
    funext x y z
    ring
  | @cover a b e f ha he hf ih =>
    intro m g h hg
    have hw := ih m g (by omega) hg
    have hr := WordCone.cover a (b+m) e ha he hw
    have hi : a + (b+m) = (a+b)+m := by omega
    rw [hi] at hr
    convert hr using 1
    funext x y z
    ring
  | @add n f h hf hh ihf ihh =>
    intro m g ht hg
    convert WordCone.add (ihf m g ht hg) (ihh m g ht hg) using 1
    funext x y z
    ring
  | @scale n f a ha hf ih =>
    intro m g ht hg
    convert WordCone.scale a ha (ih m g ht hg) using 1
    funext x y z
    ring


theorem cover_min_degree (n : ℕ) (hn : n ≤ 6) (e : Partition × Partition) (he : e ∈ covers n) : 2 ≤ n := by
  by_contra h
  have hsmall : n ≤ 1 := by omega
  interval_cases n <;> norm_num [covers, partitions, dominates, degree] at he

theorem WordCone.single_cover (n : ℕ) (hn : n ≤ 6) (e : Partition × Partition) (he : e ∈ covers n) :
    WordCone n (fun x y z => realD e.1 e.2 x y z) := by
  have hmin := cover_min_degree n hn e he
  have hzero : WordCone 0 (fun x y z => realP (0,0,0) x y z) :=
    WordCone.mono (MonoCone.basis (0,0,0) (by simp [partitions]))
  have h := WordCone.cover n 0 e hmin he hzero
  simpa [realP, realM, orbit, Finset.sum_insert, Finset.sum_singleton] using h

theorem WordCone.sum_covers (n : ℕ) (hn : n ≤ 6) (es : List (Partition × Partition))
    (he : ∀ e ∈ es, e ∈ covers n) :
    WordCone n (fun x y z => (es.map (fun e => realD e.1 e.2 x y z)).sum) := by
  induction es with
  | nil => simpa using WordCone.mono (MonoCone.zero (n := n))
  | cons e es ih =>
    have h1 := WordCone.single_cover n hn e (he e (by simp))
    have h2 := ih (fun e h => he e (by simp [h]))
    simpa only [List.map_cons, List.sum_cons] using WordCone.add h1 h2

theorem WordCone.difference (n : ℕ) (hn : n ≤ 6) (a b : Partition)
    (ha1 : a.2.1 ≤ a.1) (ha2 : a.2.2 ≤ a.2.1) (hda : degree a = n)
    (hb1 : b.2.1 ≤ b.1) (hb2 : b.2.2 ≤ b.2.1) (hdb : degree b = n)
    (hab : dominates a b) : WordCone n (fun x y z => realD a b x y z) := by
  obtain ⟨es, he, hsum⟩ := dominance_decomposes n a b hn ha1 ha2 hda hb1 hb2 hdb hab
    (fun p : Partition => fun x y z => realP p x y z)
  have hw := WordCone.sum_covers n hn es he
  convert hw using 1
  funext x y z
  have hx := congrFun (congrFun (congrFun hsum x) y) z
  have hpoint : (es.map (fun e => (fun x y z => realP e.1 x y z) - fun x y z => realP e.2 x y z)).sum x y z =
      (es.map (fun e => realP e.1 x y z - realP e.2 x y z)).sum := by
    clear he hsum hw hx
    induction es with
    | nil => rfl
    | cons e es ih => simpa using ih
  rw [hpoint] at hx
  simpa [realD] using hx


inductive HomSemiring : ℕ → SymFun → Prop
  | zero (n : ℕ) : HomSemiring n (fun _ _ _ => 0)
  | monomial (n : ℕ) (p : Partition) : p.2.1 ≤ p.1 → p.2.2 ≤ p.2.1 → degree p = n →
      HomSemiring n (fun x y z => realP p x y z)
  | difference (n : ℕ) (a b : Partition) :
      a.2.1 ≤ a.1 → a.2.2 ≤ a.2.1 → degree a = n →
      b.2.1 ≤ b.1 → b.2.2 ≤ b.2.1 → degree b = n → dominates a b →
      HomSemiring n (fun x y z => realD a b x y z)
  | add {n f g} : HomSemiring n f → HomSemiring n g → HomSemiring n (fun x y z => f x y z + g x y z)
  | mul {n m f g} : HomSemiring n f → HomSemiring m g → HomSemiring (n+m) (fun x y z => f x y z * g x y z)
  | scale {n f} (a : ℝ) : 0 ≤ a → HomSemiring n f → HomSemiring n (fun x y z => a * f x y z)

theorem HomSemiring.toWord {n : ℕ} {f : SymFun} (hf : HomSemiring n f) : n ≤ 6 → WordCone n f := by
  induction hf with
  | zero n => intro hn; exact WordCone.mono MonoCone.zero
  | monomial n p h1 h2 hd =>
    intro hn
    apply WordCone.mono
    exact MonoCone.basis p (partitions_complete n p.1 p.2.1 p.2.2 hn h1 h2 hd)
  | difference n a b ha1 ha2 hda hb1 hb2 hdb hab =>
    intro hn
    exact WordCone.difference n hn a b ha1 ha2 hda hb1 hb2 hdb hab
  | add hf hg ihf ihg => intro hn; exact WordCone.add (ihf hn) (ihg hn)
  | @mul n m f g hf hg ihf ihg =>
    intro hnm
    exact WordCone.mul (ihf (by omega)) m g hnm (ihg (by omega))
  | scale a ha hf ih => intro hn; exact WordCone.scale a ha (ih hn)

theorem HomSemiring.degree_six_reduces {f : SymFun} (hf : HomSemiring 6 f) : ReducedCone f :=
  (hf.toWord (by omega)).to_reduced rfl

theorem HomSemiring.excludes_counterexample :
    ¬ HomSemiring 6 (fun x y z => realP420 x y z / realP420 1 1 1 - realP411 x y z / realP411 1 1 1) := by
  intro h
  exact reduced_cone_excludes_counterexample h.degree_six_reduces

end ChenKhareSahi
