# Founder

This is an application to find files into a given path.
When the path is not given the find action will be performed into the same
path where the executable is located.

## Installation

In order to test the project it must be compiled with:

```shell
$ mix escript.build
```
Then the find can be performed with:


```shell
$ ./founder README
```

## Useful commands

With the path specified:

```shell
$ ./founder -s ~/Documents README
```


With the recursive option specified (not completed yet):

```shell
$ ./founder -r README
```


With the verbose option specified (not completed yet):

```shell
$ ./founder -v README
```

All the options together:

```shell
$ ./founder -rvs ~/Documents README
```