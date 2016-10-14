# Bloccit
#### A Reddit replica to teach the fundamentals of web development and Rails.

To read my case study on this application please visit [my portfolio](sleekramer.github.io/portfolio/bloccit).

## Summary

Reddit is an online discussion website that allows users to post, discuss, and vote on content. This structure of topics, posts, and comments lends itself quite well to learning the fundamentals of Rails development. This was a great introduction to the MVC model that Rails provides.  

Building this project helped me learn the essentials of Rails scaffolds and ActiveRecord as well as the principles of building a rails controller. I also learned the ins-and-outs of authentication and authorization by building a working system from scratch, and I got an introduction into unobtrusive javascript through Rails.

## Setup

Clone the repo and run the following on the command line:

```
$ bundle
$ rake db:create
$ rake db:migrate
```

If you want to include some fake user data to fill out your local instance, run `$ rake db:seed`.  Then fire up the built-in rails server: `$ rails server`.

Made with my mentor at [Bloc](http://bloc.io).
