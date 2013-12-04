require 'pry'

class CommissionSalesPerson < Employee

  def initialize(name, base_salary, commission)
    super(name, base_salary)
    @commission = commission
  end

  def commission_dollars
    data = SalesData.monthly_sales
    sales_dollars = data[@name.split(' ')[1]]
    @commission_dollars = (sales_dollars * @commission.to_f * Employee::TAX_RATE).to_i
  end

  def monthly_pay
    data = (gross_salary + @commission_dollars).to_i
    data / 12
  end

end



# Ricky Bobby - CommissionSalesPerson
# Gross Salary: $28000
# Commision met: ((((puts yesss or nooo)
# Commission: $1.5
# base salary: $40000
# monthly pay: $2333