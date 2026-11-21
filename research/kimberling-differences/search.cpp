// Search for a first sign-run counterexample to Kimberling's Problem 13.
#include <algorithm>
#include <array>
#include <cstdint>
#include <iostream>
#include <string>
#include <vector>

// Level 0 stores unused integers. A bit at each higher level is set exactly
// when the word under it is nonempty.
class Unused {
    using Word = std::uint64_t;
    std::vector<std::vector<Word>> levels;
    int bound;

    int next_at(size_t level, int x) const {
        const auto& words = levels[level];
        int j = x / 64;
        if (j >= int(words.size())) return -1;
        Word bits = words[j] & (~Word{0} << (x % 64));
        if (bits) return 64*j + __builtin_ctzll(bits);
        if (level + 1 == levels.size()) return -1;
        int k = next_at(level + 1, j + 1);
        return k < 0 ? -1 : 64*k + __builtin_ctzll(words[k]);
    }

    int previous_at(size_t level, int x) const {
        if (x < 0) return -1;
        const auto& words = levels[level];
        int j = x / 64;
        Word bits = words[j] & (~Word{0} >> (63 - x % 64));
        if (bits) return 64*j + 63 - __builtin_clzll(bits);
        if (level + 1 == levels.size()) return -1;
        int k = previous_at(level + 1, j - 1);
        return k < 0 ? -1 : 64*k + 63 - __builtin_clzll(words[k]);
    }

public:
    explicit Unused(int size) : bound(size) {
        for (int bits = size; ; bits = (bits+63)/64) {
            levels.emplace_back((bits+63)/64, ~Word{0});
            if (bits % 64) levels.back().back() >>= 64 - bits % 64;
            if (bits <= 64) break;
        }
    }

    void remove(int x) {
        for (auto& words : levels) {
            words[x/64] &= ~(Word{1} << (x%64));
            x /= 64;
            if (words[x]) break;
        }
    }

    int next(int x) const { return x >= bound ? -1 : next_at(0, x); }
    int previous(int x) const { return previous_at(0, std::min(x, bound-1)); }
};

int main(int argc, char** argv) {
    if (argc < 2 || argc > 3) return 2;
    bool print_terms = argc == 3 && std::string(argv[2]) == "--terms";
    if (argc == 3 && !print_terms) return 2;
    int limit = std::stoi(argv[1]);
    if (limit < 2 || limit > 400000000) return 2;
    int bound = 2*limit + 2;
    Unused positions(bound), positive(bound), negative(bound);
    positions.remove(0);
    positions.remove(1);
    int x = 1, up_mex = 1, down_mex = 1, last_sign = 0, run = 0;
    int high = 1, record_rises = 0, last_record_rise = 0;
    std::array<int, 2> longest{};
    std::uint64_t hash = 1;
    if (print_terms) std::cout << "1 1 0\n";
    for (int k = 2; k <= limit; ++k) {
        int d = down_mex;
        while (d < x) {
            int y = positions.previous(x-d);
            if (y < 1) { d = x; break; }
            if (x-y == d) break;
            d = negative.next(x-y);
            if (d < 0) { d=x; break; }
        }
        int sign = d < x ? -1 : 1;
        if (sign == -1) {
            negative.remove(d);
            if (d == down_mex) down_mex = negative.next(d+1);
        } else {
            d = up_mex;
            while (true) {
                int y = positions.next(x+d);
                if (y < 0) return 3;
                if (y-x == d) break;
                d = positive.next(y-x);
                if (d < 0) return 3;
            }
            positive.remove(d);
            if (d == up_mex) up_mex = positive.next(d+1);
            if (x == high) { ++record_rises; last_record_rise = k; }
        }
        x += sign*d;
        high = std::max(x, high);
        positions.remove(x);
        hash = hash*1000003 + x;
        if (print_terms) std::cout << k << " " << x << " " << sign*d << '\n';
        run = last_sign == sign ? run+1 : 1;
        last_sign = sign;
        longest[sign>0] = std::max(longest[sign>0],run);
        if (run == 3) {
            std::cout << "Three steps of sign " << sign << " ending at " << k
                      << ", position " << x << ", prefix hash " << hash << '\n';
            return 1;
        }
    }
    std::cout << "terms " << limit << ", position " << x << ", maximum " << high
              << ", missing position " << positions.next(1)
              << ", missing -/+ magnitudes " << down_mex << "/" << up_mex
              << ", longest -/+ runs " << longest[0] << "/" << longest[1]
              << ", rises from records " << record_rises << ", last arrival index "
              << last_record_rise << ", prefix hash " << hash << '\n';
}
