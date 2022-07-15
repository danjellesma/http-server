[![](https://images.microbadger.com/badges/image/danjellz/http-server.svg)](http://microbadger.com/#/images/danjellz/http-server "Get your own image badge on microbadger.com") [![GitHub issues](https://img.shields.io/github/issues/danjellesma/http-server.svg)](https://github.com/danjellesma/http-server/issues) [![GitHub stars](https://img.shields.io/github/stars/danjellesma/http-server.svg)](https://github.com/danjellesma/http-server/stargazers) [![GitHub forks](https://img.shields.io/github/forks/danjellesma/http-server.svg)](https://github.com/danjellesma/http-server/network) [![CircleCI](https://circleci.com/gh/danjellesma/http-server/tree/master.svg?style=svg)](https://circleci.com/gh/danjellesma/http-server/tree/master)

# Http-Server

Run a web server from your current directory without installing Nginx, Nodejs, NPM, etc.

## Basic Functionality

To see basic functionality, run without arguments:

``` bash
docker run -it --rm -p 8080:8080 -v $(pwd):/public danjellz/http-server
```

Output:

``` ruby
Starting up http-server, serving ./
Available on:
  http://127.0.0.1:8080
  http://172.17.0.2:8080
Hit CTRL-C to stop the server
```

You can now visit the site in your web browser:

[![Preview](./preview1.png)]

## Daemon Mode

Like many images you can run your container in daemon mode by using the `-d` switch with the Docker run command:

``` bash
docker run -d -p 8080:8080 -v $(pwd):/public danjellz/http-server
```

## Tips

#### Alias
Creating an alias in your `~/.bashrc` or `~/.zshrc` files can make this command much shorter. Example:

``` bash
alias http-server="docker run -it --rm -p 8080:8080 -v $(pwd):/public danjellz/http-server"
```

Allowing you to run the following and mount your current directory

``` bash
http-server
```

#### Source:

Uses the NPM package found here:
https://www.npmjs.com/package/http-server
