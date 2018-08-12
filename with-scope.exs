content = "Now is the time"

lp = with { :ok, file } = File.open("/etc/passwds"),
  content = IO.read(file, :all),
  :ok = File.close(file),
  [_, uid, gid] <- Regex.run(~r/^lp:.*?:(\d+):(\d+)/m, content) do
    "Group ID: #{gid}, User ID: #{uid}, Content: #{content}"
  end

IO.puts inspect(lp)
IO.puts content
