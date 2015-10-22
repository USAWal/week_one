require 'rails_helper'

RSpec.describe Shop, type: :model do
  it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }

  it { is_expected.to validate_presence_of :owner }

  it { is_expected.to belong_to(:owner).with_foreign_key(:user_id).class_name('User') }
  it { is_expected.to have_and_belong_to_many :products }
end
