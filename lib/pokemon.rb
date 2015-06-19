class Pokemon
  @@all = []
 attr_accessor :name, :type
   def initialize
      @@all << self
      
      
      # binding.pry
   end

   def self.all? 
      @@all
   end

  def self.save(name, type, db)
    @@db = db
    sql = <<-SQL 
      INSERT INTO pokemons (name, type)
      VALUES (? , ?);
    SQL
    # binding.pry
    @@db.execute(sql, name, type)

  end


end