#include <algorithm>
#include <array>
#include <bit>
#include <cassert>
#include <charconv>
#include <cstdint>
#include <fstream>
#include <iostream>
#include <string_view>
#include <vector>

using Integer = std::int64_t;
using Word = std::uint64_t;

constexpr Integer numerator = 350'477'575;
constexpr Integer denominator = 856'371'966;
constexpr Integer turn = 3 * denominator;
constexpr Integer step = 3 * numerator;
constexpr int buckets = 1024;
constexpr int early_limit = 1024;
constexpr int rank_width = 256;
constexpr int maximum = 1'000'000'000;

Integer phase(int n) {
    return 3 * ((numerator * n) % denominator);
}

bool middle(Integer x) {
    return denominator < x && x < 2 * denominator;
}

int bucket(Integer x) {
    return static_cast<int>((x - denominator) * buckets / denominator);
}

struct PairCount {
    int ways = 0;
    int smaller = 0;

    void add(int a) {
        smaller = a;
        ++ways;
    }
};

struct Deficit {
    int target = 0;
    int smaller = 1;
    int amount = 0;

    void include(int n, int p, int value) {
        if (value <= 0) {
            return;
        }
        if (static_cast<__int128>(value) * value * smaller >
            static_cast<__int128>(amount) * amount * p) {
            *this = {n, p, value};
        }
    }
};

int main(int argc, char** argv) {
    int limit = maximum;
    if (argc > 3) {
        return 1;
    }
    if (argc >= 2) {
        const std::string_view argument{argv[1]};
        const auto [end, error] = std::from_chars(argument.begin(), argument.end(), limit);
        if (error != std::errc{} || end != argument.end() || limit < 2 || limit > maximum) {
            return 1;
        }
    }

    std::vector<Word> membership(limit / 64 + 1);
    std::vector<int> ranks(limit / rank_width + 1);
    std::array<std::vector<int>, buckets> inliers;
    std::vector<int> early;
    std::vector<int> outliers;
    int count = 0;
    auto select = [&](int n, Integer x) {
        ++count;
        membership[n / 64] |= Word{1} << (n % 64);
        if (n <= early_limit) {
            early.push_back(n);
        }
        if (middle(x)) {
            inliers[bucket(x)].push_back(n);
        } else {
            outliers.push_back(n);
        }
    };
    const auto selected = [&](int n) { return (membership[n / 64] >> (n % 64)) & Word{1}; };
    const auto prefix_count = [&](int n) {
        const int block = n / rank_width;
        int total = ranks[block];
        for (int i = block * (rank_width / 64); i < n / 64; ++i) {
            total += std::popcount(membership[i]);
        }
        return total + std::popcount(membership[n / 64] & (~Word{0} >> (63 - n % 64)));
    };

    select(1, phase(1));
    select(2, phase(2));
    auto x = phase(2);
    int failures = 0;
    Deficit worst;
    Deficit worst_large;
    for (int n = 3; n <= limit; ++n) {
        if (n % rank_width == 0) {
            ranks[n / rank_width] = count;
        }
        x += step;
        if (x >= turn) {
            x -= turn;
        }
        const int half = (n - 1) / 2;
        const bool inlier = middle(x);
        PairCount pairs;
        if (!inlier) {
            for (int a : early) {
                if (a > half || pairs.ways == 2) {
                    break;
                }
                if (selected(n - a)) {
                    pairs.add(a);
                }
            }
            // Two interior phases that hit an exterior target must
            // have each summand in the same lifted interval below.
            if (pairs.ways < 2 && half > early_limit && x != denominator && x != 2 * denominator) {
                const auto low = denominator + (x < denominator ? x : 0);
                const auto high = x < denominator ? 2 * denominator : x - denominator;
                for (int b = bucket(low); b <= bucket(high - 1) && pairs.ways < 2; ++b) {
                    const auto& list = inliers[b];
                    auto a = std::ranges::upper_bound(list, early_limit);
                    for (; a != list.end() && *a <= half && pairs.ways < 2; ++a) {
                        if (selected(n - *a) && middle(phase(n - *a))) {
                            pairs.add(*a);
                        }
                    }
                }
            }
        }
        if (pairs.ways < 2) {
            const int counted = inlier ? 0 : early_limit;
            for (int a : outliers) {
                const int b = n - a;
                const int smaller = std::min(a, b);
                if (a == b || smaller <= counted || !selected(b) || (b < a && !middle(phase(b)))) {
                    continue;
                }
                pairs.add(smaller);
                if (pairs.ways == 2) {
                    break;
                }
            }
        }
        if (pairs.ways == 1) {
            const int p = pairs.smaller;
            const int q = n - p;
            const int ap = prefix_count(p);
            const int aq = prefix_count(q);
            const int deficit = ap + aq - count - 1;
            if (p >= 4096) {
                worst.include(n, p, deficit);
                if (deficit > 0 && Integer{deficit} * deficit > 4LL * p) {
                    ++failures;
                    std::cout << "Failure " << n << '=' << p << '+' << q << " counts "
                              << ap << ',' << aq << ',' << count + 1 << " deficit " << deficit << '\n';
                }
            }
            if (p >= 8192) {
                worst_large.include(n, p, deficit);
            }
            select(n, x);
        }
    }

    // Check the witness pairs directly without using a phase partition.
    for (int n : {569'375'099, 581'862'197}) {
        if (n > limit) {
            continue;
        }
        PairCount pairs;
        for (int p = 1; 2 * p < n; ++p) {
            if (selected(p) && selected(n - p)) {
                pairs.add(p);
            }
        }
        assert(selected(n) && pairs.ways == 1 && pairs.smaller == 4118);
    }
    if (limit == maximum) {
        assert(count == 73'976'842 && failures == 2);
        assert(worst.target == 581'862'197 && worst.smaller == 4118 && worst.amount == 143);
    }
    std::cout << "Through " << limit << ": " << count << " terms, " << failures << " failures.\n";
    std::cout << "Largest ratios for p >= 4096 and p >= 8192:\n";
    for (const auto& d : {worst, worst_large}) {
        std::cout << d.target << ": " << d.amount << "/sqrt(" << d.smaller << ")\n";
    }
    if (argc == 3) {
        std::ofstream file(argv[2], std::ios::binary);
        file.write(reinterpret_cast<const char*>(membership.data()), membership.size() * sizeof(Word));
        if (!file) {
            return 2;
        }
    }
}
