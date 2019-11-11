row1 = IO.gets("How many rows are on the matrix-1: ") |> String.trim() |> String.to_integer()
col1 = IO.gets("How many columns are on the matrix-1: ") |> String.trim() |> String.to_integer()

row2 = IO.gets("How many rows are on the matrix-2: ") |> String.trim() |> String.to_integer()
col2 = IO.gets("How many columns are on the matrix-2: ") |> String.trim() |> String.to_integer()

if col2 == row1 do
  IO.puts("Alright lets start the multiplication")
else
  IO.puts(:stderr, "Sorry they wont be multiplied")
  exit(:shutdown)
end

mat_1 = IO.gets("Enter the matrix-1, the row values are comma(',') separeted, the columns are semicolon(';') separated: \n")
IO.puts(mat_1)

mat_1 = mat_1 |> String.trim() |> String.split(";") |> Enum.map(fn s -> String.split(s, ",") |> Enum.map(&String.to_integer(&1)) end)
IO.inspect(mat_1)

row_count = Enum.count( mat_1)
IO.puts(row_count )
col_count = Enum.map(mat_1, &Enum.count(&1))

if row_count != row1 do
  IO.puts "Row mismatched please reenter the matrix"
  exit(:shutdown)
end
ch = Enum.map(col_count, fn (s) -> if s != col1 do "col mismatched" end end)
if Enum.member?(ch, "col mismatched") do
  IO.puts "col mismatched please reenter the matrix"
  exit(:shutdown)
end


mat_2 = IO.gets("Enter the matrix-2, the row values are comma(',') separeted, the columns are semicolon(';') separated: \n")
IO.puts(mat_1)

mat_2 = mat_2 |> String.trim() |> String.split(";") |> Enum.map(fn s -> String.split(s, ",") |> Enum.map(&String.to_integer(&1)) end)
IO.inspect(mat_2)

row_count = Enum.count( mat_2)
IO.puts(row_count )
col_count = Enum.map(mat_2, &Enum.count(&1))

if row_count != row2 do
  IO.puts "Row mismatched please reenter the matrix"
  exit(:shutdown)
end
ch = Enum.map(col_count, fn (s) -> if s != col2 do "col mismatched" end end)
if Enum.member?(ch, "col mismatched") do
  IO.puts "col mismatched please reenter the matrix"
  exit(:shutdown)
end

IO.puts(Matrix.mult(mat_1, mat_2))

s=[]

b = for i <- 0..(col1-1) do
  Enum.map(mat_2, fn s1 -> s++[Enum.at(s1, i)]  end)
end

b = Enum.map(b, &List.flatten(&1))
mat_2 = b


