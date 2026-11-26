#include <cstdint>
#include <iostream>
#include <vector>

int main() {
    constexpr int cutoff = 1'000'000;
    std::vector<unsigned char> representations(cutoff + 1);
    std::vector<int> members;
    std::vector<int> count(cutoff + 1);

    for (int n = 1; n <= cutoff; ++n) {
        if (n <= 2 || representations[n] == 1) {
            for (int earlier : members) {
                const int sum = n + earlier;
                if (sum > cutoff) {
                    break;
                }
                representations[sum] += representations[sum] < 2;
            }
            members.push_back(n);
        }
        count[n] = static_cast<int>(members.size());
    }

    for (const int n : {100'000, cutoff}) {
        std::cout << "A(" << n << ") = " << count[n] << '\n';
    }
    for (const int scale : {2, 3}) {
        constexpr int start = 100'000;
        int worst_n = start;
        std::int64_t worst_deficit = 0;
        int first_positive = 0;
        for (int n = start; n <= cutoff / scale; ++n) {
            const std::int64_t deficit = scale * count[n] - count[scale * n];
            if (deficit <= 0) {
                continue;
            }
            if (first_positive == 0) {
                first_positive = n;
            }
            if (deficit * deficit > 16LL * n) {
                std::cerr << "Square-root test failed at scale " << scale << ", N = "
                          << n << '\n';
                return 1;
            }
            if (deficit * deficit * worst_n > worst_deficit * worst_deficit * n) {
                worst_deficit = deficit;
                worst_n = n;
            }
        }
        std::cout << "Scale " << scale << ", checked N = " << start << " through "
                  << cutoff / scale << ", worst ratio = " << worst_deficit << "/sqrt("
                  << worst_n << "), first positive deficit at " << first_positive << '\n';
    }

    // At these targets, a pair can have at most one summand below 4096.
    constexpr int start = 100'000;
    std::vector<unsigned char> small_representations(cutoff + 1);
    for (int small : members) {
        if (small >= 4096) {
            break;
        }
        for (int large : members) {
            const int n = small + large;
            if (n > cutoff) {
                break;
            }
            if (n >= start) {
                small_representations[n] += small_representations[n] < 2;
            }
        }
    }
    int accepted_without_small = 0;
    int rejected_with_one_small = 0;
    for (int n = start; n <= cutoff; ++n) {
        const bool accepted = count[n] > count[n - 1];
        accepted_without_small += accepted && small_representations[n] == 0;
        rejected_with_one_small += !accepted && small_representations[n] == 1;
    }
    std::cout << "Accepted using two large summands: " << accepted_without_small << '\n'
              << "Rejected despite one small-summand representation: "
              << rejected_with_one_small << '\n';
}
