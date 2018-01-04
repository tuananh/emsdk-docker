emsdk-docker
------------

> Dockerfile with emsdk installed.

## Example usage

We can use this Docker image to build C/C++ files without the need to setup
Emscripten on the host machine.

Put the below script in your `package.json` scripts

```sh
docker run -it --rm -u $(id -u):$(id -g) -v $PWD:/src -w /src tuananh/emsdk emcc -O3 src/xxhash.c -s WASM=1 -s SIDE_MODULE=1 -o src/xxhash.wasm
```


```json
"scripts": {
    "build": "docker run -it --rm -u $(id -u):$(id -g) -v $PWD:/src -w /src tuananh/emsdk emcc -O3 src/xxhash.c -s WASM=1 -s SIDE_MODULE=1 -o src/xxhash.wasm",
    "test": "echo \"Error: no test specified\" && exit 1"
},
```

and `yarn build`. BAM!! your `.wasm` file is there in the `src` folder.