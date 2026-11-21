// Exact diagnostic for a proposed all-graphs reduction, not a test of the
// full conjecture. A failed lemma is useful; positive samples prove nothing.
#include <algorithm>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <random>
#include <vector>

using Graph = std::vector<unsigned>;

int gamma(const Graph& a) {
    const unsigned n=a.size(), count=1u<<n;
    std::vector<unsigned> common(count,0);
    std::vector<unsigned char> clique(count,0),bad(count,0);
    common[0]=count-1; clique[0]=1;
    for(unsigned s=1;s<count;s++) {
        const unsigned v=__builtin_ctz(s), rest=s&(s-1);
        clique[s]=clique[rest] && ((rest & ~a[v])==0);
        common[s]=common[rest]&a[v];
        if(clique[s] && __builtin_popcount(s)>=2 && common[s]==0) bad[s]=1;
    }
    for(unsigned v=0;v<n;v++)
        for(unsigned s=0;s<count;s++) if(s&(1u<<v)) bad[s]|=bad[s^(1u<<v)];
    int best=0;
    for(unsigned s=0;s<count;s++) if(!bad[s]) best=std::max(best,__builtin_popcount(s));
    return best;
}

void report(const Graph&a,int before,const std::vector<int>&after) {
    std::cout<<"{\"status\":\"proposed single-edge reduction is false\",\"n\":"<<a.size()
             <<",\"gamma\":"<<before<<",\"adjacency_masks\":[";
    for(unsigned i=0;i<a.size();i++) std::cout<<(i?",":"")<<a[i];
    std::cout<<"],\"triangle_edge_deletion_gammas\":[";
    for(unsigned i=0;i<after.size();i++)std::cout<<(i?",":"")<<after[i];
    std::cout<<"]}"<<std::endl;
}

bool obstructs(Graph a, int before) {
    std::vector<int> after;
    for(unsigned u=0;u<a.size();u++) for(unsigned v=u+1;v<a.size();v++) {
        if(!(a[u]&(1u<<v)) || !(a[u]&a[v])) continue;
        a[u]^=1u<<v; a[v]^=1u<<u;
        int next=gamma(a);
        a[u]^=1u<<v; a[v]^=1u<<u;
        after.push_back(next);
        if(next<=before)return false;
    }
    if(after.empty())return false;
    report(a,before,after);return true;
}

int main(int argc,char**argv) {
    std::mt19937_64 rng(20261121);
    const unsigned samples=argc>1?std::atoi(argv[1]):1000;
    const unsigned n=6, edges=n*(n-1)/2;
    std::vector<unsigned char> values(1u<<edges);
    for(unsigned mask=0;mask<(1u<<edges);mask++) {
        Graph a(n,0); unsigned e=0;
        for(unsigned u=0;u<n;u++)for(unsigned v=u+1;v<n;v++,e++)if(mask&(1u<<e)) {
            a[u]|=1u<<v;a[v]|=1u<<u;
        }
        values[mask]=gamma(a);
        bool triangle=false,ok=false;e=0;
        for(unsigned u=0;u<n;u++)for(unsigned v=u+1;v<n;v++,e++)if((a[u]&(1u<<v))&&(a[u]&a[v])) {
            triangle=true;
            if(values[mask^(1u<<e)]<=values[mask])ok=true;
        }
        if(triangle&&!ok){obstructs(a,values[mask]);return 0;}
    }
    std::cout<<"{\"phase\":\"all labeled graphs on six vertices\",\"graphs\":32768,\"lemma_counterexamples\":0}"<<std::endl;
    for(unsigned size=7;size<=12;size++) {
        for(unsigned sample=0;sample<samples;sample++) {
            Graph a(size,0);
            // Several fixed densities; this is random sampling, not optimization.
            const unsigned probability=20+10*(sample%7);
            for(unsigned u=0;u<size;u++)for(unsigned v=u+1;v<size;v++)if(rng()%100<probability) {
                a[u]|=1u<<v;a[v]|=1u<<u;
            }
            if(obstructs(a,gamma(a)))return 0;
        }
        std::cout<<"{\"phase\":\"random lemma diagnostic\",\"n\":"<<size
                 <<",\"graphs\":"<<samples<<",\"lemma_counterexamples\":0}"<<std::endl;
    }
}
