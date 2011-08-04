

Fork notes
----

* Forked the project because I needed some modifications to the way the form inputs are generated (needed to see errors)
* My modifications are not covered by tests yet (will be soon)
* Tests will be refactored at the same time

* * * *

jqmobile_helpers
===== 

Copyright (C) 2011 Consoci8 Sdn Bhd

jqmobile_helpers are view helpers for jquery mobile components e.g list view, buttons, form elements, etc

To use this in your rails app, add the following line to your gemfile:

    gem "jqmobile_helpers"

And then run
  
    bundle install

At the moment, you have to manually include the jquery-mobile stylesheets & javascript at your headers.

Download jquery-mobile link http://jquerymobile.com/download/

Copy & paste these snippet at your application.html.erb layout header

    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.0a3/jquery.mobile-1.0a3.min.css" />
    <script src="http://code.jquery.com/jquery-1.5.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.0a3/jquery.mobile-1.0a3.min.js"></script>

Documentation
-------

For further usage of all helper methods:

1. http://rdoc.info/github/Consoci8/jqmobile_helpers

2. Clone this project, and run the rails app at test/dummy. Look at http://localhost:3000 and see all jqmobile_helpers examples.

TODO
-------

1. Wiki
2. Generators to include jquery-mobile javascript and stylesheet in header.

This project rocks and it uses MIT License.
