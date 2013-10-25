#BITS Activity Management Tool
<br>
BITS AMT aims to manage organization's activities and events with ease. It helps users to track their organization's activites and notify users on changes and status of upcoming activities. It also provides PDF reports and documentations for successful activities.

##Installing

Clone the repository first:

    git clone git@github.com:chabzlala29/bitsapp.git

Create new file named ```.rvmrc```. into project's directory and insert the following script and save the file:

    rvm use ruby-2.0.0-p247@<gemset name> --create
    
Go to the root of your project again to load ```.rvmrc``` file then run:

    bundle install
    rake db:setup
    
Run Rails server on your local machine:

    rails s
    
## Testing (currently not configured)

1. Make sure your test database is migrated to the latest:


    rake db:drop RAILS_ENV=test
    rake db:migrate RAILS_ENV=test
    rake db:test:prepare
    
2. Running the tests:


    bundle exec rspec (all rails unit tests)
    bundle exec cucumber -p selenium (all js integration tests)
    bundle exec rake jasmine (all js unit tests)
    

