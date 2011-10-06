require 'spec_helper'

describe "bodies/new.html.erb" do
  before(:each) do
    assign(:body, stub_model(Body,
      :name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new body form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bodies_path, :method => "post" do
      assert_select "input#body_name", :name => "body[name]"
      assert_select "input#body_description", :name => "body[description]"
    end
  end
end
