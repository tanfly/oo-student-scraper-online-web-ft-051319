require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = []

    page = Nokogiri::HTML(open(index_url))

    page.css('div.student-card').each do |student|

      students << {name: student.css('h4.student-name').text,
      location: student.css('p.student-location').text,
      profile_url: student.css('a').attribute('href').value}
    end
    students
  end



  def self.scrape_profile_page(profile_url)
    student_profile = {}

    page = Nokogiri::HTML(open(profile_url))

  end

end
