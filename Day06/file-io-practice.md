# Day 06 — Linux Fundamentals: File I/O Practice Log

Today, I practiced basic file input and output operations using fundamental Linux streams and redirection commands.

## 1. Step-by-Step Command Execution

### Step 1: Create an empty file
* **Command:** `touch notes.txt`
* **Action:** Created a brand new empty text file named `notes.txt`.

### Step 2: Write the first line (Overwrite mode)
* **Command:** `echo "DevOps is all about automation and culture." > notes.txt`
* **Action:** Used the `>` operator to write the first line.

### Step 3: Append the second line
* **Command:** `echo "Linux file management is a core skill." >> notes.txt`
* **Action:** Used the `>>` operator to append text to the next line without deleting previous content.

### Step 4: Write and display at the same time using `tee`
* **Command:** `echo "Learning and improving one step at a time." | tee -a notes.txt`
* **Action:** The `tee -a` command displayed this string on my terminal screen and appended it to `notes.txt` simultaneously.

---

## 2. Reading the File Contents

### Command 5: Read the full file
* **Command:** `cat notes.txt`
* **Output captured:**
  ```text
Command 6: Read the top part of the file
Command: head -n 2 notes.txt

Output:
DevOps is all about automation and culture.
Linux file management is a core skill.

Command 7: Read the bottom part of the file
Command: tail -n 2 notes.txt

Output:
Linux file management is a core skill.
Learning and improving one step at a time.
  DevOps is all about automation and culture.
  Linux file management is a core skill.
  Learning and improving one step at a time.
