"""Generate the explicit dual-number certificate for the Li coefficient.

The weights are `Dual` numbers `c0 + c1*ε` with `ε^2 = 0`.  Each leaf
elimination stores only the updated value at the parent, so the final root
value is a concrete dual number and the kernel arithmetic is small.
"""
from fractions import Fraction

STEPS = [(30,29),(29,28),(28,27),(27,26),(26,25),(25,24),(24,23),(23,22),(22,21),
         (21,20),(20,19),(19,18),(18,17),(17,16),(16,0),(14,13),(13,12),(12,11),
         (11,10),(10,9),(9,8),(15,8),(8,7),(7,6),(6,5),(5,4),(4,0),(3,2),(2,0),(1,0)]

W0 = [(Fraction(1), Fraction(1,2)), (Fraction(-1), Fraction(1,2)), (Fraction(0), Fraction(-1))]

def mul(x, y):
    return (x[0]*y[0], x[0]*y[1] + x[1]*y[0])

def add(x, y):
    return (x[0]+y[0], x[1]+y[1])

def sub(x, y):
    return (x[0]-y[0], x[1]-y[1])

tables = [[list(W0) for _ in range(31)]]
for (l, p) in STEPS:
    prev = tables[-1]
    cur = [row[:] for row in prev]
    total = add(add(prev[l][0], prev[l][1]), prev[l][2])
    for i in range(3):
        cur[p][i] = mul(prev[p][i], sub(total, prev[l][i]))
    tables.append(cur)

final = tables[-1]
Z = add(add(final[0][0], final[0][1]), final[0][2])
assert Z[1] == 29, Z
print("final root dual number:", Z)

def q(v):
    s = str(v.numerator) if v.denominator == 1 else f"({v.numerator}/{v.denominator})"
    if s.startswith('-'):
        s = f"({s})"
    return s

def dm(x):
    return f"Dual.mk {q(x[0])} {q(x[1])}"

L = []
L.append('import Conjectures.LiDualFull')
L.append('import Conjectures.LiEliminate')
L.append('import Conjectures.LiBasic')
L.append('')
L.append('/-!')
L.append('# Numerical certificate for the Li coefficient, over the dual numbers')
L.append('')
L.append('Each step of the leaf-elimination chain records only the updated weight of the')
L.append('parent vertex.  The final root value is therefore a concrete dual number and')
L.append('the kernel arithmetic is small.  The result is the `t`-coefficient `29`.')
L.append('-/')
L.append('')
L.append('open SimpleGraph')
L.append('open scoped BigOperators')
L.append('')
L.append('namespace LiCompute')
L.append('')
L.append('abbrev R := Dual')
L.append('')
L.append('/-- The three truncated weights. -/')
L.append('def wR : Fin 3 \u2192 Dual :=')
L.append('  ![Dual.mk 1 (1/2), Dual.mk (-1) (1/2), Dual.mk 0 (-1)]')
L.append('')
L.append('def W0 : Fin 31 \u2192 Fin 3 \u2192 Dual := fun _ => wR')
L.append('')
for k in range(1, 31):
    l, p = STEPS[k-1]
    a, b, c = (dm(tables[k][p][i]) for i in range(3))
    L.append(f'def T{k} : Fin 3 \u2192 Dual :=')
    L.append(f'  ![{a}, {b}, {c}]')
    L.append('')
    prev = 'W0' if k == 1 else f'W{k-1}'
    L.append(f'def W{k} : Fin 31 \u2192 Fin 3 \u2192 Dual := fun v i => if v = {p} then T{k} i else {prev} v i')
    L.append('')
for k in range(1, 31):
    l, p = STEPS[k-1]
    prev = 'W0' if k == 1 else f'W{k-1}'
    L.append(f'lemma update{k} :')
    L.append(f'    Function.update {prev} {p} (fun i => {prev} {p} i * (({chr(8721)} j : Fin 3, {prev} {l} j) - {prev} {l} i)) = W{k} := by')
    L.append('  funext v i')
    L.append('  by_cases hv : v = ' + str(p))
    L.append('  \u00b7 subst hv')
    L.append(f'    simp only [Function.update_self, W{k}]')
    L.append('    rw [ite_eq_left trivial]')
    L.append('    fin_cases i')
    for idx in range(3):
        val = dm(tables[k][p][idx])
        if k == 1:
            defs = 'W0, wR'
        else:
            defs = ', '.join(['W0'] + [f'W{j}' for j in range(1, k)] + ['wR'] +
                             [f'T{j}' for j in range(1, k)])
        L.append(f'    \u00b7 change {prev} {p} {idx} * (({chr(8721)} j : Fin 3, {prev} {l} j) - {prev} {l} {idx}) = {val}')
        L.append(f'      simp only [{defs}, Fin.sum_univ_three, Matrix.cons_val_zero]')
        L.append('      apply Dual.ext <;> norm_num')
    L.append('  \u00b7 rw [Function.update_of_ne hv]')
    L.append(f'    simp [W{k}, ite_eq_right hv]')
    L.append('')
