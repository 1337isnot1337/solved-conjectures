"""Check the scalar margins in the near-half Erdős 23 notes using exact fractions."""
from fractions import Fraction as F

b = F(".03999")
eta = F(".00001")
epsilon = F(".0001")
checks = {
    "phase shore cap": F(".276") * (F(".42") - F(".276")) + F("17.5") * eta < F(".04"),
    "phase d cap": 2 * (F(".0625") - F(".08") / 4 + F("17.5") * eta) < F(".086"),
    "phase t cap": F(".0625") - F(".08") / 4 + F("17.5") * eta < F(".0427"),
    "phase K cap": F(".045") + 4 * F(".276") * eta / F(".08") < F(".04514"),
    "phase lower Q": F(".16") * b - 2 * eta == F(".0063784"),
    "phase drift": 4 * F(".362") + 2 + 8 * F(".276") / F(".08") < F("31.1"),
    "phase moment perturbation": 24 * F(".276") ** 2 < F("1.829"),
    "phase H-star quotient": F(".172") + F(".276") * (1 - F(".08") / F(".0903")) < F(".204"),
    "phase H quotient": F(".204") + (F("1.829") + F(".204") * F("2.208")) * eta / F(".0063784") < F(".208"),
    "phase mixed gain": 4 * (F(".16") - 2 * eta / b) ** 2 / (F(".0225") * F(".208")) > F("21.6"),
    "phase contradiction": F(".0427") + F(".362") * (4 * b - F(".08")) + F(".000311") - F("21.6") * b**2 < F(".038"),
    "phase decreasing quadratic": 4 * F(".362") - 2 * F("21.6") * b < 0,
    "dominant component cap": (F(".5") - F(".118")) ** 2 + F(".118") ** 2 < F(".16"),
    "dominant-component cut": F(".0161") - F(".17") * F(".114") + F(".114") ** 2 / 4 < 0,
    "dictionary union residual": F(".08") * (F(".5") - epsilon) / F(".21") > F(".1904"),
    "dictionary four mismatches": F(".5") - 4 * F(".08") + 83 * epsilon < F(".1904"),
    "dictionary maximal pair count": 14 * F(".08") - 30 * 7 * epsilon > 1,
    "fractional-colour repair": F(3197, 80000) + F(3, 4) * F(1, 20000) == F(1, 25),
}
for name, holds in checks.items():
    if not holds:
        raise ArithmeticError(name)
print(f"{len(checks)} exact rational comparisons passed")
