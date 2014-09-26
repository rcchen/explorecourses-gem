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

Copyright (c) 2014 Roger Chen

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
