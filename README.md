### Blueboard Backend Engineer Application

---

#### Description
Design and write a Rails application with the following features:

- Email and password authorization
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
- `belongs_to :account`
- `status:integer` with possible values:
    - `waiting_to_be_approved`
    - `approved`
    - `denied`
    - `sent`
    - `redeemed`
    - `completed`

###### Account
- `has_many :rewards`
- `email:string`
- `password_digest:string`
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

To submit your application please make a pull request to the https://github.com/blueboard/backend-assessment repository. In your PR, please provide Account details so that we can test your application. If you've chosen to implement additional features not listed above, please explain them briefly.

