<a name="readme-top"></a>

<div align="center">

  <img src="./murple_logo.png" alt="logo" width="140"  height="auto" />
  <br/>


</div>
<!--
HOW TO USE:
This is an example of how you may give instructions on setting up your project locally.

Modify this file to match your project and remove sections that don't apply.

REQUIRED SECTIONS:
- Table of Contents
- About the Project
  - Built With
  - Live Demo
- Getting Started
- Schema
- Authors
- Future Features
- Contributing
- Show your support
- Acknowledgements
- License

After you're finished please remove all the comments and instructions!
-->

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 Vet Clinic Database ](#-vet-clinic-database-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Connect to your PostgreSQL server with psql](#connect-to-your-postgresql-server-with-psql)
    - [Create the database](#create-the-database)
    - [Connect to the database](#connect-to-the-database)
  - [ Screenshots ](#-screenshots-)
  - [📄 Schema ](#-schema-)
  - [👥 Authors ](#-authors-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# 📖 Vet Clinic Database <a name="about-project"></a>

**Vet Clinic Database** is a Relational database to create the data structure for a vet clinic

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **CREATE DATABASE**
- **INSERT ANIMALS**
- **QUERY ANIMALS**
- **ALTER TABLES**
- **TRANSACTIONS**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- PostgreSQL server installed and running
- psql installed

### Setup

Clone this repository to your desired folder:

Example commands:

```
  git clone https://github.com/normainobary2021/vet-clinic-3.git
  cd vet-clinic-3
```

### Connect to your PostgreSQL server with psql
    
```
  psql
```

### Create the database

```
  CREATE DATABASE vet_clinic;
```

### Connect to the database

```
  \c vet_clinic
```

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database. **Important note: this file might include queries that make changes in the database (e.g., remove records). Use them responsibly!**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Screenshots <a name="screenshots"></a>

![1](https://user-images.githubusercontent.com/87012757/213214371-f84eab9f-bb04-4bea-bed5-e1000ece6c38.png)
![2](https://user-images.githubusercontent.com/87012757/213214386-794a2139-31f9-4b41-af09-e651e547fff9.png)


### Schema <a name="schema"></a>
N/A


<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Norman Ainobushoborozi**

- GitHub: [@normainobary2021](https://github.com/normainobary2021)
- Twitter: [@NormanAinobush2](https://twitter.com/NormanAinobush2)
- LinkedIn: [@norman-ainobushoborozi](https://www.linkedin.com/in/norman-ainobushoborozi/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project, please give it a ⭐️!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

- N/A

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE.md) licensed.

_NOTE: we recommend using the [MIT license](https://choosealicense.com/licenses/mit/) - you can set it up quickly by [using templates available on GitHub](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/adding-a-license-to-a-repository). You can also use [any other license](https://choosealicense.com/licenses/) if you wish._

<p align="right">(<a href="#readme-top">back to top</a>)</p>
