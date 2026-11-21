// Read the shifted Hankel determinants of a prefix modulo 2^61-1.
// A nonzero residue certifies a nonzero integer determinant.
#include <algorithm>
#include <array>
#include <cstdint>
#include <iostream>
#include <string>
#include <vector>

using Field = std::uint64_t;
constexpr Field prime = (Field{1} << 61) - 1;

Field multiply(Field a, Field b) {
    __uint128_t x = static_cast<__uint128_t>(a) * b;
    Field folded = (static_cast<Field>(x) & prime) + static_cast<Field>(x >> 61);
    return folded < prime ? folded : folded - prime;
}

Field invert(Field a) {
    Field result = 1;
    for (Field exponent = prime - 2; exponent; exponent >>= 1) {
        if (exponent & 1) result = multiply(result, a);
        a = multiply(a, a);
    }
    return result;
}

int main(int argc, char** argv) {
    if (argc < 3 || argc > 4) {
        std::cerr << "usage: condensation iterations max_order [initial_word]\n";
        return 2;
    }
    int steps = std::stoi(argv[1]);
    int max_order = std::stoi(argv[2]);
    std::string word = argc == 4 ? argv[3] : "1";
    if (steps < 0 || steps > 22 || max_order < 1 ||
        word.empty() || word.find_first_not_of("1234") != std::string::npos) return 2;
    const std::array<std::string, 4> rule = {"12", "23", "14", "32"};
    for (int step = 0; step < steps; ++step) {
        std::string next;
        next.reserve(2 * word.size());
        for (char c : word) next += rule[c - '1'];
        word.swap(next);
    }
    size_t width = word.size();
    max_order = std::min<size_t>(max_order, (width+1)/2);
    std::vector<Field> older(width+2, 1), previous(width), current(width), prefix(width+1);
    for (size_t k = 0; k < width; ++k) previous[k] = word[k] - '0';
    Field checks = width;
    for (int order = 2; order <= max_order; ++order) {
        width -= 2;
        // Every central pivot is nonzero since a zero would already have stopped the run.
        prefix[0] = 1;
        for (size_t k = 0; k < width; ++k) prefix[k+1] = multiply(prefix[k], older[k+2]);
        Field reciprocal = invert(prefix[width]);
        for (size_t k = width; k-- > 0;) {
            Field numerator = multiply(previous[k], previous[k+2]) +
                              prime - multiply(previous[k+1], previous[k+1]);
            if (numerator >= prime) numerator -= prime;
            current[k] = multiply(numerator, multiply(reciprocal, prefix[k]));
            reciprocal = multiply(reciprocal, older[k+2]);
            if (!current[k]) {
                std::cout << "zero residue: order " << order << ", offset " << k << '\n';
                return 1;
            }
        }
        checks += width;
        previous.swap(older);
        current.swap(previous);
    }
    std::cout << "length " << word.size() << ", order through " << max_order
              << ", nonzero residues " << checks << '\n';
}
