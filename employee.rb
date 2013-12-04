require 'pry'
class Employee

  TAX_RATE = 0.3

  attr_reader :name, :base_salary
  def initialize(name, base_salary)
    @name = name
    @base_salary = base_salary.to_i
  end
   # the Employee class should have a class method that returns a list of employees loaded from a CSV
  def self.return_list_of_employees(filename)
    raw_data = File.read(filename)
    raw_data = CSV.parse(raw_data, headers:true)
    @employees = []
    raw_data.each do |row|
      if row['Employee Type'] == 'developer'
        @employees << Developer.new(row['Name'], row['Base Salary'])
      elsif row['Employee Type'] == 'designer'
        @employees << Designer.new(row['Name'], row['Base Salary'])
      elsif row['Employee Type'] == 'commission'
        @employees << CommissionSalesPerson.new(row['Name'], row['Base Salary'], row['Commission'])
      elsif row['Employee Type'] == 'quota'
        @employees << QuotaSalesPerson.new(row['Name'], row['Base Salary'], row['Quota Level'], row['Bonus'])
      elsif row['Employee Type'] == 'owner'
        @employees << Owner.new(row['Name'], row['Base Salary'], row['Quota Level'], row['Bonus'])
      end
    end
    self.display_employees
  end

  def self.display_employees
    @employees.each do |employee|
      puts "*** #{employee.name} - #{employee.class} ***"
      puts "Base Salary: $#{employee.base_salary}"
      puts "Gross Salary: $#{employee.gross_salary}"
      if employee.class == CommissionSalesPerson
        puts "Commision Dollars: $#{employee.commission_dollars}"
      elsif employee.class == QuotaSalesPerson || employee.class == Owner
        puts "Bonus met? #{employee.bonus}"
      end
      puts "monthly pay: $#{employee.monthly_pay}"
      puts
    end
  end

  def gross_salary
    (@base_salary - (@base_salary * TAX_RATE)).to_i
    # a gross_salary instance method should be defined in the Employee class
  end

end
