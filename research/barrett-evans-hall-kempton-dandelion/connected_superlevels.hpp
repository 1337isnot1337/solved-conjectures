// Sum Laplacian rows over the actual superlevel set, whose crossing drops are nonnegative.
bool superlevels_possible(const Graph& graph,const Coordinates& chart,int n,int xl,int xu,bool reverse,int cover) {
    int l[MAX],u[MAX];
    auto sums=chart.sum_bounds((1u<<n)-1,n);
    int mean=reverse ? M-(sums.second+n-1)/n : sums.first/n;
    for(int i=0;i<n;++i){
        l[i]=reverse?M-chart.u[i]:chart.l[i];u[i]=reverse?M-chart.l[i]:chart.u[i];
    }
    int trial[]={u[0],u[1],u[2],u[3],M/8,M/4,mean,M/2,3*M/4};
    for(int t:trial) {
        if(t==M)continue;
        unsigned below=0;
        for(int i=0;i<n;++i)if(u[i]<=t)below|=1u<<i;
        if(!below)continue;
        long long loss=0;
        for(int i=0;i<n;++i) {
            if(u[i]<=t)continue;
            unsigned known=graph[i]&below;
            int k=__builtin_popcount(known),offset=0;
            for(unsigned m=known;m;m&=m-1)offset+=u[__builtin_ctz(m)];
            if(cover && i!=0 && i!=1 && i!=2 && u[1]<=t && u[2]<=t && !(known&6u)) {
                ++k;offset+=std::max(u[1],u[2]);
            }
            int left=std::max(l[i],t),right=u[i];
            auto residual=[&](int c){return D*(k*c-offset)-(c>=mean?xu:xl)*(c-mean);};
            int low=std::min(residual(left),residual(right));
            loss+=l[i]>t?low:std::min(0,low);
        }
        if(loss>0)return false;
    }
    return true;
}
