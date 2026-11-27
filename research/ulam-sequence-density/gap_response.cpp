#include <array>
#include <bit>
#include <cassert>
#include <cstdint>
#include <fstream>
#include <iostream>
#include <vector>

using Word = std::uint64_t;
constexpr int cutoff = 1'000'000'000;

struct Minimum {
    int samples = 0;
    int target = 0;
    int gap = 1;
    int count = 1;
};

int interval_count(const std::vector<Word>& membership, int first, int last) {
    int count = 0;
    for (int word = first / 64; word <= last / 64; ++word) {
        Word bits = membership[word];
        if (word == first / 64) {
            bits &= ~Word{0} << (first % 64);
        }
        if (word == last / 64) {
            bits &= ~Word{0} >> (63 - last % 64);
        }
        count += std::popcount(bits);
    }
    return count;
}

int main(int argc, char** argv) {
    if (argc != 2) {
        return 1;
    }
    std::vector<Word> membership(cutoff / 64 + 1);
    std::ifstream file(argv[1], std::ios::binary);
    if (!file.read(reinterpret_cast<char*>(membership.data()), membership.size() * sizeof(Word))) {
        return 1;
    }
    assert(interval_count(membership, 1, cutoff) == 73'976'842);
    constexpr std::array<int, 6> thresholds{100, 200, 300, 400, 500, 600};
    std::array<Minimum, thresholds.size()> minima{};
    int previous = 1;
    for (int word = 0; word <= cutoff / 64; ++word) {
        for (Word bits = membership[word]; bits; bits &= bits - 1) {
            const int u = 64 * word + std::countr_zero(bits);
            const int gap = u - previous;
            previous = u;
            if (gap < thresholds.front() || u + gap - 1 > cutoff) {
                continue;
            }
            const int count = interval_count(membership, u, u + gap - 1);
            for (std::size_t i = 0; i < minima.size() && gap >= thresholds[i]; ++i) {
                auto& row = minima[i];
                ++row.samples;
                if (count * row.gap < row.count * gap) {
                    row = {row.samples, u, gap, count};
                }
            }
        }
    }
    for (std::size_t i = 0; i < minima.size(); ++i) {
        const auto& row = minima[i];
        std::cout << thresholds[i] << ' ' << row.samples << ' ' << row.count << '/' << row.gap
                  << " at " << row.target << '\n';
    }
    assert(minima[2].samples == 1527 && minima[2].count == 15 && minima[2].gap == 315);
}
