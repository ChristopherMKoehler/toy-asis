toy-asis
========

Toy Author Status Inquiry System - A coding exercise for software developer candidates

We want to implement a simple author inquiry system for authors to view the status of their submitted manuscripts.

### Requirements

* A running MongoDB Server (http://www.mongodb.org) - Install if necessary.
* Ruby 2.2

### Setup Instructions

* Clone the repo
* Install the bundle (bundler)
* Seed the database ```rake db:setup``` - The database is populated with the following manuscript from ```db/seeds.rb``` via Mongoid.
  <pre>
    Manuscript.create(code: 'AA1001', title: 'My awesome paper', status: 'WITH_AUTHOR', :status_date => Date.parse('01Jan2014')) do |m|
      m.authors << Author.new(publish_name: 'Smith,Joe')
      m.authors << Author.new(publish_name: 'Li,Wen')
      m.authors << Author.new(publish_name: 'Jones,Ben')
    end
  </pre>
* Start the application (standard Rails)
* Visit http://localhost:3000/admin/manuscripts to confirm the app is up and running.
  You should see a crude looking page that shows info about the above manuscript(s).
  
### Specifications

See TODO.md