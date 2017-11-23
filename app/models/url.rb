class Url < ApplicationRecord

	validates :long_url, presence: true
	validates :short_url, :long_url, uniqueness: true
	validates :long_url, format: {with: /(((ftp|http|https):\/\/)|(\/)|(..\/))(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/, message: "valid URLs only"}
	
	def shorten
		self.short_url = [*('A'..'Z'),*('a'..'z'),*('0'..'9')].shuffle[0,5].join
		# return x
		# self.shorten = SecureRandom.base64
	end

end
