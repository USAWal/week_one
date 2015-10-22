require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }
  it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
  it { is_expected.to have_db_column(:description).of_type(:text) }
  it { is_expected.to have_db_column(:price).of_type(:float).with_options(null: false, default: 0.0) }
  it { is_expected.to have_db_column(:stock_level).of_type(:integer).with_options(null: false, default: 0) }
  it { is_expected.to have_db_column(:pictures).of_type(:json) }

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :price }
  it { is_expected.to validate_presence_of :stock_level }
  it { is_expected.to validate_presence_of :seller }

  its(:price)       { is_expected.to eq 0.0 }
  its(:stock_level) { is_expected.to eq 0 }

  it { is_expected.to have_and_belong_to_many :categories }
  it { is_expected.to belong_to(:seller).with_foreign_key(:user_id).class_name('User') }
end
