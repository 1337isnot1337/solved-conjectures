"""Directed-rounding certificate for the scalar Gaussian bound in the Poisson half-chord."""
from decimal import Decimal, ROUND_CEILING, getcontext
from fractions import Fraction as F
from math import factorial

# All rectangular sums and comparisons after the scalar table use integers.
W = G = Z = 512
LIMIT = 12
SCALE = 10**6
DEN = 4096
EXP_SCALE = 10**9


def log_moment_table():
    ctx = getcontext().copy()
    ctx.prec = 40
    ctx.rounding = ROUND_CEILING
    size = (3*LIMIT*Z+4)//5+1
    tab = []
    for index in range(-size, size+1):
        if not index:
            tab.append(SCALE//2)
            continue
        def exp_upper(num, den):
            arg = ctx.divide(Decimal(num), Decimal(den))
            return ctx.next_plus(ctx.exp(arg))

        left = ctx.multiply(Decimal(144), exp_upper(29*index, 12*Z))
        right = ctx.multiply(Decimal(841), exp_upper(-12*index, 29*Z))
        mgf = ctx.divide(ctx.add(left, right), Decimal(985))
        # Decimal.exp and Decimal.ln are correctly rounded to nearest; use the next larger value.
        upper = ctx.next_plus(ctx.ln(mgf))
        scaled = ctx.divide(ctx.multiply(upper, Decimal(SCALE*Z*Z)), Decimal(index*index))
        tab.append(int(scaled.to_integral_value(rounding=ROUND_CEILING)))
    return tab, size


def exp_upper_table():
    # e^(-1/DEN) <= DEN/(DEN+1); the ceilings preserve the upper bound.
    tab = [EXP_SCALE]
    for _ in range(DEN*LIMIT**2//2+1):
        tab.append((tab[-1]*DEN+DEN)//(DEN+1))
    return tab


def main():
    moment, shift = log_moment_table()
    upper_exp = exp_upper_table()
    spacing = 20*W*G
    denominator = 50*SCALE*G*G
    square = [DEN*j*j for j in range(LIMIT*G)]
    slack = F(1)
    for l in range(W):
        total = 0
        for j, factor in enumerate(square):
            # Nearest z-grid index to (3/5) times the center of the w-by-g rectangle.
            center = (3*Z*(2*l+1)*(2*j+1)+spacing//2)//spacing
            for kval in (moment[shift+center], moment[shift-center]):
                # |K'|<=1/2 and rounding the center plus both half-widths costs <1/200 in K.
                k = kval + SCALE//200
                idx = factor*(25*SCALE-18*k)//denominator
                assert 0 <= idx < len(upper_exp)
                total += upper_exp[idx]
        # 1/sqrt(2*pi)<399/1000. The omitted two Gaussian tails together cost <10^-7.
        upper = F(399*total, 1000*G*EXP_SCALE) + F(1,10**7)
        exponent = F(1,4) + F(l*l,12*W*W) - F(1,1000)
        lower = sum(exponent**j/factorial(j) for j in range(7))
        assert upper < lower, (l, upper, lower)
        slack = min(slack, lower-upper)
    print(f'{W} parameter intervals and {2*G*LIMIT} Gaussian intervals passed; minimum rational slack exceeds {int(slack*10**6)}/10^6')


if __name__ == '__main__':
    main()
