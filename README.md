# System dependencies

- Postgresql 9+
- Ruby 2.5.1+

# Setup

- Set environment variable `DATABASE_URL`, ie:

```
export DATABASE_URL="postgres://myuser:mypass@localhost/somedatabase"
```

- Run `bundle install`

- Run database setup

```
bundle exec rake db:setup
```

- Start server

```
bundle exec rails server
```

# Test suite

To run all of testcases:

```
bundle exec rails test
```
