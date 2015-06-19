require_relative "environment.rb"

db = SQLite3::Database.new('db/pokemon.db')
sql_runner = SQLRunner.new(db)
sql_runner.execute_schema_migration_sql
scraped_pokemon = Scraper.new(db)
scraped_pokemon.scrape
#all of my scraped pokemon!!!





