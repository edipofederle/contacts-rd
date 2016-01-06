== README


=== How to run locally

Clone this repository:

``git clone git@github.com:edipofederle/contacts-rd.git``


This project use postgres as database. So make sure that you have it installed and running.

Create the database and execute the migrations:
 
``cd contacts-rd``
``bundle exec rake db:create && bundle exec rake db:migrate``

Running:

``rails s``

Point you browser to ``localhost:3000``


=== Tests

In order to run all tests you can execute:

``bundle exec rake spec``

Some tests are integration test using Capybara. So make sure that you have Firefox installed in your machine