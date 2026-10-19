cask "brew-guide" do
  version "1.7.0"

  on_arm do
    sha256 "fa49284848f561907ffc326bfee9b5022cc1f52ec439d7b3e9ade94c197f0b58"
    url "https://github.com/chuthree/brew-guide/releases/download/v#{version}/BrewGuide_#{version}_macos_arm64.dmg"
  end

  on_intel do
    sha256 "2c130fedaad756d7bf07c5e4a117f63755644fa26513d6f5f422396d5f7a3d79"
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

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Brew Guide.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.brewguide.desktop",
    "~/Library/Caches/com.brewguide.desktop",
    "~/Library/Preferences/com.brewguide.desktop.plist",
    "~/Library/Saved Application State/com.brewguide.desktop.savedState",
  ]
end
