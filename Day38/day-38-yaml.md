# Day 38 Notes: YAML Syntax, Formatting & Validation Rules

---

## 📜 Task 1 & 2: Lists & Key-Value Syntax

### Two Ways to Represent Lists in YAML
1. **Block Format (Dash `-` with indent):**
   ```yaml
   tools:
     - Docker
     - Kubernetes

🔍 Task 5 & 6: Validation & Spot the DifferenceSpot the Difference ChallengeYAML
# Block 1 - CORRECT
name: devops
tools:
  - docker
  - kubernetes

# Block 2 - BROKEN
name: devops
tools:
- docker
  - kubernetes
  - 
What is wrong with Block 2?In Block 2, - docker and - kubernetes are at inconsistent indentation levels (0 spaces for docker vs 2 spaces for kubernetes). YAML parsers expect sibling list items to share identical indentation.

💡 Key Lessons Learned (3 Golden Rules of YAML)
Spaces Only — No Tabs: YAML parsers strictly reject tab characters (\t). Always use 2 spaces per indentation level.
Colons Need Space: A colon defining a key-value pair MUST be followed by a space (e.g., name: Deepika, NOT name:Deepika).
Data Types Matter: true/false are parsed as booleans, whereas "true" or "false" in quotes are parsed as strings.
