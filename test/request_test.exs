defmodule RequestTest do
  use ExUnit.Case

  import Mox

  # Have our mocks been properly called at the end
  # of each test?
  setup :verify_on_exit!

  test "get_artists/1 returns a list of artists" do
    SetlistApp.Main.Api.Mock
    |> expect(:fetch, fn "Sleater-Kinney" ->
      {:ok,
       %{
         "artist" => [
           %{
             "mbid" => "9ea5df14-ed58-418f-9bee-cf0737133b77",
             "name" => "Sleater-Kinney & Fred Schneider",
             "sortName" => "Sleater-Kinney & Schneider, Fred",
             "url" =>
               "https://www.setlist.fm/setlists/sleater-kinney-and-fred-schneider-63d68ab3.html"
           },
           %{
             "disambiguation" => "",
             "mbid" => "e36e78eb-3ace-4acd-882c-16789e700ab7",
             "name" => "Sleater‐Kinney",
             "sortName" => "Sleater‐Kinney",
             "tmid" => 781_369,
             "url" => "https://www.setlist.fm/setlists/sleaterkinney-3d6ed5b.html"
           }
         ],
         "itemsPerPage" => 30,
         "page" => 1,
         "total" => 2,
         "type" => "artists"
       }}
    end)

    assert SetlistApp.Request.get_artists("Sleater-Kinney") ==
             {:ok,
              [
                %{
                  "mbid" => "9ea5df14-ed58-418f-9bee-cf0737133b77",
                  "name" => "Sleater-Kinney & Fred Schneider",
                  "sortName" => "Sleater-Kinney & Schneider, Fred",
                  "url" =>
                    "https://www.setlist.fm/setlists/sleater-kinney-and-fred-schneider-63d68ab3.html"
                },
                %{
                  "disambiguation" => "",
                  "mbid" => "e36e78eb-3ace-4acd-882c-16789e700ab7",
                  "name" => "Sleater‐Kinney",
                  "sortName" => "Sleater‐Kinney",
                  "tmid" => 781_369,
                  "url" => "https://www.setlist.fm/setlists/sleaterkinney-3d6ed5b.html"
                }
              ]}
  end
end
