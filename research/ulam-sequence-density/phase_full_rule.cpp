#include <algorithm>
#include <array>
#include <cassert>
#include <cstdint>
#include <iostream>
#include <string>
#include <vector>

using Integer = std::int64_t;
constexpr Integer p = 350'477'575;
constexpr Integer q = 856'371'966;
constexpr Integer turn = 3 * q;
constexpr int cutoff = 400;
constexpr int extra_lag = 2581;
constexpr int margin = 16;

Integer mod_turn(Integer x) {
    const auto residue = x % turn;
    return residue < 0 ? residue + turn : residue;
}

std::vector<int> prefix() {
    std::array<bool, extra_lag + 1> member{};
    member[1] = member[2] = true;
    std::vector<int> u{1, 2};
    for (int n = 3; n <= extra_lag; ++n) {
        int ways = 0;
        for (int a : u) {
            if (2 * a >= n || (member[n - a] && ++ways == 2)) {
                break;
            }
        }
        if (ways == 1) {
            member[n] = true;
            u.push_back(n);
        }
    }
    return u;
}

struct Probe {
    Integer phase;
    bool expected;
    bool verified = false;
};

using Interval = std::pair<Integer, Integer>;

Integer overlap(const std::vector<Interval>& targets, const std::vector<Interval>& sources) {
    const auto offset = mod_turn(3 * p * extra_lag);
    Integer total = 0;
    for (const Integer move : {offset, offset - turn}) {
        auto target = targets.begin();
        auto source = sources.begin();
        while (target != targets.end() && source != sources.end()) {
            const auto left = std::max(target->first, source->first + move);
            const auto right = std::min(target->second, source->second + move);
            total += std::max(Integer{0}, right - left);
            if (target->second < source->second + move) {
                ++target;
            } else {
                ++source;
            }
        }
    }
    return total;
}

int main() {
    int offset;
    std::array<Integer, 3> cuts;
    if (!(std::cin >> offset >> cuts[0] >> cuts[1] >> cuts[2])) {
        return 1;
    }
    constexpr std::array<int, 2> times{4'290'233, 10'135'096};
    constexpr std::array<Integer, 3> witnesses{856'369'674, 1'712'763'216, 1'712'772'597};
    constexpr std::array<int, 3> parents{273, 69, 69};
    constexpr std::array<int, 3> assignments{0, 0, 1};
    std::array<std::vector<Probe>, 2> probes;
    std::vector<int> lag;
    const auto u = prefix();
    assert(u.back() == extra_lag && extra_lag % 2 == 1);
    for (int s : u) {
        if (s > cutoff) {
            break;
        }
        const auto phase = mod_turn(3 * p * s);
        if (phase <= q || phase >= 2 * q) {
            lag.push_back(s);
        }
        for (std::size_t k = 0; k < witnesses.size(); ++k) {
            const int parity = (1 - (s % 2)) ^ assignments[k];
            probes[parity].push_back({mod_turn(witnesses[k] - phase), s == parents[k]});
        }
    }
    for (auto& list : probes) {
        std::ranges::sort(list, {}, &Probe::phase);
    }

    std::array<Integer, 2> bottom{turn, turn};
    std::array<Integer, 2> top{};
    std::array<std::vector<Interval>, 2> supports;
    for (int label = 0; label < 6; ++label) {
        int color, check_label;
        std::string memory;
        if (!(std::cin >> color >> check_label >> memory) || check_label != label || memory.size() != cutoff) {
            return 1;
        }
        for (int branch = 0; branch < 2; ++branch) {
            std::array<unsigned char, 512> history{};
            std::transform(memory.begin(), memory.end(), history.begin(), [](char c) { return c == '1'; });
            constexpr unsigned mask = 511;
            unsigned index = cutoff;
            Integer left = mod_turn(cuts[branch] + color * q + 3 * p * offset);
            const auto width = cuts[branch + 1] - cuts[branch];
            for (int t = offset; t < offset + times[branch]; ++t) {
                int ways = 0;
                if (2 * q < 2 * left + width && 2 * left + width < 4 * q) {
                    for (int s : lag) {
                        if ((ways += history[(index - s) & mask]) == 2) {
                            break;
                        }
                    }
                }
                history[index++ & mask] = ways == 1;
                if (ways == 1) {
                    const auto right = left + width;
                    assert(q <= left && right <= 2 * q);
                    const int parity = (label + t) % 2;
                    bottom[parity] = std::min(bottom[parity], left);
                    top[parity] = std::max(top[parity], right);
                    if (width > 2 * margin) {
                        supports[parity].emplace_back(left + margin, right - margin);
                    }
                    auto& list = probes[parity];
                    auto hit = std::ranges::lower_bound(list, left - margin, {}, &Probe::phase);
                    for (; hit != list.end() && hit->phase <= right + margin; ++hit) {
                        assert(hit->expected);
                        hit->verified |= left + margin < hit->phase && hit->phase < right - margin;
                    }
                }
                left = mod_turn(left + 3 * p);
            }
        }
    }
    for (const auto& list : probes) {
        for (const auto& probe : list) {
            assert(probe.verified == probe.expected);
        }
    }
    assert(std::ranges::count(probes[0], true, &Probe::verified) == 2);
    assert(std::ranges::count(probes[1], true, &Probe::verified) == 1);
    assert((bottom == std::array<Integer, 2>{q + 42'321, q}));
    assert((top == std::array<Integer, 2>{2 * q - 6'183, 2 * q - 15'564}));
    assert(top[0] + top[1] - turn + 2 * margin < witnesses[0] - 1);
    assert(witnesses[0] + 1 < q && 2 * q < witnesses[1] - 1);
    assert(witnesses[2] + 1 < bottom[0] + bottom[1] - 2 * margin);
    std::cout << "Exterior windows for both parity assignments have exactly one representation.\n";

    for (auto& support : supports) {
        std::ranges::sort(support);
        for (std::size_t i = 1; i < support.size(); ++i) {
            assert(support[i - 1].second <= support[i].first);
        }
    }
    const auto even = overlap(supports[0], supports[1]);
    const auto odd = overlap(supports[1], supports[0]);
    assert(even == 2'741'845 && odd == 2'682'609 && lag.size() == 17);
    assert(18'000 * (even + odd) > 2 * turn * (2 + static_cast<Integer>(lag.size())));
    std::cout << "The genuine lag 2581 forces lower disagreement density above 1/18000.\n";
}
