require 'csv'

class Gossip
  	attr_accessor :author, :content

  	def initialize(author, content)
      @content = content
      @author = author
    end

#Sauvegarder les potins dans un CSV
	def save
  		CSV.open("./db/gossip.csv", "ab") do |csv|
    	csv << [@author, @content]
  		end
	end

#Enregistrer les potins dans un tableau
  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

#"Indexer"
  def self.find(id)
  gossips = []  
  CSV.read("./db/gossip.csv").each_with_index do |row, index|
    if (id == index+1)         
      gossips << Gossip.new(row[0], row[1])  
      break
      end
    end
      return gossips
  end


end