# Yanit - Yet Another (Netzke) Issue Tracker

One-page demo RIA for [RubyShift](http://rubyshift.org/) 2011.

It is a very simple issue tracker driven by the following models and relationships between them:

`Issue` that `belongs_to` `User` and `belongs_to` `Project`.

## Installation

* Create your database.yml
* bundle install
* rake db:setup

Test data is included.

Have fun!

---
Released by [@nomadcoder](http://twitter.com/nomadcoder) under the MIT license **except for**:

* Sencha Ext JS: http://www.sencha.com/products/extjs/license/
* FamFamFam icons (public/images/icons): http://creativecommons.org/licenses/by/2.5/
