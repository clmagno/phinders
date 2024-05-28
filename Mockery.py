from calendar import c
import csv
from os import read
from faker import Faker
import datetime
import argparse
import os


fake = Faker()
parser = argparse.ArgumentParser(description='Generate mock data for a given schema.')
parser.add_argument('input_file', help='Path to the cleaned CSV file containing the schema.')
args = parser.parse_args()

raw_csv_path = args.input_file

# Function to generate sample data based on the column data type
def generate_sample_data(data_type):
    if "VARCHAR" in data_type:
        return f"'{fake.word()}'"
    elif "STRING" in data_type:
        return f"'{fake.word()}'"
    elif "BIGINT" in data_type:
        return str(fake.random_number(digits=5))
    elif "INT" in data_type:
        return str(fake.random_int(min=0, max=1000))
    elif "TIMESTAMP" in data_type:
        return f"'{fake.date_time()}'"
    elif "DECIMAL" in data_type:
        return str(fake.pyDECIMAL(left_digits=5, right_digits=2, positive=True))
    else:
        return "NULL"

def generate_insert_query(csv_file_path, table_name):
    columns = []
    values = []

    with open(csv_file_path, newline='', encoding='utf-8') as csvfile:
        reader = csv.reader(csvfile)

        for row in reader:
            if row:  # Check if row is not empty
                column_info = row[0].strip('"').split()
                column_name = column_info[0].strip('`')
                data_type = column_info[1]
                columns.append(column_name)
                values.append(generate_sample_data(data_type))

    columns_str = ", ".join(columns)
    values_str = ", ".join(values)
    insert_query = f"INSERT INTO {table_name} ({columns_str}) VALUES ({values_str});"
    return insert_query

num_rows = input("Enter the number of rows of sample data you want to generate: ")
export_format = input("Do you want to export the data as a CSV file or as an INSERT query? (csv/insert): ")

try:
    num_rows = int(num_rows)
except ValueError:
    print("Invalid input for the number of rows. Please enter a valid INTeger.")
    exit()
if export_format.lower() not in ['csv', 'insert']:
    print("Invalid choice for export format. Please enter either 'csv' or 'insert'.")
    exit()



current_date = datetime.datetime.now().strftime("%Y-%m-%d")


if export_format.lower() == 'csv':
    output_dir = f'Data\csv\{current_date}'
    os.makedirs(output_dir, exist_ok=True)
    TIMESTAMP = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    csv_file_path = os.path.join(output_dir, f'output_{TIMESTAMP}.csv')
    with open(csv_file_path, mode='w', newline='', encoding='utf-8') as csv_file:
        writer = csv.writer(csv_file)
        
        with open(raw_csv_path, newline='', encoding='utf-8') as ddl_file:
            reader = csv.reader(ddl_file)
            schema = [row for row in reader if row] 
            columns = [row[0].strip('"').split()[0].strip('`') for row in schema]
            writer.writerow(columns)
            for _ in range(num_rows):
                values = [generate_sample_data(row[0].strip('"').split()[1]).strip("'") for row in schema]
                writer.writerow(values)
        print(f'{csv_file_path} has been created successfully!')
elif export_format.lower() == 'insert':
    output_dir = f'Data\sql\{current_date}'
    os.makedirs(output_dir, exist_ok=True)
    table_name = '`sit11_dp_gc_cnsm_anlt`.`psnt_subs_detl`'
    insert_queries = []
    for _ in range(num_rows):
        insert_query = generate_insert_query(raw_csv_path, table_name)
        insert_queries.append(insert_query)
    TIMESTAMP = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    sql_filename = os.path.join(output_dir, f"output_{TIMESTAMP}.sql")
    with open(sql_filename, 'w', encoding='utf-8') as sql_file:
        sql_file.write("\n".join(insert_queries))
    print(f'{sql_filename} has been created successfully!')
