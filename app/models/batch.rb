# == Schema Information
#
# Table name: batches
#
#  id         :integer          not null, primary key
#  due_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#

class Batch < ApplicationRecord
  has_many :admissions
  validates :due_date, presence: true

  def self.current
    where("due_date >= ?", Date.today).first
  end
end
