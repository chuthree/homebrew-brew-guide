cask "brew-guide" do
  version "1.7.1"

  on_arm do
    sha256 "e0ed53637efcb6cda721af71d09730723d828e0ac1a6ece381cc5557e3413c53"
    url "https://github.com/chuthree/brew-guide/releases/download/v#{version}/BrewGuide_#{version}_macos_arm64.dmg"
  end

  on_intel do
    sha256 "cb7a34dbc758928a81521b828db5154c310acac77eac77b29810c0c66ab76d31"
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
