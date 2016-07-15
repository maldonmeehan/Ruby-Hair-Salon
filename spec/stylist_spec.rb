require('spec_helper.rb')

describe(Stylist) do
  describe('.all') do
    it('starts off with no stylists') do
      expect(Stylist.all()).to(eq([]))
    end
  end
end

describe('#name') do
    it('returns the name of a given stylist') do
      stylist1 = Stylist.new({:id => nil, :name => 'David Mallet'})
      expect(stylist1.title()).to(eq('David Mallet'))
    end
  end
