// Compile with c++ -O3 -std=c++17. Check exact prime witnesses on Chen's two progressions.
#include <algorithm>
#include <cmath>
#include <cstdint>
#include <iostream>
#include <numeric>
#include <stdexcept>
#include <vector>

using Int = std::int64_t;
constexpr Int modulus = 312018;
struct SievePrime { Int prime, inverse; };

Int inverse_mod(Int a, Int p) {
    Int old_r = a, r = p, old_s = 1, s = 0;
    while (r != 0) {
        Int q = old_r / r;
        Int next_r = old_r - q * r, next_s = old_s - q * s;
        old_r = r; r = next_r;
        old_s = s; s = next_s;
    }
    return (old_s % p + p) % p;
}

std::vector<SievePrime> primes_to(Int upper) {
    Int limit = static_cast<Int>(std::sqrt(static_cast<long double>(upper)));
    while ((limit + 1) <= upper / (limit + 1)) ++limit;
    std::vector<bool> composite(limit + 1);
    std::vector<SievePrime> primes;
    for (Int p = 2; p <= limit; ++p) {
        if (composite[p]) continue;
        if (p <= limit / p)
            for (Int k = p * p; k <= limit; k += p) composite[k] = true;
        if (modulus % p) primes.push_back({p, inverse_mod(modulus, p)});
    }
    return primes;
}

std::vector<Int> shifts_below(Int lower) {
    std::vector<Int> shifts;
    for (Int i = 0, c = 1; c < lower; ++i) {
        for (Int f = 1, next_f = 2; f < lower - c;) {
            shifts.push_back(c + f);
            Int following = f + next_f;
            f = next_f;
            next_f = following;
        }
        __int128 next = static_cast<__int128>(c) * (4 * i + 2) / (i + 2);
        if (next >= lower) break;
        c = static_cast<Int>(next);
    }
    std::sort(shifts.begin(), shifts.end());
    shifts.erase(std::unique(shifts.begin(), shifts.end()), shifts.end());
    return shifts;
}

void check(Int first, Int count, const std::vector<SievePrime>& primes) {
    std::vector<char> has_witness(count), composite(count);
    Int left = count;
    unsigned used = 0;
    for (Int shift : shifts_below(first)) {
        Int initial = first - shift;
        if (initial < 3 || std::gcd(initial, modulus) != 1) continue;
        std::fill(composite.begin(), composite.end(), false);
        for (auto [p, inverse] : primes) {
            if (p * p > initial + (count - 1) * modulus) break;
            Int index = ((p - initial % p) * inverse) % p;
            if (initial + index * modulus == p) index += p;
            for (; index < count; index += p) composite[index] = true;
        }
        ++used;
        for (Int i = 0; i < count; ++i) {
            if (!composite[i] && !has_witness[i]) { has_witness[i] = true; --left; }
        }
        if (!left) break;
    }
    std::cout << "first=" << first << " count=" << count << " shifts=" << used
              << " without a certified representation=" << left << '\n';
    for (Int i = 0; i < count; ++i)
        if (!has_witness[i]) std::cout << "needs full check " << first + i * modulus << '\n';
}

int main(int argc, char** argv) {
    if (argc != 3) return 2;
    Int lower = std::stoll(argv[1]), count = std::stoll(argv[2]);
    if (lower < 5 || lower > 1000000000000000LL || count < 1 || count > 10000000)
        throw std::invalid_argument("lower must be in [5,10^15] and count in [1,10^7]");
    auto primes = primes_to(lower + count * modulus);
    for (Int residue : {208641, 218331}) {
        Int first = lower + (residue - lower % modulus + modulus) % modulus;
        check(first, count, primes);
    }
}
