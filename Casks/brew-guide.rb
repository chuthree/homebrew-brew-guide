cask "brew-guide" do
  version "1.7.2"

  on_arm do
    sha256 "5e3f097bb41ddbffea258ebe9b44b31b51cf2d018623a226e52320b3a767fdf3"
    url "https://github.com/chuthree/brew-guide/releases/download/v#{version}/BrewGuide_#{version}_macos_arm64.dmg"
  end

  on_intel do
    sha256 "2ef59186f0e919d978d4500c41e44d09432b3570907e9470f48d49b558c70465"
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
