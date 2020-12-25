class Collection < ApplicationRecord
	belongs_to :language
	belongs_to :script
	has_many :articles, :dependent => :destroy

	def self.as_csv
		CSV.generate do |csv|
			csv << ["name", "authors", "source_language", "language", "script"]
			all.each do |item|
				csv << [item.label, item.authors, item.source, item.language.label, item.script.label]
			end
		end
	end

	def as_csv
		CSV.generate do |csv|
			csv << ["name", "authors", "source_language", "language", "script"]
			csv << [label, authors, source, language.label, script.label]
		end
	end

	def editable?(user)
		user && user.root
	end

	def empty!
		articles.destroy_all
	end
end
