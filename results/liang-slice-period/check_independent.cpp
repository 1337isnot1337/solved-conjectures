// Independent diagnostic: direct labeled triples, no sorted recurrence or folding.
#include <algorithm>
#include <array>
#include <cstdint>
#include <iostream>
#include <vector>

int main() {
    constexpr int N = 360, W = N + 1;
    std::array<std::vector<std::uint8_t>, 3> p;
    for (auto& layer : p) layer.resize(W * W);
    auto at = [&](int a, int x, int y) -> std::uint8_t& { return p[a][x * W + y]; };
    const auto legal = [](int h, int k) {
        return k == 0 ? h == 1 || h == 2 :
            k > 0 && (h-k == 1 || h-k == 4);
    };
    for (int s = 0; s <= 2 + 2*N; ++s) {
        for (int a = 0; a <= std::min(2, s); ++a) {
            for (int x = std::max(0,s-a-N); x <= std::min(N,s-a); ++x) {
                const int y = s-a-x;
                bool losing = s != 0;
                for (const int k : {0,a-1,a-4}) {
                    if (legal(a,k) && at(k,x,y)) losing = false;
                }
                for (const int k : {0,x-1,x-4}) {
                    if (legal(x,k) && at(a,k,y)) losing = false;
                }
                for (const int k : {0,y-1,y-4}) {
                    if (legal(y,k) && at(a,x,k)) losing = false;
                }
                at(a,x,y) = losing;
            }
        }
    }
    std::size_t bulk = 0, failures = 0, axis = 0;
    for (int x = 0; x <= N; ++x) {
        for (int y = 0; y <= N; ++y) {
            const int m = std::min(x,y), gap = std::abs(x-y);
            if (m >= 12) {
                const bool predicted = gap >= 3 ? gap % 5 == 2 :
                    gap == 2 && m % 4 <= 1;
                if (at(2,x,y) != predicted) return 1;
                ++bulk;
            }
            if (m >= 12 && gap == 2 && x+5 <= N && y+5 <= N) {
                if (at(2,x,y) == at(2,x+5,y+5) && m%2 == 1) return 2;
                if (at(2,x,y) != at(2,x+5,y+5)) ++failures;
            }
            if (x == 2 && gap >= 3 && y > x && y+5 <= N) {
                if (at(2,x,y) != at(2,x,y+5)) return 3;
                ++axis;
            }
        }
    }
    if (bulk != 121801 || failures != 342 || axis != 351) return 4;
    std::cout << 3*W*W << " labeled positions; " << bulk << " bulk checks; "
              << failures << " period-five counterexamples; " << axis << " axis checks\n";
}
