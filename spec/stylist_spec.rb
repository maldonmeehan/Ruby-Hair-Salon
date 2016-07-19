require('spec_helper.rb')

describe(Stylist) do
  describe('.all') do
    it('starts off with no stylists') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#name') do
    it('returns the name of a given stylist') do
      stylist1 = Stylist.new({:id => nil, :name => 'David Mallet'})
      expect(stylist1.name()).to(eq('David Mallet'))
    end
  end

  describe('#id') do
    it('returns the id of a given stylest') do
      stylest1 = Stylist.new({:id => nil, :name => 'David Mallet'})
      stylest1.save()
      expect(stylest1.id()).to(be_an_instance_of(Fixnum))
    end
  end

  # describe('#==') do
  #   it('is the same stylist if it has the same attributes') do
  #     test_stylest1 = Stylest.new({:id => nil, :name => 'David Mallet'})
  #     test_stylest2 = Stylest.new({:id => nil, :name => 'David Mallet'})
  #     expect(test_stylest1).to(eq(test_stylest2))
  #   end
  # end

  describe('#save') do
    it('saves a new stylist in the hair_salon database') do
      test_stylist = Stylist.new({:id => nil, :name => 'Ilaria Urbinati'})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe('.find') do
    it('returns a stylist by its id') do
      test_stylist1 = Stylist.new({:id => nil, :name => 'David Mallet'})
      test_stylist1.save()
      test_stylist2 = Stylist.new({:id => nil, :name => 'Ilaria Urbinati'})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe('#delete') do
  it('deletes a stylist from the database') do
    stylist1 = Stylist.new({:id => nil, :name => 'David Mallet'})
    stylist1.save()
    stylist2 = Stylist.new({:id => nil, :name => 'Ilaria Urbinati'})
    stylist2.save()
    stylist1.delete()
    expect(Stylist.all()).to(eq([stylist2]))
  end
end




end
