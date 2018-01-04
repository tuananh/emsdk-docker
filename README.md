emsdk-docker
------------

> Docker container with emsdk installed.

## Example usage

We can use this Docker image to build C/C++ files without the need to setup
Emscripten on the host machine.

Put the below script in your `package.json` scripts

```sh
docker run -it --rm -u $(id -u):$(id -g) -v $PWD:/src -w /src tuananh/emsdk emcc -O3 src/xxhash.c -s WASM=1 -s SIDE_MODULE=1 -o src/xxhash.wasm
```

In this example, suppose our project has a `src` folder with a C file `xxhash.c` in it.
What we do here is that we will mount the `src` folder into the container's `/src` folder, compile
it the `.wasm` there in the container and output it back to the host's `src` folder.

```json
"scripts": {
    "build": "docker run -it --rm -u $(id -u):$(id -g) -v $PWD:/src -w /src tuananh/emsdk emcc -O3 src/xxhash.c -s WASM=1 -s SIDE_MODULE=1 -o src/xxhash.wasm",
    "test": "echo \"Error: no test specified\" && exit 1"
},
```

and `yarn build`. BAM!! your `.wasm` file is there in the `src` folder.