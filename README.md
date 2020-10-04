# README

This README would normally document whatever steps are necessary to get the
application up and running.

* Ruby Version - 2.6.3

* Rails version - 6.0.3

* One has to setup the database using db:setup

* One will need master.key to use credentials

* Some seed data is already created.

    Use email: 'testuser@gmail.com', password: 'password' to login

    To add more rss-feed urls please check the rss-websites of different agencies.

 * Thing to highlight

  I have used uncouple gem. You can find it here https://github.com/citrus/uncouple

  For pdf generation i have used prawn gem.

  A basic preview of the pdf can be found in  /public folder.

  To update the rss-feeds i have whenver gem that schedules a cronjob for every 5 minutes.
