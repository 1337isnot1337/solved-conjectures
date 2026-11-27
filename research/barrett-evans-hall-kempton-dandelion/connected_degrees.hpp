bool degrees_possible(const Graph& red,const Graph& blue,int n,const Coordinates& a,const Coordinates& b,
                      int xu,int yu){
    const Coordinates* coord[]={&a,&b};
    int ml[2],mu[2]; long long var[2];
    for(int k=0;k<2;++k){
        int sl=0,su=0;
        for(int i=0;i<n;++i){sl+=coord[k]->l[i];su+=coord[k]->u[i];}
        auto sum=coord[k]->sum_bounds((1u<<n)-1,n); ml[k]=sum.first/n;mu[k]=(sum.second+n-1)/n;
        int middle=(ml[k]+mu[k])/2;
        long long v1=0,v2=0;
        for(int i=0;i<n;++i){
            int t=std::max(middle-coord[k]->l[i],coord[k]->u[i]-middle);
            int s=std::max(M/2-coord[k]->l[i],coord[k]->u[i]-M/2);
            v1+=t*t;v2+=s*s;
        }
        var[k]=std::min(v1,v2);
    }
    for(int i=0;i<n;++i){
        int mag[]={std::max({0,a.l[i]-mu[0],ml[0]-a.u[i]}),std::max({0,b.l[i]-mu[1],ml[1]-b.u[i]})};
        int upper[]={xu,yu};
        int high=n-1-std::max(1,__builtin_popcount(blue[i]));
        int low=std::max(1,__builtin_popcount(red[i]));
        auto fits=[&](int k,int d){
            if(!mag[k] || d*D<=upper[k])return true;
            long long miss=n-1-d,dd=d*D-upper[k],dd1=dd+D;
            long long den=static_cast<long long>(D)*D*d*miss;
            long long num=den+dd*dd*miss+dd1*dd1*d;
            return (__int128)num*mag[k]*mag[k]<=(__int128)den*var[k];
        };
        while(low<=high && !fits(0,high))--high;
        if(low>high || !fits(1,n-1-high))return false;
    }
    return true;
}
