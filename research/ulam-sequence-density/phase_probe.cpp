#include <algorithm>
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
    std::cout << "Verified the extinct continuation and the two-point repeatable pulse.\n";
    return true;
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
    return check_dilation(membership, 2) && check_dilation(membership, 3) ? 0 : 1;
}
