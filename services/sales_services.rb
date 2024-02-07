require_relative 'product_validation_services'

class SalesServices
  class << self
    def process_sale(item, quantity, price)
      total_price = 0.0
      total_tax = 0.0

      if ProductValidationServices.is_not_taxable_product?(item)
        # puts "NOT TAXABLE: #{item}" for debug only
        total_price, total_tax = calculate_total_cost(price, quantity, 0.0)
      else
        # puts "TAXABLE: #{item}" for debug only
        total_price, total_tax = calculate_total_cost(price, quantity, 0.1)
      end

      if ProductValidationServices.is_imported_product?(item)
        # puts "IMPORT TAXABLE: #{item}" for debug only
        aditional_tax = total_price * 0.05
        total_price = total_price + aditional_tax
        total_tax += aditional_tax
      end

      [total_price.round(2), total_tax.round(2)]

    end

    private

    def calculate_total_cost(price, quantity, tax, imported = false)
      # Calculate the subtotal (price multiplied by quantity)
      subtotal = price * quantity

      # Calculate the tax amount (10% of the subtotal)
      tax = subtotal * tax

      # Calculate the total cost (subtotal plus tax)
      total_cost = subtotal + tax

      # Return the total cost and tax
      [total_cost.round(2), tax.round(2)]
    end
  end
end
