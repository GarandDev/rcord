import toml

WALLY_PATH = './wally.toml'
VERSION_PATH = './VERSION'

def changeWallyVersion(version):
    with open(WALLY_PATH, 'r') as file:
        content = toml.load(file)
    
    content["package"]["version"] = version
    
    with open(WALLY_PATH, 'w') as file:
        toml.dump(content, file)
        
def changeFileVersion(version):
    with open(VERSION_PATH, "w") as file:
        file.write(version)

def getCurrentVersion():
    return open(VERSION_PATH, 'r').read()

def parseVersion(version):
    return tuple(map(int, version.split('.')))

def isVersionLowerThanCurrent(version):
    return parseVersion(getCurrentVersion()) >= parseVersion(version)

def changeVersionPrompt():
    current_version = getCurrentVersion()
    version = input("[rCord]: What version do you want to release this under (current: " + current_version + ")? ")
    if isVersionLowerThanCurrent(version):
        proceed = input("[rCord] Tried version is lower than the old one, are you sure you want to proceed (Y, N)? ")
        if proceed.lower() == "n":
            exit()
    
    assert len(parseVersion(version)) > 2, (
        "You need to have 3 numbers, for eaxmple: 3.0.0"
    )
    
    return version

if __name__ == "__main__":
    version = changeVersionPrompt()
    changeWallyVersion(version)
    changeFileVersion(version)