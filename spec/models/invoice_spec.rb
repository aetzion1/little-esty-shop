require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "relationships" do
    it { should have_many :transactions }
    it { should have_many :invoice_items }
    it { should have_many :items }
    it { should belong_to :customer }
    it { should belong_to :merchant }
  end

  before :each do
    @merchant1 = Merchant.create!(name: "Robert Heath")
    @merchant2 = Merchant.create!(name: "Liam and Sons and Daughters")

    @item1 = Item.create!(name: "magic pen", description: "special", unit_price: 9.10, enabled: true, merchant_id: @merchant1.id)
    @item2 = Item.create!(name: "preposterous pencil", description: "big", unit_price: 8.50, enabled: true, merchant_id: @merchant1.id)
    @item3 = Item.create!(name: "fantastic fountain pen", description: "small", unit_price: 55.00, merchant_id: @merchant1.id)
    @item4 = Item.create!(name: "My shoes", description: "too big", unit_price: 200, merchant_id: @merchant2.id)
    @item5 = Item.create!(name: "my tie", description: "too tight", unit_price: 300, merchant_id: @merchant2.id)

    @customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Steel')
    @customer_2 = Customer.create!(first_name: 'Phoebe', last_name: 'Link')
    @customer_3 = Customer.create!(first_name: 'Rachel', last_name: 'Doop')
    @customer_4 = Customer.create!(first_name: 'Other', last_name: 'Diny')
    @customer_5 = Customer.create!(first_name: 'Macy', last_name: 'Finy')
    @customer_6 = Customer.create!(first_name: 'Grayson', last_name: 'Niny')

    @invoice_1 = Invoice.create!(merchant_id: @merchant1.id, customer_id: @customer_1.id, status: 1)
    @invoice_2 = Invoice.create!(merchant_id: @merchant1.id, customer_id: @customer_1.id, status: 1)
    @invoice_3 = Invoice.create!(merchant_id: @merchant1.id, customer_id: @customer_2.id, status: 1)
    @invoice_4 = Invoice.create!(merchant_id: @merchant1.id, customer_id: @customer_3.id, status: 1)
    @invoice_5 = Invoice.create!(merchant_id: @merchant2.id, customer_id: @customer_4.id, status: 1)
    @invoice_6 = Invoice.create!(merchant_id: @merchant2.id, customer_id: @customer_5.id, status: 1)
    @invoice_7 = Invoice.create!(merchant_id: @merchant2.id, customer_id: @customer_6.id, status: 2)

    @ii1 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item1.id, quantity: 9, unit_price: 10, status: 2, created_at: "2012-03-27 14:54:09")
    @ii2 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item1.id, quantity: 1, unit_price: 10, status: 0, created_at: "2012-03-29 14:54:09")
    @ii3 = InvoiceItem.create!(invoice_id: @invoice_3.id, item_id: @item2.id, quantity: 2, unit_price: 8, status: 2, created_at: "2012-03-28 14:54:09")
    @ii4 = InvoiceItem.create!(invoice_id: @invoice_4.id, item_id: @item3.id, quantity: 3, unit_price: 5, status: 2, created_at: "2012-03-30 14:54:09")
    @ii6 = InvoiceItem.create!(invoice_id: @invoice_5.id, item_id: @item4.id, quantity: 1, unit_price: 1, status: 2, created_at: "2012-04-01 14:54:09")
    @ii7 = InvoiceItem.create!(invoice_id: @invoice_6.id, item_id: @item5.id, quantity: 1, unit_price: 3, status: 2, created_at: "2012-04-02 14:54:09")
    @ii8 = InvoiceItem.create!(invoice_id: @invoice_7.id, item_id: @item5.id, quantity: 1, unit_price: 5, status: 2, created_at: "2012-04-03 14:54:09")
    @ii9 = InvoiceItem.create!(invoice_id: @invoice_7.id, item_id: @item4.id, quantity: 1, unit_price: 1, status: 1, created_at: "2012-04-04 14:54:09")

    @transaction1 = Transaction.create!(credit_card_number: 203942, result: 0, invoice_id: @invoice_1.id)
    @transaction2 = Transaction.create!(credit_card_number: 230948, result: 0, invoice_id: @invoice_2.id)
    @transaction3 = Transaction.create!(credit_card_number: 234092, result: 0, invoice_id: @invoice_3.id)
    @transaction4 = Transaction.create!(credit_card_number: 230429, result: 1, invoice_id: @invoice_4.id)
    @transaction5 = Transaction.create!(credit_card_number: 102938, result: 0, invoice_id: @invoice_5.id)
    @transaction6 = Transaction.create!(credit_card_number: 879799, result: 0, invoice_id: @invoice_6.id)
    @transaction7 = Transaction.create!(credit_card_number: 203942, result: 0, invoice_id: @invoice_7.id)

  end

  describe 'class methods' do
    it 'provides incomplete invoices' do
      expect(Invoice.incomplete).to eq([])
    end

  end

  describe 'instance methods' do
    it 'provides a formatted created date' do
    end

    it "finds customer name" do
    end

    it "can calculate total success" do
    end

    it "can find customer on invoice" do
    end

    it "can find items on invoice" do
    end

    it "can find invoice item data for an item on invoice" do
    end
  end


end