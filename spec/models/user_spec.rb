require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_one(:cart).inverse_of(:user).dependent(:nullify) }
  it { is_expected.to have_many(:products).inverse_of(:seller).dependent(:destroy) }
  it { is_expected.to have_many(:shops).inverse_of(:owner).dependent(:restrict_with_error) }
end
