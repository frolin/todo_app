require 'spec_helper'


describe 'Edit todo list' do

  let!(:todo_list) {TodoList.create(title: "My edit todo list", description: "edit me")}

  def update_todo_list(options={})
    options[:title] ||= "Edited My todo list"
    options[:description] ||= "Edited description"

    visit "/todo_lists"

    todo_list = options[:todo_list]

    within "#todo_list_#{todo_list.id}" do
      click_link "Edit"
    end

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]

    click_button "Update Todo list"
  end


  it 'updates todo list' do

    update_todo_list todo_list: todo_list

    todo_list.reload

    expect(page).to have_content("Todo list was successfully updated")
    expect(todo_list.title).to eq("Edited My todo list")
    expect(todo_list.description).to eq("Edited description")
  end

  it 'displays error if no title' do
    update_todo_list todo_list: todo_list, title: " "
    title = todo_list.title
    todo_list.reload
    expect(todo_list.title).to eq(title)
    expect(page).to have_content("error")
  end

end