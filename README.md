
# Product Service

This is the `Product Service` application, a Ruby on Rails project designed to manage product-related operations.

## Table of Contents

- [Installation](#installation)
- [Environment Configuration](#environment-configuration)
- [Database Setup](#database-setup)
- [Running the Service](#running-the-service)
- [Seeding the Database](#seeding-the-database)
- [Running Tests](#running-tests)
- [Linting and Code Formatting](#linting-and-code-formatting)
- [API Documentation](#api-documentation)
- [Setup - Action Cable with Postman](#setup---action-cable-with-postman)
- [Contributing](#contributing)
- [License](#license)

## Installation

### Prerequisites

Ensure you have the following installed on your machine:

- [Ruby](https://www.ruby-lang.org/en/documentation/installation/) (version 3.0.0 or higher)
- [Rails](https://guides.rubyonrails.org/getting_started.html#installing-rails) (version 6.0 or higher)
- [SQLite3](https://www.sqlite.org/download.html)

### Setup

Clone the repository:

```bash
git clone git@github.com:persada21/product_service.git
cd product_service
```

Install the required gems:

```bash
bundle install
```

## Environment Configuration

Before running the application, you need to set up your environment variables. Follow these steps:

1. **Create a `.env` file**:

   In the root directory of the project, create a `.env` file by copying the provided `.env.example` file:

   ```bash
   cp .env.example .env
   ```

2. **Configure the environment variables**:

   Open the `.env` file and update the placeholder values with your own configuration:

   ```bash
   # Sendinblue/Brevo SMTP settings
   SENDINBLUE_SMTP_ADDRESS=smtp-relay.brevo.com
   SENDINBLUE_SMTP_PORT=587
   SENDINBLUE_SMTP_USERNAME=your_email_sendin_blue_or_brevo
   SENDINBLUE_SMTP_PASSWORD=your_password_sendin_blue_or_brevo
   MAILER_DOMAIN=yourdomain.com
   ```

   Make sure to replace `your_*` placeholders with your actual configuration values.

## Database Setup & Configuration

Set up the database and run migrations:

```bash
rails db:create
rails db:migrate
```

## Seeding the Database

To populate the database with initial data, run the following command:

```bash
rails db:seed
```

This command will execute the seed data located in `db/seeds.rb`.

## Running the Service

Start the Rails server:

```bash
rails server
```

The service should now be running on `http://localhost:3000`.

## Running Tests

To run the test suite, use the following command:

```bash
bundle exec rspec
```

This will run all the tests defined in the `spec/` directory.

## Linting and Code Formatting

This project uses [StandardRB](https://github.com/testdouble/standard) for linting and code formatting. To check for linting issues and automatically fix them, run:

```bash
bundle exec standardrb --fix
```

This will apply StandardRB's formatting rules to the entire codebase.

## API Documentation

For detailed API documentation, refer to the Postman collection:

[Product Service API Documentation](https://documenter.getpostman.com/view/9243887/2sAXjM2qpd)

## Setup - Action Cable with Postman

To interact with Action Cable in the Product Service, follow the steps below using Postman:

### Step 1: Create a New Request

1. Open Postman and create a new request.
2. Set the request type to **WebSocket**.

### Step 2: Enter the WebSocket URL

Enter the following URL in the request URL field:

```bash
ws://localhost:3000/cable
```

### Step 3: Subscribe to a Channel

To subscribe to a channel, send the following JSON payload:

```json
{
  "command": "subscribe",
  "identifier": "{\"channel\":\"ProductsChannel\"}"
}
```

This will connect you to the `ProductsChannel` in your Rails application, allowing you to receive real-time updates via WebSocket.

### Additional Information

- Make sure your Rails server is running before trying to connect.
- You can use this setup to test real-time features like broadcasting product updates or notifications.

## Contributing

If you wish to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes and commit them (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```
