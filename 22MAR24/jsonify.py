import csv
import json

def csv_to_json(csv_file, column_name):
    data=[]
    with open(csv_file, 'r') as file:
        reader = csv.DictReader(file)
        for row in reader:
            order_items = row.get('orderItems')
            if order_items:
                data.append(order_items)
        return json.dumps(data, indent=4,sort_keys=True, ensure_ascii=False)
csv_file = 'APPT_ORDER_20240322_001_01.csv'
column_name = 'orderItems'

json_data = csv_to_json(csv_file, column_name)
print(json_data)
