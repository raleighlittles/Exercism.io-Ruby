module BookKeeping
  VERSION = 1
end

class SpaceAge
=begin
The formula for finding someone's age in years on a different planet is:

Age = L * (1 / hd) * (1/ Op)

where Op = the orbital period of the new planet
      hd = number of seconds in one earth day, or 60*60*24=31557600
=end
  @age

ORBITAL_PERIODS = {"earth"=> 1,
                   'mercury' => 0.2408467,
                   'venus' => 0.61519726,
                   'mars' => 1.8808158,
                   'jupiter' => 11.862615,
                   'saturn' => 29.447498,
                   'uranus' => 84.016846,
                   'neptune' => 164.79132}

  def initialize(age)
      @age = age
  end

  def method_missing(method)
    # All of the methods will have the form "on_<planet>"
    planet_name = method.to_s.split('_')[1]
    compute_age(planet_name)
  end
  
  private

 def compute_age(planet)
   # use the formula above
   age_in_yrs = @age * (1.0 / 31557600) * (1.0 / ORBITAL_PERIODS[planet])
   return (age_in_yrs).round(2)
 end

end