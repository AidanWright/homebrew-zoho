# homebrew-zoho

A [Homebrew](https://brew.sh) tap for Zoho desktop apps.

```sh
brew tap AidanWright/zoho
brew install --cask zoho-trident
brew install --cask zoho-workdrive-truesync
```

## Casks

| Cask | App |
| --- | --- |
| `zoho-trident` | Zoho Trident |
| `zoho-workdrive-truesync` | Zoho WorkDrive TrueSync |

## Automated updates

`.github/workflows/update.yml` runs daily. For each cask it uses `brew livecheck`
to detect a newer upstream version, then `brew bump-cask-pr` to recompute the
`sha256` and open an auto-merging PR with the bump.

When such a bump lands on `main`, `.github/workflows/release.yml` cuts a CalVer
GitHub release (only when a cask version actually changed) and moves the `latest`
tag to the newest release.
