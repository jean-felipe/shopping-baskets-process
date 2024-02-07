require_relative '../../services/sales_services'

RSpec.describe SalesServices do
  describe '#process_sale' do
    context 'when the product is not taxable' do
      it 'calculates total price and tax correctly' do
        item = 'book'
        quantity = 1
        price = 12.49

        total_price, total_tax = SalesServices.process_sale(item, quantity, price)

        expect(total_price).to eq(12.49)
        expect(total_tax).to eq(0.0)
      end
    end

    context 'when the product is taxable' do
      it 'calculates total price and tax correctly' do
        item = 'music CD'
        quantity = 1
        price = 14.99

        total_price, total_tax = SalesServices.process_sale(item, quantity, price)

        expect(total_price).to eq(16.49) # price + 10% tax
        expect(total_tax).to eq(1.50)    # 10% tax
      end
    end

    context 'when the product is imported and taxable' do
      it 'calculates total price and tax correctly' do
        item = 'imported bottle of perfume'
        quantity = 1
        price = 47.50

        total_price, total_tax = SalesServices.process_sale(item, quantity, price)

        expect(total_price).to eq(54.86) # price + 10% tax + 5% import tax
        expect(total_tax).to eq(7.36)    # 10% tax + 5% import tax
      end
    end

    context 'when the product is imported and not taxable' do
      it 'calculates total price and tax correctly' do
        item = 'imported box of chocolates'
        quantity = 1
        price = 10.00

        total_price, total_tax = SalesServices.process_sale(item, quantity, price)

        expect(total_price).to eq(10.50) # price + 5% import tax
        expect(total_tax).to eq(0.50)    # 5% import tax
      end
    end
  end
end
