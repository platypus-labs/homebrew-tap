# PlatypusDB Homebrew tap

Install [PlatypusDB](https://github.com/platypus-labs/platypus-db), the fast, lightweight SQL
client, on macOS (Apple silicon and Intel):

```sh
brew install --cask platypus-labs/tap/platypusdb
```

The app updates itself. PlatypusDB is not signed by Apple yet: the first time, open it from
Finder with right-click > Open, or run
`xattr -dr com.apple.quarantine /Applications/PlatypusDB.app`.

The cask is filled from `packaging/homebrew/` of the main repository for each release
(`scripts/packaging.mjs`).
