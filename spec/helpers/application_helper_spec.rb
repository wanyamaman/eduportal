require 'rails_helper'

describe ApplicationHelper do
  describe "#youtube_tag" do
    it "returns a formated iframe" do
      expect(helper.youtube_tag('https://youtube.com')).to match(/<iframe\b.*src='https:\/\/youtube.com'/)
    end
  end
end
