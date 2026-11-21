"""Exact algebra checks for the radius proof; not a numerical proof of roots.

Run with Python 3 and SymPy.  The all-degree argument is in PROOF.md.
"""
import sympy as sp

z, t, beta = sp.symbols('z t beta')
checks = 0


def assert_zero(expr, label):
    global checks
    assert sp.expand(expr) == 0, label
    checks += 1


def falling(x, k):
    return sp.prod(x-j for j in range(k))


def diagonal(n):
    # (beta)_n/(beta)_k is kept polynomial, avoiding symbolic division.
    return sp.expand(sum(sp.binomial(n,k)*t**(n-k)*falling(z,k)
                         *sp.rf(beta+k,n-k) for k in range(n+1)))


ps = [diagonal(n) for n in range(9)]
assert_zero(ps[0]-1, 'degree zero')
assert_zero(ps[1]-z-beta*t, 'degree one')
for n in range(1,8):
    assert_zero(ps[n+1]-(z-n+(2*n+beta)*t)*ps[n]
                -t*(1-t)*n*(n+beta-1)*ps[n-1], ('recurrence',n))
for n in range(1,9):
    assert_zero(ps[n].subs(t,1)-sp.rf(z+beta,n), ('sharpness',n))
    assert_zero(ps[n].subs(z,-z-beta)-(-1)**n*ps[n].subs(t,1-t),
                ('diagonal reflection',n))
    assert_zero(sum(sp.binomial(n,k)*falling(z,k)*sp.rf(beta+k,n-k)
                     for k in range(n+1))-sp.rf(z+beta,n),
                ('finite Vandermonde',n))

# Symmetric multiaffine reflection, with independently varied parameters.
for n in range(1,5):
    aa = sp.symbols('a:'+str(n))
    w = sp.Symbol('w')
    q = sp.Poly(sp.prod(w+a for a in aa),w)
    p = sp.expand(sum(q.nth(k)*falling(z,k)*sp.rf(beta+k,n-k)
                      for k in range(n+1)))
    reflected = p.subs({a:1-a for a in aa}, simultaneous=True)
    assert_zero(p.subs(z,-z-beta)-(-1)**n*reflected,
                ('multiaffine reflection',n))
    assert sp.Poly(p,z).LC() == 1
    checks += 1

# At t=1/2+3i/8, t(1-t)=25/64.  For beta=1, every
# entry of the exact complex symmetric tridiagonal matrix is rational complex.
tt = sp.Rational(1,2)+sp.I*sp.Rational(3,8)
for n in range(1,8):
    jmat = sp.diag(*[j-(2*j+1)*tt for j in range(n)])
    for j in range(1,n):
        jmat[j-1,j] = jmat[j,j-1] = sp.I*j*sp.Rational(5,8)
    assert_zero(jmat.charpoly(z).as_expr()-ps[n].subs({t:tt,beta:1}),
                ('complex characteristic polynomial',n))

# The weighted tridiagonal determinant uses the same off-diagonal products.
for bb in (sp.Rational(1,3),sp.Rational(3,2),sp.Integer(4)):
    for n in range(1,7):
        jmat = sp.diag(*[j-(2*j+bb)*tt for j in range(n)])
        for j in range(1,n):
            jmat[j-1,j] = 1
            jmat[j,j-1] = -tt*(1-tt)*j*(j+bb-1)
        assert_zero(jmat.charpoly(z).as_expr()-ps[n].subs({t:tt,beta:bb}),
                    ('weighted determinant',bb,n))

# Exact quadratic-form identity underlying the Rayleigh estimate.
# Real and imaginary parts of a complex vector obey this identity separately.
for n in range(1,7):
    vv = sp.symbols('v:'+str(n),real=True)
    bb = sp.Rational(3,2)
    form = sum((2*j+bb)*vv[j]**2 for j in range(n))
    form -= 2*sum(sp.sqrt(j*(j+bb-1))*vv[j]*vv[j-1]
                  for j in range(1,n))
    sos = sum((sp.sqrt(j)*vv[j]-sp.sqrt(j+bb-1)*vv[j-1])**2
               for j in range(1,n))+(n+bb-1)*vv[-1]**2
    assert_zero(form-sos, ('Rayleigh sum of squares',n))

# Reciprocal-segment intersection is an exact identity.  The proof uses its
# sign and convexity for all points, not a finite selection of samples.
x, y = sp.symbols('x y',real=True)
r = x+sp.I*y
rho = x*x+y*y
crossing = (r+rho/r)/(1+rho)
assert sp.cancel(crossing-2*x/(1+rho)) == 0
checks += 1

print(f'{checks} exact algebraic checks passed.')
