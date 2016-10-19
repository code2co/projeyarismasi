require 'rails_helper'

RSpec.describe Batch, type: :model do
  it { should validate_presence_of(:due_date) }
end
