# database.py
# Handles all the methods interacting with the database of the application.
# Students must implement their own methods here to meet the project requirements.

import os
import pymysql.cursors
from prettytable import PrettyTable

db_host = os.environ['DB_HOST']
db_username = os.environ['DB_USER']
db_password = os.environ['DB_PASSWORD']
db_name = os.environ['DB_NAME']


def connect():
    try:
        conn = pymysql.connect(host=db_host,
                               port=3306,
                               user=db_username,
                               password=db_password,
                               db=db_name,
                               charset="utf8mb4",
                               cursorclass=pymysql.cursors.DictCursor)
        print("Bot connected to database {}".format(db_name))
        return conn
    except:
        print(
            "Bot failed to create a connection with your database because your secret environment variables "
            + "(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME) are not set".format(
                db_name))
        print("\n")


# Commands

# 1.  /region-deposits <Deposit amount> <year y> <year z>
# (e.g /region-deposits 100 2020 2022)


# 2. /atm-balance-pol <balance> <police alerts>
# (e.g /atm-balance-pol 5000 4)


# For nice formatting
def format_data(headers, rows):
    # formats the data in a nice way
    table = PrettyTable()
    table.field_names = headers
    for row in rows:
        table.add_row(row)
    return table

def get_response(msg):
    data = msg.split()
    errors = []
    response = None
    command = data[0]
    if "/region-deposits" in command:
        if not data[1] or not data[2] or not data[3]:
            errors.append("You are missing an argument")
        else:
            deposit = data[1]
            year1 = data[2]
            year2 = data[3]
            response = business_rule_1(deposit, year1, year2)
    elif " /atm-balance-pol" in command:
        if not data[1] or not data[2]:
            errors.append("You are missing arguments")
        else:
            balance = data[1]
            polAlerts = data[2]
            response = business_rule_2(balance, polAlerts)

    if len(errors) >= 1:
        return errors
    return response





# 1. For each region, find the total number of deposit transactions that deposited more than x, in-between years y and z.
#    Show region, deposits, and deposit amount
def business_rule_1(deposit, year1, year2):
  #output = None
  conn = connect()
  rows = []
  headers = ["Region", "Deposit", "Amount"]
  if conn:
    # there is a connecion with the database
    cursor = conn.cursor()
    query ="""SELECT R.region_id AS "Region", D.deposit_id AS "Deposit", D.amount AS Amount
              FROM Region R, Deposit D
              WHERE D.amount > %s AND
              D.transaction_id IN (SELECT S.session_id
                                        FROM Session S
                                        WHERE EXTRACT(YEAR FROM S.session_create) BETWEEN %s AND %s)
              GROUP BY R.region_id"""
    # %s is a wildc
    variable = (deposit, year1, year2)
    cursor.execute(query, variable)
    data = cursor.fetchall() # returns all the results from the query
    if data: # checks that data is not null
      for deposit_data in data:
        row = []
        region = deposit_data["Region"]
        deposit = deposit_data['Deposit']
        amount = deposit_data['Amount']
        row.append(region)
        row.append(deposit)
        row.append(amount)
        rows.append(row)
    output = format_data(headers, rows)
    print(output)
    return output
  conn.close()
  return "There is an internal problem. Try again later."
business_rule_1(10000, 2000, 2030)



# 2. Find all ATMs with a balance less than x and that has alerted the police y amount of times.
#    Show ATM, balance, police alerts
def business_rule_2(balance, polAlerts):
  #output = None
  conn = connect()
  rows = []
  headers = ["ATM", "Balance", "Police Alerts"]
  if conn:
    # there is a connecion with the database
    cursor = conn.cursor()
    query ="""SELECT A.atm_id AS "ATM", C.cash_amount AS Balance, A.polAlerts AS PoliceAlerts
              FROM ATM A
              JOIN Supply S ON A.atm_id = S.sup_id
              JOIN Cash C ON S.sup_id = C.cash_id
              HAVING C.cash_amount < %s AND A.polAlerts = %s"""
    # %s is a wildc
    variable = (balance, polAlerts)
    cursor.execute(query, variable)
    data = cursor.fetchall() # returns all the results from the query
    if data: # checks that data is not null
      for atm_data in data:
        row = []
        atm = atm_data['ATM']
        atmBal = atm_data['Balance']
        policeAlerts = atm_data['PoliceAlerts']
        row.append(atm)
        row.append(atmBal)
        row.append(policeAlerts)
        rows.append(row)
    output = format_data(headers, rows)
    print(output)
    return output
  conn.close()
  return "There is an internal problem. Try again later."


business_rule_2(10000, 2)
