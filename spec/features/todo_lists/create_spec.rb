require 'spec_helper'
#
#
describe 'Creating Todo list' do

  def create_todo_list(options={})
    options[:title] ||= "My test todo list"
    options[:description] ||= "My test todo list discription"

    visit '/todo_lists'
    click_link '+'
    expect(page).to have_content 'New Todo List'

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]

    click_button "Create Todo list"
  end


  it 'Creates todo list' do
    create_todo_list
    expect(page).to have_content "My test todo list"
  end

  it 'displays error if no title present' do

    expect(TodoList.count).to eq(0)

    create_todo_list title: " "

    expect(page).to have_content "error"

    expect(TodoList.count).to eq(0)

    visit "/todo_lists"

    expect(page).to_not have_content("My test todo list discription")

  end

end