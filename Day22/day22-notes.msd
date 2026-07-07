# Day 22 Notes — Git Workflow & Architecture

### 1. Difference between `git add` and `git commit`
* `git add` takes changes from your workspace and moves them to the temporary Staging Area.
* `git commit` takes everything from the Staging Area and saves it permanently in the repository history.

### 2. Why do we need the Staging Area?
The Staging Area acts as a preview or rough-draft space. It allows you to select and review exactly which changes (or files) you want to package together before making a permanent commit.

### 3. What does `git log` show?
It displays the repository's timeline, including the unique Commit ID (SHA-1 hash), Author name, Date/Time, and the commit message.

### 4. What is the `.git/` folder?
It is the hidden brain of your repository where Git stores all tracking configuration, objects, and history. Deleting it instantly turns the folder back into a regular directory, wiping out your entire commit history.

### 5. Workflow Layers Explained
* **Working Directory:** The actual folder on your machine where you edit files.
* **Staging Area:** The virtual index space where files wait to be committed.
* **Repository:** The permanent database where Git securely locks your commit history.
