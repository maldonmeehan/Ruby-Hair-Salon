require('pry')

class Client
  attr_reader(:id, :name, :stylist_id)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      id = client.fetch('id').to_i()
      name = client.fetch('name')
      stylist_id = client.fetch('stylist_id').to_i()
      clients.push(Client.new({:id => id, :name => name, :stylist_id => stylist_id}))
    end
    clients
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name()).&(self.id().==(another_client.id()))
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{stylist_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_singleton_method(:find) do |id|
    found_client = nil
    Client.all().each() do |client|
      if client.id().==(id)
        found_client = client
      end
    end
    found_client
  end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  end

  define_method(:update) do |attributes|
    @id = self.id()
    @name = attributes.fetch(:name)
    # @stylist_id = attributes.fetch(:stylist_id)
    DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id};")
  end

  define_singleton_method(:find_by_stylist_id) do |stylist_id|
    returned_clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{stylist_id};")
    clients = []
    returned_clients.each do |client|
      id = client['id'].to_i
      name = client['name']
      stylist_id = client['stylist_id'].to_i
      clients.push(Client.new({:id => id, :name => name, :stylist_id => stylist_id}))
    end
    clients
  end


end
