#include <list>

namespace clanguml_examples::list {
void emplace() {
    std::list<int> l;
    l.emplace(l.end(), 1);
}
}  // namespace clanguml_examples::list