L.append('lemma partFunOn_zero (w : Fin 31 \u2192 Fin 3 \u2192 Dual) :')
L.append('    LiElim.partFunOn Li.T ({0} : Finset (Fin 31)) w = w 0 0 + w 0 1 + w 0 2 := by')
L.append('  classical')
L.append('  let e0 : {v // v \u2208 ({0} : Finset (Fin 31))} := \u27e80, Finset.mem_singleton_self 0\u27e9')
L.append('  have e0_unique : \u2200 a : {v // v \u2208 ({0} : Finset (Fin 31))}, a = e0 := by')
L.append('    intro a')
L.append('    exact Subtype.ext (Finset.mem_singleton.mp a.2)')
L.append('  have hproper : \u2200 \u03ba : {v // v \u2208 ({0} : Finset (Fin 31))} \u2192 Fin 3,')
L.append('      (\u2200 u v : {v // v \u2208 ({0} : Finset (Fin 31))}, Li.T.Adj u v \u2192 \u03ba u \u2260 \u03ba v) := by')
L.append('    intro \u03ba u v huv')
L.append('    have hu : (u : Fin 31) = 0 := Finset.mem_singleton.mp u.2')
L.append('    have hv : (v : Fin 31) = 0 := Finset.mem_singleton.mp v.2')
L.append('    rw [hu, hv] at huv')
L.append('    exact (Li.T.loopless.irrefl 0 huv).elim')
L.append('  let ee : ({v // v \u2208 ({0} : Finset (Fin 31))} \u2192 Fin 3) \u2243 Fin 3 :=')
L.append('    { toFun := fun \u03ba => \u03ba e0')
L.append('      invFun := fun i => fun _ => i')
L.append('      left_inv := fun \u03ba => by')
L.append('        funext a')
L.append('        rw [e0_unique a]')
L.append('      right_inv := fun i => rfl }')
L.append('  rw [LiElim.partFunOn]')
L.append('  trans \u2211 \u03ba : {v // v \u2208 ({0} : Finset (Fin 31))} \u2192 Fin 3, w 0 (\u03ba e0)')
L.append('  \u00b7 apply Finset.sum_congr rfl')
L.append('    intro \u03ba _')
L.append('    rw [ite_eq_left (hproper \u03ba)]')
L.append('    have hattach : ({0} : Finset (Fin 31)).attach = {e0} := by')
L.append('      ext a')
L.append('      simp only [Finset.mem_attach, Finset.mem_singleton, true_iff]')
L.append('      exact e0_unique a')
L.append('    rw [hattach, Finset.prod_singleton]')
L.append('  \u00b7 rw [Fintype.sum_equiv ee _ _ ?_]')
L.append('    \u00b7 rw [Fin.sum_univ_three]')
L.append('    \u00b7 intro \u03ba')
L.append('      rfl')
L.append('')
L.append('set_option maxHeartbeats 0 in')
L.append('set_option maxRecDepth 100000 in')
L.append('theorem coeff_29 : (LiElim.partFunOn Li.T Finset.univ W0).c1 = 29 := by')
S = 'Finset.univ'
for k in range(1, 31):
    l, p = STEPS[k-1]
    prev = 'W0' if k == 1 else f'W{k-1}'
    L.append(f'  have step{k} : LiElim.partFunOn Li.T {S} {prev} = LiElim.partFunOn Li.T ({S}.erase {l}) W{k} := by')
    L.append(f'    rw [LiElim.partFunOn_erase Li.T {S} {l} {p} (by decide) (by decide) (by decide) (by decide) {prev}, update{k}]')
    L.append(f'  rw [step{k}]')
    S = f'({S}.erase {l})'
L.append(f'  have hS : {S} = ({{0}} : Finset (Fin 31)) := by decide')
L.append('  rw [hS, partFunOn_zero]')
L.append('  simp only [W30, ite_eq_left rfl, T30, Matrix.cons_val_zero, Dual.snd_add]')
L.append('  norm_num')
L.append('')
L.append('end LiCompute')
open('lean/Conjectures/LiCompute.lean', 'w', encoding='utf-8').write('\n'.join(L) + '\n')
print('generated lean file')
