cask "kanade" do
  version "2026.11.18.1621"
  sha256 "d8518a90178f6cd99345cecbaab17b2da747183aad85e71d57b8434af1289d26"

  url "https://github.com/MoomA-0750/kanade-ime/releases/download/mac-v#{version}/Kanade-mac-aarch64.pkg"
  name "Kanade"
  desc "Japanese input method with live conversion and voice input"
  homepage "https://github.com/MoomA-0750/kanade-ime"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  pkg "Kanade-mac-aarch64.pkg"

  uninstall early_script: {
              executable:   "/Library/Input Methods/Kanade.app/Contents/MacOS/Kanade",
              args:         ["--uninstall"],
              must_succeed: false,
            },
            script:       {
              executable:   "/usr/bin/pkill",
              args:         ["-f", "dev.mooma.kanade.desktop.MainKt serve"],
              must_succeed: false,
            },
            quit:         "dev.mooma.kanade.Settings",
            signal:       ["TERM", "dev.mooma.inputmethod.Kanade"],
            pkgutil:      "dev.mooma.pkg.Kanade",
            delete:       [
              "/Applications/Kanade Settings.app",
              "/Library/Input Methods/Kanade.app",
            ]

  zap trash: [
    "~/Library/Application Support/Kanade",
    "~/Library/Logs/Kanade",
  ]

  caveats <<~EOS
    Choose Kanade in the input menu in the menu bar.
    Voice input asks for microphone and Accessibility permission the first time.
  EOS
end
