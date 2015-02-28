require 'spec_helper'

describe "View todo_list tasks" do

    let!(:todo_list) {TodoList.create(title: "My tewst todo_list", description: "Test description")}

    it "display no items when todo list is emty" do
      visit "/todo_lists"

      within "#todo_list_#{todo_list.id}" do
        click_link "List items"
      end
    expect(page).to have_content("Tasks#index")
    end

end