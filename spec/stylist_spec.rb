require('spec_helper.rb')

describe(Stylist) do
  describe('.all') do
    it('starts off with no stylists') do
      expect(Stylist.all()).to(eq([]))
    end
  end
end
