module

public import Conjectures.WaringGapSymmetryBridge

@[expose] public section

namespace WaringGapSymmetryCore

theorem coordinate_cancel (x L U V H i j u v al ar bl br : Nat)
    (hx : 0<x) (hdet : L*H=x+U*V)
    (ha : H*i+V*j+x*al=H*u+V*v+x*ar)
    (hb : U*i+L*j+x*bl=U*u+L*v+x*br) :
    i+L*al+V*br=u+L*ar+V*bl ∧
      j+H*bl+U*ar=v+H*br+U*al := by
  have h1 := congrArg (fun n : Nat => L*n) ha
  have h2 := congrArg (fun n : Nat => V*n) hb
  simp only [Nat.mul_add, ← Nat.mul_assoc] at h1 h2
  rw [hdet] at h1
  simp only [Nat.add_mul] at h1
  rw [Nat.mul_comm V U,Nat.mul_comm V L] at h2
  have h3 : x*i+(L*x)*al+(V*x)*br=x*u+(L*x)*ar+(V*x)*bl := by omega
  have h4 : x*(i+L*al+V*br)=x*(u+L*ar+V*bl) := by
    simp only [Nat.mul_add, ← Nat.mul_assoc]
    rw [Nat.mul_comm x L,Nat.mul_comm x V]
    exact h3
  have h5 := congrArg (fun n : Nat => H*n) hb
  have h6 := congrArg (fun n : Nat => U*n) ha
  simp only [Nat.mul_add, ← Nat.mul_assoc] at h5 h6
  rw [Nat.mul_comm H L,hdet] at h5
  simp only [Nat.add_mul] at h5
  rw [Nat.mul_comm H U] at h5
  have h7 : x*j+(H*x)*bl+(U*x)*ar=x*v+(H*x)*br+(U*x)*al := by omega
  have h8 : x*(j+H*bl+U*ar)=x*(v+H*br+U*al) := by
    simp only [Nat.mul_add, ← Nat.mul_assoc]
    rw [Nat.mul_comm x H,Nat.mul_comm x U]
    exact h7
  exact ⟨Nat.eq_of_mul_eq_mul_left hx h4,Nat.eq_of_mul_eq_mul_left hx h8⟩

theorem shifts_of_residue (a b x : Nat) (ha : a<x+x) (hb : b<x+x)
    (he : a%x=b%x) :
    ∃ l r, ((l=0 ∧ r=0) ∨ (l=0 ∧ r=1) ∨ (l=1 ∧ r=0)) ∧
      a+x*l=b+x*r := by
  rcases residue_trichotomy a b x ha hb he with h|h|h
  · exact ⟨0,0,Or.inl ⟨rfl,rfl⟩,by simpa using h⟩
  · exact ⟨0,1,Or.inr (Or.inl ⟨rfl,rfl⟩),by simpa using h⟩
  · exact ⟨1,0,Or.inr (Or.inr ⟨rfl,rfl⟩),by simpa using h.symm⟩

theorem unique_of_coordinate_certificate (d : ReductionData) (hA hB : Nat)
    (hdet : d.L*d.H=d.x+d.U*d.V)
    (boundA : d.H*d.L+d.V*d.H<d.x+d.x)
    (boundB : d.U*d.L+d.L*d.H<d.x+d.x)
    (ha1 : (hA*d.y)%d.x=d.H%d.x)
    (ha2 : (hA*d.z)%d.x=d.V%d.x)
    (hb1 : (hB*d.y)%d.x=d.U%d.x)
    (hb2 : (hB*d.z)%d.x=d.L%d.x) :
    UniqueReduced d := by
  intro i j u v hi hu he
  have hrA := coordinate_mod d.x d.y d.z d.H d.V hA ha1 ha2 i j u v he
  have hrB := coordinate_mod d.x d.y d.z d.U d.L hB hb1 hb2 i j u v he
  obtain ⟨hi1,hi2,hi3⟩ := hi
  obtain ⟨hu1,hu2,hu3⟩ := hu
  have hAi : d.H*i+d.V*j<d.x+d.x := by
    have h1 := Nat.mul_le_mul_left d.H (Nat.le_of_lt hi1)
    have h2 := Nat.mul_le_mul_left d.V (Nat.le_of_lt hi2)
    omega
  have hAu : d.H*u+d.V*v<d.x+d.x := by
    have h1 := Nat.mul_le_mul_left d.H (Nat.le_of_lt hu1)
    have h2 := Nat.mul_le_mul_left d.V (Nat.le_of_lt hu2)
    omega
  have hBi : d.U*i+d.L*j<d.x+d.x := by
    have h1 := Nat.mul_le_mul_left d.U (Nat.le_of_lt hi1)
    have h2 := Nat.mul_le_mul_left d.L (Nat.le_of_lt hi2)
    omega
  have hBu : d.U*u+d.L*v<d.x+d.x := by
    have h1 := Nat.mul_le_mul_left d.U (Nat.le_of_lt hu1)
    have h2 := Nat.mul_le_mul_left d.L (Nat.le_of_lt hu2)
    omega
  obtain ⟨al,ar,ha,hea⟩ := shifts_of_residue _ _ _ hAi hAu hrA
  obtain ⟨bl,br,hb,heb⟩ := shifts_of_residue _ _ _ hBi hBu hrB
  obtain ⟨h1,h2⟩ := coordinate_cancel d.x d.L d.U d.V d.H i j u v al ar bl br
    d.x_pos hdet hea heb
  have hLV := d.LV
  have hHU := d.HU
  clear he hrA hrB ha1 ha2 hb1 hb2 hea heb hAi hAu hBi hBu boundA boundB hdet
  rcases ha with ⟨rfl,rfl⟩|⟨rfl,rfl⟩|⟨rfl,rfl⟩ <;>
    rcases hb with ⟨rfl,rfl⟩|⟨rfl,rfl⟩|⟨rfl,rfl⟩ <;>
    simp only [Nat.mul_zero,Nat.mul_one,Nat.add_zero] at h1 h2 <;> omega

end WaringGapSymmetryCore
