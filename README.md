# Log Parser

Log parser is a script that:

  a. Receives a log as argument
  
  b. Returns the following:

    > list of webpages with most page views ordered from most pages views to less page views e.g.:
      /home 90 visits
      /index 80 visits
      etc...

    > list of webpages with most unique page views also ordered e.g.:
      /about/2 8 unique views
      /index 5 unique views
      etc...

## Installation

  - Clone repository
  - Install Ruby 3.0.1
  - Run ```bundle install``` inside the script directory


## Running

  - Run ```bin/parser webserver.log``` or provide path to your log file

## Testing

  - Run ```bundle exec rubocop``` for rubocop check
  - Run ```bundle exec rspec -fd``` for rspec check

## Approach

  - Developed according to OOP principles
  - All classes covered with unit tests, integration test is also implemented
  - Validations for file existence, emptiness, wrong extension are provided
  - Github CI integration

Application reads file line by line, collects urls and ips, counts total views as well as total unique views. Sorted data is printed in terminal.
