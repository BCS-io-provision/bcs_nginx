bcs_nginx CHANGELOG
=======================

This file is used to list changes made in each version of the nginx-wrapper cookbook.

## [2.0.0] - 2016-12-23
### Breaking Change
  - Switching from nginx cookbook to chef_nginx cookbook
    - nginx cookbook's branch 2.7.x is broken, it does not start,  and no longer being supported.
    - instead the nginx cookbook developers are working on a 3.0.0 branch which isn't ready to use.
    - 2.7.x branch was taken and used in chef_nginx cookbook where it is supported and it working.
    - Using chef_nginx cookbook while 3.0.0 is in development
  - Support Ubuntu 12.04 removed

### Added
  - Support for Ubuntu 16.04 LTS added
  - Rakefile added for simpler development
  - Test Kitchen running on mac

## [1.0.1]
-----
- CHANGELOG not kept until after this version

- - -
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
