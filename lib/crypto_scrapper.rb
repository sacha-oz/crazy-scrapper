require 'rubygems'
require 'nokogiri'
require 'open-uri'


def crazyscrapper

	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

	def recup_symbol(page)

		crypto_name_array = page.xpath('//*[@id]/td[3]')

		crypto_name_mapped = crypto_name_array.map {|names| names.text}

		return crypto_name_mapped

	end

	recup_symbol(page)

	def recup_price(page)

		crypto_price_array = page.xpath('//*[@id]/td[5]/a')

		crypto_price_mapped = crypto_price_array.map {|prices| prices.text}

		return crypto_price_mapped

	end 

	recup_price(page)

	def merge(crypto_name_mapped,crypto_price_mapped)

		output = Hash[crypto_name_mapped.zip(crypto_price_mapped)]

		puts output

		return output


	end

		crypto_name_mapped = recup_symbol(page)
		crypto_price_mapped = recup_price(page)
		merge(crypto_name_mapped,crypto_price_mapped)

end

crazyscrapper

