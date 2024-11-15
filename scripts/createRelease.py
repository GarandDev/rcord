"""
Pretty hardcoded release script that makes it easier for me to quickly release and change versions for all systems
"""

import subprocess
import changeVersion

def checkUncomittedChanges():
    result = subprocess.run(['git', 'status', '--porcelain'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    return True if result.stdout else False

if __name__ == "__main__":
    version = changeVersion.changeVersionPrompt()

    if checkUncomittedChanges():
        proceed = input("[rCord] You have uncommited changes, will you still proceed (Y, N)? ")
        if proceed.lower() == "N":
            exit()
    
    changeVersion.changeWallyVersion(version)
    changeVersion.changeFileVersion(version)
    print("[rCord] Changed versions")
    