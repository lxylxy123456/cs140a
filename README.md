# cs140a
Build a docker image that simulates the required environment for ECS140A.

## Dependencies
The following existing docker images are used
* [golang:1.11.4](https://hub.docker.com/_/golang?tab=tags&page=1&name=1.11.4)
* [nacyot/commonlisp-clisp:apt](https://hub.docker.com/r/nacyot/commonlisp-clisp/tags)
* [swipl:7.6.4](https://hub.docker.com/_/swipl?tab=tags&page=1&name=7.6.4)

## Versions
* `go version go1.11.4`
* `GNU CLISP 2.49 (2010-07-07)`
* `SWI-Prolog version 7.6.4`

## How it works
The Dockerfile just copies all files needed from the images above.

It also installs things like `tmux` and `vi` for convenience.

## Disclaimer
There are known bugs to this repository and may not be fixed forever. 

This project does not provide any warranties.

