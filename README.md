Eduportal
================

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

Ruby on Rails
-------------

This application requires:

- Ruby 2.3.3
- Rails 4.2.7.1

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).
> Recommend installing ruby using rbenv.

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

**Daily workflow**
1. Fetch updates: `git pull upstream develop`
2. Create new feature branch: `git checkout -b <myFeature>`
3. After completing feature, add changed files: `git add -p <filename>` , check file differences
4. Make sure tests are passing: `bundle exec rspec`
5. Commit changes: `git commit -m "Commit message."`
6. Pull in latest changes to develop: _same as step 1_
7. Update feature branch with upstream changes: `git rebase develop`
8. Fix merge conflicts
9. Push changes to your fork: `git push origin <myFeature>`
10. Create a pull request from your fork on github

- Commit messages should be complete sentences written in the imperative mood.
- Branch names should indicate feature with words-separated-by-hyphens.

Credits
-------
Eduportal is developed and maintained by the Renstine Multimedia Group.

<!-- License -->
