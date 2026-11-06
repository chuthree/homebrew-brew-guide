cask "brew-guide" do
  version "1.7.3"

  on_arm do
    sha256 "21f3037e6149cd07d9e0b76890ea4a91ff500533598b20cbe420c049fccf6490"
    url "https://github.com/chuthree/brew-guide/releases/download/v#{version}/BrewGuide_#{version}_macos_arm64.dmg"
  end

  on_intel do
    sha256 "68f804b3e21b4170fdc7facf6d6cd062ef72f31c25cf6600b0aea19dd26c8e83"
    url "https://github.com/chuthree/brew-guide/releases/download/v#{version}/BrewGuide_#{version}_macos_x64.dmg"
  end

  name "Brew Guide"
  name "咖啡冲煮指南"
  desc "Coffee brewing assistant with timer, bean management, and tasting notes"
  homepage "https://github.com/chuthree/brew-guide"

  livecheck do
    url :url
    strategy :github_latest
  end

  # 未签名应用需要移除隔离属性
  app "Brew Guide.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-rd", "com.apple.quarantine", "{{appdir}}/Brew Guide.app"],
        sudo: false,
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/com.brewguide.desktop",
    "~/Library/Caches/com.brewguide.desktop",
    "~/Library/Preferences/com.brewguide.desktop.plist",
    "~/Library/Saved Application State/com.brewguide.desktop.savedState",
  ]
end
