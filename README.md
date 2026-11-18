# homebrew-tap

MoomA-0750 の自分用の Homebrew tap。

```sh
brew tap MoomA-0750/tap
brew install --cask kanade
```

| cask | 中身 |
|---|---|
| `kanade` | [Kanade](https://github.com/MoomA-0750/kanade-ime) の Mac 版（日本語の入力方式）。pkg を入れる。Apple Silicon・macOS 14 以上 |

cask の版と sha256 は、kanade-ime の `scripts/mac-release.sh` が Release に pkg を載せたあとで書き換える。
