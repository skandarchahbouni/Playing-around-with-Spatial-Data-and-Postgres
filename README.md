# Playing around with Spatial Data and Postgres 🌐📊

This project uses the Microsoft Geolife dataset to perform spatial data analysis and classification using a PostgreSQL database with MobilityDB and PostGIS extensions.

## Project Structure 🛏️

- **data/**: Contains the Geolife dataset provided by Microsoft.
- **postgres_setup/**: Includes a `docker-compose.yml` file to set up:
  - PostgreSQL database
  - pgAdmin for database management
  - MobilityDB and PostGIS extensions for spatial and temporal data analysis.
- **queries.sql**: Contains spatial queries to analyze the data using the MobilityDB extension.
- **main.ipynb**: Jupyter Notebook to load the dataset into the PostgreSQL database.
- **classification.ipynb**: Jupyter Notebook for performing classifications on the dataset.

## How to Use 🔧

1. **Set Up the Database**
   - Navigate to the `postgres_setup/` directory.
   - Run `docker-compose up` to start the PostgreSQL database and pgAdmin.

2. **Load the Data**
   - Open `main.ipynb` and execute the cells to load the Geolife dataset into the database.

3. **Run Queries**
   - Use the SQL queries in `queries.sql` to analyze the data.

4. **Perform Classification**
   - Open `classification.ipynb` to perform data classification tasks.

## Requirements 🛠️

- Docker and Docker Compose
- Jupyter Notebook

## Some screenshots 🖼️
<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/8e08c82a-763c-4558-b0de-38b13029050d" alt="Image 1" width="400"/></td>
    <td><img src="https://github.com/user-attachments/assets/a183d2cc-9ffc-4122-9288-17ceda337aa3" alt="Image 2" width="400"/></td>
  </tr>
</table>


