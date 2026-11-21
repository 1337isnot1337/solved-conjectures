"""Independent polynomial check for the full m >= 6 counterexample family.

Requires SymPy.  The input polynomials are formed from MacMahon's telescoped
product, independently of the conjecture's binomial-ratio representation.
No approximate arithmetic, fitting, or extrapolation is used.
"""
import sympy as s

m = s.symbols('m')


def box(k, ell):
    return s.prod(s.Rational(1, i+j-1)*(m+i+j-1)
                  for i in range(1,k+1) for j in range(1,ell+1))


def H(n):
    return s.Poly(s.expand(sum(box(k,n-1-k) for k in range(n))),m)


def L(seq):
    return [seq[i]*seq[i+2]-seq[i+1]**2 for i in range(len(seq)-2)]


if __name__=='__main__':
    values=[H(n) for n in range(2,9)]
    for _ in range(3):
        values=L(values)
    assert len(values)==1
    Q=s.Poly.from_list([
        1,42,723,6462,27742,-16148,-934842,-5962420,
        -21758691,-53818158,-97778329,-138523978,-159475276,
        -154920392,-129902448,-88784352,-37081152,-2892672],m)
    claimed=s.Poly(-m**4*(m-1)**4*(m+1)**5*(m+2)**2
                  *(m**4+9*m**3+26*m**2+36*m+72)*Q.as_expr()
                  /1547934105600,m)
    assert values[0]==claimed
    assert Q.eval(6)==264264378826752
    shifted=s.Poly(Q.as_expr().subs(m,m+6),m)
    assert all(c>0 for c in shifted.all_coeffs())
    print('Exact MacMahon-based identity verified; polynomial degree',values[0].degree())
    print('Q(6) =',Q.eval(6))
    print('Q(m+6), descending coefficients:',shifted.all_coeffs())
    print('PASS: L^3(H^[m])_2 < 0 for every real m >= 6')
