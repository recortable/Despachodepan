require 'spec_helper'

describe "Public" do
  describe "Public site" do
    it "should have root" do
      get root_path
      response.status.should = 200
    end
  end
end
