require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
  it { is_expected.to have_db_column(:description).of_type(:text) }
  it { is_expected.to have_db_column(:price).of_type(:float).with_options(null: false, default: 0.0) }
  it { is_expected.to have_db_column(:stock_level).of_type(:integer).with_options(null: false, default: 0) }

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :price }
  it { is_expected.to validate_presence_of :stock_level }

  its(:price)       { is_expected.to eq 0.0 }
  its(:stock_level) { is_expected.to eq 0 }
end
