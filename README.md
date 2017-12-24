### Set up project 
1) run `bundle install`
2) run `rake db:create`
3) run `rake db:migrate`
4) run `rake db:seed`
5) run `rails c`

### Test account credentials
Email: test@mail.com

Password: 123456

### API

#### POST /api/v1/session - sign in
- Required params: email, password
- Success response contains `Authorization` header. `Authorization` header should be passed with all requests which require the authorization

**All endpoint below require an authorization**

#### DELETE /api/v1/session - sign out
- Remove current account authorization data from the server(only for current device/web session)

#### GET /api/v1/setting - Account settings
- Returns current account info

#### PUT|PATH /api/v1/setting - Account settings
- Params: name, password
- Updates passed params for current account

#### GET /api/v1/rewards - Rewards
- Params: page, status
- Returns rewards which belong to the current account with pagination. If `status` passed it filters rewards by the status
 
 

### Blueboard Backend Engineer Application

---

#### Description
Design and write a Rails application with the following features:

- Email and password authentication
- Three views
    - Sign in page
        - Ability to sign out
    - A rewards page
    - An account settings page
- An API with four endpoints
    - Sign in endpoint
    - Sign out endpoint
    - A rewards endpoint
    - An account settings endpoint

---

#### Models
Please use the following base models for your application, feel free to add additional fields although they are not required in any way.

###### Reward
- `status` column with possible values:
    - `waiting_to_be_approved`
    - `approved`
    - `denied`
    - `sent`
    - `redeemed`
    - `completed`

###### Account
- has many `Reward`s
- `email:string`
- password
- `name:string`

---

#### Implementation
How you decide to split API and views is up to you. You can choose to write separate controllers for each, or you can write one controller that can respond to `json` and `html`. You don't need to spend much time styling any pages, but be sure to display your data nicely in a table.

###### Rewards page
This page should return all `Reward`s and be paginated. It should allow you to filter the results by `status`.

###### Settings page
This page should display the currently authenticated user's attributes and allow you do update them, especially the password.

###### Rewards endpoint
Same functionality as the page, but response should be `json`.

###### Settings endpoint
Same functionality as the page, but response should be `json`.

---

#### Application Data & The Submission Process
Please utilize the `db/seeds.rb` file to populate your database. Seed one `Account` and a lot of randomized `Rewards` that belong to that account.

To submit your application please make a pull request to the https://github.com/blueboard/backend-engineer-application repository. In your PR, please provide Account details so that we can test your application. If you've chosen to implement additional features not listed above, please explain them briefly.

