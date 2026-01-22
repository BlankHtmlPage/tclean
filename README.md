# tclean 🧹

![Pull Requests are welcome](https://img.shields.io/badge/PRs%20are-welcome-green?style=flat-square)
![Coded by BlankHtmlPage and contributors](https://img.shields.io/badge/%3C%2F%3E%20by%20BlankHtmlPage-and%20contributors-orange?style=flat-square)

**Termux Deep Cleaner**

`tclean` is a lightweight Bash script designed to free up storage space in Termux by removing cached data, unused dependencies, and temporary files. It intelligently detects installed package managers (like pip, npm, go) and cleans them only if they exist.

## 🚀 Features

`tclean` automatically cleans the following:

*   **APT:** Clears cache and removes unused dependencies (`autoremove`).
*   **Python:** Purges `pip` cache.
*   **Node.js:** Cleans `npm` and `yarn` caches.
*   **Golang:** Cleans `go` module cache.
*   **System:** Removes temporary files (`$PREFIX/tmp`) and logs (`$PREFIX/var/log`).
*   **User Cache:** Wipes the `~/.cache` directory.
*   **Compiler Cache:** Clears `ccache` (if installed).
*   **Thumbnails:** Removes generated image thumbnails.

## 📥 Installation

1. Download the script

```bash
curl -O "https://raw.githubusercontent.com/BlankHtmlPage/tclean/refs/heads/main/tclean.sh"
```

2. Make it executable

```bash
chmod +x tclean.sh
```

## ⚙️ Usage

### Run locally
To run the script from the current directory:

```bash
./tclean.sh
```

### Install globally (Recommended)
To run `tclean` from anywhere in Termux, move it to your bin folder:

```bash
mv tclean.sh $PREFIX/bin/tclean
chmod +x $PREFIX/bin/tclean
```

Now you can simply type `tclean` anytime you want to clean up!

## ⚠️ Disclaimer

This script removes files in temporary directories and cache folders (specifically `~/.cache`). While this is generally safe and intended for freeing up space, please ensure you do not have important persistent data stored in temporary folders before running.

## 📄 License

Copyright © 2026 **BlankHtmlPage**.

Licensed under the **Apache License, Version 2.0**. See the script header or [LICENSE](http://www.apache.org/licenses/LICENSE-2.0) for details.
