require("minitest/autorun")
require_relative("../pub.rb")
require_relative("../drink.rb")
require_relative("../customer.rb")

class PubTest < MiniTest::Test

def setup
@drink1 = Drink.new("WKD", 1.20)
@drink2 = Drink.new("stella", 5.80)
@drink3 = Drink.new("bulmers", 3.70)
@customer2 = Customer.new("Steve", 19.0, 36)
@customer1 = Customer.new("Tony", 19.0, 11)
@pub = Pub.new("chanter", 500.99, [])
end

def test_pub_has_name

assert_equal("chanter", @pub.name())
end

def test_pub_has_till

assert_equal(500.99, @pub.till())
end

def test_pub_has_drinks

assert_equal([], @pub.drinks())
end


def test_pub_has_new_drinks
  @pub.add_drink(@drink1)
  assert_equal([@drink1], @pub.drinks())
end

def test_pub_sells_drink
  @pub.add_drink(@drink1)
  @pub.add_drink(@drink3)
  @pub.sells_drink(@drink3)
  assert_equal([@drink1], @pub.drinks())

end

def test_pub_makes_money
    @pub.add_drink(@drink3)
    @pub.sale(@drink3)
    assert_equal(504.69, @pub.till())


end


def test_pub_serves_customer__success

  assert_equal(true, @pub.serve?(@customer2))

end


def test_pub_serves_customer__fail

  assert_equal(false, @pub.serve?(@customer1))

end


end
