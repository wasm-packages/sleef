// Taken from https://github.com/emscripten-core/emscripten/blob/main/system/include/compat/
/*
 * Copyright 2020 The Emscripten Authors.  All rights reserved.
 * Emscripten is available under two separate licenses, the MIT license and the
 * University of Illinois/NCSA Open Source License.  Both these licenses can be
 * found in the LICENSE file.
 */
#ifndef __emscripten_immintrin_h__
#define __emscripten_immintrin_h__

#ifdef __AVX__
#error "not implemented"
#endif

#ifdef __SSE4_2__
#error "not implemented"
#endif

#ifdef __SSE4_1__
#error "not implemented"
#endif

#ifdef __SSSE3__
#error "not implemented"
#endif

#ifdef __SSE3__
#error "not implemented"
#endif

#ifdef __SSE2__
#include "compat/emmintrin.h"
#endif

#ifdef __SSE__
#include "compat/xmmintrin.h"
#endif

#endif /* __emscripten_immintrin_h__ */
