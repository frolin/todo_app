require 'spec_helper'

describe Task, type: :model do
  it { should belong_to(:todo_list)}
end
