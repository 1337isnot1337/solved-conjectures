#include <algorithm>
#include <array>
#include <cstdint>
#include <iostream>
#include <vector>

using Membership = std::vector<unsigned char>;

constexpr std::uint64_t numerator = 350477575;
constexpr std::uint64_t denominator = 856371966;

std::uint64_t phase(int value) {
    return numerator * value % denominator;
}

bool middle_third(int value) {
    const auto residue = phase(value);
    return 3 * residue > denominator && 3 * residue < 2 * denominator;
}

Membership generate_by_phase(int cutoff) {
    Membership membership(cutoff + 1);
    membership[1] = membership[2] = 1;
    std::vector<int> terms{1, 2};
    std::vector<int> outliers{2};
    for (int target = 3; target <= cutoff; ++target) {
        int representations = 0;
        const bool middle = middle_third(target);
        if (middle) {
            // Two middle-third summands cannot hit this target. For an
            // outlier-outlier pair only count its smaller summand.
            for (int first : outliers) {
                const int second = target - first;
                if (first == second || !membership[second]
                    || (second < first && !middle_third(second))) {
                    continue;
                }
                if (++representations == 2) {
                    break;
                }
            }
        } else {
            for (int first : terms) {
                const int second = target - first;
                if (second <= first) {
                    break;
                }
                if (membership[second] && ++representations == 2) {
                    break;
                }
            }
        }
        if (representations == 1) {
            membership[target] = 1;
            terms.push_back(target);
            if (!middle) {
                outliers.push_back(target);
            }
        }
    }
    std::cout << "Cutoff " << cutoff << ": " << terms.size() << " terms, "
              << outliers.size() << " outside the open middle third.\n";
    return membership;
}

Membership generate_by_sums(int cutoff) {
    Membership membership(cutoff + 1);
    Membership representations(cutoff + 1);
    std::vector<int> terms;
    for (int term = 1; term <= cutoff; ++term) {
        if (term > 2 && representations[term] != 1) {
            continue;
        }
        for (int earlier : terms) {
            const int sum = earlier + term;
            if (sum > cutoff) {
                break;
            }
            representations[sum] += representations[sum] < 2;
        }
        membership[term] = 1;
        terms.push_back(term);
    }
    return membership;
}

bool check_dilation(const Membership& membership, int scale) {
    const int limit = (static_cast<int>(membership.size()) - 1) / scale;
    int count = 0;
    int scaled_count = 0;
    int worst_target = 1;
    std::int64_t worst_deficit = 0;
    for (int n = 1; n <= limit; ++n) {
        count += membership[n];
        for (int t = scale * n - scale + 1; t <= scale * n; ++t) {
            scaled_count += membership[t];
        }
        const std::int64_t deficit = scale * count - scaled_count;
        if (n < 100000 || deficit <= 0) {
            continue;
        }
        const std::int64_t square = deficit * deficit;
        if (square > 16LL * n) {
            std::cerr << "Square-root inequality violated at scale " << scale
                      << ", n = " << n << ", deficit = " << deficit << '\n';
            return false;
        }
        if (square * worst_target > worst_deficit * worst_deficit * n) {
            worst_target = n;
            worst_deficit = deficit;
        }
    }
    std::cout << "Scale " << scale << " through " << limit << ": worst ratio "
              << worst_deficit << "/sqrt(" << worst_target << ").\n";
    return true;
}

bool check_relaxed_phase_tail(const Membership& original) {
    constexpr int memory = 4095;
    constexpr int start = 1'000'000;
    constexpr int burst = 2'000'072;
    const std::vector<int> completion{0, 2, 19, 49, 51, 71, 73, 88, 90, 308, 310};
    const std::vector<int> pulse{0, 2};

    auto extended = [](int n) {
        const auto r = 150 * phase(n);
        return 47 * denominator <= r && r <= 103 * denominator;
    };
    auto core = [](int n) {
        const auto r = 150 * phase(n);
        return 56 * denominator < r && r < 94 * denominator;
    };

    std::vector<int> shifts;
    for (int s = 1; s <= memory; ++s) {
        if (original[s]) {
            shifts.push_back(s);
        }
    }
    Membership edited(original.begin(), original.begin() + start);
    edited.resize(start + completion.back() + memory + 1);
    for (int x : completion) {
        edited[start + x] = 1;
    }
    if (edited[start] != original[start]) {
        return false;
    }
    for (int n = memory + 1; n < static_cast<int>(edited.size()); ++n) {
        if (!extended(n) && edited[n]) {
            return false;
        }
        if (n > 2 * memory && core(n)) {
            const auto ways = std::count_if(shifts.begin(), shifts.end(),
                [&](int s) { return edited[n - s]; });
            if (edited[n] != (ways == 1)) {
                return false;
            }
        }
    }

    for (int j = 0; j <= memory + pulse.back(); ++j) {
        const bool accepted = std::binary_search(pulse.begin(), pulse.end(), j);
        const auto ways = std::count_if(shifts.begin(), shifts.end(), [&](int s) {
            return std::binary_search(pulse.begin(), pulse.end(), j - s);
        });
        if ((!extended(burst + j) && accepted)
            || (core(burst + j) && accepted != (ways == 1))) {
            return false;
        }
    }
    const int translated_burst = burst + static_cast<int>(denominator);
    const int sum_of_starts = burst + translated_burst;
    if (2 * static_cast<int>(edited.size()) >= sum_of_starts
        || burst - 2 < static_cast<int>(edited.size()) || extended(sum_of_starts)) {
        return false;
    }
    std::cout << "Verified the extinct continuation and the two-point repeatable pulse.\n";
    return true;
}

