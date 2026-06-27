# Day 16 Challenge — Shell Scripting Basics

Today, I started my shell scripting automation journey by learning the core mechanics of syntax expansion, variable evaluation, dynamic reading parameters, and execution logic conditionals.

---

## 1. Challenge Scripts and Code Logs

### Task 1: `hello.sh`
```bash
#!/bin/bash
echo "Hello, DevOps!"
Execution Output: Hello, DevOps!

What happens if you remove the shebang line? If the shebang (#!/bin/bash) is removed, the operating system kernel does not know which interpreter to invoke. It will default to the current execution shell (usually sh or bash in standard setups). However, if the script uses advanced bash-specific features (Bashisms) and falls back to a basic POSIX sh interpreter, the script will break with syntax errors.

Task 2: variables.sh
Bash
#!/bin/bash
NAME="Deepikasri Baskar"
ROLE="Cloud & DevOps Engineer"

echo "Double Quotes: Hello, I am $NAME and I am a $ROLE"
echo 'Single Quotes: Hello, I am $NAME and I am a $ROLE'
Single vs Double Quotes Difference: * Double Quotes ("..."): Allows interpolation/evaluation. Variables prefixed with $ are replaced with their actual runtime string values.

Single Quotes ('...'): Treats everything as a hard literal string. Variable expansion is disabled;  $NAME is printed exactly as characters.

Task 3: greet.sh
Bash
#!/bin/bash
read -p "Enter your name: " NAME
read -p "Enter your favorite tool: " TOOL
echo "Hello $NAME, your favorite tool is $TOOL."
Task 4: check_number.sh & file_check.sh
check_number.sh
Bash
#!/bin/bash
read -p "Enter a number: " NUM
if [ $NUM -gt 0 ]; then
    echo "The number is Positive."
elif [ $NUM -lt 0 ]; then
    echo "The number is Negative."
else
    echo "The number is Zero."
fi
file_check.sh
Bash
#!/bin/bash
read -p "Enter filename to check: " FILENAME
if [ -f "$FILENAME" ]; then
    echo "File '$FILENAME' exists."
else
    echo "File '$FILENAME' does not exist."
fi
Task 5: server_check.sh
Bash
#!/bin/bash
SERVICE="nginx"
read -p "Do you want to check the status of $SERVICE? (y/n): " CHOICE

if [ "$CHOICE" == "y" ] || [ "$CHOICE" == "Y" ]; then
    echo "Checking $SERVICE status..."
    if service nginx status > /dev/null 2>&1; then
        echo "$SERVICE is Active and Running."
    else
        echo "$SERVICE is Stopped/Inactive."
    fi
else
    echo "Skipped."
fi
2. Key Learnings & Takeaways
The Core Shebang Directive: Understood how the kernel reads the leading magic bytes (#!) to map standard code parameters cleanly into dedicated processing shells.

Expansion Contexts: Mastered the structural difference between single literal quoting frameworks and double variable parsing frames.

Condition Optimization Syntax: Practiced building standard robust evaluation chains using if-else loops, flags like -f for filesystem validations, and operators like -gt / -lt for numerical checking.
