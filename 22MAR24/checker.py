import pandas as pd
import json
from tabulate import tabulate


def ord_items():
    df = pd.read_csv('APPT_ORDER_20240322_001_01.csv')
    orderItems = df.iloc[:,10]

    for row in range(len(orderItems)):
        replacements = {'[':'',']':''}
        data = ''.join(replacements.get(c,c) for c in orderItems[row])
        try:
            print(row, eval(data).keys())
        except:
            pass
def colm():
    df = pd.read_csv('APPT_PRODUCT_20240322_001_01.csv')
    
    print(df.columns.tolist())

ord_items()
