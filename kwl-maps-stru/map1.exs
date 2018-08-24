import IO, only: [puts: 1]
person = %{ name: "randy" }

%{ name: name } = person
puts name

people = [
  %{ name: "john", lastname: "doe", age: 24, height: 1.2 },
  %{ name: "jane", lastname: "doe", age: 27 , height: 1.5},
  %{ name: "brian", lastname: "logan", age: 30, height: 2.0 },
  %{ name: "micheal", lastname: "davis", age: 40, height: 1.7 },
  %{ name: "jay", lastname: "dela cruz", age: 16, height: 1.0 }
]

gt_20 = for result = %{ age: age } <- people, age > 25, do: result
puts inspect(gt_20)

defmodule HotelRoom do
  def book(%{ name: name, height: height })
  when height > 1.7 do
    "Need a long bed for #{name}"
  end

  def book(%{ name: name, height: height })
  when height < 1.3 do
    "Need a shorter shower controls for #{name}"
  end

  def book(person) do
    "Need a regular bed for #{person.name}"
  end
end

people
|> Enum.each(&(puts HotelRoom.book(&1)))

list = for person <- people do
  for key <- [:name, :age] do
    %{ ^key => value } = person
    value
  end
end

puts inspect(list)
