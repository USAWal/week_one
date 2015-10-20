require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_one(:cart).inverse_of(:user).dependent(:nullify) }
end
