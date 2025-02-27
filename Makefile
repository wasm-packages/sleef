CC=/opt/wasi-sdk/bin/clang
CFLAGS="-D_WASI_EMULATED_SIGNAL -mllvm -wasm-enable-sjlj -D__SSE2__ -DENABLE_SSE2 -I$(PWD) -D__SSE__"

install/lib/libsleef.so:
	cd ./src && \
		CFLAGS=$(CFLAGS) CC=$(CC) cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DSLEEF_BUILD_TESTS=OFF -DSLEEF_BUILD_SHARED_LIBS=ON \
		-DSLEEF_BUILD_SHARED_LIBS=ON -DCMAKE_SYSTEM_NAME=WASI -DSLEEF_BUILD_WITH_LIBM=OFF -DSLEEF_BUILD_BENCH=OFF \
		  -DSLEEF_DISABLE_SSE2=ON -DSLEEF_DISABLE_SSE4=ON -DSLEEF_DISABLE_AVX=ON -DSLEEF_DISABLE_FMA4=ON -DSLEEF_DISABLE_AVX2=ON \
		  -DSLEEF_DISABLE_AVX512F=ON -DSLEEF_DISABLE_SVE=ON -DSLEEF_DISABLE_VSX=ON -DSLEEF_DISABLE_VSX3=ON -DSLEEF_DISABLE_VXE=ON \
		  -DSLEEF_DISABLE_VXE2=ON -DSLEEF_DISABLE_RVVM1=ON -DSLEEF_DISABLE_RVVM2=ON -DSLEEF_DISABLE_OPENMP=ON \
		  -DCMAKE_CROSSCOMPILING=OFF -DSLEEF_DISABLE_FLOAT128=ON -DSLEEF_BUILD_QUAD=OFF -DSLEEF_BUILD_DFT=OFF -DSLEEF_BUILD_SCALAR_LIB=OFF \
		  -S . -B build/ && \
		  cmake --build build --clean-first && \
		  cmake --install build/ --prefix $(PWD)/install/

.PHONY: clean
clean:
	rm -rf ./src/build ./install ./src/CMakeCache.txt ./src/CMakeFiles/
