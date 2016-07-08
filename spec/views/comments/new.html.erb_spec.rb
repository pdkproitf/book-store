require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :user_id => 1,
      :book_id => 1,
      :desc => "MyText"
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input#comment_user_id[name=?]", "comment[user_id]"

      assert_select "input#comment_book_id[name=?]", "comment[book_id]"

      assert_select "textarea#comment_desc[name=?]", "comment[desc]"
    end
  end
end
