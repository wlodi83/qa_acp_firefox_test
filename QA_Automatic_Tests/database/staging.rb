require 'rubygems'
require 'dbi'

class Staging

  def initialize(login, password)
    @login = login
    @password = password
  end

  def connect
    begin
      #connect to the Exasol Server
      @dbh = DBI.connect('DBI:Mysql:ids_db_production:10.2.10.1:3306', @login, @password)
    rescue DBI::DatabaseError => e
      puts "An error occured"
      puts "Error code: #{e.err}"
      puts "Error message: #{e.errstr}"
      err_message = "#{e.errstr}"
    end
  end

  def disconnect
    #disconnect from server
    @dbh.disconnect if @dbh
  end

  def do_query(query)
    begin
      @sth = @dbh.prepare(query)
      @sth.execute
    rescue DBI::DatabaseError => e
      puts "An error occured"
      puts "Error code: #{e.err}"
      puts "Error message: #{e.errstr}"
      err_message = "#{e.errstr}"
    end
  end

  def print_column_names
    @column_array = Array.new
    @column_array.push(@sth.column_names)
    return @column_array
  end

  def return_number_of_headers
    return @column_array[0].size
  end

  def print_result_array
    @result_array = Array.new
    while row=@sth.fetch_array do
      @result_array.push(row)
    end
    @sth.finish
    return @result_array.flatten
  end

end

#@connection = Staging.new("lwlodarczyk", "gaBeicah0phaibo")
#puts @connection.connect
#@connection.do_query("select pr.name from cms_db_production.programs as pr join cms_db_production.advertisers as adv on pr.advertiser_id = adv.id join cms_db_production.companies as comp on adv.company_id = comp.id where comp.id = 13892 and pr.deleted_at IS NULL;")
#@connection.print_result_array
#puts @campaigns_table
=begin
My account:
@dbh.select_one("select * from cms_db_production.programs as pr join cms_db_production.advertisers as adv on pr.advertiser_id = adv.id join cms_db_production.companies as comp on adv.company_id = comp.id where comp.id = '13913' and pr.deleted_at IS NULL;")
Felix's account:
Qdbh.select_one("select * from cms_db_production.programs as pr join cms_db_production.advertisers as adv on pr.advertiser_id = adv.id join cms_db_production.companies as comp on adv.company_id = comp.id where comp.id = '13892' and pr.deleted_at IS NULL;")
=end
