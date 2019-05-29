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

    social = page.css("div.social-icon-container a").collect {|x| x.attribute("href").value}

   social_icons.each do |social_icon|

     if social_icon.include?("linkedin")
       student[:linkedin] = social_icon

     elsif social_icon.include?("github")
       student[:github] = social_icon

     elsif social_icon.include?("twitter")
       student[:twitter] = social_icon

     else
       student[:blog] = social_icon
   end
   end
       student[:profile_quote] = doc.css("div.profile-quote").text
       student[:bio] = doc.css("div.bio-content.content-holder p").text
   student
 end
end

  end

end
