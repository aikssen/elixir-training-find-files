# Founder

This is an application to find files into a given path.
When the path is not given the find action will be performed into the same
path where the executable is located.

## Installation

In order to run the project it must be compiled with:

```shell
$ mix escript.build
```
Then search file can be performed with the command:


```shell
$ ./founder README.*
```

## Useful commands

With the path specified:

```shell
$ ./founder -s ~/Documents README.*
```


With the recursive option specified (not completed yet):

```shell
$ ./founder -r README.*
```


With the verbose option specified (not completed yet):

```shell
$ ./founder -v README.*
```

All the options together:

```shell
$ ./founder -rvs ~/Documents README.*
```


The search option supports wildcard commands like:

```shell
#look for files with the name [README] and any extension
$ ./founder README.*


#look for files with the extension [.md]
$ ./founder *.md
```

It also supports the wildcard commands from [Path.wildcard](https://hexdocs.pm/elixir/Path.html#wildcard/2) 