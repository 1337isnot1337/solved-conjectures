#include <algorithm>
#include <array>
#include <bit>
#include <cstdint>
#include <iostream>
#include <stdexcept>
#include <vector>
#include <gmpxx.h>

using Words = std::vector<std::uint32_t>;

mpz_class pack(const Words& bits, int start, int length) {
    mpz_class result;
    mpz_import(result.get_mpz_t(), length, -1, sizeof(bits[0]), 0, 0, bits.data() + start);
    return result;
}

void solve_block(int left, int right, Words& bits, Words& counts) {
    const int length = right - left;
    if (length <= 64) {
        for (int n = left; n < right; ++n) {
            if (n != 1 && n != 2 && counts[n] != 1) {
                continue;
            }
            bits[n] = 1;
            for (int a = 1; a < std::min(n, right - n); ++a) {
                counts[n + a] += bits[a];
            }
        }
        return;
    }

    const int middle = left + length / 2;
    solve_block(left, middle, bits, counts);
    {
        mpz_class product = pack(bits, left, length / 2);
        if (left == 0) {
            product *= product;
        } else {
            product *= pack(bits, 0, length);
        }
        // Only target offsets below length enter the right half of this block.
        mpz_fdiv_r_2exp(product.get_mpz_t(), product.get_mpz_t(), 32UL * length);
        Words coefficients(length);
        mpz_export(coefficients.data(), nullptr, -1, sizeof(coefficients[0]), 0, 0,
                   product.get_mpz_t());
        for (int n = middle; n < right; ++n) {
            auto added = coefficients[n - left];
            if (left == 0) {
                const auto diagonal = n % 2 == 0 ? bits[n / 2] : 0U;
                if (added < diagonal || (added - diagonal) % 2 != 0) {
                    throw std::logic_error("invalid ordered coefficient");
                }
                added = (added - diagonal) / 2;
            }
            counts[n] += added;
        }
    }
    solve_block(middle, right, bits, counts);
}

void check_prefix(const Words& bits, const Words& counts) {
    constexpr int limit = 8192;
    std::vector<int> terms;
    Words naive(limit + 1);
    for (int n = 1; n <= limit; ++n) {
        bool selected = n <= 2 || naive[n] == 1;
        if (bits[n] != selected || counts[n] != naive[n]) {
            throw std::logic_error("direct restricted pair sieve disagrees");
        }
        if (selected) {
            for (int a : terms) {
                if (a + n > limit) {
                    break;
                }
                ++naive[a + n];
            }
            terms.push_back(n);
        }
    }
}

void check_all_counts(const Words& bits, const Words& counts) {
    mpz_class square = pack(bits, 0, static_cast<int>(bits.size()));
    square *= square;
    mpz_fdiv_r_2exp(square.get_mpz_t(), square.get_mpz_t(), 32UL * bits.size());
    Words ordered(bits.size());
    mpz_export(ordered.data(), nullptr, -1, sizeof(ordered[0]), 0, 0, square.get_mpz_t());
    for (std::size_t n = 0; n < bits.size(); ++n) {
        const auto diagonal = n % 2 == 0 ? bits[n / 2] : 0U;
        if (ordered[n] != 2 * counts[n] + diagonal
            || bits[n] != (n == 1 || n == 2 || counts[n] == 1)) {
            throw std::logic_error("whole-prefix square disagrees with the recurrence");
        }
    }
}

void report_phase_occupancy(const Words& bits) {
    constexpr std::uint64_t numerator = 350477575, denominator = 856371966;
    for (int bins : {180, 600, 1800, 5400}) {
        Words selected(bins), total(bins);
        for (int n = 4'000'001; n <= 8'000'000; ++n) {
            const auto bin = ((n * numerator) % denominator) * bins / denominator;
            selected[bin] += bits[n];
            ++total[bin];
        }
        int best = 0;
        for (int i = 1; i < bins; ++i) {
            if (std::uint64_t(selected[i]) * total[best] > std::uint64_t(selected[best]) * total[i]) {
                best = i;
            }
        }
        std::cout << bins << " bins: maximum in bin " << best << ", "
                  << selected[best] << '/' << total[best] << '\n';
    }
}

void report_parity(const Words& bits, const Words& counts) {
    std::int64_t even_half = 1, odd_half = 0, odd_terms = 0, odd_crowded = 0;
    std::int64_t terms = 0, record_terms = 1, record_cutoff = 1;
    std::array<int, 2> first_over{};
    constexpr std::array bounds{21, 22};
    for (int n = 1; n < static_cast<int>(bits.size()); ++n) {
        terms += bits[n];
        if (n % 2 == 0) {
            const int half = n / 2;
            if (half % 2 == 0) {
                even_half += bits[half];
            } else {
                odd_half += bits[half];
            }
        } else {
            odd_terms += bits[n];
            odd_crowded += counts[n] >= 2;
        }
        const auto support = odd_terms + odd_crowded;
        if (terms * record_cutoff < record_terms * n) {
            record_terms = terms;
            record_cutoff = n;
            for (std::size_t i = 0; i < bounds.size(); ++i) {
                const auto bound_squared = bounds[i] * bounds[i] * even_half * odd_half;
                if (n >= 4 && first_over[i] == 0 && support * support > bound_squared) {
                    first_over[i] = n;
                }
            }
        }
        if (n == 65'536 || n == 582'954 || n == 1'722'075 || n == (1 << 24)) {
            std::cout << "Parity at " << n << ": " << even_half << ' ' << odd_half
                      << ' ' << odd_terms << ' ' << odd_crowded << '\n';
        }
    }
    std::cout << "First parity ratio over 21 and 22 at records (0 means none): "
              << first_over[0] << ' ' << first_over[1] << '\n';
}

