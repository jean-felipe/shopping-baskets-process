require_relative './services/sales_services'

def split_input(input)
  data = input.split(' ')
  quantity = data.first.to_i
  price = data.last.to_f

  data.pop # remove 'price
  data.pop # remove word 'at'
  data.shift # remove quantity
  item = data.join(' ')

  [item, price, quantity]
end

def get_user_input
  inputs = []

  puts "Enter your inputs (type 'confirm' to finish):"

  loop do
    input = gets.chomp
    break if input.downcase == 'confirm'
    inputs << input
  end

  inputs
end

def process_inputs(inputs)
  final_taxes = 0.0
  final_price = 0.0
  products = []

  inputs.each do |input|
    item, price, quantity = split_input(input)

    price, taxes = SalesServices.process_sale(item, price, quantity)
    products << "#{quantity} #{item}: #{price.round(2)}"
    final_price += price
    final_taxes += taxes
  end

  [products, final_price, final_taxes]
end

inputs = get_user_input
products, final_price, final_taxes = process_inputs(inputs)

products.each do |product|
  puts product
end

puts "Sales Taxes: #{final_taxes.round(2)}"
puts "Total: #{final_price.round(2)}"
