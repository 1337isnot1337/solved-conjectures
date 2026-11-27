"""Compile the exact checker and verify all five anchor forms at orders 11 through 20."""
import math
import os
from pathlib import Path
import subprocess
import tempfile


def expected_types(n, form):
    if form == 0:
        return math.comb(n, 3)
    if form in (1, 2):
        return math.comb(n + 4, 8)
    return math.comb(n + 3, 8)


def main():
    directory = Path(__file__).resolve().parent
    totals = dict.fromkeys(("types", "nodes", "leaves", "original", "disconnected", "spectral"), 0)
    with tempfile.TemporaryDirectory(prefix="dandelion-check-") as temporary:
        executable = Path(temporary) / "check-connected"
        subprocess.run([os.environ.get("CXX", "c++"), "-std=c++17", "-O3",
                        str(directory / "check_connected_dandelion.cpp"), "-o", str(executable)], check=True)
        for n in range(11, 21):
            for form in range(5):
                check = subprocess.run([str(executable), str(n), str(form)], check=True,
                                       capture_output=True, text=True)
                fields = dict(item.split("=") for item in check.stdout.split())
                if (int(fields["n"]) != n or int(fields["form"]) != form or fields["complete"] != "1"
                        or int(fields["types"]) != expected_types(n, form)):
                    raise ValueError(f"Incomplete certificate for order {n}, form {form}: {check.stdout}")
                for key in totals:
                    totals[key] += int(fields[key])
                print(check.stdout.rstrip(), flush=True)
    print("50 certified order/form pairs.")
    print(" ".join(f"{key}={value}" for key, value in totals.items()))


if __name__ == "__main__":
    main()
