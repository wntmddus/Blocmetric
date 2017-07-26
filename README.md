# Blocmetrics
Blocmetrics is an analytics tool for tracking events on websites. Integrate with web apps to track user activity and report results.
## Getting Started
## Software requirements
- Rails 4.2.2
- Ruby 2.2.2p95
- PostgreSQL 9.3.x or higher
## Navigate to the Rails application
```$ cd /path/to/rails/application```
## Set configuration files
```$ cp config/database.yml.template config/database.yml$ cp config/initializers/mail.rb.template config/initializers/mail.rb```
Note:  You may need to edit the above files as necessary for your system.
## Create the database
 ``` $ pgstart $ rake db:create ```
## Migrating and seeding the database
```$ rake db:migrate$ rake db:seed```
## Starting the local server
```$ rails server
   or
$ rails s```
## Production Deployment
  ```  $ git push heroku master  $ heroku run rake db:migrate  ```
## License
Blocmetrics is released under the <LICENSE-NAME> license.
## Copyright
copyright:: (c) Copyright 2016 Blocmetrics. All Rights Reserved.
