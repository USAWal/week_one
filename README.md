Week One app
============

What services are required
--------------------------
 To run this application you need to have postgresql run only. I didn't implement email delievering through sidekiq. I've demonstrated that previously in my Blog application, when successfully passed interview with Ryan in March. Anyway blog application is still available in my repos. I didn't implement searching with SOLR either. Sunspot makes search feature implementing extremely simple, its DSL is really great. In my projects I always use Sunspot gem instead of Elastic Ssearch because of its DSL.
 
 How to setup & boot the application
-----------------------------------
 
 ```
 createdb week_one_test
 rspec
 createdb week_one_development
 rake db:migrate db:seed
 rails s
 ```
 
 Your testing methodology
-------------------------
 I always try to cover models with test. My primary testing tool is RSpec. It makes available to test all application tiers. Most of my tests are about models. Additionally I use controllers on returning status, assigned values and DB state changes. If I need to make acceptence tests I use Cucumber, which allows run structured user stories against application.
 
 How to run the test suite
--------------------------
 
 ```
 rspec
 ```
 
 An outline of how you tackled the project – what you prioritised etc
---------------------------------------------------------------------
 Developing Rails application is a bottom-up process, so priority is always on models side. We need to think a lot about strucutre of application to simplify our life in future. First of all I wrote tests for models. After that I coded models and connected them. After that I was able to write business logic in controllers, growing funcitonality of the application.
 
 Any other details you wish to make us aware of.
-----------------------------------------------
 I implemented Shop entity. Shop is just a showcase for you products. Shop helps you represent the same products as many times as you want, so browsing list of categories and products of categories is always in scope of a shop. Working with categories happens through product editting. I thought it's ok because other way Product CRUD doesn't differ from Category CRUD, it's boring. So any user could be seller as well as consumer.
