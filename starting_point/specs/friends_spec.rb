require( 'minitest/autorun' )
require( 'minitest/rg')
require_relative( '../friends' )

class TestFriends < MiniTest::Test

  def setup

    @person1 = {
      name: "Shaggy",
      age: 12,
      monies: 1,
      friends: ["Velma","Fred","Daphne", "Scooby"],
      favourites: {
        tv_show: "Friends",
        snacks: ["charcuterie"]
      }
    }

    @person2 = {
      name: "Velma",
      age: 15,
      monies: 2,
      friends: ["Fred"],
      favourites: {
        tv_show: "Baywatch",
        snacks: ["soup","bread"]
      }
    }

    @person3 = {
      name: "Scooby",
      age: 18,
      monies: 20,
      friends: ["Shaggy", "Velma"],
      favourites: {
        tv_show: "Pokemon",
        snacks: ["Scooby snacks"]
      }
    }

    @person4 = {
      name: "Fred",
      age: 18,
      monies: 20,
      friends: ["Shaggy", "Velma", "Daphne"],
      favourites: {
        tv_show: "X-Files",
        snacks: ["spaghetti", "ratatouille"]
      }
    }

    @person5 = {
      name: "Daphne",
      age: 20,
      monies: 100,
      friends: [],
      favourites: {
        tv_show: "X-Files",
        snacks: ["spinach"]
      }
    }

    @people = [@person1, @person2, @person3, @person4, @person5]

  end

  # 1. For a given person, return their name
  def test_getting_name
    result = get_name(@person5)
    assert_equal("Daphne", result)
  end

  # 2. For a given person, return their favourite tv show
  # (e.g. the function favourite_tv_show(@person2) should return the string "Baywatch")
  def test_getting_tv_show
    assert_equal("Baywatch", favourite_tv_show(@person2))
  end

  # 3. For a given person, check if they like a particular food
  # (e.g. the function likes_to_eat(@person2, "bread") should return true, likes_to_eat(@person3, "spinach") should return false)

  def test_likes_to_eat
    assert_equal(true, likes_to_eat(@person2, "bread"))
  end

  def test_doesnt_like_to_eat
    assert_equal(false, likes_to_eat(@person2, "Scooby snacks"))
  end

  # 4. For a given person, add a new name to their list of friends
  # (e.g. the function add_friend(@person2, "Scrappy-Doo") should add Scrappy-Doo to the friends.)
  # (hint: This function should not return anything. After the function call, check for the length of the friends array to test it!)

  def test_add_friend_successfully
    friends_before = @person2[:friends].length
    add_friend(@person2, "Scrappy-do")
    friends_after = @person2[:friends].length
    assert_equal(friends_before+1, friends_after)
    assert_equal("Scrappy-do", @person2[:friends].last )
  end

  # 5. For a given person, remove a specific name from their list of friends
  # (hint: Same as above, testing for the length of the array should be sufficient)
  def test_remove_friend_successfully
    friends_before = @person4[:friends].length
    remove_friend(@person4, "Velma")
    friends_after = @person4[:friends].length
    assert_equal(friends_before - 1, friends_after)
    assert_equal(false, @person4[:friends].include?("Velma") )
  end

  # 6. Find the total of everyone's money
  # (hint: use the @people array, remember how we checked the total number of eggs yesterday?)

  def test_get_total_money
    total_money = get_total_money(@people)
    assert_equal(143, total_money)
  end

  # 7. For two given people, allow the first person to loan a given value of money to the other
  # (hint: our function will probably need 3 arguments passed to it... the lender, the lendee, and the amount for this function)
  # (hint2: You should test if both the lender's and the lendee's money have changed, maybe two assertions?)

  def test_loan_of_money_sender
    transfer_money(@person5, @person1, 50)
    assert_equal(50, @person5[:monies])
  end

  def test_loan_of_money_receiver
    transfer_money(@person5, @person1, 50)
    assert_equal(51, @person1[:monies])
  end

  # 8. Find the set of everyone's favourite food joined together
  # (hint: concatenate the favourites/snack arrays together)

  def test_add_everyones_food
    everyones_food = add_everyones_food(@people)
    assert_equal(["charcuterie", "soup", "bread", "Scooby snacks", "spaghetti", "ratatouille", "spinach"], everyones_food)
  end


  # 9. Find people with no friends
  # (hint: return an array, there might be more people in the future with no friends!)

  def test_nae_mates
    assert_equal(["Daphne"], nae_mates(@people))
  end

end
