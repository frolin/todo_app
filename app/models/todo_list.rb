class TodoList < ActiveRecord::Base
  has_many :tasks

  validates :title, presence: true

end
