require 'spec_helper'

describe "services/new" do
  before(:each) do
    assign(:service, stub_model(Service,
      :url => "MyString",
      :type => "",
      :interval => 1,
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new service form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => services_path, :method => "post" do
      assert_select "input#service_url", :name => "service[url]"
      assert_select "input#service_type", :name => "service[type]"
      assert_select "input#service_interval", :name => "service[interval]"
      assert_select "input#service_status", :name => "service[status]"
    end
  end
end
