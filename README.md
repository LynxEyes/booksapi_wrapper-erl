# Description

A simple CLI app that retrieves book information details from Google Books API.
The app is able to filter results by:

* author name
* book title
* free form text that can match any book detail

(any combination of these factors is allowed)

A session with the app can look like this:

```
$ ./books -a Tolkien
1) Title: OS FILHOS DE HURIN
   Date:
   Authors: J. R. R. TOLKIEN, ALAN LEE, CHRISTOPHER TOLKIEN, LUZIA APARECIDA DOS SANTOS, RONALD EDUARD KYRMSE

2) Title: O Silmarillion
   Date: 2015-08-11
   Authors: J.R.R. Tolkien

3) Title: O Hobbit
   Date:
   Authors: J.R.R. Tolkien

4) Title: Senhor Dos Aneis, O - as Duas Torres - Vol 2
   Date: 2000
   Authors: John Ronald Reuel Tolkien

5) Title: THE FELLOWSHIP OF THE RING
   Date:
   Authors: J.R.R. TOLKIEN

...
```

# Building

To build the app, be sure to have **rebar** (2) laying around (I have it on my home /bin folder which is on my path).
After making sure you have rebar laying around on your path, you need to install all dependencies:

```
$ rebar get-deps
==> books (get-deps)
Pulling jsone from {git,"git@github.com:sile/jsone.git"}
Cloning into 'jsone'...
Pulling dactyl from {git,"git@github.com:basho/dactyl.git"}
Cloning into 'dactyl'...
Pulling hackney from {git,"git@github.com:benoitc/hackney.git"}
Cloning into 'hackney'...

...
```

This will download all dependencies and make them available to compile.
Then all that is left is for you to compile and build the app:

```
$ rebar compile escriptize
==> jsone (compile)
Compiled src/jsone.erl
Compiled src/jsone_decode.erl
Compiled src/jsone_encode.erl
==> dactyl (compile)
Compiled src/dactyl.erl

...

==> books (escriptize)
```

This will compile all modules and dependencies and will also generate an binary escript that basically is the runnable app.

All you need to do now is to use the app!

# Usage

```
$ ./books
Usage: "./books" [options] [search term]

Options:
       -a Author
       -t Title
       -h shows this help screen

Search Term is any string you want to search for

Examples:
  $ "./books" -a Tolkien                      # search for books written by Tolkien
  $ "./books" -t Hobbit                       # search for books entitled Hobbit
  $ "./books" Hitchhiker Guide                # search for books that include the words 'Hitchhiker' or 'Guide'
  $ "./books" -a 'Douglas Adams' Hitchhiker   # search for books written by Douglas Adams and that include the word 'Hitchhiker'
```

# Disclaimer

This is my very first CLI app in Erlang, I am in no manner an Erlang expert or something like that.
This is meant to be a learning exercice and a reference (either good or bad) for future work.