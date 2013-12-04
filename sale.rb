require 'csv'
require 'pry'

class SalesData

  def self.monthly_sales
  sales_data = {}
  CSV.foreach('sales_data.csv', headers:true) do |row|
    if sales_data.has_key?(row[0])
      sales_data[row[0]] += row[1].to_i
    else
      sales_data[row[0]] = row[1].to_i
    end
    end
    sales_data
  end


end

#the Sale class should have a class method that returns a list of sales laoded from a CSV