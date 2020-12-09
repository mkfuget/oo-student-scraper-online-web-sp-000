require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = Nokogiri::HTML(URI.open(index_url))
    out = []
    html.css('.student-card').each do |student|
      hash = 
      {
        :name => student.css('.student-name').text,
        :location => student.css('.student-location').text,
        :profile_url => student.css('a').attribute('href').value
      }
      out.push(hash)
      end
    return out
  end

  def self.scrape_profile_page(profile_url)
    html = Nokogiri::HTML(URI.open(profile_url))
<<<<<<< HEAD
    out = {
      :bio => html.css('p').text,
      :profile_quote => html.css('.profile-quote').text,
    }

    student_social_data = html.css('.social-icon-container').css('a')
    student_social_data.each do |link|
      url = link.attribute('href').value
      if(url.include?("twitter.com"))
        out[:twitter] = url
      elsif(url.include?("linkedin.com"))
        out[:linkedin] = url 
      elsif(url.include?("github.com"))
        out[:github] = url 
      else 
        out[:blog] = url 
      end
    end
    return out
=======
    out = []
    student_bio = html.css('.bio-block content-holder').css('p').text
    student_quote = html.css('.profile_quote').text
    student_social_data = html.css('.social-icon-container')
    student_twitter = student_social_data.css('a:first-child').attribute('href').value
    student_linkedin = student_social_data.css('a:nth-child(2)').attribute('href').value
    student_github = student_social_data.css('a:nth-child(3)').attribute('href').value
    student_blog = student_social_data.css('a:nth-child(4)').attribute('href').value
    binding.pry
>>>>>>> 0c14622cd932a4953035aa1f5bd95cd4a8f6cfe9
  end

end

