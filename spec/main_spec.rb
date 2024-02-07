require_relative '../main'

RSpec.describe '#split_input' do
  it 'returns item, price, and quantity' do
    input = '1 book at 12.49'
    item, price, quantity = split_input(input)
    expect(item).to eq('book')
    expect(price).to eq(12.49)
    expect(quantity).to eq(1)
  end
end

RSpec.describe '#process_inputs' do
  it 'returns products, final price, and final taxes' do
    inputs = ['1 book at 12.49']
    products, final_price, final_taxes = process_inputs(inputs)
    expect(products).to eq(['1 book: 12.49'])
    expect(final_price).to eq(12.49)
    expect(final_taxes).to eq(0.0)
  end
end
