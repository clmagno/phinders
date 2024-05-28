import re
import csv
import argparse
import os
from datetime import datetime

def extract_table_name(input_file_path):
    table_name_regex = re.compile(r'CREATE TABLE IF NOT EXISTS (.+?)\(')
    with open(input_file_path, 'r', encoding='utf-8') as file:
        for line in file:
            match = table_name_regex.search(line)
            if match:
                full_table_name = match.group(1)
                table_name = full_table_name.split('.')[-1]
                return table_name
    return None

parser = argparse.ArgumentParser(description='Process a CSV file and clean it.')
parser.add_argument('input_file', help='Path to the raw CSV file to clean.')
args = parser.parse_args()

raw_csv_path = args.input_file

current_date = datetime.now().strftime("%Y-%m-%d")

output_dir = f'DDL\{current_date}'
os.makedirs(output_dir, exist_ok=True)

table_name = extract_table_name(raw_csv_path)

if table_name:
    output_csv_path = os.path.join(output_dir, f'{table_name.replace("`","")}_cleaned.csv')
else:
    output_csv_path = os.path.join(output_dir, 'cleaned_ddl.csv')


column_def_regex = re.compile(r'(\w+)\s+((?:\w+)(?:\(\d+(?:,\d+)?\))?)')

with open(raw_csv_path, mode='r', newline='', encoding='utf-8') as raw_file:
    
    with open(output_csv_path, mode='w', newline='', encoding='utf-8') as output_file:
        writer = csv.writer(output_file, delimiter=' ')
        
        for line in raw_file:
            print(line)
            matches = column_def_regex.findall(line)
            print(matches)
            for match in matches:
                column_name, data_type = match
                
                writer.writerow([column_name, data_type])

print(f"Cleaning complete. Output saved to {output_csv_path}")
