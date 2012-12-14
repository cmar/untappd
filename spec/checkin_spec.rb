require File.dirname(__FILE__) + '/spec_helper'

describe "Checkin" do
  context "post" do
    it "add comment", :vcr do
      comment = Untappd::Checkin.add_comment(TEST_ACCESS_TOKEN, 17831896, 'test comment')
      comment.result.should == 'success'
    end

    it "removes comment", :vcr do
      comment = Untappd::Checkin.remove_comment(TEST_ACCESS_TOKEN, 1326083)
      comment.result.should == 'success'
    end

    it "adds toast", :vcr do
        toast = Untappd::Checkin.toggle_toast(TEST_ACCESS_TOKEN, 17831896)
        toast.like_type.should == 'toast'
        toast.result.should == 'success'
        toast.toasts.items.first.user.user_name.should == 'darbyfrey'
    end

    it "removes toast", :vcr do
        toast = Untappd::Checkin.toggle_toast(TEST_ACCESS_TOKEN, 17831896)
        toast.like_type.should == 'un-toast'
        toast.result.should == 'success'
    end

    it "creates checkin", :vcr do
      checkin = Untappd::Checkin.create(TEST_ACCESS_TOKEN, -5, 'CST', 10891)
      checkin.beer.beer_name.should == 'Tank 7 Farmhouse Ale'
    end
  end

  context "get" do
    it "gets info", :vcr do
      checkin = Untappd::Checkin.info(17811863)
      checkin.checkin.beer.beer_name.should == "Christmas Ale (2012)"
    end

    it "gets thepub feed", :vcr do
      checkins = Untappd::Checkin.feed
      checkins.checkins.items.first.beer.beer_name.should == "Harvest Ale"
    end
  end
end
