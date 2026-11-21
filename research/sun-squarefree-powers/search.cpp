// Check every n in an inclusive interval for Sun's OEIS A304081 conjecture.
#include <algorithm>
#include <array>
#include <cstdint>
#include <iostream>
#include <stdexcept>
#include <vector>

using I = std::int64_t;
using Word = std::uint64_t;
constexpr I block_size = 1 << 19;  // Number of odd prime candidates per block.
constexpr I pad = 1 << 16;

std::vector<I> primes_to_sqrt(I upper) {
    I limit = 1;
    while (limit + 1 <= upper / (limit + 1)) ++limit;
    std::vector<bool> composite(limit + 1);
    std::vector<I> primes;
    for (I p = 2; p <= limit; ++p) {
        if (composite[p]) continue;
        primes.push_back(p);
        for (I k = p * p; k <= limit; k += p) composite[k] = true;
    }
    return primes;
}

Word mul_mod(Word a, Word b, Word n) {
    return static_cast<__uint128_t>(a) * b % n;
}

// The seven bases below are deterministic for n < 341550071728321 (Jaeschke).
bool odd_prime(I input) {
    if (input < 3 || input % 2 == 0) return false;
    Word n = input;
    for (Word p : {3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37}) {
        if (n % p == 0) return n == p;
    }
    Word d = n - 1;
    int twos = __builtin_ctzll(d);
    d >>= twos;
    for (Word base : {2, 3, 5, 7, 11, 13, 17}) {
        Word x = 1;
        for (Word exponent = d; exponent; exponent >>= 1) {
            if (exponent & 1) x = mul_mod(x, base, n);
            base = mul_mod(base, base, n);
        }
        if (x == 1 || x == n - 1) continue;
        for (int j = 1; j < twos && x != n - 1; ++j) x = mul_mod(x, x, n);
        if (x != n - 1) return false;
    }
    return true;
}

std::array<std::vector<I>, 2> shifts(I upper, const std::vector<I>& primes) {
    std::array<std::vector<I>, 2> result;
    for (int e = 0; e < 2; ++e) {
        for (I x = 1; x < upper; x *= 2) {
            for (I y = 1 + e; x + y < upper; y *= 5) {
                I s = x + y;
                if ((s + 1) % 2 != e) continue;
                bool squarefree = true;
                for (I p : primes) {
                    if (p * p > s) break;
                    if (s % (p * p) == 0) { squarefree = false; break; }
                }
                if (squarefree) result[e].push_back(s);
            }
        }
        auto& values = result[e];
        std::sort(values.begin(), values.end());
        values.erase(std::unique(values.begin(), values.end()), values.end());
    }
    return result;
}

// Bit j records primality of 2*(start+j)+1, including the endpoints.
std::vector<Word> prime_bits(I start, I end, const std::vector<I>& primes) {
    std::vector<unsigned char> bits(end - start + 1, 1);
    if (start == 0) bits[0] = 0;
    for (I p : primes) {
        if (p == 2) continue;
        if (p * p > 2 * end + 1) break;
        I first = (p * p - 1) / 2;
        if (first < start) first += ((start - first + p - 1) / p) * p;
        for (I i = first; i <= end; i += p) bits[i - start] = 0;
    }
    std::vector<Word> packed((bits.size() + 63) / 64 + 1);
    for (std::size_t i = 0; i < bits.size(); ++i) packed[i / 64] |= Word(bits[i]) << (i % 64);
    return packed;
}

int main(int argc, char** argv) {
    if (argc != 3) return 2;
    I low = std::stoll(argv[1]), high = std::stoll(argv[2]);
    if (low < 1 || high < low || high > 100000000000000LL) throw std::invalid_argument("range outside [1,10^14]");
    auto primes = primes_to_sqrt(high);
    auto sums = shifts(high, primes);
    I checked = 0, unresolved = 0, fallbacks = 0;
    for (I begin = low / 2; begin <= high / 2; begin += block_size) {
        I end = std::min(high / 2, begin + block_size - 1);
        I base = std::max(I(0), begin - pad);
        auto prime = prime_bits(base, end, primes);
        for (int e = 0; e < 2; ++e) {
            // n=2*t+e, n-s=2*(t-(s+1-e)/2)+1.
            std::vector<I> offsets;
            for (I s : sums[e]) {
                I offset = (s + 1 - e) / 2;
                if (offset > begin - base) break;
                offsets.push_back(offset);
            }
            for (I t = begin; t <= end; t += 64) {
                Word missing = ~Word(0);
                for (I offset : offsets) {
                    I bit = t - base - offset;
                    Word witnessed = prime[bit / 64] >> (bit % 64);
                    if (bit % 64) witnessed |= prime[bit / 64 + 1] << (64 - bit % 64);
                    missing &= ~witnessed;
                    if (!missing) break;
                }
                while (missing) {
                    int index = __builtin_ctzll(missing);
                    missing &= missing - 1;
                    I n = 2 * (t + index) + e;
                    if (t + index > end || n < low || n > high) continue;
                    ++fallbacks;
                    bool found = false;
                    for (std::size_t j = offsets.size(); j < sums[e].size(); ++j) {
                        I s = sums[e][j];
                        if (s > n - 3) break;
                        if (odd_prime(n - s)) { found = true; break; }
                    }
                    if (!found) {
                        std::cout << "unrepresented " << n << std::endl;
                        ++unresolved;
                    }
                }
            }
        }
        checked += std::min(high, 2 * end + 1) - std::max(low, 2 * begin) + 1;
    }
    std::cout << "interval " << low << ' ' << high << " checked " << checked
              << " individually tested " << fallbacks << " unrepresented " << unresolved << '\n';
}
