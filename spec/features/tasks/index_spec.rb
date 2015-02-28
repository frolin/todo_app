require 'spec_helper'

describe "View todo_list tasks" do

    let!(:todo_list) {TodoList.create(title: "My tewst todo_list", description: "Test description")}

    def visit_todo_list(list)
      visit "/todo_lists"

      within "#todo_list_#{todo_list.id}" do
        click_link "List items"
      end
    end

    it "displays the title of the todo list" do
      visit_todo_list(todo_list)
      within("h1") do
        expect(page).to have_content(todo_list.title)
      end

    end

    it "display no task when todo list is empty" do
      expect(page.all("div.list-group span.list-group-item").size).to eq(0)
    end

    it "displays task content when a todo list has items" do
        todo_list.tasks.create(content: "Vegatables")
        todo_list.tasks.create(content: "Fruts")
        todo_list.tasks.create(content: "Coffie")

        visit_todo_list(todo_list)
        expect(page.all("div.list-group span.list-group-item").size).to eq(3)

        within "div.list-group" do
          expect(page).to have_content("Vegatables")
          expect(page).to have_content("Fruts")
          expect(page).to have_content("Coffie")
       end
    end
end