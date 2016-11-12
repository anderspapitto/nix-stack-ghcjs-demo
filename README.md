skeleton ghc/ghcjs project using nix, stack, cabal, reflex-platform, intero
===========================================================================

This is a skeleton project structured to use a bunch of tools in the
ecosystem.  Sometimes those tools play nicely together, and sometimes
they don't - this is one configuration in which they do.

Features
--------

- ghc, ghcjs, and all haskell libraries are installed safely and
  deterministically via nix
- both ghc- and ghcjs-targeted code can be build with either cabal or
  stack, or both
- ghcjs-targeted code can also be built by ghc, when helpful
- intero is available for use from editors, for both codebases

Usage
-----

1. install the nix environment
2. run either`'stack build` or `cabal build` from ghc-code or ghcjs-code

To install the nix environment, you have two options

- install it globally, via `nix-env -f
  /path/to/nix-stack-ghcjs-demo/default.nix -i`. You can
  uninstall/disable it at any time with `nix-env -e ghc-and-ghcjs-env`
- open a nix-shell and run everything inside it, via `nix-shell -p
  'import /path/to/nix-stack-ghcjs-demo'`

Details (in no particular order)
--------------------------------

- [reflex-platform](https://github.com/reflex-frp/reflex-platform) is
  used to provide version pinning. It is itself built on top of nix,
  and it has been carefully put together with versions of various
  packages that work well together (basically, it takes the pain away
  from installing ghcjs).
- I have
  one
  [custom commit](https://github.com/anderspapitto/reflex-platform/commit/18b3153919932ab1c969b8cc400b6184d03fd31a) at
  the top of reflex-platform, which updates intero to a newer version
  (needed by the intero emacs package). If/when reflex-platform
  updates enough to make this no longer necessary, that can be
  removed.
- [stack](http://www.haskellstack.org/) is set up to use the 'system'
  ghc, so it should never try to install anything for you.
- there's only one stack.yaml, which is symlinked inside each of
  ghc-code/ghcjs-code. It needs to be inside those directories, since
  stack tooling looks for stack.yaml to find the project boundary, and
  we want the ghc and ghcjs code to be treated as separate projects.
