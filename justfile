# Update dependencies
update:
    uv run uv-bump
    bun update

# Release new version
release level:
    bun pm version {{level}} --no-git-tag-version
    uv version $(bun pm pkg get version | tr -d '"')
    git add package.json pyproject.toml
    git commit -m "chore: release v$(bun pm pkg get version | tr -d '"')"
    git tag v$(bun pm pkg get version | tr -d '"')
    git push && git push --tags

# Release patch version
release-patch: (release "patch")

# Release minor version
release-minor: (release "minor")

# Release major version
release-major: (release "major")
