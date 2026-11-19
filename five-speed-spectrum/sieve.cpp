// Exact searches over projective spaces modulo a prime. Python verifies the
// resulting prime products and reconstructs the bounded integer directions.
#include <algorithm>
#include <array>
#include <bit>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <stdexcept>
#include <string>
#include <vector>

using Word = std::uint64_t;
using Vector = std::vector<int>;
using Matrix = std::vector<Vector>;

// Bit j represents the positive residue j, including an unused bit at zero.
struct Field {
    int p, n, words;
    std::vector<std::vector<Word>> good;

    explicit Field(int prime, int threshold=5) : p(prime), n(p / 2), words(n / 64 + 1),
        good(n + 1, std::vector<Word>(words)) {
        if (p < 3 || p > 50023) throw std::runtime_error("unsupported prime");
        for (int i = 2; i * i <= p; ++i)
            if (p % i == 0) throw std::runtime_error("composite modulus");
        for (int a = 1; a <= n; ++a) {
            int r = 0;
            for (int t = 1; t <= n; ++t) {
                r += a;
                if (r >= p) r -= p;
                if (threshold * std::min(r, p-r) >= p)
                    good[a][t/64] |= Word(1) << (t%64);
            }
        }
    }
    int fold(int a) const {
        a %= p;
        if (a < 0) a += p;
        return std::min(a, p-a);
    }
    template<std::size_t N>
    bool witness(const std::array<int,N>& d) const {
        for (int w = 0; w < words; ++w) {
            Word common=~Word(0);
            for (int speed:d) common &= good[speed][w];
            if (common) return true;
        }
        return false;
    }
};

// Stop at the first bad quintuple having fewer than two additive relations
// and lacking a scaled {1,3,4}. All entries here are distinct folded residues.
bool exceptional(const Field& f, const std::array<int,5>& d) {
    int relations = 0;
    auto has = [&](int x) { return std::find(d.begin(),d.end(),f.fold(x)) != d.end(); };
    for (int x : d) {
        if (has(3*x) && has(4*x)) return false;
        if (has(2*x)) ++relations;
    }
    for (int i = 0; i < 5; ++i)
        for (int j = i+1; j < 5; ++j)
            for (int k = j+1; k < 5; ++k)
                if (f.fold(d[i]+d[j]) == d[k] || f.fold(d[i]-d[j]) == d[k])
                    ++relations;
    return relations < 2;
}

bool covers_quintuples(const Field& f) {
    const int n = f.n, words = f.words;
    std::vector<int> inverse(n+1);
    for (int a = 1; a <= n; ++a)
        for (int t = 1; t <= n; ++t)
            if (f.fold(a*t) == 1) inverse[a] = t;
    Matrix ratio(n+1,Vector(n+1));
    for (int a=1; a<=n; ++a)
        for (int b=1; b<=n; ++b)
            ratio[a][b] = std::min(f.fold(a*inverse[b]), f.fold(b*inverse[a]));

    // Scale an ordered pair attaining the least folded quotient to (1,b).
    for (int b = 2; b <= n-3; ++b) {
        if (ratio[1][b] < b) continue;
        Vector eligible;
        for (int x = b+1; x <= n; ++x)
            if (ratio[1][x] >= b && ratio[b][x] >= b) eligible.push_back(x);
        std::vector<std::vector<Word>> later(n+1,std::vector<Word>(words));
        for (int x : eligible)
            for (int y : eligible)
                if (y > x && ratio[x][y] >= b)
                    later[x][y/64] |= Word(1) << (y%64);
        std::vector<Word> possible(words), three(words);
        for (int c : eligible) {
            for (int w=0; w<words; ++w)
                three[w] = f.good[1][w] & f.good[b][w] & f.good[c][w];
            for (int d : eligible) {
                if (!(later[c][d/64] & (Word(1) << (d%64)))) continue;
                Word live = 0;
                for (int h=d/64; h<words; ++h)
                    live |= (possible[h] = later[c][h] & later[d][h]);
                for (int w=0; w<words && live; ++w) {
                    Word times = three[w] & f.good[d][w];
                    while (times && live) {
                        int t = 64*w + std::countr_zero(times);
                        times &= times-1;
                        live = 0;
                        for (int h=d/64; h<words; ++h)
                            live |= (possible[h] &= ~f.good[t][h]);
                    }
                }
                if (!live) continue;
                for (int h=d/64; h<words; ++h) {
                    Word mask=possible[h];
                    while (mask) {
                        int e=64*h+std::countr_zero(mask);
                        mask &= mask-1;
                        if (exceptional(f,{1,b,c,d,e})) return false;
                    }
                }
            }
        }
    }
    return true;
}

Matrix read_matrix(int rows, int cols) {
    Matrix a(rows,Vector(cols));
    for (auto& row : a) for (int& x : row)
        if (!(std::cin >> x)) throw std::runtime_error("missing coefficient");
    return a;
}

template<std::size_t N>
bool covers_plane(const Field& f, const Matrix& a, const Matrix& lines) {
    // First nonzero homogeneous coordinate equals one.
    for (int pivot=0; pivot<3; ++pivot)
        for (int i=0; i<(pivot==0 ? f.p : 1); ++i)
            for (int j=0; j<(pivot<=1 ? f.p : 1); ++j) {
                const int x = pivot==0, y = pivot==0 ? i : pivot==1;
                const int z = pivot==2 ? 1 : j;
                auto eval = [&](const Vector& r) { return r[0]*x+r[1]*y+r[2]*z; };
                std::array<int,N> d;
                for (std::size_t k=0; k<N; ++k) d[k]=f.fold(eval(a[k]));
                if (std::find(d.begin(),d.end(),0)!=d.end() || f.witness(d)) continue;
                bool covered=false;
                for (const auto& h : lines)
                    if (eval(h)%f.p == 0) { covered=true; break; }
                if (!covered) return false;
            }
    return true;
}

int main(int argc, char** argv) {
    if (argc != 3) return 2;
    std::string mode = argv[1];
    Field f(std::stoi(argv[2]),mode=="plane6" ? 6 : 5);
    if (mode == "root") { std::cout << covers_quintuples(f) << '\n'; return 0; }
    int id;
    while (std::cin >> id) {
        if (mode == "plane" || mode == "plane6") {
            auto a = read_matrix(mode=="plane6" ? 6 : 5,3);
            int count;
            if (!(std::cin >> count)) return 2;
            auto lines = read_matrix(count,3);
            std::cout << id << ' ' << (mode=="plane6" ? covers_plane<6>(f,a,lines) : covers_plane<5>(f,a,lines)) << '\n';
        } else if (mode == "slopes") {
            auto a = read_matrix(5,2);
            std::cout << id;
            for (int r=0; r<f.p; ++r) {
                std::array<int,5> d;
                for (int k=0; k<5; ++k) d[k]=f.fold(a[k][0]+a[k][1]*r);
                if (!f.witness(d)) std::cout << ' ' << r;
            }
            std::cout << '\n';
        } else return 2;
    }
}
