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
end
