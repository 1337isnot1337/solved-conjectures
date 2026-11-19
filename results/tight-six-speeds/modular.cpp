// For each tested prime verify that the only distinct folded sextuples
// without a strict 1/7 witness are modular dilations of {1,2,3,4,5,6}.
// The list modes emit witnessless representatives for their stated threshold.
#include <algorithm>
#include <array>
#include <bit>
#include <cstdint>
#include <iostream>
#include <set>
#include <string>
#include <stdexcept>
#include <vector>

using Word = std::uint64_t;
constexpr int blocks = 15; // enough for the prime ranges in both verifiers
using Bits = std::array<Word,blocks>;

template<int count>
struct Sieve {
    int p, n, words;
    bool emit;
    std::vector<Bits> witnessed, later;
    std::vector<std::vector<int>> ratio;
    std::set<std::array<int,count>> baseline;
    std::array<int,count> prefix{1};

    Sieve(int prime, int denominator, bool list) : p(prime), n(p/2), words(n/64+1), emit(list),
        witnessed(n+1), later(n+1), ratio(n+1,std::vector<int>(n+1)) {
        if (p<53 || words>blocks) throw std::runtime_error("unsupported modulus");
        for (int i=2; i*i<=p; ++i)
            if (p%i==0) throw std::runtime_error("modulus is composite");
        std::vector<int> inverse(n+1);
        for (int a=1; a<=n; ++a) {
            std::array<int,count> copy;
            for (int j=0; j<count; ++j) copy[j]=fold(a*(j+1));
            std::sort(copy.begin(),copy.end());
            baseline.insert(copy);
            for (int t=1; t<=n; ++t) {
                int v=fold(a*t);
                if (denominator*v>p) witnessed[a][t/64] |= Word(1)<<(t%64);
                if (v==1) inverse[a]=t;
            }
        }
        for (int a=1; a<=n; ++a)
            for (int b=1; b<=n; ++b)
                ratio[a][b]=std::min(fold(a*inverse[b]),fold(b*inverse[a]));
    }

    int fold(int x) const {
        x%=p;
        return std::min(x,p-x);
    }

    bool visit(int size, const Bits& eligible, const Bits& times) {
        int start=prefix[size-1]/64;
        if (size==count-1) {
            Bits survivors=eligible;
            for (int w=0; w<words; ++w) {
                Word ts=times[w];
                while (ts) {
                    int t=64*w+std::countr_zero(ts);
                    ts &= ts-1;
                    Word live=0;
                    for (int h=start; h<words; ++h)
                        live |= (survivors[h] &= ~witnessed[t][h]);
                    if (!live) return true;
                }
            }
            for (int w=start; w<words; ++w) {
                Word left=survivors[w];
                while (left) {
                    prefix[count-1]=64*w+std::countr_zero(left);
                    left &= left-1;
                    if (emit) {
                        for (int speed : prefix) std::cout << speed << ' ';
                        std::cout << '\n';
                    } else if (!baseline.contains(prefix)) return false;
                }
            }
            return true;
        }
        for (int w=start; w<words; ++w) {
            Word left=eligible[w];
            while (left) {
                int a=64*w+std::countr_zero(left);
                left &= left-1;
                Bits next{}, common{};
                Word live=0;
                for (int h=w; h<words; ++h)
                    live |= (next[h]=eligible[h]&later[a][h]);
                if (!live) continue;
                for (int h=0; h<words; ++h) common[h]=times[h]&witnessed[a][h];
                prefix[size]=a;
                if (!visit(size+1,next,common)) return false;
            }
        }
        return true;
    }

    bool check() {
        for (int b=2; b<=n-(count-2); ++b) {
            if (ratio[1][b]<b) continue;
            std::vector<int> options;
            Bits eligible{}, times{};
            for (int a=b+1; a<=n; ++a)
                if (ratio[1][a]>=b && ratio[b][a]>=b) {
                    options.push_back(a);
                    eligible[a/64] |= Word(1)<<(a%64);
                }
            if (options.size()<count-2) continue;
            for (int a:options) {
                later[a].fill(0);
                for (int e:options)
                    if (e>a && ratio[a][e]>=b) later[a][e/64] |= Word(1)<<(e%64);
            }
            for (int w=0; w<words; ++w) times[w]=witnessed[1][w]&witnessed[b][w];
            prefix[1]=b;
            if (!visit(2,eligible,times)) return false;
        }
        return true;
    }
};

int main(int argc, char** argv) {
    const std::string mode = argc==2 ? argv[1] : "";
    if (argc>2 || (argc==2 && mode!="--list-sixths" && mode!="--list-eighths" && mode!="--list-ninths" && mode!="--list-tenths" && mode!="--spectrum-eight" && mode!="--list-sevenths")) return 2;
    int p;
    while (std::cin>>p) {
        // For the allowed primes a nonzero folded distance never equals 1/6 or 1/8.
        if (mode=="--spectrum-eight") Sieve<8>(p,8,true).check();
        else if (mode=="--list-sevenths") Sieve<7>(p,7,true).check();
        else if (mode=="--list-tenths") Sieve<9>(p,10,true).check();
        else if (mode=="--list-ninths") Sieve<8>(p,9,true).check();
        else if (mode=="--list-eighths") Sieve<7>(p,8,true).check();
        else if (mode=="--list-sixths") Sieve<6>(p,6,true).check();
        else std::cout<<p<<' '<<Sieve<6>(p,7,false).check()<<std::endl;
    }
}
