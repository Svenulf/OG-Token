# OG-Token
Origin Group Token

# Stages
1. Deployment of token
2. Deployment of a timelock contract for each beneficiary
3. Send tokens to timelock address

# Functions
Mintable
Burnable
Role Management
Pausable
Snapshot
Timelock

# Git
Initialize Git:
1. initialize Git in folder (only once)
    $ git init
2. tell Git who you are
    $ git config --global user.email "mailadress"
    $ git config --global user.name "username"
3. sync a remote repository
    $ git remote set-url origin "https://github.com/Svenulf/OG-Token.git"
    $ git pull origin master

Work flow:
1. add file to staging area (indexing file)
    $ git add "filename or foldername"
2. commit file to local depository
    $ git commit -m "message"
3. push file to Github
    $ git push

Other functions: 
Add file to project
$ touch
View project file status
$ git status
Check which is the current branch
$ git branch 

Git tutorial
https://intellipaat.com/blog/tutorial/devops-tutorial/git-tutorial/


# Timelock notes
Unix epoch timestamp converter (blocktime)
https://www.epochconverter.com/

block.timestamp = current block timestamp in Unix Epoch Time  
_releaseTime = block.timestamp + _lockedUpTime = 1 day ahead from now (if _lockedUpTime = 1 days)

How to use:
1. Update OGTokenTimelock contract with the desired beneficiary and timestamp
2. Deploy OGTokenTimelock contract
3. Deposit tokens in deployed OGTokenTimelock contract

Functions:
token()             // Return held token
beneficiary()       // Return beneficiary
releaseTime()       // Return release time
release()           // Release token to beneficiary if block.timestamp >= releaseTime()

