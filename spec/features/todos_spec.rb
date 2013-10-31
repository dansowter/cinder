require 'spec_helper'

describe "Todos", js: true do
 let!(:todo) { Todo.create(title: "My todo item") }

  it "lists all todos " do
    visit '/'

    page.should have_content("My todo item")
  end
end
