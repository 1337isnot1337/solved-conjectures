// Continue each residual prime orbit until it has a strict witness or determines a direction.
#include <algorithm>
#include <cstdint>
#include <iostream>
#include <numeric>
#include <set>
#include <stdexcept>
#include <string>
#include <vector>

using Row = std::vector<int>;

void visit(const Row& parent, int modulus, int depth, std::set<Row>& directions) {
    if (depth==10) throw std::runtime_error("unresolved binary lift");
    const int n=parent.size(), next=2*modulus;
    int pivot=0;
    while (pivot<n && parent[pivot]%2==0) ++pivot;
    for (int bits=0; bits<(1<<n); ++bits) {
        if (modulus%2==0 && (bits&(1<<pivot))) continue;
        Row child=parent;
        for (int i=0; i<n; ++i) if (bits&(1<<i)) child[i]+=modulus;
        if (std::count_if(child.begin(),child.end(),[](int x){return x%2;})<2) continue;
        bool resolved=false;
        Row small(n);
        for (int t=1; t<=modulus && !resolved; t+=2) {
            bool witness=true, short_vector=true;
            for (int i=0; i<n && (witness || short_vector); ++i) {
                int r=(std::int64_t(t)*child[i])%next;
                small[i]=std::min(r,next-r);
                witness &= (n+1)*small[i]>next;
                short_vector &= n*(n+1)*small[i]<2*next;
            }
            if (witness) resolved=true;
            if (short_vector) {
                std::sort(small.begin(),small.end());
                if (small.front() && std::adjacent_find(small.begin(),small.end())==small.end()) {
                    int divisor=0;
                    for (int x:small) divisor=std::gcd(divisor,x);
                    for (int& x:small) x/=divisor;
                    directions.insert(small);
                }
                resolved=true;
            }
        }
        if (!resolved) visit(child,next,depth+1,directions);
    }
}

int main(int argc, char** argv) {
    if (argc!=3) return 2;
    int p=std::stoi(argv[1]), n=std::stoi(argv[2]);
    if (n<10 || n>13 || p<53 || p>900) return 2;
    Row root(n);
    std::set<Row> directions;
    int count=0;
    while (std::cin>>root[0]) {
        for (int i=1; i<n; ++i) if (!(std::cin>>root[i])) return 2;
        if (*std::min_element(root.begin(),root.end())<=0 || *std::max_element(root.begin(),root.end())>=p) return 2;
        visit(root,p,0,directions);
        ++count;
    }
    if (!count) return 2;
    for (const auto& row:directions) {
        for (int x:row) std::cout<<x<<' ';
        std::cout<<'\n';
    }
}
