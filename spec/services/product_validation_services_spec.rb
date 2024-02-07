require_relative '../../services/product_validation_services'

RSpec.describe ProductValidationServices do
  describe '#is_not_taxable_product?' do
    context 'when the item is not taxable' do
      it 'returns true' do
        non_taxable_items = ['book', 'chocolates', 'packet of headache pills']

        non_taxable_items.each do |item|
          expect(ProductValidationServices.is_not_taxable_product?(item)).to eq(true)
        end
      end
    end

    context 'when the item is taxable' do
      it 'returns false' do
        taxable_items = ['music CD', 'perfume', 'bottle of wine']

        taxable_items.each do |item|
          expect(ProductValidationServices.is_not_taxable_product?(item)).to eq(false)
        end
      end
    end
  end

  describe '#is_imported_product?' do
    context 'when the item is imported' do
      it 'returns true' do
        imported_items = ['imported chocolates', 'imported perfume']

        imported_items.each do |item|
          expect(ProductValidationServices.is_imported_product?(item)).to eq(true)
        end
      end
    end

    context 'when the item is not imported' do
      it 'returns false' do
        non_imported_items = ['book', 'music CD', 'bottle of wine']

        non_imported_items.each do |item|
          expect(ProductValidationServices.is_imported_product?(item)).to eq(false)
        end
      end
    end
  end
end
