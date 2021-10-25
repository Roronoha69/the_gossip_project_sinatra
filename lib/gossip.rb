require 'pry'
require 'csv'


class Gossip

  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end
 # --> Enregistre dans le dossier .csv comme vendredi =)
  def save                                          
    CSV.open("./db/gossip.csv", "ab") do |csv|
        csv << [@author, @content]              
      end
  end
  # --> Créer un tableau qui enregistre tout les potins créer sur le cite et les retournes
  def self.all
  all_gossips = []                                    

    CSV.read("./db/gossip.csv").each do |csv_line|
     all_gossips << Gossip.new(csv_line[0], csv_line[1])

    end
    return all_gossips                                
  end
  # --> 
  def self.find(id)
    return Gossip.all[id]                           #
  end
  # Ecrase l'ancien gossip via "truncate" et enregistre la modification avec "save"
  def self.update(author, content, id)
		   gossip_array = self.all
	     gossip_array[id.to_i].content = content
		   gossip_array[id.to_i].author = author
		
		   File.open("./db/gossip.csv", 'w') {|file| file.truncate(0) }
		
		   gossip_array.each do |gossip|
		   gossip.save
		end	
  # Trop loin pour nous =)
    def commentaire
        
    end

  end
  
  



  
end

#binding.pry


