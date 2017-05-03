Eduportal
================
[![Build Status](https://travis-ci.org/wanyamaman/eduportal.svg?branch=develop)](https://travis-ci.org/wanyamaman/eduportal)
[![Code Climate](https://codeclimate.com/github/wanyamaman/eduportal/badges/gpa.svg)](https://codeclimate.com/github/wanyamaman/eduportal)
[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

- Eduportal was an online schools directory based in Kenya
- The project was initialy launched in 2015
- As of Jan 2017, the project is no longer active. Web Archive can be found [here](https://web.archive.org/web/20160306120529/http://eduportal.co.ke/)
- The initial implementation was completed in Joomla! This repository serves as a recreation of the project done in Rails as was originaly intented

Ruby on Rails
-------------

This application uses:

- Ruby 2.3.3
- Rails 5.0.2

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).
> We recommend installing ruby using rbenv.

<!-- Getting Started -->
Documentation and Support
-------------------------
- For suggestions, errors or general info you can raise an [issue here](https://github.com/wanyamaman/eduportal/issues).

<!-- Issues -->
Contributing
------------
- master branch -> production ready code
- develop branch -> new feature development

**Initial Setup**
1. Fork the repository on github
2. Clone your fork: `git clone git@github.com:<username>/eduportal.git`
3. Set clone to track upstream: `git remote add upstream git@github.com:wanyamaman/eduportal.git`
4. Install gems: `bundle install`
5. Make sure tests are passing: `bundle exec rspec`
6. Seed the database: `rails db:seed`

**Daily workflow**
1. Fetch updates: `git pull upstream develop`
2. Make sure to start from develop branch: `git checkout develop`
3. Create new feature branch: `git checkout -b <myFeature>`
4. After completing feature, add changed files: `git add -p <filename>` , check file differences
5. Make sure tests are passing: `bundle exec rspec`
6. Commit changes: `git commit -m "Commit message."`
7. Pull in latest changes to develop: _same as step 1_
8. Update feature branch with upstream changes: `git rebase develop`
9. Fix merge conflicts
10. Push changes to your fork: `git push origin <myFeature>`
11. Create a pull request from your fork on github

- Commit messages should be complete sentences written in the imperative mood.
- Branch names should indicate feature with words-separated-by-hyphens.

Credits
-------
Eduportal is developed and maintained on behalf of [Renstine Multimedia Group](http://renstine.co.ke/).

<!-- License -->
