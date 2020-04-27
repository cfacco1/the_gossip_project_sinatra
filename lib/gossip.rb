class Gossip
	def save
  CSV.open("./db/gossip.csv", "ab") do |csv|
    csv << [@author, @content]
  end
end
end