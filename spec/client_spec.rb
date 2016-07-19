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
       test_client = Client.new({:id => nil, :name => "Rey", :stylist_id => 1})
       test_client.save()
       expect(Client.all()).to(eq([test_client]))
     end
   end
end
