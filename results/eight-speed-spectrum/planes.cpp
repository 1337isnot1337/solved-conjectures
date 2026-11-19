// Enumerate ordered pairs of independent repeat lines in an eight-coordinate plane.
#include <algorithm>
#include <array>
#include <iostream>

using Row = std::array<int,8>;
using Shape = std::array<int,7>;
constexpr std::array<Shape,3> bases{{
    {1,2,3,4,5,6,7}, {1,2,3,4,5,7,12}, {1,4,5,6,7,11,13}
}};

constexpr int mask(Shape s) {
    int bits=0;
    for (int x:s) bits |= 1<<x;
    return bits;
}

bool known_shape(int bits) {
    return bits==mask(bases[0]) || bits==mask(bases[1]) || bits==mask(bases[2]);
}

bool admissible(const Row& w, const Row& z) {
    bool independent=false;
    for (int i=0; i<8; ++i) for (int j=0; j<i; ++j) {
        independent |= w[i]*z[j]!=w[j]*z[i];
        for (int sign:{-1,1}) {
            int a=w[i]-sign*w[j], b=z[i]-sign*z[j];
            if (!a && !b) return false;
            Row magnitudes;
            for (int k=0; k<8; ++k) magnitudes[k]=std::abs(a*z[k]-b*w[k]);
            int least=*std::min_element(magnitudes.begin(),magnitudes.end());
            if (!least) continue;
            int bits=0;
            for (int x:magnitudes) {
                if (x>13*least || x%least) return false;
                bits |= 1<<(x/least);
            }
            if (!known_shape(bits)) return false;
        }
    }
    return independent;
}

bool product_plane(const Row& w, const Row& z) {
    for (int i=0; i<8; ++i) {
        int bits=0, count=0;
        for (int j=0; j<8; ++j) if (w[i]*z[j]==w[j]*z[i]) {
            bits |= 1<<w[j];
            ++count;
        }
        if (count==7 && known_shape(bits)) return true;
    }
    return false;
}

int main() {
    long long tested=0, survivors=0;
    for (auto first:bases) for (int repeat:first) {
        Row w;
        std::copy(first.begin(),first.end(),w.begin());
        w.back()=repeat;
        for (auto second:bases) for (int other_repeat:second) {
            Row p;
            std::copy(second.begin(),second.end(),p.begin());
            p.back()=other_repeat;
            std::sort(p.begin(),p.end());
            do {
                for (int signs=0; signs<128; ++signs) {
                    Row z=p;
                    for (int j=1; j<8; ++j) if (signs&(1<<(j-1))) z[j]=-z[j];
                    ++tested;
                    if (admissible(w,z)) {
                        ++survivors;
                        if (!product_plane(w,z)) return 1;
                    }
                }
            } while (std::next_permutation(p.begin(),p.end()));
        }
    }
    std::cout<<tested<<" candidate pairs, "<<survivors<<" admissible pairs.\n";
    return tested==1137991680 && survivors==546 ? 0 : 1;
}
