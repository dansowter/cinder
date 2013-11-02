require 'spec_helper'

describe "Todos", js: true do
  let!(:todo1) { create(:todo) }
  let!(:todo2) { create(:todo, is_completed: true) }

  before(:each) do
    visit '/'
  end

  it "shows all todos " do
    expect(page).to have_content(todo1.title)
    expect(page).to have_content(todo2.title)
  end

  context "when clicking all" do
    before(:each) do
      click_on 'Active'
      click_on 'All'
    end

    it "shows active todos " do
      expect(page).to have_content(todo1.title)
    end

    it "shows completed todos " do
      expect(page).to have_content(todo2.title)
    end
  end

  context "when clicking active" do
    before(:each) do
      click_on 'Active'
    end

    it "shows active todos " do
      expect(page).to have_content(todo1.title)
    end

    it "doesn't show completed todos " do
      expect(page).to_not have_content(todo2.title)
    end
  end

  context "when clicking active" do
    before(:each) do
      click_on 'Completed'
    end

    it "doesn't show active todos " do
      expect(page).to_not have_content(todo1.title)
    end

    it "shows completed todos " do
      expect(page).to have_content(todo2.title)
    end
  end

  context "destroying a todo" do
    it "destroys the todo" do
      expect do
        within "#todo-list" do
          first('li').hover
          first('button.destroy').click
        end

        sleep 0.5
        Todo.find(todo1.id)
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
