NOTE: This repo is still under construction, please use at your own risk. :-)

# Google Robotstxt Parser C++ Library Wrapper Gem

This is a unofficial Ruby gem that provides a wrapper around [Google Robotstxt Parser C++ library](https://github.com/google/robotstxt).

## Installation

Add this line to your application's Gemfile:
```
gem 'google_robotstxt_parser'
```

And then execute:
```
bundle
```

Or install it yourself as:
```
gem install google_robotstxt_parser
```

## Usage
At the time there is only one method available which is demonstrated below:
```
require './robotstxt'
include Robotstxt

robotstxt_content = "# robotstxt.org/\n\nUser-agent: *\nDisallow: /\n\nSitemap: https://www.bqst.fr/sitemap.xml"
user_agent = "GoogleBot"
url = "https://www.bqst.fr"

Robotstxt.allowed_by_robots(robotstxt_content, user_agent, url)
```

## Todo
There are quite a few outstanding tasks:
- [ ] Try to link the robots.dylib library from c-build instead of creating a symbolic link to /usr/local/lib/ to make it compatible with different OS
- [ ] Some tests :-)


## Author
[Bastien Montois](https://www.bqst.fr) @ [la-revanche-des-sites.fr](https://www.la-revanche-des-sites.fr)

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/larevanchedessites/google-robotstxt-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## History
View the [changelog](https://github.com/larevanchedessites/google-robotstxt-ruby/blob/master/CHANGELOG.md). This gem follows [Semantic Versioning](http://semver.org/).

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
See [LICENSE](https://github.com/larevanchedessites/google-robotstxt-ruby/blob/master/LICENSE) for details.

## Code of Conduct
Everyone interacting in the project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/larevanchedessites/google-robotstxt-ruby/blob/master/CODE_OF_CONDUCT.md).
