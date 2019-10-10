require_relative '../lib/crypto_scrapper'

describe "test crazy_scrapper" do

    it "length" do
      expect(crazyscrapper.keys.length < 10).to eq(true)
    end

    it "float" do
    expect(crazyscrapper[3].values[0].class.to_s).to eq('Float')
	end

  end