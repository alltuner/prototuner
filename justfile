# Update dependencies
update:
    uv run uv-bump
    bun update

# Release patch version
release-patch:
    npm version patch
    uv version $(node -p "require('./package.json').version")
    git push && git push --tags

# Release minor version
release-minor:
    npm version minor
    uv version $(node -p "require('./package.json').version")
    git push && git push --tags

# Release major version
release-major:
    npm version major
    uv version $(node -p "require('./package.json').version")
    git push && git push --tags
