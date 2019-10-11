require_relative '../lib/mairie_christmas'

   describe "townhall urls method" do
    it "should return email adresses as a value" do
      expect(get_townhall_urls).not_to be_nil
    end
   end