require 'spec_helper'


describe 'Adding Todo_list tasks ' do
  let!(:todo_list) {TodoList.create(title: "My tewst todo_list", description: "Test description")}

  def visit_todo_list(list)
    visit "/todo_lists"

    within "#todo_list_#{todo_list.id}" do
      click_link "List items"
    end
  end


  it 'is successful with valid content' do
    skip "add test later"
  #   visit_todo_list(todo_list)
  #   click_link "Add"
  #   fill_in 'Content', with: "Fruits"
  #   click_button 'Add'
  #   expect(page).to have_content("Added new task")
  #   within('div.list-group') do
  #     expect(page).to have_content("Fruits")
  #   end
  end
end