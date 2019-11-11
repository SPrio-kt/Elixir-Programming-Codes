m1 = [[11, 12], [13, 14]]
m2 = [[11, 12], [13, 14]]

result =
  Enum.reduce(0..1, [], fn i, acc1 ->
    res =
      Enum.reduce(0..1, [], fn j, acc2 ->
        res =
          Enum.reduce(0..1, [], fn k, acc3 ->
            ele1 = Enum.at(m1, i) |> Enum.at(k)
            ele2 = Enum.at(m2, k) |> Enum.at(j)
            [ele1 * ele2 | acc3]
          end)
          |> Enum.reduce(&(&1 + &2))

        [res | acc2]
      end)
      |> Enum.reverse()

    [res | acc1]
  end)
  |> Enum.reverse()

IO.inspect(result)
