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
      expect(stylist1.name()).to(eq('David Mallet'))
    end
  end

describe('#==') do
  it('is the same stylist if it has the same attributes') do
    stylest1 = Stylest.new({:id => nil, :name => 'David Mallet'})
    stylest2 = Stylest.new({:id => nil, :name => 'David Mallet'})
    expect(stylest1).to(eq(stylest2))
  end
end
