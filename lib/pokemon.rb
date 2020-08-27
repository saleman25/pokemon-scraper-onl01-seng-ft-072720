class Pokemon
  
attr_accessor :id, :name, :type, :db, :hp  
  
def initialize(id, name, type, db)  
  @id = id 
  @name = name
  @type = type
  @db= db
end 
  
def self.save 
  db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
end  

def self.find(id, db) 
   pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    Pokemon.new
end

def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
end
  
end
