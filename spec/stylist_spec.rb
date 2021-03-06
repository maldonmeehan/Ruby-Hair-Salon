require('spec_helper.rb')

describe(Stylist) do
  describe('.all') do
    it('is empty at first') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#name') do
    it('returns the name of a given stylist') do
      stylist1 = Stylist.new({:id => nil, :name => 'David Mallet'})
      expect(stylist1.name()).to(eq('David Mallet'))
    end
  end

  describe('#==') do
    it('shows a stylist as being == equal when they share the same name and id') do
      test_stylist1 = Stylist.new({:id => nil, :name => 'David Mallet'})
      test_stylist2 = Stylist.new({:id => nil, :name => 'David Mallet'})
      expect(test_stylist1).to(eq(test_stylist2))
    end
  end

  describe('#id') do
    it('returns the id of a given stylest') do
      stylest1 = Stylist.new({:id => nil, :name => 'David Mallet'})
      stylest1.save()
      expect(stylest1.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#save') do
    it('saves a new stylist to the database') do
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

  describe('#update') do
    it('updates a stylists in the database') do
      stylist = Stylist.new({:id => nil, :name => 'David Mallet'})
      stylist.save()
      stylist.update({:name => 'Ilaria Urbinati'})
      expect(stylist.name()).to(eq('Ilaria Urbinati'))
    end
  end
end
