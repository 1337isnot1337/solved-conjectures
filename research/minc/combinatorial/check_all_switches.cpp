#define main ignored_main
#include "search_integrality.cpp"
#undef main

// Exact diagnostic: inspect every feasible unit 2-by-2 switch.
// Categories are collision-decreasing, collision-preserving, and increasing.
// This is not a test of every matrix and proves no Minc-list conjecture.
int main() {
  int n;
  if (!(std::cin >> n) || n < 2 || n > 20) return 2;
  std::vector<int> a(n*n);
  for (auto &x : a) if (!(std::cin >> x) || x < 0) return 2;
  U p0 = permanent(a,n);
  U best[3] = {~0ull, ~0ull, ~0ull};
  long long count[3] = {}, decreases[3] = {}, equal[3] = {};
  int arg[3][4] = {};
  for (int i=0;i<n;i++) for(int r=i+1;r<n;r++)
    for(int j=0;j<n;j++) for(int s=0;s<n;s++) {
      if (j==s || !a[i*n+j] || !a[r*n+s]) continue;
      int dc=2-a[i*n+j]-a[r*n+s]+a[i*n+s]+a[r*n+j];
      int c=dc<0?0:(dc==0?1:2);
      a[i*n+j]--; a[r*n+s]--; a[i*n+s]++; a[r*n+j]++;
      U p=permanent(a,n);
      a[i*n+j]++; a[r*n+s]++; a[i*n+s]--; a[r*n+j]--;
      count[c]++; decreases[c] += p<p0; equal[c] += p==p0;
      if(p<best[c]) {
        best[c]=p; arg[c][0]=i; arg[c][1]=j;
        arg[c][2]=r; arg[c][3]=s;
      }
    }
  std::cout<<"n "<<n<<" permanent "<<p0<<" collisions "<<collisions(a)<<'\n';
  for(int c=0;c<3;c++) {
    std::cout<<"category "<<c<<" count "<<count[c]<<" decreases "<<decreases[c]
      <<" equal "<<equal[c]<<" best "<<best[c]<<" switch";
    for(int z:arg[c]) std::cout<<' '<<z;
    std::cout<<'\n';
  }
}
