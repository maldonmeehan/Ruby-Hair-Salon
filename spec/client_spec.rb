require('spec_helper')

describe(Client) do

  describe('.all') do
    it('is empty at first') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('is the same client if it has the same attributes') do
      client1 = Client.new({:id => nil, :name => "Joanne Ward", :stylist_id => 1})
      client2 = Client.new({:id => nil, :name => "Joanne Ward", :stylist_id => 1})
      expect(client1).to(eq(client2))
    end
  end

  describe('#save') do
    it('saves a new client to the database') do
      test_client = Client.new({:id => nil, :name => "Joanne Ward", :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe('.find') do
    it('returns a client by its id') do
      test_client1 = Client.new({:id => nil, :name => 'Joanne Ward', :stylist_id => 1})
      test_client2 = Client.new({:id => nil, :name => 'Laura White', :stylist_id => 1})
      test_client1.save()
      test_client2.save()
      expect(Client.find(test_client2.id())).to(eq(test_client2))
    end
  end

  describe('#delete') do
    it('deletes a client from the database') do
      client = Client.new({:id => nil, :name => 'Joanne Ward', :stylist_id => 1})
      client.save()
      client.delete()
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#update') do
    it('updates a client in the database') do
      client = Client.new({:id => nil, :name => 'Laura White', :stylist_id => 1})
      client.save()
      client.update({:name => 'Laura Walsh', :stylist_id => 2})
      expect(client.stylist_id()).to(eq(2))
    end
  end




end
