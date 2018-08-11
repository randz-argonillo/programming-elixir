
randy = %{ firstName: "Randy", lastName: "Argonillo" }
caroline = %{ "firstName" => "Caroline", "lastName" => "Argonillo" }

IO.inspect randy
IO.inspect randy.lastName

IO.inspect caroline
IO.inspect caroline["firstName"]
