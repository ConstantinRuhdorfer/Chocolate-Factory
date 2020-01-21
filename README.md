# Chocolate Factory

This implements runable examples for our talk "Einführung in die funktionale Programmierung".

by Michael Weidmann, Jonas Komarek, Constantin Ruhdorfer.

## Usage

A basic project setup looks like this (assumes the haskell-stack toolchain):

```sh
git clone git@github.com:ConstantinRuhdorfer/Chocolate-Factory.git
cd hocolate-Factory
stack install
./build.sh
```

After that you can compile and run the programm with:

```sh
./build.sh
```

or (but really the same):

```sh
stack build
stack exec chocolateFactory [all|factory[1|2|3]]
```

## Project structure

The relevant folders are:

```
.
+-- app/                  Entry point
|   +-- Main.hs
+-- src/                  Problem solutions
|   +-- Factory1.hs       Example 1.
|   +-- ...               etc.
```

## Note

Every factory is intenionally pretty self-contained even though they could share more code.
This is to preserve readability for everyone who is interested in seeing the complete solution to one problem while being pretty unfamiliar with haskell or the structure of this project.
