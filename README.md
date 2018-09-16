# URL Shortener Application

A URL shortener application in Ruby that can generate a unique "short" address on the local machine from any valid URL. "Short" URLs should be exactly 6 characters long, and be accessible from the root application path(for example: 'localhost:3000/ABC123'.)

## Getting Started

Clone this project to local and run the command below to enjoy the application.

```
  $ git clone xxx
  $ cd xxx
  $ rails s
```

Open a browser and enter 'localhost:3000'. Enter a valid URL and submit it, then you will get a short URL for this long long URL. After that, enter the short URL that generate by system at address bar, it will redirect to the original URL, enjoy!

## Heroku

I have hosting this application at Heroku.
Link:

## Database

I am using the Sqlite3 as my development database, but the production database will be postgresql for Heroku.

## Test

Run the command below to do a full test include
  - Model testing
  - Controller testing
  - Integration testing
  - System testing

```
  $ rails test
```

Include some 3rd party library to do the testing more convenient.

### Minitest-reporters

#### Installation

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

### Automation Guard

#### Installation

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


## Bootstrap && Jquery

Add gem in the Gemfile

```
  gem 'bootstrap-sass', '3.3.7'
  gem 'jquery-rails'
```

Create a scss file

```
touch app/assets/stylesheets/custom.scss
```

Add the code below in the file above

```
@import "bootstrap-sprockets";
@import "bootstrap";
```

## Version

Please take note that might minor changes of syntax on different version

```
    ruby                      ==   2.5.1
    rails                     ==   5.2.1
    rvm                       ==   1.29.4
    nodejs                    ==   8.10
    bootstrap-sass            ==   3.3.7
    jquery-rails              ==   4.3.3
    sass-rails                ==   5.0.6
    rails-controller-testing  ==   1.0.2
    minitest                  ==   5.11.3
    minitest-reporters        ==   1.3.4
    guard                     ==   2.14.2
    guard-minitest            ==   2.4.6
    pg                        ==   0.18.4
    validate_url              ==   1.0.2
    sqlite3                   ==   1.3.13
```
