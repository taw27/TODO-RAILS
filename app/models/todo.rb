class Todo < ApplicationRecord
  VALID_STATUSES = %w[pending completed]

  validates :todo, presence: true
  validates :status, inclusion: { in: VALID_STATUSES }

  after_initialize :set_defaults, unless: :persisted?

  def pending?
    status == 'pending'
  end

  def set_defaults
    self.status ||= 'pending'
  end
end
