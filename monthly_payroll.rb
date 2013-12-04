require 'pry'
require 'csv'
require_relative 'employee'
require_relative 'developer'
require_relative 'designer'
require_relative 'commission_sales_person'
require_relative 'quota_sales_person'
require_relative 'owner'
require_relative 'sale'




Employee.return_list_of_employees('employee_data.csv')

# ***Jimmy McMahon***
# Gross Salary: $7083.33
# Net Pay: $4958.33
# ***

# ***Bob Lob***
# Gross Salary: $4166.66
# Commission: $125
# Net Pay: $4254.16
# ***

# ...

