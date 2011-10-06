require 'spec_helper'

describe "bodies/edit.html.erb" do
  before(:each) do
    @body = assign(:body, stub_model(Body,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit body form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bodies_path(@body), :method => "post" do
      assert_select "input#body_name", :name => "body[name]"
      assert_select "input#body_description", :name => "body[description]"
    end
  end
end
