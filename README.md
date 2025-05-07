# resumeonrails

A Ruby on Rails application for creating and managing professional resumes, featuring user authentication, a two-column editor with live preview, and autosave functionality.

---

### Prerequisites

The setup steps expect the following tools to be installed on your system.

- Git
- Ruby - 3.4.2
- Rails - 8.0.2
- Node.js (for JavaScript runtime, used by `tailwindcss-rails`)
- SQLite3

---

### Setup Instructions

##### 1. Check out the repository

```bash
git clone https://github.com/BradenEM/resumeonrails.git
cd resumeonrails
```

##### 2. Install dependencies

```bash
bundle install
```

##### 3. Create and set up the database

```bash
rails db:create
rails db:migrate
rails db:setup
```

##### 4. Start the Rails server

```bash
rails s
```
