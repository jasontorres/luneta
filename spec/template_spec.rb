require 'spec_helper'

describe 'Luneta' do

  describe 'Template' do

    let(:template) do
      Luneta::Template.new(sample_file("sample-site/simple-test.erb"))
    end

    it "creates an instance" do
      template.must_be_instance_of(Luneta::Template) 
    end

    it "renders the template" do
      template.render.must_match("Simple ERB Test")
    end

  end

  describe 'Template HAML' do

    it "renders the template" do
      template = Luneta::Template.new(sample_file("sample-site/simple-test.haml"))
      template.render.must_match("Simple HAML Test")
    end

    it "renders the template with parameters" do
      template = Luneta::Template.new(sample_file("sample-site/simple-test-with-params.haml"))
      template.render("", {a: "Simple Test with Parameters"}).must_match("Simple Test with Parameters")
    end


  end

end
