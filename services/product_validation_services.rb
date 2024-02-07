class ProductValidationServices
  NO_TAX_ITEMS = ['books', 'book', 'food', 'chocolates', 'chocolate', 'packet of headache pills'].freeze

  BASIC_TAX = 10 # 10%

  class << self
    def is_not_taxable_product?(item)
      NO_TAX_ITEMS.each do |word|
        return true if item.include?(word)
      end

      false
    end

    def is_imported_product?(item)
      item.include?('imported')
    end
  end
end
