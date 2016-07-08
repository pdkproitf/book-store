require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :user_id => 1,
      :book_id => 1,
      :desc => "MyText"
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input#comment_user_id[name=?]", "comment[user_id]"

      assert_select "input#comment_book_id[name=?]", "comment[book_id]"

      assert_select "textarea#comment_desc[name=?]", "comment[desc]"
    end
  end
end
