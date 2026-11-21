// Exact order-17 checks of the two block constructions in prime_circulant_maxima.md.
// Build with c++ -O2 -std=c++20. Every count is at most 17!, which fits in uint64_t.
#include <algorithm>
#include <array>
#include <bit>
#include <cstdint>
#include <iostream>
#include <stdexcept>
#include <vector>

using Mask = std::uint32_t;
using Count = std::uint64_t;

Count permanent(const std::vector<Mask>& rows) {
    const Mask limit = Mask{1} << rows.size();
    std::vector<Count> ways(limit);
    ways[0] = 1;
    for (Mask used = 0; used + 1 < limit; ++used) {
        if (ways[used] == 0) continue;
        Mask choices = rows[std::popcount(used)] & ~used;
        while (choices) {
            const Mask lowest = choices & -choices;
            ways[used | lowest] += ways[used];
            choices ^= lowest;
        }
    }
    return ways.back();
}

std::vector<Mask> cyclic_rows(unsigned n, Mask first) {
    const Mask full = (Mask{1} << n) - 1;
    std::vector<Mask> rows;
    for (unsigned i = 0; i < n; ++i) {
        rows.push_back(first);
        first = ((first << 1) & full) | (first >> (n - 1));
    }
    return rows;
}

struct Maximum {
    int representatives = 0;
    Count value = 0;
};

Maximum circulant_maximum(unsigned prime, int degree) {
    const Mask limit = Mask{1} << prime;
    std::vector<bool> seen(limit);
    Maximum result;
    for (Mask mask = 0; mask < limit; ++mask) {
        if (seen[mask] || std::popcount(mask) != degree) continue;
        ++result.representatives;
        result.value = std::max(result.value, permanent(cyclic_rows(prime, mask)));
        for (unsigned multiplier = 1; multiplier < prime; ++multiplier) {
            Mask dilated = 0;
            for (unsigned j = 0; j < prime; ++j)
                if (mask & (Mask{1} << j))
                    dilated |= Mask{1} << ((j * multiplier) % prime);
            for (Mask translated : cyclic_rows(prime, dilated)) seen[translated] = true;
        }
    }
    return result;
}

Count block_competitor(int n, int k) {
    const int r = std::min(k, n - k);
    const int blocks = n / r;
    const Mask full = (Mask{1} << n) - 1;
    std::vector<Mask> rows;
    for (int g = 0; g < blocks; ++g) {
        const int size = n / blocks + (g < n % blocks);
        const auto offset = rows.size();
        for (Mask local : cyclic_rows(size, (Mask{1} << r) - 1)) {
            const Mask row = local << offset;
            rows.push_back(k == r ? row : (full ^ row));
        }
    }
    for (Mask row : rows)
        if (std::popcount(row) != k) throw std::logic_error("wrong row degree");
    for (int j = 0; j < n; ++j) {
        int degree = 0;
        for (Mask row : rows) degree += (row >> j) & 1;
        if (degree != k) throw std::logic_error("wrong column degree");
    }
    return permanent(rows);
}

int main() {
    for (int k : std::array{6, 7, 10, 12, 15}) {
        const auto best = circulant_maximum(17, k);
        const auto competitor = block_competitor(17, k);
        if (competitor <= best.value) throw std::logic_error("comparison failed");
        std::cout << k << "  " << best.representatives << "  " << best.value
                  << "  " << competitor << '\n';
    }
}
