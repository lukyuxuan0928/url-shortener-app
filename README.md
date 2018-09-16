# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Test

## Minitest-reporters

### Installation

Add gem in the Gemfile

```
  gem 'rails-controller-testing'
  gem 'minitest'
  gem 'minitest-reporters'
```

Add the code below in test/test_helper.rb

```
  require "minitest/reporters"
  Minitest::Reporters.use!

```

## Automation Guard

### Installation

Add gem in the Gemfile

```
  gem 'guard'
  gem 'guard-minitest'
```

Initial a Guard File

```
  $ bundle exec guard init
```

A custom Guardfile.

Please refer a sample config: https://bitbucket.org/railstutorial/sample_app_4th_ed/raw/289fcb83f1cd72b51c05fe9319277d590d51f0d2/Guardfile


## boostrap && jquery

Add gem in the Gemfile

```
  gem 'bootstrap-sass', '3.3.7'
  gem 'jquery-rails'
```

```
touch app/assets/stylesheets/custom.scss
```

```
@import "bootstrap-sprockets";
@import "bootstrap";
```

GEM
  gem 'rails-controller-testing'
  gem 'minitest'
  gem 'minitest-reporters'
  gem 'guard'
  gem 'guard-minitest'
  gem 'pg', '0.18.4'
  gem 'validate_url'
  gem 'bootstrap-sass', '3.3.7'
  gem 'jquery-rails'
