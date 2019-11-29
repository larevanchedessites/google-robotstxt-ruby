# frozen_string_literal: true

require 'robotstxt'

RSpec.describe GoogleRobotstxtParser do
  include Robotstxt

  let(:context) { GoogleRobotstxtParser.create }

  describe '.VERSION' do
    it 'returns a string' do
      expect(GoogleRobotstxtParser::VERSION).to be_instance_of String
    end
  end

  describe 'allowed_by_robots' do
    it 'should return the true' do
      robotstxt_content = "# robotstxt.org/\n\nUser-agent: *\nDisallow: \n\nSitemap: https://www.bqst.fr/sitemap.xml"
      user_agent = 'GoogleBot'
      url = 'https://www.bqst.fr'

      expect(Robotstxt.allowed_by_robots(robotstxt_content, user_agent, url)).to eq(true)
    end

    it 'should return the true' do
      robotstxt_content = "# robotstxt.org/\n\nUser-agent: *\nDisallow: /\n\nSitemap: https://www.bqst.fr/sitemap.xml"
      user_agent = 'GoogleBot'
      url = 'https://www.bqst.fr'

      expect(Robotstxt.allowed_by_robots(robotstxt_content, user_agent, url)).to eq(false)
    end
  end
end
