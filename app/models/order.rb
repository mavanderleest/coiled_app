class Order < ActiveRecord::Base
	has_many :order_links
	has_many :users, through: :order_links
	validates :grade, 			presence: true, length: { maximum: 10 }

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |order|
				csv << order.attributes.values_at(*column_names)
			end
		end
	end

	def accessible_attributes
		[:grade, :notes]
	end

	def self.import(file,user)
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    order = find_by_id(row["id"]) || new
    order.attributes = row.to_hash.slice(*[:id, :grade, :notes])
    order.save!
    user.link!(order)
  end
end

def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
  when ".csv" then Roo::Csv.new(file.path)
  when ".xls" then Roo::Excel.new(file.path)
  when ".xlsx" then Roo::Excelx.new(file.path)
  else raise "Unknown file type: #{file.original_filename}"
  end
end
end
