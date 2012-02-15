require 'spec_helper'

describe PagesController do

  describe "GET 'blog'" do
    it "should be successful" do
      get 'blog'
      response.should be_success
    end
  end
end