# 📄 MyGrep Script

MyGrep is a small Bash script that works like the basic grep command.
It can search for words inside a text file and supports options to show line numbers and invert matches.

## 🛠️ Features

Case-insensitive search (default).

Options supported:

`-n` → Show line numbers.

`-v` → Invert match (show lines that do not match).

Combined options like `-vn` or `-nv` are supported.

Error handling for missing arguments.

## 🚀 How to Use
Make sure the script is executable
`chmod +x mygrep.sh`

## Examples
`./mygrep.sh hello testfile.txt`

![WhatsApp Image 2025-04-28 at 12 41 43 AM](https://github.com/user-attachments/assets/88983bfc-6d32-47de-ae26-e481dde642a0)

`./mygrep.sh -n hello testfile.txt`

![WhatsApp Image 2025-04-28 at 12 42 01 AM](https://github.com/user-attachments/assets/cb9e0c2f-0ccf-4969-83fa-36126c94b153)

`./mygrep.sh -vn hello testfile.txt`

![WhatsApp Image 2025-04-28 at 12 42 32 AM](https://github.com/user-attachments/assets/97ff7883-64f0-4051-9016-68509b58ec7a)

`./mygrep.sh -v testfile.txt`

![WhatsApp Image 2025-04-28 at 12 42 46 AM](https://github.com/user-attachments/assets/e8486e76-7576-4ca5-b7d0-320696dac032)

