class Script < ApplicationRecord
	has_many :collections

	def self.as_csv
	  CSV.generate do |csv|
	    csv << ["id", "label", "iso15924"]
	    all.each do |item|
	      csv << [item.id, item.label, item.iso15924]
	    end
	  end
	end
end
