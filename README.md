
# WRK-Docker [![Build Status](https://api.travis-ci.org/msterhuj/WRK-Docker.svg?branch=master)](https://github.com/msterhuj/WRK-Docker)

## Configuration

- Alpine
- libc-dev perl linux-headers
- wrk

## Build yourself
    
    $ git clone https://github.com/msterhuj/WRK-Docker.git
    $ cd WRK-Docker
    $ docker build -r <yourName>/<dockerName>:<> .
    
## Usage

	$ docker run msterhuj/wrk:1.0 <options>
	
## Command Line Options

    -c, --connections: total number of HTTP connections to keep open with
                       each thread handling N = connections/threads

    -d, --duration:    duration of the test, e.g. 2s, 2m, 2h

    -t, --threads:     total number of threads to use

    -s, --script:      LuaJIT script, see SCRIPTING

    -H, --header:      HTTP header to add to request, e.g. "User-Agent: wrk"

        --latency:     print detailed latency statistics

        --timeout:     record a timeout if a response is not received within
                       this amount of time.
    
## Example Usage

	$ docker run msterhuj/wrk:1.0 -t12 -c400 -d30s http://127.0.0.1:8080/index.html
   
This runs a benchmark for 30 seconds, using 12 threads, and keeping
400 HTTP connections open.

  Output:

    Running 30s test @ http://127.0.0.1:8080/index.html
      12 threads and 400 connections
      Thread Stats   Avg      Stdev     Max   +/- Stdev
        Latency   635.91us    0.89ms  12.92ms   93.69%
        Req/Sec    56.20k     8.07k   62.00k    86.54%
      22464657 requests in 30.00s, 17.76GB read
    Requests/sec: 748868.53
    Transfer/sec:    606.33MB
 

## Credit

[WRK source](https://github.com/wg/wrk)