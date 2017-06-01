#include "priority_queue.hpp"
#include <cfloat>

static ap_uint<4> log_rom[CAPACITY] = {0, 0, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11};

int log_base_2(int index){
#pragma HLS INLINE
	/*if(index <= 1)
		return 0;
	else if(index <= 3)
		return 1;
	else if(index <= 7)
		return 2;
	else if(index <= 15)
		return 3;
	else if(index <= 31)
		return 4;
	else if(index <= 63)
		return 5;
	else if(index <= 127)
		return 6;
	else if(index <= 255)
		return 7;
	else if(index <= 511)
		return 8;
	else if(index <= 1023)
		return 9;
	else if(index <= 2047)
		return 10;
	else
		return 11;*/
	return log_rom[index];
}

int pow2(int level){
#pragma HLS INLINE
	return 1 << level;
}

int find_path(int counter, int& hole_counter, int hole_reg[CAPACITY], int level){
#pragma HLS INLINE
	if(hole_counter > 0){
		int temp = hole_reg[hole_counter];
		hole_counter--;
		int leaf_node = pow2(level);
		return temp - leaf_node;
	}
	else {
		int leaf_node = pow2(level);
		return counter - leaf_node;
	}
}

unsigned calculate_index (int insert_path, int level, int idx){
#pragma HLS INLINE
	unsigned temp = (insert_path >> level) & 1;
	if(temp == 0)
		return 2*idx;
	else
		return (2*idx)+1;
}

order left_child(unsigned level, unsigned index, order queue[LEVELS][CAPACITY/2]){
#pragma HLS INLINE
	return queue[level+1][index*2];
}

order right_child(unsigned level, unsigned index, order queue[LEVELS][CAPACITY/2]){
#pragma HLS INLINE
	return queue[level+1][(index*2) + 1];
}

void add_bid(order heap[LEVELS][CAPACITY/2],
		     order &new_order,
			 unsigned& heap_counter,
			 int& hole_counter,
			 int hole_reg[CAPACITY],
			 stream<order> &top_bid,
             stream<order> &top_ask,
             stream<Time> &outgoing_time,
             stream<metadata> &outgoing_meta,
             ap_uint<32> &top_bid_id,
             ap_uint<32> &top_ask_id,
             Time t, metadata m, order ask, bool w)
{
#pragma HLS INLINE
	heap_counter++;
	int insert_level = log_base_2(heap_counter);
	int insert_path = find_path(heap_counter, hole_counter, hole_reg, insert_level);
	unsigned idx = 1;
	unsigned level = 0;
	unsigned new_idx = 0;
	if(w == true){
	    top_ask.write(ask);
	    top_ask_id = ask.orderID;
	    outgoing_time.write(t);
	    outgoing_meta.write(m);
	    if(new_order.price > heap[0][0].price){
	        top_bid.write(new_order);
	        top_bid_id = new_order.orderID;
	    }
	    else{
	        top_bid.write(heap[0][0]);
	        top_bid_id = heap[0][0].orderID;
	    }
	}
	BID_PUSH_LOOP:
	for(int i = insert_level; i > 0; i--){
#pragma HLS DEPENDENCE variable=heap inter false
#pragma HLS LOOP_TRIPCOUNT max=11
#pragma HLS PIPELINE II=1
		if(new_order.price > heap[level][new_idx].price){
			order temp = heap[level][new_idx];
			heap[level][new_idx] = new_order;
			new_order = temp;
		}
		new_idx = calculate_index(insert_path, i-1, new_idx);
		level++;
	}
	heap[level][new_idx] = new_order;
	//If the heap is full after adding this entry, neglect the entry with least priority
	/*if(heap_counter == CAPACITY-1)
		heap_counter--;*/
}


void remove_bid(order heap[LEVELS][CAPACITY/2],
		 	 	ap_uint<8>& req_size,
				unsigned& heap_counter,
				int& hole_counter,
				int hole_reg[CAPACITY],
				order dummy_order)
{
#pragma HLS INLINE
	//If the incoming remove order is of size less than the top, modify the size and don't pop
	if (req_size < heap[0][0].size){
		heap[0][0].size -= req_size;
		req_size = 0;
	}
	//Else, the top is removed and the book is re-heapified
	else{
		req_size -= heap[0][0].size;
		heap_counter--;
		unsigned level = 0;
		unsigned new_idx = 0;
		unsigned offset = 0;
		order left = left_child(level, new_idx, heap);
		order right = right_child(level, new_idx, heap);

		POP_LOOP:
		while(level < LEVELS-1){
#pragma HLS DEPENDENCE variable=heap inter false
#pragma HLS LOOP_TRIPCOUNT max=11
#pragma HLS PIPELINE II=1
			if(left.price >= right.price){
				offset = 0;
				heap[level][new_idx] = left;
			}
			else{
				offset = 1;
				heap[level][new_idx] = right;
			}
			left = left_child(level+1, (new_idx<<1)+offset, heap);
			right = right_child(level+1, (new_idx<<1)+offset, heap);
			level++;
			new_idx = (new_idx<<1)+offset;
		}
		heap[level][new_idx] = dummy_order;
		hole_counter++;
		hole_reg[hole_counter] = (level*CAPACITY/2) + new_idx + 1;
	}

}

