class Task < ActiveRecord::Base
  belongs_to :todo_list

  scope :completed, -> {where.not(completed_at: nil)}

  def complete?
    !completed_at.blank?
  end

end
