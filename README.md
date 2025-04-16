# shellWatchMeOn
**ShellWatchMeOn** is a collection of **Shell Scripts developed as part of a programming**  course focused on linux commands, **conditionals**, **loops**, **functions**, **create logs**, **debugs automation**, **process monitoring**, and **system management** through the terminal. These scripts cover a variety of practical tasks, including working with conditional statements, loops, file backups, and categorizing files by extension.

All scripts are free for modification and use. Feel free to contribute or adapt them for your own projects!
---
## Scripts Included
---
-  ###  Benvindo.sh
A simple script that greets the user based on the current time of day (morning, afternoon, evening) using conditional statements.

**Functionality**: Displays a greeting message (Good morning, Good afternoon, or Good evening) based on the current hour.

**Use Case**: Helpful as a beginner example for working with conditionals and date/time in Shell Script.

<br>
<br>
<br>

---
- ###  checkChanges.sh
Monitors a specified URL for changes by comparing the page’s hash value and notifying the user when the page content has changed.

**Functionality**:  Downloads the page, checks its hash, and compares it with the previous hash stored in file_hash.txt. If the page changes, the script outputs a notification. 

**Use Case:** Ideal for monitoring changes on webpages, like checking for content updates, price changes, or news updates.

<br>
<br>
<br>

---
- ###  countTypes.sh
Categorizes and counts the file extensions within a specified directory, providing a summary of the types of files present.

**Functionality**: Reads the file names in the provided directory, categorizes them by extension, and then counts how many files exist for each extension.

**Use Case**: Useful for organizing and auditing file types in a directory.

<br>
<br>
<br>

---
- ###  createBAK.sh
A backup script that creates .tgz compressed backups of a user’s home directory, excluding the backup folder itself. It also checks if the last backup was older than 7 days and prompts the user to decide whether to proceed with the backup.

**Functionality**: Checks for existing backups, creates a backup if necessary, and automates the process with a cron job.

**Use Case**: Ideal for automating the backup of important files in the user’s home directory.

<br>
<br>
<br>

---
- ###  mapPS.sh
Monitors running processes and waits until all specified programs have terminated.

**Functionality**: Takes a list of process names as arguments. Continuously checks if any of those processes are running. Only exits (with confirmation) once all have completely stopped.

**Use Case**: Ideal for monitoring long-running background tasks and triggering actions only after they complete.

<br>
<br>
<br>

---
- ###  infoMachine.sh
Prints a machine status report.

**Functionality**: Displays Hostname, Current date/time, System uptime, Kernel version, CPU model and number of cores, Total memory
Mounted partitions and usage

**Use Case**: Quick overview of system status, great for support, audit, or diagnostics.

<br>
<br>
<br>

---
- ###  sumNumbers.sh
Performs a simple addition of two numbers entered by the user.

**Functionality**: Prompts the user for two numbers and returns their sum.

<br>
<br>
<br>

---
- ###  dataShift.sh
Manipulates and formats date strings in either Brazilian or US format.

**Functionality** : Supports the following operations:

-f → Detects and returns the date format (BR, US, unknown, invalid).

-i → Inverts the format (e.g., BR → US, or vice-versa).

-b → Adds slashes to compact dates (e.g., 13081981 → 13/08/1981).

-e → Displays the date in full written format (e.g., “13 de Agosto de 1981”).

**Use Case**: Useful for formatting user input dates or adapting between localization standards.

<br>
<br>
<br>
<br>

---
- ###  ⚙️ Technologies Used
**Bash**: Core scripting language for all the scripts.

**Cron**: Automates periodic tasks like backups and monitoring.

**Curl**: Used for downloading web pages to monitor for changes.

**Tar**: Used for compressing files into .tgz archives for backups.

**Visual Studio Code** : The IDE of choice for writing and editing the shell scripts, thanks to its rich plugin ecosystem and terminal integration.

**WSL (Windows Subsystem for Linux)**: Since this was developed on Windows, WSL was used to run a virtualized Linux environment and execute all Bash scripts natively as if on a Linux machine.



