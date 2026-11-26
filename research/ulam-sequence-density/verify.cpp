#include <algorithm>
#include <array>
#include <bit>
#include <cstdint>
#include <iostream>

constexpr int window = 4096;
constexpr int numerator = 193;
constexpr int denominator = 800;
constexpr int goal = numerator * window / denominator + 1;
using Mask = std::array<std::uint64_t, (window + 63) / 64>;
using Predecessors = std::array<Mask, window>;

bool find_dense_prefixes(const Predecessors& predecessors, Mask& selected,
                         int start, int size, std::uint64_t& visited) {
    ++visited;
    if (size == goal) {
        return true;
    }

    // The prefix ending immediately before x has exactly size points.
    const int last = std::min(window - 1, (size * denominator - 1) / numerator);
    for (int x = start; x <= last; ++x) {
        const int word = x / 64;
        int hits = 0;
        for (int i = 0; i <= word && hits < 2; ++i) {
            hits += std::popcount(selected[i] & predecessors[x][i]);
        }
        if (hits < 2) {
            const auto bit = std::uint64_t{1} << (x % 64);
            selected[word] |= bit;
            if (find_dense_prefixes(predecessors, selected, x + 1, size + 1, visited)) {
                return true;
            }
            selected[word] ^= bit;
        }
    }
    return false;
}

int main() {
    std::array<bool, window> ulam{};
    ulam[1] = ulam[2] = true;
    for (int n = 3; n < window; ++n) {
        int representations = 0;
        for (int a = 1; a < n - a; ++a) {
            representations += ulam[a] && ulam[n - a];
        }
        ulam[n] = representations == 1;
    }

    Predecessors predecessors{};
    for (int x = 0; x < window; ++x) {
        for (int y = 0; y < x; ++y) {
            if (ulam[x - y]) {
                predecessors[x][y / 64] |= std::uint64_t{1} << (y % 64);
            }
        }
    }

    Mask selected{1};
    std::uint64_t visited = 0;
    if (find_dense_prefixes(predecessors, selected, 1, 1, visited)) {
        std::cerr << "The prefix criterion failed.\n";
        return 1;
    }
    std::cout << "Verified " << numerator << "/" << denominator
              << " with window " << window << ".\n"
              << "Exhausted " << visited << " search nodes.\n";
}
