class QuotaSalesPerson < Employee
  attr_reader :quota, :bonus

  def initialize(name, base_salary, quota, bonus)
    super(name, base_salary)
    @quota = quota
    @bonus = bonus.to_i
  end

  def bonus
    data = SalesData.monthly_sales
    sales_for_person = (data[@name.split(' ')[1]].to_i)
    if sales_for_person > @quota.to_i
      answer = "(yes) - $#{@bonus}"
    else
      answer = "(no)"
    end
    answer
  end


  def monthly_pay
    (gross_salary + @bonus / 12).to_i
  end
end