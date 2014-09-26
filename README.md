### ExploreCourses for Ruby

##### Installation

Assuming that you have RubyGems, either run

	gem install explorecourses
	
to install for your system or add the following to your Gemfile

	gem 'explorecourses'
	
then run
	
	bundle install
	
##### Usage

Until I add documentation annotations to the source code, I recommend reading the source directly to find out what properties can be accessed.

	require 'explorecourses'
	
	# Search for all the courses
	courses = ExploreCourses.query_courses("CS 140")
	
	# Get the title of the course
	courses[0].title
	=> "Operating Systems and Systems Programming"
	
	# Get the number of sections for the course
	courses[0].sections.length
	=> 3

##### Checklist

* Add RDoc style documentation to all source code
* Add tests

##### License

This project is licensed under the terms of the MIT License.
