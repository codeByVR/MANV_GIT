![MANV RED Logo](./icon-128.webp)

# MANV RED

MANV RED is an interactive training application
for doctors to simulate and train for a Mass
Casualty Incident (MCI) scenario. The app supports
multi-user operations and is built using Ionic and
Directus, making it accessible on browsers, iOS,
and Android devices.

## Table of Contents

- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Migrate Data](#migrate-data)
- [Take and Apply Snapshots](#take-and-apply-snapshots)
- [Import / Export DB Data](#import-export-db-data)
- [Delete Service](#delete-service)
- [Configuration](#configuration)
- [Example Data](#example-data)

## Getting Started

### Prerequisites

Ensure you have the following installed:

- Git
- Docker

### Installation

Clone the repository:

_The Cloning of the Repository is not necessary if
it already exists from initialising the
frontend-app_

```
git clone https://bitbucket.hs-ansbach.de/scm/aew24g1/frontend-app.git
cd frontend-app
cd backend
```

Start the containers:  
To start the backend service, ensure that the
Docker daemon is running. Start the service using
Docker Compose:

```
docker compose up -d
```

Apply the initial snapshot:

_Hint: the default config for container names can
be found at ./compose.yaml_

- _\<directus container name\>
  **backend-directus-1**_
- _\<postgres container name\>
  **backend-postgres-1**_
- _\<directus postgres user\> **directus**_
- _\<database name\> **directus**_

```
docker exec -it <directus container name> npx directus schema apply --yes ./snapshots/init.yaml
```

Apply the initial SQL:

Move into the postgres container:

```
docker exec -it <postgres container name> /bin/bash
```

Execute the initial SQL:

```
psql -U <directus postgres user> <database name> < /sqldump/init.sql
```

Restart the backend service

```
docker compose down
docker compose up
```

**Your Backend is now available on localhost:8055.
Login with the default user: admin@example.com |
password**

Fix Triggers:

Unfortunately, Flows won't trigger if you import
them using a SQL dump. Therefore, you need to log
in to your Directus admin frontend as an admin
(admin@example.com | password), locate the Flows
in the settings, and for both Flows (BlockDevice
and ExaminationRecognice), edit the Flow. Edit the
trigger (the first Flow element) by clicking the
pen icon (you don't need to change anything), then
save the Flow.

**Congratulations, you have started your MANV RED
backend!**

## Migrate Data

**Migrating data may cause a permission error.
Restart your Directus container to fix these
errors.**

### Take and Apply Snapshots

To ensure smooth development in teams using Git
and to distribute changes in the Directus data
model across members, utilize the built-in
snapshot generator.

1. **Take a snapshot:**

```
docker exec -it <container name> npx directus schema snapshot --yes ./snapshots/<filename>.yaml
```

2. **Apply a snapshot:**

```
docker exec -it <container name> npx directus schema apply --yes ./snapshots/<filename>.yaml
```

**Attention: Make sure you are in the correct Git
branch for these commands!**

### Import / Export DB Data

Snapshots offer the functionality to import or
export the data schema. If you also wish to
migrate your data to or from the database, you can
use SQL dumps.

1. **Move into the postgres container:**

```
docker exec -it <postgres container name> /bin/bash
```

**Attention: Import / Export data only when you
are using the same snapshot version!**

**Importing data to a database with existing data
may result in unpredictable data loss.**

#### Export Data:

If you want to export flows as well, use the
`--clean` option.

```
pg_dump -U <directus postgres user> <database name> > /sqldump/<file name>.sql
```

#### Import Data:

```
psql -U <directus postgres user> <database name> < /sqldump/<file name>.sql
```

## Delete Service

To delete the service, run:

```
docker compose down
```

## Configuration

Take a look at the `compose.yaml` file to
configure your backend service as needed.

You should also refer to the image documentation
from:

- Postgres: https://hub.docker.com/_/postgres
- Directus:
  https://docs.directus.io/self-hosted/docker-guide.html

## Example Data

We provide you with some example data, including
everything you need to test a basic MANV scenario.

### Install Example Data

1. **Follow the
   [Getting Started](#getting-started) steps.**
2. **Copy all files from `exampleUpload` to
   `uploads`.**
3. **Copy `exampleData/exampleData.sql` to
   `sqldump`.**
4. **Import Data:**

   Run the import command as shown in
   [Import Data](#import-data) with
   `exampleData.sql` as the file.

5. **Restart the Directus container.**

### Included Data:

- 10 Patients
- 5 Rooms
- 5 Symptoms
- 5 Devices
- Users:
  - Admin User (Username: admin@example.com |
    Password: password)
  - Dr. Anna Nass (Username: a.nass@manv.de |
    Password: manvred)
  - Dr. Albert Tross (Username: a.tross@manv.de |
    Password: manvred)
  - Dr. Klara Himmel (Username: k.himmel@manv.de |
    Password: manvred)
  - Dr. Karl Kopf (Username: k.kopf@manv.de |
    Password: manvred)
- Examination Result Data:

![MANV RED Logo](./exampleData/QrCodes.png)
