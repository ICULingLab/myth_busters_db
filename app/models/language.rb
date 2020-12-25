class Language < ApplicationRecord
	has_many :collections

	def self.as_csv
		CSV.generate do |csv|
			csv << ["id", "label", "autonyms", "glossonyms", "iso639_3", "reference"]
			all.each do |item|
				csv << [item.id, item.label, item.autonyms, item.glossonyms, item.iso639_3, item.reference]
			end
		end
	end
end
