// Cover the one exceptional common neighbor of the blue signed Fiedler extrema.
#include "dandelion_schur.hpp"
#include <array>
#include <vector>
using Graph = std::array<Bits, MAX>;

#include "connected_coordinates.hpp"
#include "connected_degrees.hpp"
#include "connected_superlevels.hpp"

void edge(Graph& graph, int i, int j) {
    graph[i] |= 1u << j;
    graph[j] |= 1u << i;
}

struct Search {
    int n, form;
    int anchors() const { return form == 0 ? 3 : 4; }
    Bits all() const { return (1u << n) - 1; }
    long long types = 0, nodes = 0, leaves = 0, original = 0, disconnected = 0, spectral = 0;
    std::vector<int> masks;

    bool visit(const Graph& red, Graph blue, bool bounds_only=false) {
        ++nodes;
        bool red_leaf = false, blue_leaf = false;
        Graph possible_red{};
        for(int v=0; v<n; ++v) {
            int rd = __builtin_popcount(red[v]), bd = __builtin_popcount(blue[v]);
            if (rd == n-1 || bd == n-1) { ++disconnected; return true; }
            red_leaf |= bd == n-2;
            blue_leaf |= rd == n-2;
            possible_red[v] = all() & ~(blue[v] | (1u<<v));
        }
        // The completion is required to be connected, so "at most one" forces a leaf.
        if (red_leaf && blue_leaf) { ++leaves; return true; }
        if (!connected(possible_red.data(), n)) { ++disconnected; return true; }
        // A dominating red edge in any completion makes these two sites distant in blue.
        // Every completion already has distant red endpoints (a,b).
        for(int v=0; v<n; ++v) {
            for(Bits next=red[v] & ~((1u<<(v+1))-1); next; next &= next-1) {
                int w = __builtin_ctz(next);
                if ((red[v]|red[w]) == all()) { ++original; return true; }
            }
        }
        // Force any sole possible common blue neighbor of a known red edge.
        // Each neighbor may have one or both of its two blue edges unassigned.
        for(int v=0;v<n;++v) {
            for(Bits next=red[v] & ~((1u<<(v+1))-1); next; next &= next-1) {
                int w=__builtin_ctz(next);
                Bits possible=all() & ~(red[v]|red[w]);
                if((possible & (possible-1))==0) {
                    int z=__builtin_ctz(possible);
                    edge(blue,v,z); edge(blue,w,z);
                }
            }
        }
        const int total=dandelion_upper(n), blue_lower=D+D/(n-1);
        int mx=0,mn=form==0?1:3, cx=form==0?0:1,cy=2;
        auto ruled_out = [&](int xl,int xu) {
            int yu=total-xl;
            Coordinates ra,bc;
            if(!ra.shrink(red,blue,n,mx,mn,xl,xu) || !bc.shrink(blue,red,n,cx,cy,blue_lower,yu))
                return true;
            if(!degrees_possible(red,blue,n,ra,bc,xu,yu))return true;
            if(!superlevels_possible(red,ra,n,xl,xu,false,form==1||form==2)||
               !superlevels_possible(red,ra,n,xl,xu,true,form==1||form==2)||
               !superlevels_possible(blue,bc,n,blue_lower,yu,false,0)||
               !superlevels_possible(blue,bc,n,blue_lower,yu,true,0))return true;
            long long re=0,be=0,unassigned=0,variance_red=0,variance_blue=0;
            for(int i=0;i<n;++i){
                int rd=std::max(M/2-ra.l[i],ra.u[i]-M/2);
                int bd=std::max(M/2-bc.l[i],bc.u[i]-M/2);
                variance_red+=rd*rd; variance_blue+=bd*bd;
                for(int j=i+1;j<n;++j){
                    int ar=ra.gap(i,j),ab=bc.gap(i,j);
                    if(red[i]>>j&1)re+=ar*ar;
                    else if(blue[i]>>j&1)be+=ab*ab;
                    else unassigned+=std::min(ar*ar,ab*ab);
                }
            }
            return D*re>xu*variance_red || D*be>yu*variance_blue ||
                   D*(re+be+unassigned)>total*std::max(variance_red,variance_blue);
        };
        int cap=total-blue_lower;
        bool impossible=ruled_out(0,cap);
        if(!impossible){
            impossible=true;
            for(int left=0; left<cap;left+=12){
                if(!ruled_out(left,std::min(cap,left+12))){impossible=false;break;}
            }
        }
        if(impossible){++spectral;return true;}
        L a,b; a.build(red.data(),n); b.build(blue.data(),n);
        const int threshold=dandelion_upper(n);
        // Outside the original domain blue has diameter at most two and lambda >= 1.
        if ((a.fast(threshold-blue_lower) && a.cert(threshold-blue_lower)) || (b.fast(threshold) && b.cert(threshold))
            || prove(a,b) || prove(b,a)) { ++spectral; return true; }

        if(bounds_only)return false;
        // The blue diameter is at most two. First realize a common blue neighbor
        // for a required pair whenever that provides a small branching family.
        int first=-1, second=-1;
        std::vector<int> candidates;
        for(int i=0;i<n;++i) for(int j=i+1;j<n;++j) {
            if(!((red[i]>>j)&1) || (blue[i]&blue[j]))continue;
            Bits possible=all()&~(red[i]|red[j]);
            std::vector<int> classes;
            for(unsigned m=possible;m;m&=m-1) {
                int v=__builtin_ctz(m);bool equivalent=false;
                for(int k:classes) {
                    Bits others=~((1u<<v)|(1u<<k));
                    if(v>=anchors() && k>=anchors() && !(((red[v]^red[k])|(blue[v]^blue[k]))&others)) {
                        equivalent=true;break;
                    }
                }
                if(!equivalent)classes.push_back(v);
            }
            if(first<0 || classes.size()<candidates.size()) {
                first=i;second=j;candidates=classes;
            }
        }
        if(first>=0 && candidates.size()<=4) {
            for(int v:candidates) {
                Graph fresh=blue;
                edge(fresh,first,v);edge(fresh,second,v);
                if(!visit(red,fresh))return false;
            }
            return true;
        }
        int pivot=-1,best=-1;
        std::vector<int> chosen;
        for(int i=anchors(); i<n; ++i) {
            Bits assigned=red[i]|blue[i]|(1u<<i);
            for(int j=anchors(); j<n; ++j) {
                if ((assigned>>j)&1) continue;
                std::vector<int> group;
                for(int k=anchors(); k<n; ++k) {
                    Bits others=~((1u<<k)|(1u<<j));
                    if (!((assigned>>k)&1) && !(((red[k]^red[j])|(blue[k]^blue[j]))&others)) group.push_back(k);
                }
                int diff=__builtin_popcount((red[i]^red[j]) & ((1u<<anchors())-1));
                int priority=static_cast<int>(group.size())*(1+diff);
                if(red[i]==0) priority+=1000;
                if(red[j]==0) priority+=100;
                if (priority>best) {best=priority; pivot=i; chosen=group;}
            }
        }
        if(pivot<0) {
            std::printf("Uncertified complete graph, red board:");
            for(int i=0;i<n;++i)std::printf(" %u",red[i]);
            std::puts("");
            return false;
        }
        for(std::size_t count=0; count<=chosen.size(); ++count) {
            Graph r=red,b=blue;
            for(std::size_t i=0;i<chosen.size();++i)edge(i<count?r:b,pivot,chosen[i]);
            if(!visit(r,b))return false;
        }
        return true;
    }

