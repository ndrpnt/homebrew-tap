cask "keira3" do
  version "3.7.0"
  sha256 "32dfe8f806507c4e876b8b3b4ccc0c5237ec0d9a48fdd6bf3437c7423904c4ae"

  url "https://github.com/azerothcore/Keira3/releases/download/v#{version}/Keira-#{version}.MAC.dmg.zip",
      verified: "github.com/azerothcore/Keira3/"
  name "keira3"
  desc "Cross-platform Database Editor for AzerothCore"
  homepage "https://www.azerothcore.org/Keira3/"

  app "Keira3.app"
end