bool check_gap_germs(const Membership& original) {
    constexpr int cutoff = 10'000'000;
    std::vector<int> shifts;
    for (int s = 1; s <= cutoff; ++s) {
        if (original[s] && !middle_third(s)) {
            shifts.push_back(s);
        }
    }
    constexpr std::array<std::array<int, 3>, 2> expected{{
        {7'382, 74'038, 739'569},
        {7'558, 74'048, 740'453},
    }};
    constexpr std::array<int, 3> samples{100'000, 1'000'000, cutoff};
    for (int boundary : {1, 2}) {
        Membership germ(cutoff + 1);
        germ[0] = 1;
        int count = 1;
        std::size_t sample = 0;
        for (int t = 1; t <= cutoff; ++t) {
            const auto r = (3 * phase(t) + boundary * denominator) % (3 * denominator);
            if (denominator < r && r < 2 * denominator) {
                int ways = 0;
                for (int s : shifts) {
                    if (s > t || (germ[t - s] && ++ways == 2)) {
                        break;
                    }
                }
                germ[t] = ways == 1;
                count += germ[t];
            }
            if (t == samples[sample]) {
                std::cout << "Germ " << boundary << "/3 through " << t
                          << ": " << count << " terms.\n";
                if (count != expected[boundary - 1][sample]) {
                    return false;
                }
                ++sample;
            }
        }
    }
    return true;
}

bool check_short_parent_paths(const Membership& original) {
    constexpr int lag_limit = 1'000'000;
    constexpr int cutoff = 6'000'000;
    std::vector<int> small_terms;
    std::vector<int> outliers;
    for (int n = 1; n <= cutoff; ++n) {
        if (original[n]) {
            if (n <= lag_limit) {
                small_terms.push_back(n);
            }
            if (!middle_third(n)) {
                outliers.push_back(n);
            }
        }
    }
    Membership reachable(original.begin(), original.begin() + lag_limit + 1);
    reachable.resize(cutoff + 1);
    int last = small_terms.back();
    for (int n = lag_limit + 1; n <= cutoff; ++n) {
        if (!original[n]) {
            continue;
        }
        const auto& candidates = middle_third(n) ? outliers : small_terms;
        for (int s : candidates) {
            if (s >= n) {
                break;
            }
            const int t = n - s;
            if (s != t && std::min(s, t) <= lag_limit
                && original[t] && reachable[std::max(s, t)]) {
                reachable[n] = 1;
                last = n;
                break;
            }
        }
    }
    std::cout << "Last larger-parent descendant with lag and root at most " << lag_limit
              << ": " << last << ".\n";
    return last == 4'780'104 && cutoff >= last + lag_limit;
}

int main() {
    constexpr int cutoff = 100'000'000;
    const Membership membership = generate_by_phase(cutoff);
    const Membership reference = generate_by_sums(1'000'000);
    if (!std::equal(reference.begin(), reference.end(), membership.begin())) {
        std::cerr << "The independent sieves disagree.\n";
        return 1;
    }
    std::cout << "Exact prefix through one million agrees bit for bit.\n";
    if (!check_relaxed_phase_tail(reference)) {
        std::cerr << "The relaxed phase countermodel failed.\n";
        return 1;
    }
    if (!check_gap_germs(membership)) {
        std::cerr << "A germ count disagreed with the recorded value.\n";
        return 1;
    }
    if (!check_short_parent_paths(membership)) {
        std::cerr << "The short-parent reachability check failed.\n";
        return 1;
    }
    return check_dilation(membership, 2) && check_dilation(membership, 3) ? 0 : 1;
}
