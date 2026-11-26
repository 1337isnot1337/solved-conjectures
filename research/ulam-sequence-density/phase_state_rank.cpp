#include <algorithm>
#include <array>
#include <bit>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <vector>

using State = std::array<std::uint64_t, 2>;

constexpr int memory = 69;
constexpr int window = 16'696;
constexpr std::int64_t speed = 350477575LL * 5422;
constexpr std::int64_t offset = 502LL * 856371966;
constexpr std::int64_t period = 856371966LL * 5422;

std::int64_t phase_numerator(int n) {
    return ((offset + speed * n) % period + period) % period;
}

bool gate(int n) {
    const auto residue = phase_numerator(n);
    return period < 3 * residue && 3 * residue < 2 * period;
}

void set_bit(State& state, int index) {
    state[index / 64] |= std::uint64_t{1} << (index % 64);
}

int main() {
    for (int n = -memory; n < window; ++n) {
        const auto triple = 3 * phase_numerator(n);
        const auto margin = std::min(std::abs(triple - period), std::abs(triple - 2 * period));
        if (margin * 200000 <= 3 * period) {
            std::cerr << "The finite gate window has insufficient margin.\n";
            return 1;
        }
    }

    std::array<bool, memory + 1> ulam{};
    ulam[1] = ulam[2] = true;
    for (int n = 3; n <= memory; ++n) {
        int ways = 0;
        for (int a = 1; a < n - a; ++a) {
            ways += ulam[a] && ulam[n - a];
        }
        ulam[n] = ways == 1;
    }
    State shifts{};
    for (int s = 1; s <= memory; ++s) {
        if (ulam[s]) {
            set_bit(shifts, s - 1);
        }
    }

    std::vector<State> states{State{}};
    for (int lag = 1; lag <= memory; ++lag) {
        if (gate(-lag)) {
            const auto size = states.size();
            for (std::size_t i = 0; i < size; ++i) {
                auto state = states[i];
                set_bit(state, lag - 1);
                states.push_back(state);
            }
        }
    }
    if (states.size() != 2'097'152) {
        std::cerr << "Unexpected number of allowed initial memories.\n";
        return 1;
    }

    for (int n = 0; n < window; ++n) {
        const bool open = gate(n);
        for (auto& state : states) {
            const auto low = state[0] & shifts[0];
            const auto high = state[1] & shifts[1];
            const bool accepted = open && (std::popcount(low) + std::popcount(high) == 1);
            state[1] = ((state[1] << 1) | (state[0] >> 63)) & 31;
            state[0] = (state[0] << 1) | accepted;
        }
        if ((n + 1) % 8 == 0) {
            std::sort(states.begin(), states.end());
            states.erase(std::unique(states.begin(), states.end()), states.end());
        }
    }
    const std::vector<State> expected{State{}, State{166633225941157120ULL, 0}};
    if (states != expected) {
        std::cerr << "Unexpected endpoint memories.\n";
        return 1;
    }
    std::cout << "Verified two endpoint memories from all 2,097,152 initial memories "
              << "after " << window << " steps.\n";
}
