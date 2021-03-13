#include <iostream>
#include "base58.h"
#include "span.h"

int main() {
    std::vector<const unsigned char> vec{'a','b'};
    Span<const unsigned char> sp(vec);


    std::cout <<  EncodeBase58(sp) << std::endl;
    std::cout << "Hello, World!" << std::endl;
    return 0;
}
