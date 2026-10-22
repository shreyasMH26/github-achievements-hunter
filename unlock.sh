#!/usr/bin/env bash
set -e

REPO_NAME="github-achievements-hunter"
GH_USER="shreyasMH26"
CO_AUTHOR_NAME="GAURISH007"
CO_AUTHOR_EMAIL="76580702+GAURISH007@users.noreply.github.com"
USER_EMAIL="235449796+shreyasMH26@users.noreply.github.com"

echo "=== 🏆 GitHub Achievement Unlocker ==="
echo "Target User: $GH_USER"
echo "Co-author: $CO_AUTHOR_NAME <$CO_AUTHOR_EMAIL>"

# 1. Configure git user locally
git config user.name "Shreyas MH"
git config user.email "$USER_EMAIL"

# 2. Check if repo is initialized
if [ ! -d .git ]; then
    git init -b main
    git add .
    git commit -m "feat: initial commit for achievement hunter"
fi

# 3. Create public repository if not exists on GitHub
if ! gh repo view "$GH_USER/$REPO_NAME" >/dev/null 2>&1; then
    echo "Creating public repository $GH_USER/$REPO_NAME..."
    gh repo create "$REPO_NAME" --public --source=. --remote=origin --push
    gh repo edit --enable-discussions
else
    echo "Repo already exists on GitHub."
    git remote set-url origin "https://github.com/$GH_USER/$REPO_NAME.git" 2>/dev/null || git remote add origin "https://github.com/$GH_USER/$REPO_NAME.git"
    git push -u origin main || true
fi

# 4. Trigger Quickdraw (Issue opened & immediately closed)
echo ""
echo "--- ⚡ Triggering Quickdraw Achievement ---"
ISSUE_URL=$(gh issue create --title "Quickdraw trigger verification" --body "Automated issue to fulfill Quickdraw criteria (<5 min closure).")
echo "Created issue: $ISSUE_URL"
gh issue close "$ISSUE_URL" --comment "Issue resolved and closed immediately."
echo "✅ Quickdraw trigger complete."

# 5. Trigger Pair Extraordinaire + YOLO + Pull Shark
echo ""
echo "--- 👥 Triggering Pair Extraordinaire & Pull Shark ---"
NUM_PRS=10

for i in $(seq 1 $NUM_PRS); do
    BRANCH="feat/pair-sync-$i"
    echo ""
    echo ">> [Step $i/$NUM_PRS] Creating branch $BRANCH..."
    git checkout -b "$BRANCH" main
    
    # Update activity log
    echo "Pair contribution record $i - $(date)" >> ACTIVITY_LOG.md
    git add ACTIVITY_LOG.md
    
    # Commit with verified co-author trailer
    git commit -m "feat(pair): sync milestone step $i

Co-authored-by: $CO_AUTHOR_NAME <$CO_AUTHOR_EMAIL>"
    
    # Push branch
    git push origin "$BRANCH"
    
    # Create PR
    PR_URL=$(gh pr create --title "feat: pair milestone $i" --body "Automated PR with co-authored commit for milestone $i." --base main --head "$BRANCH")
    echo "Created PR: $PR_URL"
    
    # Merge PR without review
    gh pr merge "$PR_URL" --merge --delete-branch
    echo "Merged PR #$i!"
    
    # Switch back to main and update
    git checkout main
    git pull origin main
    
    sleep 2
done

echo ""
echo "=== 🎉 Achievement Unlocking Sequence Completed! ==="
echo "Check your GitHub Profile Badges: https://github.com/$GH_USER?tab=achievements"