void add_ask(order heap[LEVELS][CAPACITY/2],
		     order &new_order,
			 unsigned& heap_counter,
			 int& hole_counter,
			 int hole_reg[CAPACITY],
             stream<order> &top_bid,
             stream<order> &top_ask,
             stream<Time> &outgoing_time,
             stream<metadata> &outgoing_meta,
             ap_uint<32> &top_bid_id,
             ap_uint<32> &top_ask_id,
             Time t, metadata m, order bid, bool w)
{
#pragma HLS INLINE
	heap_counter++;
	int insert_level = log_base_2(heap_counter);
	int insert_path = find_path(heap_counter, hole_counter, hole_reg, insert_level);
	unsigned idx = 1;
	unsigned level = 0;
	unsigned new_idx = 0;
	if(w == true){
	    top_bid.write(bid);
	    top_bid_id = bid.orderID;
	    outgoing_time.write(t);
	    outgoing_meta.write(m);
	    if(new_order.price < heap[0][0].price || heap[0][0].orderID == 0){
	        top_ask.write(new_order);
	        top_ask_id = new_order.orderID;
	    }
	    else{
	        top_ask.write(heap[0][0]);
	        top_ask_id = heap[0][0].orderID;
	    }
	}
	ASK_PUSH_LOOP:
	for(int i = insert_level; i > 0; i--){
#pragma HLS DEPENDENCE variable=heap inter false
#pragma HLS LOOP_TRIPCOUNT max=11
#pragma HLS PIPELINE II=1
		if(new_order.price < heap[level][new_idx].price /*|| heap_counter == 0*/){
			order temp = heap[level][new_idx];
			heap[level][new_idx] = new_order;
			new_order = temp;
		}
		new_idx = calculate_index(insert_path, i-1, new_idx);
		level++;
	}
	heap[level][new_idx] = new_order;
	//If the heap is full after adding this entry, neglect the entry with least priority
	/*if(heap_counter == CAPACITY-1)
		heap_counter--;*/
}

void remove_ask(order heap[LEVELS][CAPACITY/2],
		 	 	ap_uint<8>& req_size,
				unsigned& heap_counter,
				int& hole_counter,
				int hole_reg[CAPACITY],
				order dummy_order)
{
#pragma HLS INLINE
	//If the incoming remove order is of size less than the top, modify the size and don't pop
	if (req_size < heap[0][0].size){
		heap[0][0].size -= req_size;
		req_size = 0;
	}
	//Else, the top is removed and the book is re-heapified
	else{
		req_size -= heap[0][0].size;
		heap_counter--;
		unsigned level = 0;
		unsigned new_idx = 0;
		unsigned offset = 0;
		order left = left_child(level, new_idx, heap);
		order right = right_child(level, new_idx, heap);
		ASK_POP_LOOP:
		while(level < LEVELS-1){
#pragma HLS DEPENDENCE variable=heap inter false
#pragma HLS LOOP_TRIPCOUNT max=11
#pragma HLS PIPELINE II=1
			if((left.price <= right.price && right.price != 0) || (left.price != 0 && right.price == 0)){
				offset = 0;
				heap[level][new_idx] = left;
			}
			else{
				offset = 1;
				heap[level][new_idx] = right;
			}
			left = left_child(level+1, (new_idx<<1)+offset, heap);
			right = right_child(level+1, (new_idx<<1)+offset, heap);
			level++;
			new_idx = (new_idx<<1)+offset;
		}
		heap[level][new_idx] = dummy_order;
		hole_counter++;
		hole_reg[hole_counter] = (level*CAPACITY/2) + new_idx + 1;
	}

}

