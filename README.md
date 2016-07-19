## Ruby Database Basics - Independent Project

An app that allows a salon owner to track stylists and clients, July 15, 2016

By Maldon Meehan

## Description

An Epicodus student project to practice Ruby database basics.

The project was to make an application that uses a database (hair_salon) and tables (clients and stylists). This application is for a salon owner who should be able to:_

* View, add, update and delete stylists.
* view, add, update and delete clients.
* Add clients to a stylist.

## Setup/Installation Requirements

* Clone this repository onto your computer
* Run bundle install in your project directory to ensure all gems are installed.

* Install Postgres:
  * Windows users: <a href="http://www.enterprisedb.com/products-services-training/pgdownload#windows">download and install Postgres</a>
  * Mac users: install Postgres by install Postgres, detailed instructions are <a href="https://www.learnhowtoprogram.com/ruby/ruby-database-basics/installing-postgres-7fb0cff7-a0f5-4b61-a0db-8a928b9f67ef">here</a>

* Open Postgres:
  * Access the Postgres server by opening a terminal and run 'postgres'
  * Now, open another terminal window and run "psql"

* In the terminal Run the following:
  * CREATE DATABASE hair_salon;
  * \c hair_salon
  * CREATE TABLE clients (id serial PRIMARY KEY, name varchar);
  * CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
  * CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;

* Run ruby app.rb in your project directory to start Sinatra
* Open a browser of your choice to localhost:4567

## Known Bugs

No known bugs at this point

## Support and contact details

If you have any questions please feel free to contact Maldon on github

## Technologies Used

* Ruby
* Postgres
* Sinatra
* Rspec
* HTML
* CSS     
* Bootstrap

### License

MIT License

Copyright (c) 2016, **Maldon Meehan, Epicodus**

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
