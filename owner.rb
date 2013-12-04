class Owner < Employee
  attr_reader :quota, :bonus

  def initialize(name, base_salary, quota, bonus)
    super(name, base_salary)
    @quota = quota
    @bonus = bonus
  end

  def monthly_pay
    (gross_salary / 12).to_i
  end

  def bonus
    data = SalesData.monthly_sales
    sales_for_everyone = 0
    data.each do |person|
      sales_for_everyone += person[1]
    end

    if sales_for_everyone > @quota.to_i
      answer = "(yes) - $#{@bonus}"
    else
      answer = "(no)"
    end
    answer
  end

end