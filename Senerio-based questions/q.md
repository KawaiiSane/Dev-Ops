## 1. A wrong commit went to main and prod broke. What do you do?

```
Ans:- I will try to stabalise the production first.
    If the deployment is already live, I’d either:

Roll back using the last stable deployment (preferred in CI/CD), or
Revert the commit using git revert (not reset, since history is shared)

🛠 Steps
git log --oneline
git revert <bad_commit_hash>
git push origin main

````



## 2. Secrets were pushed to GitHub. How do you fix it?

```
First, I assume the secrets are compromised and immediately:

Revoke/rotate the credentials
Remove them from the repository history
Prevent future leaks using secret management
🛠 Steps
1. Rotate secrets (MOST IMPORTANT)
AWS keys, DB passwords, API keys → regenerate immediately
2. Remove from Git history
git filter-repo --path <file> --invert-paths
# or
bfg --delete-files <file>

3. Force push cleaned repo
git push origin --force

4. Add protection
.env in .gitignore

Use vaults (AWS Secrets Manager, etc.)
🔥 Bonus Line:-
“Even after removing from Git, assume the secret is leaked forever.”
```


## 3. Two PRs conflict during release. How do you handle it?

```
I would first rebase or merge the latest main into the PR branch, resolve conflicts locally, test thoroughly, and then proceed with merge.

🛠 Steps
git checkout feature-branch
git pull origin main
# OR
git rebase main

# resolve conflicts
git add .
git commit
git push
🧠 Key Insight
Conflict resolution = understand both changes, not just fix syntax
🔥 Bonus Line

“I prefer smaller PRs to reduce conflict probability.”
```


## 4. A rollback commit also breaks things. What next?
```
This indicates the issue might not be isolated to a single commit. I would:

1. Identify the last stable version
2. Compare changes (diff analysis)
3. Deploy a known good version instead of blindly reverting

🛠 Approach
Use:
git bisect

👉 Helps find the exact breaking commit

🚀 Production mindset
Rollback via deployment artifact (Docker image, version tag)
🔥 Bonus Line

“Rollback should be version-based, not commit-based.”
```
## 5. How do you manage Git branching for multiple environments?
```
I prefer a Git Flow–like or environment-based branching strategy:

🌿 Example Strategy
main → Production
develop → Staging
feature/* → New features
hotfix/* → Urgent prod fixes
🚀 Flow
feature → develop → main
🔥 For urgent fixes
hotfix → main → develop
🧠 Alternative (Modern)
Trunk-based + feature flags (for fast teams)
```
