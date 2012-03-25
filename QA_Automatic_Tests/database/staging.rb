require 'dbi'

class Staging

  #connect with database
  def connect
    begin
      #connect to the MySQL server
      @dbh = DBI.connect("DBI:Mysql:ids_db_production:10.2.10.1:3306",
                         "******", "******")
    rescue DBI::DatabaseError => e
      puts "An error occurred"
      puts "Error code:    #{e.err}"
      puts "Error message: #{e.errstr}"
    ensure
      disconnect from server
      @dbh.disconnect if @dbh
    end
  end

  def make_query(sql_query)
    @dbh.select_one(sql_query)
  end

  def disconnect
    @dbh.disconnect
  end
end

=begin
@dbh.select_one("select * from cms_db_production.programs as pr join cms_db_production.advertisers as adv on pr.advertiser_id = adv.id join cms_db_production.companies as comp on adv.company_id = comp.id where comp.id = '13913' and pr.deleted_at IS NULL;")
=end
