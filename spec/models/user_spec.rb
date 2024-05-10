require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }

  it 'have one attached image' do
    expect(User.new.image).to be_an_instance_of(ActiveStorage::Attached::One)
  end

end
