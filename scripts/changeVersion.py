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
    assert not isVersionLowerThanCurrent(version), (
        "Tried to release " + version + " but it is below current version " + current_version
    )
    
    return version

if __name__ == "__main__":
    version = changeVersionPrompt()
    changeWallyVersion(version)
    changeFileVersion(version)