Code assessment
===

## Please implement a user registration system in Ruby on Rails. The system would require following features:

- [x] As a user, I can visit sign up page and sign up with my email (with valid format and unique in database) and password (with confirmation and at least eight characters).
- [x] When I sign up successfully, I would see my profile page.
- [x] When I sign up successfully, I would receive a welcome email.
- [x] When I sign up incorrectly, I would see error message in sign up page.
- [x] As a user, I can edit my username and password in profile page. I can also see my email in the page but I can not edit it.
- [x] When I first time entering the page, my username would be my email prefixing, e.g. (email is “user@example.com” , username would be “user”)
- [x] When I edit my username, it should contain at least five characters. (Default username does not has this limitation)
- [x] As a user, I can log out the system.
- [x] When I log out, I would see the login page.
- [x] As a user, I can visit login page and login with my email and password.
- [x] As a user, I can visit login page and click “forgot password” if I forgot my password.
- [x] When I visit forgot password page, I can fill my email and ask the system to send reset password email.
- [x] As a user, I can visit reset password page from the link inside reset password email and reset my password (with confirmation and at least eight characters).
- [x] The link should be unique and only valid within six hours.




## Please notice the following concerns when implementing:

* Use PostgreSQL
* Do not use third party library for user registration. (e.g. Devise)
* Please use https://github.com/ryanb/letter_opener for the email in development environment.
* Write test code in any test suite you like.
* Use Git for version control with WELL commit message.
* Write README about how to get start for the project.


After finish all the tasks, please submit it to Github and share the link to us.

Happy coding!
