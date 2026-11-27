// Check x+y-2 max(x,y)/n > 1 on each connected graph with connected complement.
// Input: graph6 representatives from nauty geng -cq n (orders 5 through 10).
// Every accepted inequality has a dyadic lower-bound witness, checked by
// exact integer interval Schur elimination (not by an eigensolver).
#include <algorithm>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cstdint>
using Bits=unsigned;
constexpr int MAX=10, D=256;
using Z=std::int64_t;
constexpr Z SCALE=8192,LIMIT=Z{1}<<30;
struct I { Z l,u; };
Z floor_ratio(Z x,Z y) { return x/y-(x%y<0); }
Z ceil_ratio(Z x,Z y) { return x/y+(x%y>0); }
// Each endpoint is a numerator in units of 1/SCALE. Products and
// quotients use unscaled numerators throughout, then round outward.
I product_quotient(I a,I b,I p) {
    const Z x=a.l*b.l,y=a.l*b.u,z=a.u*b.l,w=a.u*b.u;
    const Z low=std::min({x,y,z,w}), high=std::max({x,y,z,w});
    return {floor_ratio(low,low>=0?p.u:p.l),ceil_ratio(high,high>=0?p.l:p.u)};
}
bool connected(const Bits *g, int n) {
    Bits todo=1,seen=1;
    while(todo) {
        int v=__builtin_ctz(todo); todo &= todo-1;
        Bits add=g[v]&~seen; seen|=add; todo|=add;
    }
    return seen==(1u<<n)-1;
}
struct L {
    int n,deg[MAX]; Bits m[MAX];
    void build(const Bits* g,int order) {
        n=order;
        for(int i=0;i<n;i++) {m[i]=g[i];deg[i]=__builtin_popcount(g[i]);}
    };
    int entry(int i,int j,int t) const {
        return (i==j ? D*n*deg[i]-(n-1)*t :
            t-(((m[i]>>j)&1u) ? D*n:0));
    }
    bool fast(int t) const {
        double a[MAX][MAX];
        for(int i=0;i<n-1;i++) for(int j=i;j<n-1;j++) a[i][j]=entry(i,j,t);
        for(int k=0;k<n-1;k++){
            double p=a[k][k]; if(p<=0) return false;
            if(k==n-2) break;
            double pinv=1/p;
            for(int i=k+1;i<n-1;i++){
                double u=a[k][i]*pinv;
                for(int j=i;j<n-1;j++) a[i][j]-=u*a[k][j];
            }
        } return true;
    }
    bool cert(int t) const {
        I a[MAX][MAX];
        for(int i=0;i<n-1;i++) for(int j=i;j<n-1;j++){
            Z z=entry(i,j,t)*SCALE; a[i][j]={z,z};
        }
        for(int k=0;k<n-1;k++){
            I p=a[k][k]; if(!(p.l>0)) return false;
            if(k==n-2) break;
            for(int i=k+1;i<n-1;i++){
                for(int j=i;j<n-1;j++) {
                    const I r=product_quotient(a[k][i],a[k][j],p);
                    a[i][j].l-=r.u; a[i][j].u-=r.l;
                    // The limit is only an overflow guard; it cannot accept
                    // a non-positive pivot, and it keeps all products safe.
                    if(a[i][j].l < -LIMIT || a[i][j].u > LIMIT) return false;
                }
            }
        } return true;
    }
};
bool prove(const L& a,const L& b){
    const int n=a.n;
    // Binary search is only a witness finder: cert rechecks both values.
    int lo=0,hi=D+1;
    while(hi-lo>1){
        int mid=(lo+hi)/2;
        if(a.fast(mid)) lo=mid; else hi=mid;
    }
    for(int x=lo;x>=std::max(1,lo-3);--x){
        if(!a.cert(x)) continue;
        const int y=(2*(n-1)*x<=n*D) ? (n*(D-x))/(n-2)+1 :
                                               (n*D-(n-2)*x)/n+1;
        if(n*(x+y)-2*std::max(x,y)<=n*D) std::abort();
        if(b.cert(y)) return true;
    }
    return false;
}
int main(int argc,char** argv){
    int n=argc==2 ? std::atoi(argv[1]):0; if(n<5 || n>10) return 2;
    unsigned long long count=0,both=0,failed=0;
    char s[128];
    while(std::fgets(s,sizeof s,stdin)){
        if((int)std::strlen(s)!=2+(n*(n-1)/2+5)/6 || s[0]!=63+n) return 2;
        Bits g[MAX]={}, h[MAX]={};
        for(int j=1,k=0;j<n;j++) for(int i=0;i<j;i++,k++)
            if((s[1+k/6]-63)>>(5-k%6)&1) {g[i]|=1u<<j;g[j]|=1u<<i;}
        ++count;
        if(!connected(g,n)) return 2;
        for(int i=0;i<n;i++) h[i]=((1u<<n)-1)^(g[i]|1u<<i);
        if(!connected(h,n)) continue;
        ++both;
        L a,b; a.build(g,n); b.build(h,n);
        if(!prove(a,b) && !prove(b,a)){
            std::printf("uncertified %s",s); ++failed;
        }
    }
    std::printf("n=%d connected=%llu both=%llu uncertified=%llu\n",n,count,both,failed);
    constexpr unsigned long long expected_connected[]={21,112,853,11117,261080,11716571};
    constexpr unsigned long long expected_both[]={8,68,662,9888,247492,11427974};
    return failed || count!=expected_connected[n-5] || both!=expected_both[n-5] ? 1:0;
}
