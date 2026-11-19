// Compress both sequences along the factor of order nine, then enumerate on C_133.
#include <algorithm>
#include <array>
#include <cassert>
#include <cstdlib>
#include <iostream>
#include <map>
#include <vector>

using Row = std::array<int, 9>;
using Key = std::array<int, 5>;
const Row weights{1,9,9,3,27,27,3,27,27};
const Row visit{4,5,7,8,1,2,3,6,0};
std::array<std::array<int,81>,5> multiplicities{};
std::map<Key,std::vector<Row>> buckets;
Row row{};
long long normalized = 0, filtered = 0;

int square_class(int x,int p) {
    if (x==0) return 0;
    for (int i=1;i<p;i++)
        if (i*i%p==x) return 1;
    return 2;
}

void count_row(int k,int total,int energy) {
    if (energy > 2378-133) return; // partner has 133 odd entries
    if (k==8) {
        row[0]=1-total;
        if (std::abs(row[0])>9 || row[0]%2==0) return;
        energy+=row[0]*row[0];
        if (energy>2378-133) return;
        ++normalized;
        int a = row[3]+9*(row[4]+row[5]);
        int b = row[6]+9*(row[7]+row[8]);
        int c = row[1]+3*(row[4]+row[7]);
        int d = row[2]+3*(row[5]+row[8]);
        auto norm = [](int p,int x,int y) {
            int real = 1-p*((x+y)/2), imag=(x-y)/2;
            return real*real+p*imag*imag;
        };
        if (norm(7,a,b)>2396 || norm(19,c,d)>2396) return;
        ++filtered;
        Key key{};
        for (int s=0;s<5;s++)
            for (int i=0;i<9;i++)
                for (int j=0;j<9;j++)
                    key[s]+=row[i]*row[j]*multiplicities[s][9*i+j];
        assert(key[0]==energy);
        buckets[key].push_back(row);
        return;
    }
    int i=visit[k];
    for (int x=-9;x<=9;x+=2) {
        row[i]=x;
        count_row(k+1,total+weights[i]*x,energy+weights[i]*x*x);
    }
}

int main() {
    // Representatives of the shift orbits under squares in each factor and common negation.
    std::array<std::pair<int,int>,5> shifts{{{0,0},{1,0},{0,1},{1,1},{1,2}}};
    assert(square_class(2,19)==2);
    for (int a=0;a<7;a++) for (int b=0;b<19;b++) {
        int i=3*square_class(a,7)+square_class(b,19);
        for (int s=0;s<5;s++) {
            auto [u,v]=shifts[s];
            int j=3*square_class((a+u)%7,7)+square_class((b+v)%19,19);
            ++multiplicities[s][9*i+j];
        }
    }
    count_row(0,0,0);
    long long pairs=0;
    for (auto const& [key,rows]:buckets) {
        Key other{};
        for (int s=0;s<5;s++) other[s]=(s==0?2378:-18)-key[s];
        auto hit=buckets.find(other);
        if (hit==buckets.end()) continue;
        pairs+=static_cast<long long>(rows.size())*hit->second.size();
        for (const auto &a:rows) for (const auto &b:hit->second) {
            for (auto x:a) std::cout<<x<<' ';
            for (int j=0;j<9;j++) {
                if (j) std::cout<<' ';
                std::cout<<b[j];
            }
            std::cout<<'\n';
        }
    }
    std::cerr<<"normalized within energy bound "<<normalized<<", passing marginal spectra "<<filtered
             <<", signatures "<<buckets.size()<<", ordered complementary compressed pairs "<<pairs<<"\n";
}
