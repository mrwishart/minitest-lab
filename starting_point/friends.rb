def get_name(person)
  return person[:name]
end

def favourite_tv_show(person)
  return person[:favourites][:tv_show]
end

def likes_to_eat(person, food)
  return person[:favourites][:snacks].include? food
end

def add_friend(person, friend_name)
  person[:friends] << friend_name
end

def remove_friend(person, friend_name)
  person[:friends].delete("Velma")
end

def get_total_money(people)
  total_money = 0
  for person in people
    total_money += person[:monies]
  end
  return total_money
end

def transfer_money(lender, lendee, amount)
  lender[:monies]-=amount
  lendee[:monies]+=amount
end

def add_everyones_food(people)
  everyones_food = []

  for person in people
    everyones_food.concat(person[:favourites][:snacks])
  end

  return everyones_food
end
