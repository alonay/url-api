# header

# Setup Repository

- clone the repo: `$ git clone git@github.com:alonay/url-api.git`
- cd into the directory `$ cd url-api`
- bundle install `$ bundle`

# Setup Environment Variables
- create a file in the root directory to host your environment variables: `.env`
- add `CLIENT_URL=http://localhost:3001` to `.env`

# Setup Database
- Run `$ rake db:setup`

Finally, run the server on port 3000:

`$ rails s -p 3000`
