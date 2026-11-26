import Conjectures.SaganWilsonPlacticModeDP

/-!
The enumerated word list is duplicate-free, has precisely the stated
alphabet and length, and is filtered by the actual insertion-tableau
centralizer predicate. This completes the finite-cardinality bridge for
every alphabet size and word length.
-/

namespace SaganWilsonPlacticMode

theorem nodup_map_injective {A B : Type} (f : A → B)
    (hf : ∀ x y, f x = f y → x = y) (l : List A) (hl : l.Nodup) :
    (l.map f).Nodup := by
  induction l with
  | nil => simp
  | cons a as ih =>
    have hh := List.nodup_cons.mp hl
    rw [List.map_cons, List.nodup_cons]
    constructor
    · intro h
      rcases List.mem_map.mp h with ⟨x, hx, hax⟩
      have hxa := hf x a hax
      subst x
      exact hh.1 hx
    · exact ih hh.2

theorem words_nodup (a : List Nat) (n : Nat) (ha : a.Nodup) :
    (words a n).Nodup := by
  induction n with
  | zero => simp [words]
  | succ n ih =>
    simp only [words]
    have aux (b : List Nat) (hb : b.Nodup) :
        (b.flatMap fun x => (words a n).map (List.cons x)).Nodup := by
      induction b with
      | nil => simp
      | cons x xs ihxs =>
        have hh := List.nodup_cons.mp hb
        rw [List.flatMap_cons, List.nodup_append]
        refine ⟨nodup_map_injective (List.cons x) (fun y z h => (List.cons.inj h).2)
          (words a n) ih, ihxs hh.2, ?_⟩
        intro u hu v hv he
        rcases List.mem_map.mp hu with ⟨uu, _, rfl⟩
        rcases List.mem_flatMap.mp hv with ⟨y, hy, hyv⟩
        rcases List.mem_map.mp hyv with ⟨vv, _, rfl⟩
        have hxy := (List.cons.inj he).1
        rw [← hxy] at hy
        exact hh.1 hy
    exact aux a ha

theorem alphabet_nodup (m : Nat) : (alphabet m).Nodup :=
  nodup_map_injective (·+1) (fun x y h => by omega) (List.range m) List.nodup_range

theorem nodup_filter_bool {A : Type} (p : A → Bool) (l : List A) (hl : l.Nodup) :
    (l.filter p).Nodup := by
  induction l with
  | nil => simp
  | cons a as ih =>
    have hh := List.nodup_cons.mp hl
    cases hpa : p a with
    | false => simpa [List.filter, hpa] using ih hh.2
    | true =>
      simp only [List.filter, hpa, List.nodup_cons]
      exact ⟨fun h => hh.1 (List.mem_filter.mp h).1, ih hh.2⟩

def centralizerWords (m n : Nat) : List (List Nat) :=
  (words (alphabet m) n).filter isCentralizer

theorem centralizerWords_mem_iff (m n : Nat) (w : List Nat) :
    w ∈ centralizerWords m n ↔
      (w.length = n ∧ (∀ x ∈ w, 1 ≤ x ∧ x ≤ m)) ∧ CentralizesOne w := by
  simp [centralizerWords, words_mem_iff, mem_alphabet, isCentralizer, CentralizesOne]

theorem centralizerWords_nodup (m n : Nat) : (centralizerWords m n).Nodup :=
  nodup_filter_bool isCentralizer _ (words_nodup (alphabet m) n (alphabet_nodup m))

theorem countFast_eq_card (m n : Nat) :
    countFast m n = (centralizerWords m n).length := by
  rw [countFast_correct, centralizer_count (alphabet m) n
    (fun x hx => ((mem_alphabet m x).mp hx).1), List.countP_eq_length_filter]
  rfl

end SaganWilsonPlacticMode
