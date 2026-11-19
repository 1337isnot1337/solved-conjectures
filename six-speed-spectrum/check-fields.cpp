// Check the stated modular covers on the output of --list-sixths. A repeated
// residue can be tested by deleting a member and repeating a surviving one.
#include <algorithm>
#include <array>
#include <cstdint>
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <vector>

using Speeds = std::array<int,6>;
using Four = std::array<int,4>;
using Five = std::array<int,5>;
using Word = std::uint64_t;

struct Check {
    int p, words;
    std::vector<std::vector<Word>> witnesses;
    std::vector<Five> second;
    std::array<std::vector<Four>,2> lines;
    int minimum=100;
    bool second_ok=true, supports_ok=true;
    std::array<bool,2> four_ok{true,true};

    int fold(int x) const {
        x%=p;
        if (x<0) x+=p;
        return std::min(x,p-x);
    }
    Check(int prime, std::istream& data) : p(prime),words((p/2)/64+1),
        witnesses(p/2+1,std::vector<Word>(words)) {
        for (int a=1;a<=p/2;++a) for (int t=1;t<=p/2;++t)
            if (6*fold(a*t)>=p) witnesses[a][t/64] |= Word(1)<<(t%64);
        int count;
        if (!(data>>count)) throw std::runtime_error("missing cover");
        second.resize(count);
        for (auto& h:second) for (int& v:h) if (!(data>>v)) throw std::runtime_error("missing five-coefficient row");
        for (auto& hs:lines) {
            if (!(data>>count)) throw std::runtime_error("missing four-parameter cover");
            hs.resize(count);
            for (auto& h:hs) for (int& v:h) if (!(data>>v)) throw std::runtime_error("missing four-coefficient row");
        }
    }
    template<std::size_t N>
    bool covered(const std::array<int,N>& u,const std::vector<std::array<int,N>>& hs) const {
        for (const auto& h:hs) {
            int sum=0;
            for (std::size_t i=0;i<N;++i) sum+=h[i]*u[i];
            if (sum%p==0) return true;
        }
        return false;
    }
    void check_triangles(const Speeds& s) {
        int count=0;
        for (int i=0;i<6;++i) for (int j=i+1;j<6;++j) for (int k=j+1;k<6;++k) {
            if (s[i]==s[j] || s[i]==s[k] || s[j]==s[k]) continue;
            for (int e:{-1,1}) for (int f:{-1,1}) if ((s[i]+e*s[j]+f*s[k])%p==0) {
                ++count;
                Five u{s[i],e*s[j]};
                int pos=2;
                for (int t=0;t<6;++t) if (t!=i && t!=j && t!=k) u[pos++]=s[t];
                // The second cover is invariant under all relabelings of the
                // signed triangle and all signs and permutations of the extras.
                if (second_ok && !covered(u,second)) second_ok=false;
            }
        }
        minimum=std::min(minimum,count);
    }
    void check_maps(const Speeds& s) {
        for (int i=0;i<6;++i) for (int j=0;j<6;++j) if (i!=j) for (int y:{s[j],-s[j]}) {
            const int x=s[i];
            for (int k=0;k<6;++k) if (k!=i && k!=j && s[k]==fold(x+y)) {
                std::array<int,3> left;
                int pos=0;
                for (int h=0;h<6;++h) if (h!=i && h!=j && h!=k) left[pos++]=s[h];
                for (int a=0;a<3;++a) for (int b=0;b<3;++b) if (a!=b) {
                    const int c=3-a-b;
                    if (four_ok[0] && left[a]==fold(x-y))
                        for (int z:{left[b],-left[b]}) for (int w:{left[c],-left[c]})
                            if (!covered(Four{x,y,z,w},lines[0])) four_ok[0]=false;
                    if (four_ok[1]) for (int z:{left[a],-left[a]}) if (left[b]==fold(x+z))
                        for (int w:{left[c],-left[c]})
                            if (!covered(Four{x,y,z,w},lines[1])) four_ok[1]=false;
                }
            }
        }
    }
    bool deletion_witness(const Speeds& s,int one,int two=-1) const {
        for (int w=0;w<words;++w) {
            Word common=~Word(0);
            for (int i=0;i<6;++i) if (i!=one && i!=two) common &= witnesses[s[i]][w];
            if (common) return true;
        }
        return false;
    }
    void visit(const Speeds& s) {
        check_triangles(s);
        check_maps(s);
        for (int j=0;j<6;++j) if (!deletion_witness(s,j)) {
            for (int k=j+1;k<6;++k) if (!deletion_witness(s,j,k)) supports_ok=false;
            for (int k=0;k<6;++k) if (k!=j) {
                Speeds duplicate=s;
                duplicate[j]=s[k];
                check_triangles(duplicate);
                check_maps(duplicate);
            }
        }
    }
};

int main(int argc,char** argv) {
    if (argc!=3) return 2;
    std::ifstream data(argv[2]);
    Check check(std::stoi(argv[1]),data);
    Speeds d;
    while (std::cin>>d[0]) {
        for (int i=1;i<6;++i) if (!(std::cin>>d[i])) return 2;
        check.visit(d);
    }
    std::cout<<(check.supports_ok && check.minimum>=2)<<' '
             <<(check.supports_ok && check.second_ok)<<' '
             <<(check.supports_ok && check.four_ok[0])<<' '
             <<(check.supports_ok && check.four_ok[1])<<'\n';
}
