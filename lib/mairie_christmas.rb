require 'rubygems'
require 'nokogiri' 
require 'open-uri'


def get_townhall_urls

  municipality = []
  emails = []

  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html")) 
  links = page.xpath('//a[contains(@href, "/95/")]')
  
  links.each do |link|
    print "#{get_townhall_email(link['href'])}             \r" #Fait apparaitre les noms pendant la recherche
    emails << get_townhall_email(link['href']) 
  end 

  links.each do |city|
    municipality << city.text
  end
  
    puts Hash[municipality.zip(emails)]

end

def get_townhall_email(url)
  
  web = Nokogiri::HTML(open("http://annuaire-des-mairies.com/" + url))
  
  mail = (web.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text)
  
end

get_townhall_urls
