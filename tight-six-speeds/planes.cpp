// A free repeat direction on a critical plane must have six distinct
// absolute coordinates proportional to 1,...,6. Check every such pair.
#include <algorithm>
#include <array>
#include <cstdlib>
#include <iostream>
#include <stdexcept>

using Vector = std::array<int,7>;

bool passes_repeat_test(const Vector& w, const Vector& z) {
    bool independent = false;
    for (int i=0; i<7; ++i) for (int j=0; j<i; ++j) {
        if (w[i]*z[j] != w[j]*z[i]) independent = true;
        for (int sign : {-1,1}) {
            const int a = w[i]-sign*w[j], b = z[i]-sign*z[j];
            if (a==0 && b==0) return false;
            Vector speeds;
            for (int k=0; k<7; ++k) speeds[k] = std::abs(a*z[k]-b*w[k]);
            const int smallest = *std::min_element(speeds.begin(),speeds.end());
            if (smallest==0) continue;
            int mask=0;
            for (int speed : speeds) {
                if (speed%smallest || speed/smallest>6) return false;
                mask |= 1<<(speed/smallest);
            }
            if (mask!=126) return false; // bits 1 through 6
        }
    }
    return independent;
}

bool is_product(const Vector& w, const Vector& z) {
    // If six forms are collinear with first coordinates 1,...,6, they are
    // multiples 1,...,6 of a common form. The independent seventh is free.
    for (int i=0; i<7; ++i) {
        int mask=0, count=0;
        for (int j=0; j<7; ++j)
            if (w[i]*z[j]==z[i]*w[j]) {
                mask |= 1<<w[j];
                ++count;
            }
        if (mask==126 && count==6) return true;
    }
    return false;
}

int main() {
    int tested=0, survivors=0;
    for (int a=1; a<=6; ++a) {
        Vector w{1,2,3,4,5,6,a};
        for (int b=1; b<=6; ++b) {
            Vector perm{1,2,3,4,5,6,b};
            std::sort(perm.begin(),perm.end());
            do {
                for (int mask=0; mask<64; ++mask) {
                    Vector z=perm;
                    for (int j=1; j<7; ++j)
                        if (mask & (1<<(j-1))) z[j]=-z[j];
                    ++tested;
                    if (passes_repeat_test(w,z)) {
                        ++survivors;
                        if (!is_product(w,z)) throw std::runtime_error("unexpected plane");
                    }
                }
            } while (std::next_permutation(perm.begin(),perm.end()));
        }
    }
    if (tested!=5806080 || survivors!=132) throw std::runtime_error("unexpected counts");
    std::cout << tested << " pairs, " << survivors << " surviving pairs, one plane orbit.\n";
}
