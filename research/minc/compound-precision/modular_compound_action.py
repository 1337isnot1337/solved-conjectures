"""Apply a permanental compound over Z/p^b using the factorial quotient."""
from collections import defaultdict
from itertools import combinations
from math import comb


def factor_operations(matrix, p, b):
    """Return elementary substitutions in application order, including the diagonal."""
    modulus = p**b
    n = len(matrix)
    A = [[v % modulus for v in row] for row in matrix]
    left, right = [], []

    def valuation(v):
        if not v:
            return b
        e = 0
        while v % p == 0:
            e += 1
            v //= p
        return e

    for i in range(n):
        v, r, c = min((valuation(A[r][c]), r, c)
                      for r in range(i,n) for c in range(i,n))
        if v == b:
            break
        if r != i:
            A[i], A[r] = A[r], A[i]
            left.append(('swap',i,r))
        if c != i:
            for row in A:
                row[i], row[c] = row[c], row[i]
            right.append(('swap',i,c))
        pivot_power = p**v
        working_modulus = modulus//pivot_power
        unit_inv = pow(A[i][i]//pivot_power,-1,working_modulus)
        for r in range(i+1,n):
            factor = A[r][i]//pivot_power * unit_inv % working_modulus
            if factor:
                A[r] = [(x-factor*y) % modulus for x,y in zip(A[r],A[i])]
                # Inverse row operation has a nonzero off-diagonal in (r,i).
                left.append(('shear',i,r,factor))
        for c in range(i+1,n):
            factor = A[i][c]//pivot_power * unit_inv % working_modulus
            if factor:
                for row in A:
                    row[c] = (row[c]-factor*row[i]) % modulus
                # Inverse column operation has a nonzero off-diagonal in (i,c).
                right.append(('shear',c,i,factor))

    return right + [('diag',[A[i][i] for i in range(n)])] + left[::-1]


def retained_moduli(k,p,b):
    values = [0]*(k+1)
    for j in range(1,k+1):
        q = j
        v = values[j-1]
        while q % p == 0:
            q //= p
            v += 1
        values[j] = v

    def retained(alpha):
        return p**max(0,b-sum(values[m] for m in alpha))

    return retained


def apply_operation(state, op, retained, modulus):
    kind, *data = op
    result = defaultdict(int)

    def add(alpha,c):
        m = retained(alpha)
        if m > 1:
            result[alpha] = (result[alpha]+c) % m

    for alpha,c in state.items():
        if kind == 'swap':
            i,j = data
            beta = list(alpha)
            beta[i],beta[j] = beta[j],beta[i]
            add(tuple(beta),c)
        elif kind == 'diag':
            multiplier = c
            for x,h in zip(data[0],alpha):
                multiplier = multiplier*pow(x,h,modulus) % modulus
            add(alpha,multiplier)
        else:
            i,j,t = data
            beta = list(alpha)
            for h in range(alpha[i]+1):
                beta[i],beta[j] = alpha[i]-h, alpha[j]+h
                add(tuple(beta),c*comb(alpha[i],h)*pow(t,h,modulus))
    return {alpha:c for alpha,c in result.items() if c}


def compound_action(matrix,k,vector,p,b):
    """Input and output vectors use lexicographic k-subset order. p must be prime."""
    n = len(matrix)
    if not (0 <= k <= n and b >= 1 and p >= 2 and all(len(row)==n for row in matrix)):
        raise ValueError('expected square matrix, 0 <= k <= n, p prime and b positive')
    if len(vector) != comb(n,k):
        raise ValueError('vector length must equal binom(n,k)')
    modulus = p**b
    retained = retained_moduli(k,p,b)
    def labels():
        for I in combinations(range(n),k):
            alpha = [0]*n
            for i in I:
                alpha[i] = 1
            yield tuple(alpha)

    state = {a:c % modulus for a,c in zip(labels(),vector) if c % modulus}
    for op in factor_operations(matrix,p,b):
        state = apply_operation(state,op,retained,modulus)
    return [state.get(a,0) for a in labels()]
