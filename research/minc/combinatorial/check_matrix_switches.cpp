#define main ignored_main
#include "search_integrality.cpp"
#undef main
int main(){
 int n;std::cin>>n;if(n>24||n<2)return 2;
 std::vector<int>a(n*n);for(auto&x:a)std::cin>>x;
 U per=permanent(a,n),best=~0ull;int i0=-1,j0=-1,k0=-1,l0=-1,count=0,nonincreasing=0;
 for(int i=0;i<n;i++)for(int k=i+1;k<n;k++)for(int j=0;j<n;j++)for(int l=0;l<n;l++){
  if(j==l||!a[i*n+j]||!a[k*n+l])continue;
  int dc=2-a[i*n+j]-a[k*n+l]+a[i*n+l]+a[k*n+j];
  if(dc>=0)continue; count++;
  a[i*n+j]--;a[k*n+l]--;a[i*n+l]++;a[k*n+j]++;
  U p=permanent(a,n);
  a[i*n+j]++;a[k*n+l]++;a[i*n+l]--;a[k*n+j]--;
  if(p<=per)nonincreasing++;
  if(p<best){best=p;i0=i;j0=j;k0=k;l0=l;}
 }
 std::cout<<"n "<<n<<" permanent "<<per<<" collisions "<<collisions(a)<<" candidate switches "<<count<<" nonincreasing "<<nonincreasing<<" best "<<best<<" delta "<<static_cast<long long>(best-per)<<" switch "<<i0<<' '<<j0<<' '<<k0<<' '<<l0<<'\n';
}