void report_large_summands(const Words& bits, const Words& counts) {
    constexpr int limit = 1'722'075, largest_cut = 4096;
    for (int n : {9782, 9848, 9914, 98347, 98413}) {
        if (counts[n] != 2 || !bits[273] || !bits[339] || !bits[n - 273] || !bits[n - 339]) {
            throw std::logic_error("two-summand allocation counterexample disagrees");
        }
    }
    std::vector<int> terms;
    for (int n = 1; n <= limit; ++n) {
        if (bits[n]) {
            terms.push_back(n);
        }
    }
    std::vector<int> least(limit + 1, largest_cut + 1);
    for (auto a = terms.begin(); a != terms.end() && *a <= largest_cut; ++a) {
        for (auto b = a + 1; b != terms.end() && *b <= limit - *a; ++b) {
            int sum = *a + *b;
            if (least[sum] > *a) {
                least[sum] = *a;
            }
        }
    }
    constexpr std::array cuts{69, 256, 1024, largest_cut};
    constexpr std::size_t cut_256 = 1;
    static_assert(cuts[cut_256] == 256);
    std::array<int, cuts.size()> without_small{}, unique_without_small{};
    int first = 0;
    std::int64_t accepted = 2, low_count = 1, low_scale = 1;
    std::int64_t most_uncovered = 0, most_count = 1, most_scale = 1;
    for (int n = 3; n <= limit; ++n) {
        accepted += bits[n];
        for (std::size_t i = 0; i < cuts.size(); ++i) {
            if (least[n] > cuts[i]) {
                without_small[i] += counts[n] >= 2;
                unique_without_small[i] += counts[n] == 1;
            }
        }
        if (accepted * low_scale < low_count * n) {
            low_count = accepted;
            low_scale = n;
            if (without_small[cut_256] * most_count > most_uncovered * accepted) {
                most_uncovered = without_small[cut_256];
                most_count = accepted;
                most_scale = n;
            }
        }
        if (counts[n] >= 2 && least[n] > largest_cut && first == 0) {
            first = n;
            std::cout << "First crowded target without summand through 4096: " << n;
            for (int a : terms) {
                if (2 * a >= n) {
                    break;
                }
                if (bits[n - a]) {
                    std::cout << ' ' << a << '+' << n - a;
                }
            }
            std::cout << '\n';
        }
        if (n == 65'536 || n == 262'144 || n == 582'954 || n == 1'048'576 || n == limit) {
            std::cout << "Through " << n << ", without small summands (crowded, unique):";
            for (std::size_t i = 0; i < cuts.size(); ++i) {
                std::cout << ' ' << cuts[i] << "=(" << without_small[i] << ','
                          << unique_without_small[i] << ')';
            }
            std::cout << '\n';
        }
    }
    std::cout << "Largest R_256/A at integer records through " << limit << ": "
              << most_uncovered << '/' << most_count << " at " << most_scale << ".\n";
}

int main() {
    constexpr int limit = 1 << 24;
    Words bits(limit + 1), counts(limit + 1);
    solve_block(0, limit, bits, counts);
    for (int a = 1; a < limit / 2; ++a) {
        counts[limit] += bits[a] * bits[limit - a];
    }
    bits[limit] = counts[limit] == 1;
    check_prefix(bits, counts);
    check_all_counts(bits, counts);

    std::int64_t accepted = 0, crowded = 0, low_count = 1, low_scale = 1;
    std::int64_t all_low_count = 1, all_low_scale = 1;
    int first_excess = 0, first_record_excess = 0;
    std::int64_t record_h = 0, record_a = 1, record_n = 1;
    for (int n = 1; n <= limit; ++n) {
        accepted += bits[n];
        crowded += counts[n] >= 2;
        if (crowded > 10 * accepted && first_excess == 0) {
            first_excess = n;
            std::cout << "At first excess, H/A=" << crowded << '/' << accepted << ".\n";
        }
        if (accepted * all_low_scale < all_low_count * n) {
            all_low_count = accepted;
            all_low_scale = n;
            if (crowded > 10 * accepted && first_record_excess == 0) {
                first_record_excess = n;
            }
            if (crowded * record_a > record_h * accepted) {
                record_h = crowded;
                record_a = accepted;
                record_n = n;
            }
        }
        if (std::has_single_bit(static_cast<unsigned>(n))) {
            const bool record = accepted * low_scale < low_count * n;
            std::cout << n << ' ' << accepted << ' ' << crowded
                      << (record ? " record\n" : "\n");
            if (record) {
                low_count = accepted;
                low_scale = n;
            }
        }
    }
    std::cout << "First H>10A: " << first_excess << ", first at an integer density record: "
              << first_record_excess << " (0 means none through cutoff).\n"
              << "Last integer density record: " << all_low_count << '/' << all_low_scale
              << ". Largest H/A at such records: " << record_h << '/' << record_a
              << " at " << record_n << ".\n";
    report_phase_occupancy(bits);
    report_large_summands(bits, counts);
    report_parity(bits, counts);
    return 0;
}