    void attach(Graph& r,Graph& b,int v,int mask) {
        for(int i=0;i<anchors();++i)edge((mask>>i)&1?r:b,v,i);
    }

    bool sorted_types(int v,unsigned start,const Graph& red,const Graph& blue) {
        if(v==n) {++types; return visit(red,blue);}
        Graph future_red=red, future_blue=blue;
        const int anchor_mask=(1<<anchors())-1;
        int always=anchor_mask,ever=0;
        for(unsigned j=start;j<masks.size();++j){always&=masks[j];ever|=masks[j];}
        for(int k=v;k<n;++k)for(int i=0;i<anchors();++i){
            if((always>>i)&1)edge(future_red,k,i);
            if(!((ever>>i)&1))edge(future_blue,k,i);
        }
        if (v>anchors() && n-v<=7 && visit(future_red,future_blue,true)) {
            long long options=1;
            // Number of multisets of n-v further types with indices at least start.
            for(int i=1;i<=n-v;++i) options=options*((int)masks.size()-start+i-1)/i;
            types+=options;
            return true;
        }
        for(unsigned j=start;j<masks.size();++j) {
            Graph r=red,b=blue;
            attach(r,b,v,masks[j]);
            if(!sorted_types(v+1,j,r,b))return false;
        }
        return true;
    }

    bool run() {
        Graph r{},b{};
        if(form==0) {
            // a=c=0, b=1, d=2. The unique common blue neighbor of c,d is b.
            edge(r,0,2); edge(b,0,1); edge(b,1,2);
            masks={1,4,5,6};
            return sorted_types(3,0,r,b);
        }
        // Now index the disjoint vertices a=0,c=1,d=2,b=3.
        masks={2,3,4,5,6,7,10,12,14};
        for(int i=0;i<4;++i)for(int j=i+1;j<4;++j) {
            bool is_red = i==1 && j==2;
            if(form<=2) {
                // a is the unique exception. b sees c (form 1), or c,d (form 2).
                is_red |= j==3 && (i==1 || (form==2 && i==2));
            } else {
                // The exception is a fifth site. The first four form a red P4.
                is_red = j==i+1;
            }
            edge(is_red?r:b,i,j);
        }
        if(form<=2) return sorted_types(4,0,r,b);
        // Under path reversal an exceptional fifth site sees neither endpoint or a.
        attach(r,b,4,form==3 ? 0 : 1);
        return sorted_types(5,0,r,b);
    }
};

int main(int argc,char**argv) {
    if(argc!=3)return 2;
    int n=std::atoi(argv[1]),form=std::atoi(argv[2]);
    if(n<11 || n>20 || form<0 || form>4)return 2;
    Search s{n,form};
    bool ok=s.run();
    std::printf("n=%d form=%d complete=%d types=%lld nodes=%lld leaves=%lld original=%lld disconnected=%lld spectral=%lld\n",
                n,form,ok,s.types,s.nodes,s.leaves,s.original,s.disconnected,s.spectral);
    return !ok;
}
