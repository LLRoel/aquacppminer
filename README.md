# Aquacppminer
docker run -itd aquaminer "parameters"
[Aquachain](https://aquachain.github.io/) C++ optimized miner.

### Versions
* 1.0: initial release
* 1.1: Roels awesome docker distributed

### Build
* docker build . -t aquaminer 
* docker pull llroelj:aquaminer

### Config file
* First time you launch the miner it will ask for configuration and store it into config.cfg. 
* You can edit this file later if you want, delete config.cfg and relaunch the miner to restart configuration
* If using commandline parameters (see next section) miner will not create config file.
* Commandline parameters have priority over config file.

### Usage
    docker run -itd --rm aquaminer -F url [-t nThreads] [-n nodeUrl] [--solo] [-r refreshRate] [-h]
        -F url         : url of pool or node to mine on, if not specified, will pool mine to dev's aquabase
        -t nThreads    : number of threads to use (if not specified will use maximum logical threads available)
        -n node_url    : optional node url, to get more stats (pool mining only)
        -r rate        : pool refresh rate, ex: 3s, 2.5m, default is 3s
        --solo         : solo mining, -F needs to be the node url
        --proxy        : proxy to use, ex: --proxy socks5://127.0.0.1:9150
        --argon x,y,z  : use specific argon params (ex: 4,512,1), skip shares submit if incompatible with HF7
        --submit       : when used with --argon, forces submitting shares to pool/node
        -h             : display this help message and exit

### Examples

Pool Mining, auto thread count
    docker run -itd --rm aquaminer "-F http://pool.aquachain-foundation.org:8888/0x6e37abb108f4010530beb4bbfd9842127d8bfb3f"

Pool Mining, 8 threads, getting more block stats from local aqua node
    docker run -itd --rm aquaminer "-t 8 -F http://pool.aquachain-foundation.org:8888/0x6e37abb108f4010530beb4bbfd9842127d8bfb3f -n http://127.0.0.1:8543"

Solo Mining to local aqua node, auto thread count
    docker run -itd --rm aquaminer "--solo -F http://127.0.0.1:8543"
