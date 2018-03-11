# Setup

Ruby Version Manager

	First you need to install Ruby Version Manager, follow the instructions for your machine:
		https://rvm.io/rvm/install

Once that is complete, its time to install Ruby with RVM:

	rvm install 2.2.4
	rvm use 2.2.4
	rvm rubygems latest

Bundler

	Ruby uses gems, and every time a gem is added or updated, Bundler needs to install them.
		$ gem install bundler

Capybara

	Finally, you will need Capybara. In the terminal write:
		$ gem install capybara
		
Initial Setup

	Run the follwing in the project directory:
		$ bundle install

# Test Execution

Exeuting a test:
		
	To run a test - execute the following command in the project root directory:
		$ cucumber features/tests/XXXX.feature
