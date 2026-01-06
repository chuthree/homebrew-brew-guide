cask "brew-guide" do
  version "1.5.10"

  on_arm do
    sha256 "7beb8e86752faa9814ee830af57201d272dd255bbfba1fb72c2926b019c8f50a"
    url "https://github.com/chuthree/brew-guide/releases/download/v#{version}/BrewGuide_#{version}_macos_arm64.dmg"
  end

  on_intel do
    sha256 "f55120ec084da7364f862743ccf5d42df11a13e0bf10c65d6f223e567425bb59"
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
