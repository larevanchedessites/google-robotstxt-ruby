# Changelog

## Version 0.0.5
* Heroku was not looking on the right directory (tmp instead of app)
* /tmp/build_xxx/vendor/bundle/ruby/2.5.0/gems/google_robotstxt_parser-0.0.5/ext/robotstxt/robotstxt/c-build
* /app/vendor/bundle/ruby/2.5.0/gems/google_robotstxt_parser-0.0.5/ext/robotstxt/robotstxt/c-build


## Version 0.0.5
* DBUILD_SHARED_LIBS=OFF to create .so insted of .bundle on Heroku

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