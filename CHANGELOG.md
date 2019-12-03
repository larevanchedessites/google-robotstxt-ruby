# Changelog

## Version 0.0.4

* Set @rpath flag in extconf to link the dylib directly from the c-build directory
* Remove symbolic link creation, useless now with the @rpath

## Version 0.0.3

* Replace File.symlink with FileUtils.ln_s

## Version 0.0.2

* User __dir__

## Version 0.0.1

* Try to create a symbolic link to /usr/local/lib/ to make the library load

## Version 0.0.0

* Initial version by [@bqst][https://github.com/bqst]