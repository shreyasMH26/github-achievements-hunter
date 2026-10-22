# 🏆 GitHub Achievements Hunter

An automated project to systematically unlock, track, and showcase GitHub Profile Badges and Achievements.

---

## 🎯 Badges Showcase & Status

| Badge | Status | Tier | How it was Achieved |
| :--- | :---: | :---: | :--- |
| ⚡ **Quickdraw** | ✅ Unlocked | Default | Closed an issue within seconds of opening |
| 🚀 **YOLO** | ✅ Unlocked | Default | Merged a pull request without code review |
| 🦈 **Pull Shark** | ✅ Unlocked | Silver (x3) ➔ Progressing to Gold (x4) | Continuous merged Pull Requests |
| 👥 **Pair Extraordinaire** | ✅ Unlocked | Base / Bronze / Silver | Co-authored commits merged via Pull Request |
| 🧠 **Galaxy Brain** | ⏳ In Progress | Q&A Accepted Answer | Answer accepted in GitHub Discussions |
| ⭐ **Starstruck** | ⏳ In Progress | 16 Stars | Needs community stars |
| 💖 **Public Sponsor** | ⏳ Pending | $1 Sponsor | Sponsor any open-source maintainer |

---

## 🛠️ How It Works

### 1. Quickdraw
GitHub rewards closing an issue or PR within 5 minutes of opening.
```bash
# Automated via GitHub CLI
ISSUE_URL=$(gh issue create --title "Quickdraw check" --body "Closing immediately")
gh issue close "$ISSUE_URL" --comment "Closed for Quickdraw"
```

### 2. YOLO
Merging a pull request without code review or branch protections.

### 3. Pair Extraordinaire
Git commits formatted with a valid GitHub user trailer:
```git
git commit -m "feat: collaborate on feature

Co-authored-by: GAURISH007 <76580702+GAURISH007@users.noreply.github.com>"
```
When this commit is pushed on a branch and merged to `main` via PR, GitHub awards the **Pair Extraordinaire** achievement.

### 4. Pull Shark
Incremented with every pull request merged into the default branch.

---

## 🚀 Running the Automation
```bash
chmod +x unlock.sh
./unlock.sh
```

---
*Created by [@shreyasMH26](https://github.com/shreyasMH26)*
