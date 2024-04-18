cask "keira3" do
  version "3.6.1"
  sha256 "9e6197c5a506c741026bd32a00f681d812d3c7a3ffe36c613f0cd45eb305a24c"

  url "https://github.com/azerothcore/Keira3/releases/download/v#{version}/Keira-#{version}.MAC.dmg.zip"
  name "keira3"
  desc "Cross-platform Database Editor for AzerothCore"
  homepage "https://www.azerothcore.org/Keira3/"

  app "Keira3.app"
end
