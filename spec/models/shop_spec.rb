require 'rails_helper'

RSpec.describe Shop, type: :model do
  it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }
  it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }

  it { is_expected.to validate_presence_of :owner }
  it { is_expected.to validate_presence_of :name }
  context do
    subject { create :shop }
    it { is_expected.to validate_uniqueness_of :name }
  end

  it { is_expected.to belong_to(:owner).with_foreign_key(:user_id).class_name('User') }
  it { is_expected.to have_and_belong_to_many :products }
  it { is_expected.to have_many(:categories).through(:products) }

  it { is_expected.to have_db_index(:name).unique(true) }

  context 'has some products with identical categories' do
    subject { create :shop }
    let(:categories) { create_list :category, 5 }
    before(:each) do
      create :category
      subject.products << create_list(:product, 3, categories: categories, seller: subject.owner)
    end

    its(:categories) { is_expected.to match_array categories }
  end
end
