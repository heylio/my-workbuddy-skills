#!/usr/bin/env bash
set -Eeuo pipefail

# Sync upstream support files while preserving this repository's adapted SKILL.md files.
# Run from the repository root: bash scripts/sync-upstream-skill-support.sh
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

sync_skill() {
  local repo="$1" source_path="$2" target_path="$3"
  local checkout="$TMP/$(echo "$repo" | tr '/.' '__')"
  echo "==> Syncing support files: $repo:$source_path -> $target_path"
  if [[ ! -d "$checkout/.git" ]]; then
    git clone --depth 1 "https://github.com/$repo.git" "$checkout"
  fi
  local source="$checkout"
  if [[ "$source_path" != "." ]]; then source="$checkout/$source_path"; fi
  if [[ ! -d "$source" ]]; then
    echo "ERROR: upstream path not found: $repo/$source_path" >&2
    return 1
  fi
  local target="$ROOT/$target_path"
  mkdir -p "$target"
  # Copy all upstream support directories, not the SKILL.md itself.
  # This includes references/, templates/, scripts/, assets/, evals/, tests/, and any
  # other support directory the upstream skill ships.
  while IFS= read -r -d '' dir; do
    cp -a "$dir" "$target/"
  done < <(find "$source" -mindepth 1 -maxdepth 1 -type d -print0)
  # Preserve useful upstream license/changelog/provenance files where present.
  for file in LICENSE LICENSE.md CHANGELOG.md CONTRIBUTING.md; do
    if [[ -f "$source/$file" ]]; then cp -f "$source/$file" "$target/$file"; fi
  done
  echo "    done"
}

sync_skill "0furkancolak/frontend-ui-prototype" "." "skills/frontend-ui-prototype"
sync_skill "anthropics/skills" "skills/frontend-design" "skills/frontend-design"
sync_skill "microsoft/skills" ".github/skills/frontend-design-review" "skills/frontend-design-review"
sync_skill "JPeetz/agent-skills" "skills/data/database-schema-designer" "skills/database-schema-designer"
sync_skill "JPeetz/agent-skills" "skills/documentation-content/spec-writer" "skills/spec-writer"
sync_skill "Dancan254/spring-boot-skills" "skills/spring-scaffold" "skills/spring-scaffold"
sync_skill "JPeetz/agent-skills" "skills/qa-testing/playwright-e2e-testing" "skills/playwright-e2e-testing"
sync_skill "JPeetz/agent-skills" "skills/development/anti-over-engineering" "skills/anti-over-engineering"
sync_skill "JPeetz/agent-skills" "skills/development/safe-refactor" "skills/safe-refactor"

echo
echo "Sync complete. Review changes, especially license/provenance files, before committing."
echo "java-development is a local adaptation and was intentionally not overwritten."
