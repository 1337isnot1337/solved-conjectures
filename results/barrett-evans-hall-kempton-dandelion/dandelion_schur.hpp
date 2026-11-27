// Shared exact bounds for the algebraic connectivities and dandelion target.
#pragma once
#include <algorithm>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cstdint>
using Bits=unsigned;
constexpr int MAX=20, D=256;
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
using Big=__int128;
const Z Q=65536;
Big cubic(int n,Z q){
    return Big(q)*q*q-Big(n+2)*q*q*Q+Big(3*n-2)*q*Q*Q-Big(n)*Q*Q*Q;
}
Z endpoint(int n,Z a,Z b,bool high){
    if(cubic(n,a)>=0 || cubic(n,b)<=0) std::abort();
    while(b-a>1){
        Z c=(a+b)/2;
        if(cubic(n,c)<0) a=c; else b=c;
    }
    return high?b:a;
}
int dandelion_upper(int n){
    Z s=endpoint(n,0,Q,true)+n*Q-endpoint(n,(n-1)*Q,n*Q,false);
    return int(s*D/Q)+1;
}
bool prove(const L& a,const L& b){
    const int target=dandelion_upper(a.n);
    int lo=0,hi=2*D+1;
    while(hi-lo>1){
        int mid=(lo+hi)/2;
        if(a.fast(mid)) lo=mid; else hi=mid;
    }
    for(int x=lo;x>=std::max(1,lo-3);--x){
        if(!a.cert(x)) continue;
        const int y=std::max(1,target-x);
        if(b.cert(y)) return true;
    }
    return false;
}
