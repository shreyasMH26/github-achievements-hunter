#!/usr/bin/env bash
set -e

REPO_NAME="github-achievements-hunter"
GH_USER="shreyasMH26"
CO_AUTHOR_NAME="Gagan0067"
CO_AUTHOR_EMAIL="238694437+Gagan0067@users.noreply.github.com"
USER_EMAIL="235449796+shreyasMH26@users.noreply.github.com"

echo "=== 🏆 GitHub Achievement Unlocker ==="
echo "Target User: $GH_USER"
echo "Collaborator & Co-author: $CO_AUTHOR_NAME <$CO_AUTHOR_EMAIL>"

git config user.name "Shreyas MH"
git config user.email "$USER_EMAIL"

# Trigger Pair Extraordinaire with Gagan0067 (10 PRs)
NUM_PRS=10
echo ""
echo "--- 👥 Merging $NUM_PRS Co-authored PRs with $CO_AUTHOR_NAME ---"

for i in $(seq 1 $NUM_PRS); do
    BRANCH="feat/collab-gagan-$i"
    echo ""
    echo ">> [PR $i/$NUM_PRS] Creating branch $BRANCH..."
    git checkout -b "$BRANCH" main
    
    echo "Collaboration with Gagan0067 milestone $i - $(date)" >> ACTIVITY_LOG.md
    git add ACTIVITY_LOG.md
    
    git commit -m "feat(collab): milestone $i with Gagan0067

Co-authored-by: $CO_AUTHOR_NAME <$CO_AUTHOR_EMAIL>"
    
    git push origin "$BRANCH"
    
    PR_URL=$(gh pr create --title "feat: collaboration milestone $i with Gagan0067" --body "Automated PR with co-authored commit for milestone $i." --base main --head "$BRANCH")
    echo "Created PR: $PR_URL"
    
    gh pr merge "$PR_URL" --merge --delete-branch
    echo "Merged PR #$i!"
    
    git checkout main
    git pull origin main
    
    sleep 1
done

echo ""
echo "=== 🎉 Sequence Complete! ==="
