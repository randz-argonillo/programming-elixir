import List, only: [flatten: 1]
import IO, only: [puts: 1]

puts inspect(flatten([1,2,3,[4,5]]))
