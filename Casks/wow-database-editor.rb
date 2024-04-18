cask "wow-database-editor" do
  # WoW Database Editor follows an erratic versionning scheme, to say the least.
  # Git tags do not match release versions, and neither of them seem to follow
  # any pattern.
  # Not sure what's best so I put the complete git tag in here.
  version "build2659"
  artifact = "WoW.Database.Editor.2024.1.1.macOS"
  sha256 "84951ba6ee79d430754ba44e08d0733f11c01183c0cf7302e270df84b7145e9b"

  url "https://github.com/BAndysc/WoWDatabaseEditor/releases/download/#{version}/#{artifact}.zip"
  name "wow-database-editor"
  desc "Integrated development environment for TrinityCore based servers"
  homepage "https://github.com/BAndysc/WoWDatabaseEditor/"

  # For some reason WoW Database Editor is zipped with 000 file mode bits
  # everywhere. We have to jump through some hoops to manually unzip the
  # downloaded file and change its permissions.
  # Not doing so results in Homebrew using the UnpackStrategy::Zip and failing
  # to copy the extracted Application with a permission denied error.
  container type: :naked

  installer script: {
    executable: "#{staged_path}/install.sh",
  }

  preflight do
    File.write "#{staged_path}/install.sh", <<~EOS
      #!/bin/sh

      unzip -qq -o #{staged_path}/#{artifact}.zip -d #{staged_path}
      rm -rf #{staged_path}/#{artifact}.zip
      chmod -R ug=rwX,o=rX "#{staged_path}/WoW Database Editor.app"
    EOS
  end

  # There may be a hard dependency on .NET version 8, but I do not think
  # Homebrew can handle that well?
  depends_on cask: "dotnet"
  auto_updates true

  app "WoW Database Editor.app"
end
