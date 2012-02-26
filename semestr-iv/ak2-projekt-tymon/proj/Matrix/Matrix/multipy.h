#ifndef __MULTIPLY_H__
#define __MULTIPLY_H__

#include "Matrix.h"
#include "utils.h"

Matrix * multiply_serial(Matrix * m1, Matrix * m2);
Matrix * multiply_thread_1(Matrix * m1, Matrix * m2);
Matrix * multiply_thread_2(Matrix * m1, Matrix * m2);

#endif
