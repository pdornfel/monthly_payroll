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
      @bonus = 0
    end
    answer
  end


  def monthly_pay
    data = gross_salary + @bonus
    data / 12
  end
end