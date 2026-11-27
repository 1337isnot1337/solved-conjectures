#pragma once
// Endpoint intervals for an eigenvector with designated extremes, scaled to [0,M].
constexpr int M=4096;
struct Coordinates {
    int l[MAX],u[MAX];
    Bits positive=0,negative=0; int budget=0;
    std::pair<int,int> sum_bounds(Bits selected,int n) const {
        int lower=0,upper=0,spare=budget;
        int lost_positive_range=0,lost_negative_range=0;
        for(int i=0;i<n;++i){
            Bits bit=1u<<i;
            if(positive&bit)spare-=M-u[i];
            if(negative&bit)spare-=l[i];
            if(!(selected&bit))continue;
            lower+=l[i];upper+=u[i];
            if(positive&bit)lost_positive_range+=u[i]-l[i];
            if(negative&bit)lost_negative_range+=u[i]-l[i];
        }
        lower+=std::max(0,lost_positive_range-spare);
        upper-=std::max(0,lost_negative_range-spare);
        return {lower,upper};
    }
    bool shrink(const Graph& g,const Graph& h,int n,int mx,int mn,int low,int high) {
        for(int i=0;i<n;++i){ l[i]=0;u[i]=M; }
        l[mx]=M;u[mn]=0;
        positive=g[mx]&~g[mn];negative=g[mn]&~g[mx];
        budget=static_cast<int>(ceil_ratio(high*M,D)) - M*__builtin_popcount(g[mx]&g[mn]);
        for(int it=0;it<4;++it) {
            auto total_sum=sum_bounds((1u<<n)-1,n);
            if(total_sum.first>total_sum.second)return false;
            int ml=total_sum.first/n,mu=(total_sum.second+n-1)/n;
            // Sum of the extremal drops counts one full range per common neighbor.
            unsigned only_max=g[mx]&~g[mn], only_min=g[mn]&~g[mx];
            int used=M*__builtin_popcount(g[mx]&g[mn]);
            int max_spent=0,min_spent=0;
            for(unsigned m=only_max;m;m&=m-1) max_spent+=M-u[__builtin_ctz(m)];
            for(unsigned m=only_min;m;m&=m-1) min_spent+=l[__builtin_ctz(m)];
            int spare=static_cast<int>(ceil_ratio(high*M,D))-used-max_spent-min_spent;
            if(spare<0)return false;
            for(unsigned m=only_max;m;m&=m-1) {
                int j=__builtin_ctz(m);l[j]=std::max(l[j],u[j]-spare);
            }
            for(unsigned m=only_min;m;m&=m-1) {
                int j=__builtin_ctz(m);u[j]=std::min(u[j],l[j]+spare);
            }
            for(int i=0;i<n;++i) {
                int degree=__builtin_popcount(g[i]),unknown=n-1-degree-__builtin_popcount(h[i]);
                if(!degree) { if(!unknown)return false; continue; }
                int sum_lo=0,sum_hi=0;
                for(unsigned m=g[i];m;m&=m-1){int j=__builtin_ctz(m);sum_lo+=l[j];sum_hi+=u[j];}
                // row: d*f[i] = sum_neighbors f[j] + lambda*(f[i] - mean).
                int dl=l[i]-mu,du=u[i]-ml;
                int offset_lo=(int)floor_ratio((dl>=0?low:high)*dl,D);
                int offset_hi=(int)ceil_ratio((du>=0?high:low)*du,D);
                int miss_lo=0,miss_hi=0;
                if(unknown){
                    Bits undecided=((1u<<n)-1) & ~(g[i]|h[i]|(1u<<i));
                    for(unsigned m=undecided;m;m&=m-1){
                        int j=__builtin_ctz(m);
                        miss_lo+=std::min(0,l[i]-u[j]);
                        miss_hi+=std::max(0,u[i]-l[j]);
                    }
                }
                offset_lo-=miss_hi;
                offset_hi-=miss_lo;
                const auto sum = sum_bounds(g[i],n);
                l[i]=std::max(l[i],(int)floor_ratio(sum.first+offset_lo,degree));
                u[i]=std::min(u[i],(int)ceil_ratio(sum.second+offset_hi,degree));
                if(l[i]>u[i])return false;
                for(unsigned m=g[i];m;m&=m-1){
                    int j=__builtin_ctz(m);
                    int before_l=l[j], before_u=u[j];
                    l[j]=std::max(before_l,degree*l[i]-offset_hi-(sum_hi-before_u));
                    u[j]=std::min(before_u,degree*u[i]-offset_lo-(sum_lo-before_l));
                    if(l[j]>u[j])return false;
                }
            }
        }
        return true;
    }
    int gap(int i,int j) const {
        return std::max({0,l[i]-u[j],l[j]-u[i]});
    }
};
