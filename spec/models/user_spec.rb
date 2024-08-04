require 'rails_helper'

RSpec.describe User do
  subject { User.new(email: 'user@example.com') }

  it { is_expected.to respond_to(:email) }

  it '#email returns a string' do
    expect(subject.email).to match('user@example.com')
  end
end
