import subprocess

from rich import print
from rich.prompt import Confirm


ORIGIN = "[bold blue]origin[/bold blue]"
WARN = "[bold yellow]WARN[/bold yellow]"


def main():
    print(f"Rolling back to latest commit from {ORIGIN}.")

    if not Confirm.ask(f"{WARN} All uncommitted work will be lost, continue?"):
        return

    subprocess.run(["git", "add", "."], shell=False)
    subprocess.run(["git", "stash"], shell=False)
    subprocess.run(["git", "pull"], shell=False)
    subprocess.run(["git", "stash", "drop"], shell=False)


if __name__ == "__main__":
    main()
