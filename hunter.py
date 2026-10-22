#!/usr/bin/env python3
"""
GitHub Achievements Hunter & Tracker
A project tool to inspect, track, and automate GitHub profile achievement badges.
"""

import sys
import json
import subprocess
import time

BADGES_INFO = {
    "quickdraw": {
        "name": "Quickdraw",
        "icon": "⚡",
        "description": "Closed an issue or pull request within 5 minutes of opening.",
        "tiers": ["Default"],
        "automatable": True,
    },
    "yolo": {
        "name": "YOLO",
        "icon": "🚀",
        "description": "Merged a pull request without code review.",
        "tiers": ["Default"],
        "automatable": True,
    },
    "pull-shark": {
        "name": "Pull Shark",
        "icon": "🦈",
        "description": "Opened pull requests that have been merged.",
        "tiers": ["Base (2 PRs)", "Bronze (16 PRs)", "Silver (64 PRs)", "Gold (128 PRs)"],
        "automatable": True,
    },
    "pair-extraordinaire": {
        "name": "Pair Extraordinaire",
        "icon": "👥",
        "description": "Co-authored commits on merged pull requests.",
        "tiers": ["Base (1 PR)", "Bronze (10 PRs)", "Silver (24 PRs)", "Gold (48 PRs)"],
        "automatable": True,
    },
    "galaxy-brain": {
        "name": "Galaxy Brain",
        "icon": "🧠",
        "description": "Answered a discussion with an accepted answer.",
        "tiers": ["Base (2)", "Bronze (8)", "Silver (16)", "Gold (32)"],
        "automatable": False,
    },
    "starstruck": {
        "name": "Starstruck",
        "icon": "⭐",
        "description": "Created a repository that has 16 or more stars.",
        "tiers": ["Base (16 stars)", "Bronze (128 stars)", "Silver (512 stars)", "Gold (4096 stars)"],
        "automatable": False,
    },
    "public-sponsor": {
        "name": "Public Sponsor",
        "icon": "💖",
        "description": "Sponsor an open-source contributor via GitHub Sponsors.",
        "tiers": ["Default ($1+)"],
        "automatable": False,
    },
}

def run_cmd(cmd):
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    return result.returncode, result.stdout.strip(), result.stderr.strip()

def check_status(username):
    print(f"\n🔍 Checking GitHub profile achievements for: @{username}")
    print("=" * 60)
    for slug, badge in BADGES_INFO.items():
        auto_str = "✓ Automated" if badge["automatable"] else "⚠ Manual / Community"
        print(f"{badge['icon']} {badge['name']:<20} | {auto_str:<20} | {badge['description']}")
    print("=" * 60)

def main():
    if len(sys.argv) > 1 and sys.argv[1] == "check":
        username = sys.argv[2] if len(sys.argv) > 2 else "shreyasMH26"
        check_status(username)
    else:
        print("Usage: python3 hunter.py check [username]")

if __name__ == "__main__":
    main()