void order_book(stream<order> &order_stream,
				stream<Time> &incoming_time,
				stream<metadata> &incoming_meta,
				stream<order> &top_bid,
				stream<order> &top_ask,
				stream<Time> &outgoing_time,
				stream<metadata> &outgoing_meta,
				ap_uint<32> &top_bid_id,
				ap_uint<32> &top_ask_id)
{
#pragma HLS INTERFACE s_axilite port=top_ask_id
#pragma HLS INTERFACE s_axilite port=top_bid_id
#pragma HLS INTERFACE axis register port=order_stream
#pragma HLS INTERFACE axis register port=incoming_time
#pragma HLS INTERFACE axis register port=incoming_meta
#pragma HLS INTERFACE axis register port=top_bid
#pragma HLS INTERFACE axis register port=top_ask
#pragma HLS INTERFACE axis register port=outgoing_time
#pragma HLS INTERFACE axis register port=outgoing_meta

/*#pragma HLS RESOURCE core=AXI4Stream variable=order_stream
#pragma HLS RESOURCE core=AXI4Stream variable=incoming_time
#pragma HLS RESOURCE core=AXI4Stream variable=incoming_meta
#pragma HLS RESOURCE core=AXI4Stream variable=top_bid
#pragma HLS RESOURCE core=AXI4Stream variable=top_ask
#pragma HLS RESOURCE core=AXI4Stream variable=outgoing_time
#pragma HLS RESOURCE core=AXI4Stream variable=outgoing_meta*/

#pragma HLS INTERFACE ap_ctrl_none port=return

#pragma HLS DATA_PACK variable=order_stream struct_level
#pragma HLS DATA_PACK variable=top_bid struct_level
#pragma HLS DATA_PACK variable=top_ask struct_level
#pragma HLS DATA_PACK variable=incoming_meta
#pragma HLS DATA_PACK variable=outgoing_meta

	static order dummy_bid; dummy_bid.price = 0; dummy_bid.orderID = 0; dummy_bid.direction = 1; dummy_bid.size = 0;
	static order dummy_ask; dummy_ask.price = 255; dummy_ask.orderID = 0; dummy_ask.direction = 0; dummy_ask.size = 0;

	static order bid [LEVELS][CAPACITY/2];
#pragma HLS DATA_PACK variable=bid struct_level
#pragma HLS ARRAY_PARTITION variable=bid cyclic factor=4 dim=2
#pragma HLS ARRAY_PARTITION variable=bid complete dim=1
	static unsigned counter_bid = 0;
	static unsigned level_bid = 0;
	static int hole_counter_bid = 0;
	static int hole_reg_bid [CAPACITY];

	static order ask [LEVELS][CAPACITY/2];
#pragma HLS DATA_PACK variable=ask struct_level
#pragma HLS ARRAY_PARTITION variable=ask cyclic factor=4 dim=2
#pragma HLS ARRAY_PARTITION variable=ask complete dim=1
	static unsigned counter_ask = 0;
	static unsigned level_ask = 0;
	static int hole_counter_ask = 0;
	static int hole_reg_ask [CAPACITY];

	static order bid_remove [LEVELS][CAPACITY/2];
#pragma HLS DATA_PACK variable=bid_remove struct_level
#pragma HLS ARRAY_PARTITION variable=bid_remove cyclic factor=4 dim=2
#pragma HLS ARRAY_PARTITION variable=bid_remove complete dim=1
	static unsigned counter_bid_remove = 0;
	static unsigned level_bid_remove = 0;
	static int hole_counter_bid_remove = 0;
	static int hole_reg_bid_remove [CAPACITY];

	static order ask_remove [LEVELS][CAPACITY/2];
#pragma HLS DATA_PACK variable=ask_remove struct_level
#pragma HLS ARRAY_PARTITION variable=ask_remove cyclic factor=4 dim=2
#pragma HLS ARRAY_PARTITION variable=ask_remove complete dim=1
	static unsigned counter_ask_remove = 0;
	static unsigned level_ask_remove = 0;
	static int hole_counter_ask_remove = 0;
	static int hole_reg_ask_remove [CAPACITY];

	int insert_path;

	if(!order_stream.empty() && !incoming_time.empty() && !incoming_meta.empty() &&
		!top_bid.full() && !top_ask.full() && !outgoing_time.full() && !outgoing_meta.full()){
	order input = order_stream.read();
	Time time_buffer = incoming_time.read();
	metadata meta_buffer = incoming_meta.read();

	//INCOMING LIMITED BID
	if(input.direction == 3){
		//Add the incoming input to the bid order book
		add_bid(bid, input, counter_bid, hole_counter_bid, hole_reg_bid, top_bid,
	             top_ask, outgoing_time, outgoing_meta, top_bid_id, top_ask_id,
	             time_buffer, meta_buffer, ask[0][0], true);
		//If the book becomes full, discard the last entry
		if (counter_bid == CAPACITY-1)
			counter_bid--;
	}

	//INCOMING REMOVE BID
	else if (input.direction == 5){
		ap_uint<8> req_size = input.size;
		//If the incoming order ID is zero, keep removing entries until order size is fulfilled.
		//After that, make sure the top entry is not arbitrary deleted.
		if(input.orderID == 0){
			OPEN_BID_REMOVE:
			while (req_size > 0){
#pragma HLS LOOP_TRIPCOUNT min=1 max=1
				remove_bid(bid, req_size, counter_bid, hole_counter_bid, hole_reg_bid, dummy_bid);
				ARBITRARY_BID_REMOVE:
				while(bid[0][0].orderID == bid_remove[0][0].orderID){
#pragma HLS LOOP_TRIPCOUNT min=0 max=1
					ap_uint<8> temp = bid[0][0].size;
					remove_bid(bid, temp, counter_bid, hole_counter_bid, hole_reg_bid, dummy_bid);
					remove_bid(bid_remove, temp, counter_bid_remove, hole_counter_bid_remove, hole_reg_bid_remove, dummy_bid);
				}
			}
		}
		//If the incoming order ID is the top entry, remove it.
		else if(input.orderID == bid[0][0].orderID){
			req_size = bid[0][0].size;
			remove_bid(bid, req_size, counter_bid, hole_counter_bid, hole_reg_bid, dummy_bid);
		}
		//Otherwise, add the incoming order to the remove heap
		else{
			add_bid(bid_remove, input, counter_bid_remove, hole_counter_bid_remove, hole_reg_bid_remove, top_bid,
	                 top_ask, outgoing_time, outgoing_meta, top_bid_id, top_ask_id,
	                 time_buffer, meta_buffer, ask[0][0], false);
		}
	}

	//INCOMING LIMITED ASK
	else if(input.direction == 2){
		//Add the incoming input to the ask order book
		add_ask(ask, input, counter_ask, hole_counter_ask, hole_reg_ask, top_bid,
                top_ask, outgoing_time, outgoing_meta, top_bid_id, top_ask_id,
                time_buffer, meta_buffer, bid[0][0], true);
		//If the book becomes full, discard the last entry
		if (counter_ask == CAPACITY-1)
			counter_ask--;
	}

	//INCOMING REMOVE ASK
	else if (input.direction == 4){
		ap_uint<8> req_size = input.size;
		//If the incoming order ID is zero, keep removing entries until order size is fulfilled.
		//After that, make sure the top entry is not arbitrary deleted.
		if(input.orderID == 0){
			OPEN_ASK_REMOVE:
			while (req_size > 0){
#pragma HLS LOOP_TRIPCOUNT min=1 max=1
				remove_ask(ask, req_size, counter_ask, hole_counter_ask, hole_reg_ask, dummy_ask);
				ARBITRARY_ASK_REMOVE:
				while(ask[0][0].orderID == ask_remove[0][0].orderID){
#pragma HLS LOOP_TRIPCOUNT min=0 max=1
					ap_uint<8> temp = ask[0][0].size;
					remove_ask(ask, temp, counter_ask, hole_counter_ask, hole_reg_ask, dummy_ask);
					remove_ask(ask_remove, temp, counter_ask_remove, hole_counter_ask_remove, hole_reg_ask_remove, dummy_ask);
				}
			}
		}
		//If the incoming order ID is the top entry, remove it.
		else if(input.orderID == ask[0][0].orderID){
			req_size = ask[0][0].size;
			remove_ask(ask, req_size, counter_ask, hole_counter_ask, hole_reg_ask, dummy_ask);
		}
		//Otherwise, add the incoming order to the remove heap
		else{
			add_ask(ask_remove, input, counter_ask_remove, hole_counter_ask_remove, hole_reg_ask_remove, top_bid,
	                 top_ask, outgoing_time, outgoing_meta, top_bid_id, top_ask_id,
	                 time_buffer, meta_buffer, ask[0][0], false);
		}
	}
	if(input.direction != 2 && input.direction != 3){
        top_bid.write(bid[0][0]);
        top_bid_id = bid[0][0].orderID;
        top_ask.write(ask[0][0]);
        top_ask_id = ask[0][0].orderID;
        outgoing_meta.write(meta_buffer);
        outgoing_time.write(time_buffer);
	}
	}
}
