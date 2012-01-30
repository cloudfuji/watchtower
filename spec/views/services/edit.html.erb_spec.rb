require 'spec_helper'

describe "services/edit" do
  before(:each) do
    @service = assign(:service, stub_model(Service,
      :url => "MyString",
      :type => "",
      :interval => 1,
      :status => "MyString"
    ))
  end

  it "renders the edit service form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => services_path(@service), :method => "post" do
      assert_select "input#service_url", :name => "service[url]"
      assert_select "input#service_type", :name => "service[type]"
      assert_select "input#service_interval", :name => "service[interval]"
      assert_select "input#service_status", :name => "service[status]"
    end
  end
end
