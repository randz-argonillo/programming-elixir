{:ok, file} = File.open('hello.exs')
{:error, :enoent} = File.open('hellos.exs')

IO.inspect(file);
