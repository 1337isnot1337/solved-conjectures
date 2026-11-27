#include <algorithm>
#include <array>
#include <cstdint>
#include <iostream>
#include <span>
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

bool in_extended_band(int n, int width_denominator) {
    const auto r = 3ULL * width_denominator * phase(n);
    return (width_denominator - 3) * denominator <= r
        && r <= (2 * width_denominator + 3) * denominator;
}

bool in_phase_core(int n, int width_denominator) {
    const auto r = 3ULL * width_denominator * phase(n);
    return (width_denominator + 6) * denominator < r
        && r < (2 * width_denominator - 6) * denominator;
}

bool verify_extinction(const Membership& original, int cutoff, int width_denominator,
                       std::span<const int> completion) {
    constexpr int start = 50'000'000;
    std::vector<int> shifts;
    for (int s = 1; s <= cutoff; ++s) {
        if (original[s]) {
            shifts.push_back(s);
        }
    }
    const auto selected = [&](int n) {
        return n < start ? bool(original[n])
                         : std::binary_search(completion.begin(), completion.end(), n - start);
    };
    for (int n = cutoff + 1; n < start; ++n) {
        if (selected(n) && !in_extended_band(n, width_denominator)) {
            return false;
        }
    }
    for (int n = start; n <= start + completion.back() + cutoff; ++n) {
        const bool member = selected(n);
        if (!in_extended_band(n, width_denominator) && member) {
            return false;
        }
        if (in_phase_core(n, width_denominator)) {
            const auto ways = std::count_if(shifts.begin(), shifts.end(),
                [&](int lag) { return selected(n - lag); });
            if (member != (ways == 1)) {
                return false;
            }
        } else if (member) {
            int ways = 0;
            for (int a = 1; 2 * a < n; ++a) {
                if (selected(a) && selected(n - a) && ++ways == 2) {
                    break;
                }
            }
            if (ways != 1) {
                return false;
            }
        }
    }
    std::cout << "Cutoff " << cutoff << ": verified extinction from 49,999,999 with "
              << completion.size() << " selected terms, each with one full representation.\n";
    return true;
}

