class Building

  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    rent_totals = @units.map { |unit| unit.monthly_rent }
    return 0 if rent_totals.length == 0
    rent_totals.sum / rent_totals.length.to_f
  end

  def renter_with_highest_rent
    occupied_units = @units.find_all { |unit| unit.renter != nil }
    occupied_unit_with_highest_rent = occupied_units.max_by { |unit| unit.monthly_rent }
    occupied_unit_with_highest_rent.renter
  end

end
