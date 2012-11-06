require 'spec_helper'

describe 'Luneta' do

  describe 'Layout' do

    let(:layout) do
      Luneta::Layout.new(sample_file("sample-site/simple-layout.erb"))
    end

    it "creates an instance" do
      layout.must_be_instance_of(Luneta::Layout) 
    end

    it "renders the layout" do
      layout.render do       
        "Content"
      end.must_match("Content")
    end

  end

end
