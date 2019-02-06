defmodule SetlistApp.Main.ApiBehaviour do
  @callback fetch(String.t()) :: {:ok, map()}
end
