require 'spec_helper'
#
#
describe 'Creating Todo list' do

  it 'Creates todo list' do

  visit '/todo_lists'
  click_link 'New Todo list'
  expect(page).to have_content 'New Todo List'

    fill_in "Title", with: "My test todo list"
    fill_in "Description", with: "My test todo list discription"

    click_button "Create Todo list"

    expect(page).to have_content "My test todo list"
  end

  it 'displays error if no title present' do

    expect(TodoList.count).to eq(0)

    visit '/todo_lists'
    click_link 'New Todo list'
    expect(page).to have_content 'New Todo List'

    fill_in "Title", with: ""
    fill_in "Description", with: "My test todo list discription"

    click_button "Create Todo list"

    expect(page).to have_content "error"

    expect(TodoList.count).to eq(0)

    visit "/todo_lists"

    expect(page).to_not have_content("My test todo list discription")

  end

end