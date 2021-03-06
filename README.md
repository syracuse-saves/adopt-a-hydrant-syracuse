<!-- http://answers.yahoo.com/question/index?qid=20101015130208AAIWWGO -->
# Adopt-a-Hydrant Syracuse [![Build Status](https://secure.travis-ci.org/ahcarpenter/adopt-a-hydrant-syracuse.png?branch=master)][travis] [![Dependency Status](https://gemnasium.com/ahcarpenter/adopt-a-hydrant-syracuse.png?travis)][gemnasium]
Claim responsibility for shoveling out a fire hydrant after it snows. Available in [Deutsch](http://adopt-a-hydrant-syracuse.herokuapp.com/de), [English](http://adopt-a-hydrant-syracuse.herokuapp.com/en), [Español](http://adopt-a-hydrant-syracuse.herokuapp.com/es)¹, [Français](http://adopt-a-hydrant-syracuse.herokuapp.com/fr)¹, [Kreyòl Ayisyen](http://adopt-a-hydrant-syracuse.herokuapp.com/ht)¹, [Italiano](http://adopt-a-hydrant-syracuse.herokuapp.com/it)¹, [Polski](http://adopt-a-hydrant-syracuse.herokuapp.com/pl)¹, [Português](http://adopt-a-hydrant-syracuse.herokuapp.com/pt)¹, [繁體字](http://adopt-a-hydrant-syracuse.herokuapp.com/cn)², [русский](http://adopt-a-hydrant-syracuse.herokuapp.com/ru)¹, [ייִדיש] (http://adopt-a-hydrant-syracuse.herokuapp.com/yi)¹, [한국의](http://adopt-a-hydrant-syracuse.herokuapp.com/kr)¹, [ελληνικά](http://adopt-a-hydrant-syracuse.herokuapp.com/gr)¹, [עברית](http://adopt-a-hydrant-syracuse.herokuapp.com/he)¹ & [العربية](http://adopt-a-hydrant-syracuse.herokuapp.com/ar)¹.

¹http://translate.google.com<br>
²http://en.wikipedia.org/wiki/Traditional_Chinese

[travis]: http://travis-ci.org/ahcarpenter/adopt-a-hydrant-syracuse
[gemnasium]: https://gemnasium.com/ahcarpenter/adopt-a-hydrant-syracuse

## <a name="screenshots"></a>Screenshots
![Adopt-a-Hydrant Syracuse](https://github.com/ahcarpenter/adopt-a-hydrant-syracuse/raw/master/screenshot37.png "Adopt-a-Hydrant Syracuse")
![Adopt-a-Hydrant Syracuse](https://github.com/ahcarpenter/adopt-a-hydrant-syracuse/raw/master/screenshot38.png "Adopt-a-Hydrant Syracuse")
![Adopt-a-Hydrant Syracuse](https://github.com/ahcarpenter/adopt-a-hydrant-syracuse/raw/master/screenshot39.png "Adopt-a-Hydrant Syracuse")
![Adopt-a-Hydrant Syracuse](https://github.com/ahcarpenter/adopt-a-hydrant-syracuse/raw/master/screenshot40.png "Adopt-a-Hydrant Syracuse")

## <a name="installation"></a>Installation
This application requires [Postgres](http://www.postgresql.org/) to be installed

    git clone git://github.com/codeforamerica/adopt-a-hydrant.git
    cd adopt-a-hydrant
    bundle install

    bundle exec rake db:create
    bundle exec rake db:schema:load

## <a name="usage"></a>Usage
    rails server

## <a name="usage"></a>Seed Data
    bundle exec rake db:seed

## <a name="contributing"></a>Contributing
In the spirit of [free software][free-sw], **everyone** is encouraged to help
improve this project.

[free-sw]: http://www.fsf.org/licensing/essays/free-sw.html

Here are some ways *you* can contribute:

* by using alpha, beta, and prerelease versions
* by reporting bugs
* by suggesting new features
* by [translating to a new language][locales]
* by writing or editing documentation
* by writing specifications
* by writing code (**no patch is too small**: fix typos, add comments, clean up
  inconsistent whitespace)
* by refactoring code
* by closing [issues][]
* by reviewing patches
* [financially][]

[locales]: https://github.com/codeforamerica/adopt-a-hydrant/tree/master/config/locales
[issues]: https://github.com/codeforamerica/adopt-a-hydrant/issues
[financially]: https://secure.codeforamerica.org/page/contribute

## <a name="issues"></a>Submitting an Issue
We use the [GitHub issue tracker][issues] to track bugs and features. Before
submitting a bug report or feature request, check to make sure it hasn't
already been submitted. You can indicate support for an existing issue by
voting it up. When submitting a bug report, please include a [Gist][] that
includes a stack trace and any details that may be necessary to reproduce the
bug, including your gem version, Ruby version, and operating system. Ideally, a
bug report should include a pull request with failing specs.

[gist]: https://gist.github.com/

## <a name="pulls"></a>Submitting a Pull Request
1. Fork the project.
2. Create a topic branch.
3. Implement your feature or bug fix.
4. Add tests for your feature or bug fix.
5. Run `bundle exec rake test`. If your changes are not 100% covered, go back
   to step 4.
6. Commit and push your changes.
7. Submit a pull request. Please do not include changes to the gemspec or
   version file. (If you want to create your own version for some reason,
   please do so in a separate commit.)

## <a name="versions"></a>Supported Ruby Versions
This library aims to support and is [tested against][travis] the following Ruby
implementations:

* Ruby 1.9.2
* Ruby 1.9.3

If something doesn't work on one of these interpreters, it should be considered
a bug.

This library may inadvertently work (or seem to work) on other Ruby
implementations, however support will only be provided for the versions listed
above.

If you would like this library to support another Ruby version, you may
volunteer to be a maintainer. Being a maintainer entails making sure all tests
run and pass on that implementation. When something breaks on your
implementation, you will be personally responsible for providing patches in a
timely fashion. If critical issues for a particular implementation exist at the
time of a major release, support for that Ruby version may be dropped.

##Calling to the API
The following might return a response:
```
http://adopt-a-hydrant-syracuse.herokuapp.com/?hydrants_adopted=
http://adopt-a-hydrant-syracuse.herokuapp.com/?hydrants_not_adopted=
http://adopt-a-hydrant-syracuse.herokuapp.com/?hydrants_all=
```

## <a name="copyright"></a>Copyright
Copyright (c) 2012 Code for America. See [LICENSE][] for details.

[license]: https://github.com/codeforamerica/adopt-a-hydrant/blob/master/LICENSE.md

[![Code for America Tracker](http://stats.codeforamerica.org/codeforamerica/adopt-a-hydrant.png)][tracker]

[tracker]: http://stats.codeforamerica.org/projects/adopt-a-hydrant