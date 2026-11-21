"""Exact operator checks for triangular_fixed_reset_obstruction.md.

The pole argument is a written all-order proof, not a finite-range test.
"""

from itertools import product
import sympy as sp

from bordered_partition_checks import border, column_replacements
from triangular_recurrence_invariant_gap import append


def operator(h, t, alpha, beta):
    return sp.expand((t*t-1)*(1+(alpha+beta)*t+alpha*beta*t*t)*sp.diff(h,t,2)
                     +(2*(1-alpha+beta)*t+4*(alpha+beta)*t*t+6*alpha*beta*t**3)*sp.diff(h,t)
                     +(2+2*(alpha+beta)*t+6*alpha*beta*t*t)*h)


def check_formal_operator():
    t,y,z,alpha,beta=sp.symbols('t y z alpha beta')
    h=sp.Function('h')(t)
    H1=(1+y)*(1+t)*sp.diff(h,t)+2*y*h
    H2=(1+z)*((t-1)*sp.diff(H1,t)+(1+y)*sp.diff(H1,y))+2*z*H1
    restricted=H2.subs({y:alpha*t,z:beta*t})
    assert sp.expand(restricted-operator(h,t,alpha,beta))==0
    fixed=operator(h,t,-1,1)
    f=1-t*t
    assert sp.expand(fixed+sp.diff(f*sp.diff(f*h,t),t))==0
    # D_x=(1-t²)D_t and U h=(1-t²)h under t=tanh(x).
    assert sp.expand(f*fixed+f*sp.diff(f*sp.diff(f*h,t),t))==0
    d=sp.symbols('d')
    assert sp.expand(d*(d-1)+6*d+6-(d+2)*(d+3))==0


def restricted_polynomial(coefficients, signs, t):
    return sp.expand(sum(value*sp.prod(signs[j] for j in range(len(signs)) if mask>>j&1)
                         *t**mask.bit_count() for mask,value in enumerate(coefficients)))


def check_actual_reset():
    b=[[1,0,0],[1,1,0],[0,1,1]]
    w=(-1,1,-1)
    reset=append(append(b,w),tuple(-x for x in w)+(1,))
    old_coefficients=column_replacements(border(b))
    new_coefficients=column_replacements(border(reset))
    t=sp.symbols('t')
    h=restricted_polynomial(old_coefficients,w,t)
    for alpha,beta in product((-1,1),repeat=2):
        direct=restricted_polynomial(new_coefficients,w+(alpha,beta),t)
        assert sp.expand(direct-operator(h,t,alpha,beta))==0


if __name__=='__main__':
    check_formal_operator()
    check_actual_reset()
    print('All four direction-update operators derived symbolically from the full hierarchy.')
    print('Fixed (-1,+1) factorization and tanh-change differential identity checked exactly.')
    print('Operators checked against actual replacement permanents for one complete reset.')