bool check_boundary_rules(const Membership& original) {
    constexpr std::array<int, 72> completion_20k{
        40, 62, 65, 67, 87, 89, 131, 133, 197, 199, 263, 265,
        365, 368, 370, 412, 414, 426, 429, 431, 448, 451, 453, 473,
        475, 514, 561, 563, 583, 585, 602, 605, 607, 649, 651, 671,
        673, 715, 717, 759, 761, 773, 776, 778, 795, 798, 800, 817,
        861, 886, 888, 908, 910, 930, 932, 1054, 1057, 1059, 1098, 1123,
        1125, 1145, 1147, 1167, 1169, 1484, 1487, 1489, 1531, 1533, 1553, 1555,
    };
    constexpr std::array<int, 457> completion_100k{
        40, 62, 65, 67, 87, 89, 131, 133, 197, 199, 263, 265,
        365, 368, 370, 412, 414, 426, 429, 431, 448, 451, 453, 473,
        475, 514, 561, 563, 583, 585, 602, 605, 607, 649, 651, 671,
        673, 715, 717, 759, 761, 773, 776, 778, 795, 798, 800, 817,
        861, 886, 888, 908, 910, 930, 932, 966, 969, 971, 1013, 1015,
        1035, 1037, 1054, 1057, 1059, 1098, 1123, 1125, 1145, 1147, 1167, 1169,
        1440, 1443, 1445, 1462, 1465, 1467, 1484, 1506, 1575, 1577, 1580, 1582,
        1602, 1604, 1616, 1619, 1621, 1638, 1641, 1643, 1663, 1665, 1682, 1704,
        1729, 1731, 1743, 1746, 1748, 1773, 1775, 1790, 1792, 1809, 1831, 1834,
        1836, 1853, 1883, 1885, 1922, 1924, 1941, 1944, 1946, 1985, 2010, 2012,
        2024, 2027, 2029, 2054, 2056, 2068, 2090, 2115, 2117, 2120, 2122, 2142,
        2144, 2159, 2161, 2178, 2181, 2183, 2225, 2227, 2244, 2291, 2293, 2313,
        2315, 2423, 2425, 2481, 2484, 2486, 2525, 2542, 2545, 2547, 2572, 2574,
        2589, 2591, 2608, 2630, 2633, 2635, 2652, 2674, 2696, 2762, 2809, 2811,
        2831, 2833, 2867, 2870, 2872, 2914, 2916, 2933, 2963, 2965, 2980, 2982,
        2999, 3046, 3048, 3060, 3063, 3104, 3112, 3114, 3129, 3131, 3134, 3136,
        3151, 3153, 3156, 3158, 3173, 3175, 3192, 3195, 3197, 3214, 3217, 3219,
        3239, 3241, 3258, 3283, 3285, 3302, 3327, 3329, 3349, 3351, 3371, 3373,
        3495, 3498, 3500, 3525, 3527, 3542, 3544, 3561, 3608, 3610, 3627, 3666,
        3669, 3671, 3688, 3691, 3693, 3713, 3715, 3757, 3759, 3784, 3786, 3798,
        3801, 3803, 3820, 3823, 3825, 3845, 3847, 3864, 3886, 3903, 3906, 3908,
        3950, 3952, 3972, 3974, 3999, 4001, 4035, 4038, 4040, 4057, 4060, 4062,
        4082, 4084, 4101, 4123, 4148, 4150, 4192, 4194, 4228, 4231, 4233, 4250,
        4253, 4255, 4272, 4294, 4338, 4363, 4365, 4385, 4387, 4407, 4409, 4443,
        4446, 4448, 4490, 4492, 4509, 4531, 4534, 4536, 4556, 4558, 4583, 4585,
        4600, 4602, 4619, 4622, 4624, 4666, 4668, 4685, 4732, 4734, 4746, 4749,
        4751, 4793, 4795, 4815, 4817, 4834, 4837, 4839, 4856, 4859, 4861, 4881,
        4883, 4922, 4969, 4971, 4991, 4993, 5027, 5030, 5032, 5074, 5076, 5093,
        5140, 5142, 5162, 5164, 5308, 5311, 5313, 5330, 5333, 5335, 5355, 5357,
        5399, 5401, 5641, 5643, 5677, 5680, 5682, 5724, 5726, 5743, 5790, 5792,
        5812, 5814, 5848, 5851, 5853, 5892, 5917, 5919, 5939, 5941, 5944, 5946,
        5961, 5963, 6046, 6049, 6051, 6093, 6095, 6115, 6117, 6195, 6198, 6200,
        6242, 6244, 6264, 6266, 6283, 6286, 6288, 6330, 6332, 6352, 6354, 6484,
        6486, 6520, 6523, 6525, 6567, 6569, 6586, 6633, 6635, 6655, 6657, 6735,
        6738, 6740, 6782, 6784, 6804, 6806, 6823, 6826, 6828, 6870, 6872, 6892,
        6894, 7024, 7026, 7060, 7063, 7065, 7107, 7109, 7126, 7173, 7175, 7195,
        7197, 7275, 7278, 7280, 7322, 7324, 7344, 7346, 7363, 7366, 7368, 7410,
        7412, 7432, 7434, 7749, 7752, 7754, 7771, 7774, 7776, 7796, 7798, 7840,
        7842,
    };
    if (!verify_extinction(original, 20'000, 80, completion_20k)
        || !verify_extinction(original, 100'000, 130, completion_100k)) {
        return false;
    }
    constexpr int cutoff = 20'000;
    std::vector<int> shifts;
    for (int lag = 1; lag <= cutoff; ++lag) {
        if (original[lag]) {
            shifts.push_back(lag);
        }
    }
    for (int boundary : {1, 2}) {
        const int seed = boundary * static_cast<int>(denominator / 3);
        Membership pulse(2 * cutoff + 1);
        pulse[0] = 1;
        int count = 1;
        int last = 0;
        for (int j = 1; j <= 2 * cutoff; ++j) {
            if (in_phase_core(seed + j, 80)) {
                int ways = 0;
                for (int lag : shifts) {
                    if (lag > j || (pulse[j - lag] && ++ways == 2)) {
                        break;
                    }
                }
                if (ways == 1) {
                    pulse[j] = 1;
                    ++count;
                    last = j;
                }
            }
        }
        const std::array<int, 2> counts{81, 65};
        const std::array<int, 2> ends{2991, 1226};
        if (count != counts[boundary - 1] || last != ends[boundary - 1] || last >= cutoff) {
            return false;
        }
        std::cout << "Boundary " << boundary << "/3 seed produces " << count
                  << " pulse entries ending at offset " << last << ".\n";
    }
    return true;
}

bool check_smallest_summand_descent(const Membership& original) {
    constexpr int cutoff = 10'000'000;
    std::vector<int> smallest(cutoff + 1);
    std::vector<int> child(cutoff + 1);
    std::vector<int> terms;
    std::vector<int> outliers;
    int represented = 0;
    for (int n = 1; n <= cutoff; ++n) {
        if (middle_third(n)) {
            int minimum = n;
            for (int s : outliers) {
                const int t = n - s;
                if (s != t && original[t]) {
                    minimum = std::min(minimum, std::min(s, t));
                }
            }
            if (minimum < n) {
                smallest[n] = minimum;
            }
        } else {
            for (int s : terms) {
                if (2 * s >= n) {
                    break;
                }
                if (original[n - s]) {
                    smallest[n] = s;
                    break;
                }
            }
        }
        const int minimum = smallest[n];
        represented += minimum > 0;
        if (minimum > 2) {
            const int retained = smallest[minimum];
            child[n] = n - minimum + retained;
            if (!retained || !smallest[child[n]] || original[child[n]]
                || smallest[child[n]] > retained) {
                return false;
            }
        }
        if (original[n]) {
            terms.push_back(n);
            if (!middle_third(n)) {
                outliers.push_back(n);
            }
        }
    }
    if (represented != 8'138'684) {
        return false;
    }
    constexpr std::array<int, 5> cutoffs{2, 69, 256, 1024, 4096};
    constexpr std::array<int, 5> large_targets{6'657'954, 1'270'428, 239'826, 25'838, 5414};
    constexpr std::array<int, 5> peak_basin{100, 19, 11, 4, 3};
    std::vector<int> root(cutoff + 1);
    for (std::size_t i = 0; i < cutoffs.size(); ++i) {
        std::vector<int> counts(cutoff + 1);
        int large = 0;
        int largest = 0;
        for (int n = 3; n <= cutoff; ++n) {
            if (smallest[n]) {
                const bool descend = smallest[n] > cutoffs[i];
                large += descend;
                root[n] = descend ? root[child[n]] : n;
                largest = std::max(largest, ++counts[root[n]]);
            }
        }
        std::cout << "Summand cutoff " << cutoffs[i] << ": " << large
                  << " targets above it, largest basin " << largest << ".\n";
        if (large != large_targets[i] || largest != peak_basin[i]) {
            return false;
        }
    }
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
    if (!check_gap_germs(membership)) {
        std::cerr << "A germ count disagreed with the recorded value.\n";
        return 1;
    }
    if (!check_short_parent_paths(membership)) {
        std::cerr << "The short-parent reachability check failed.\n";
        return 1;
    }
    if (!check_boundary_rules(membership)) {
        std::cerr << "The boundary-rule extinction or pulse check failed.\n";
        return 1;
    }
    if (!check_smallest_summand_descent(membership)) {
        std::cerr << "The smallest-summand descent check failed.\n";
        return 1;
    }
    return check_dilation(membership, 2) && check_dilation(membership, 3) ? 0 : 1;
}
