# How to contribute

The NewReq is a project still under development.
Any collaboration will be very important for the project.

If you have any difficulty in starting the contributions, you can contact Bruno Kinoshita (brunokino@gmail.com)


Discussions and product development activities are all listed in the [Issues page](https://github.com/NewReq/NewReq/issues)


## Important informations:

### Active Directory Server:

For now, you can use our Active Directory server:

IP: 52.43.44.152

Username: INTRANET\svc-ldap

Password: NewReq@123


### User credentials:

Login NewReq:

Username: test

Password: NewReq@123


## Getting Started:

* Make sure you have a GitHub account
* Fork the repository you want to contribute to, and checkout the branch that the changes should go in.
* Create a new development branch for your fix/feature/contribution, based on the current branch.
* After you finished your changes and committed them, push your branch to github.
* Create a pull request. The dev team will be notified about this, check your pull request and either merge it or give you some feedback about possible improvements.



## Preparing the environment

Some tips to prepare the development environment

### Tips:
* You can use a Cloud IDE to not need to install the dependencies on your computer, for example https://c9.io
* You can run Ruby on Rails on a Linux machine, Mac or Windows
* Data from the initial setting can be imported to Database using the command "rake db:seed"
* You need "Node.Js" installed
* You need Bundler installed


## For Windows:

* Add the following line in Gemfile
```
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
```

