# openplcproject.github.io

[![Build Status](https://travis-ci.com/openplcproject/openplcproject.github.io.svg?branch=master)](https://travis-ci.com/openplcproject/openplcproject.github.io)

This project is the source for the OpenPLC Project's website, available
at openplcproject.com. We built the site using the fantastic Jekyll static
site generator.

## Development

1. Install ruby
1. Run `bundle install`
1. Run `bundle exec jekyll serve`

You can (and should) run some simple tests with `bundle exec rake test`
to check for common problems. The continuous integration build includes
additional checks.

## Deploy

The GitHub repository hosted on openplcproject/openplcproject.github.io is configured
to automatically publish changes to the master branch. There is nothing you
need to do.

Builds automatically run a TravisCI build. The automated build checks for valid HTML
and other common problems.
