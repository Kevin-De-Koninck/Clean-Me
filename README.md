# Clean-Me
A small macOS app that acts as a system cleaner (logs, cache, ...)

<img src="https://github.com/Kevin-De-Koninck/Clean-Me/blob/master/ReadMe%20Resources/Cleam-Me-image1.png?raw=true" width="400" /><img src="https://github.com/Kevin-De-Koninck/Clean-Me/blob/master/ReadMe%20Resources/Cleam-Me-image2.png?raw=true" width="400" />

# Read this first

I do NOT recommend you to delete ALL of your cache (or cache of some specific programs). Cache files is what makes your program load faster and preform tasks faster. If you delete it, your program will not only start slower, but will REGENERATE the cache files again. This will NOT save you some precious space on your disk.
But if you do have a problem and want to delete the cache of some programs, I suggest you to click on the folder icon and search for that program and delete it this way.

If you have large log files, then you can delete these but first check the log files. A large log file mostly indicates that a problem (or your system) really has some problems.

What I do recommend are also the options that I check when the app loads: emptying the trash, deleting Xcode derived data and mail attachments (once in a while).

I wrote this app just for fast analysing purposes. (E.g. it's always fun to know how big your Document Revisions folder is)

PS: you can see which folders I check [here.](https://github.com/Kevin-De-Koninck/Clean-Me/blob/master/Clean%20Me/Paths.swift#L11)

# Security

I use the pod ['STPrivilegedTask'](https://github.com/sveinbjornt/STPrivilegedTask) to handle sensitive data like getting your root password. Clean Me does not save this password, nor it loads the password in a variable. If you do not trust Clean Me, then check its code or block all internet access with Little Snitch or RadioSilence (normally it shouldn't request an internet connection).

# Enable full disk access to be able to remove iMessage attachments

To be able to remove iMessage attachments, Clean Me requires full disk access. **DO NOT GRANT THIS IF YOU DO NOT TRUST CLEAN ME.**

To enable full disk access:
1. Pull down the  Apple menu and choose 'System Preferences'
2. Choose "Security & Privacy" control panel
3. Now select the "Privacy" tab, then from the left-side menu select "Full Disk Access"
4. Click the lock icon in the lower left corner of the preference panel and authenticate with an admin level login
5. Now click the [+] plus button to add the Clean Me app with full disk access
6. Navigate to the /Applications/Utilities/ folder and choose "Clean Me" to grant Clean Me with Full Disk Access privileges


# Example of a use case
When someone was running Appium for iOS (with the Xcode webdriveragent), he saw that his disk gets filled with some files (available disk space was shrinking over time). But a DaisyDisk search did not reveal his problem.

After running this app, we saw that Xcode Derived Data had a size of 60GB and system logs (/var/private/folders) had a size of 25GB.
It turned out that Xcode builds the WebDriverAgent every time he started a test (explaining the large Xcode derived data folder) and that the app (payload) and screenshots that Appium generated were saved in this folder: /private/var/folders. He fixed this issue by running a small script that cleans these 2 folders every week (cron job).

# Example of another use case
TL;DR: A friend of mine is not very technical but sends and receives a lot of mails on his MacBook. Then he told me that he wanted to clear out some space and asked me if I knew something to do. I asked him to run my program en delete his downloaded mail attachments. This saved him 23GB.

# How to install

### Via Homebrew cask
You can find it [here](https://formulae.brew.sh/cask/clean-me). Install it as follows:
```
brew cask install clean-me
```

If you notice that the version on cask is outdated, please follow the instructions [here](https://github.com/Homebrew/homebrew-cask/blob/master/CONTRIBUTING.md#updating-a-cask) to update it for everyone, TL;RD:

``` bash
brew install vitorgalvao/tiny-scripts/cask-repair
cask-repair clean-me
```

### Manually
Clean-Me can be installed like any other macOS app file:
1. Download it [here](https://github.com/Kevin-De-Koninck/Clean-Me/releases/download/v1.4.1/Clean.Me.app.zip)
2. Unzip the file
3. Copy the unzipped file (Clean me.app) to you `Applications` directory on your MacBook
4. (Only the first time) In the `Applications` directory, right-click the file and chose 'open'
5. Now you can access Clean Me like any other macOS app on your system

# How to use
When you've opened the app, you have 4 options:
- Click the app logo to see some other apps that I recommend (with links) and some links to this GitHub page (check for updates) and my webpage (but still need to write a page for it...).
- Click analyse to see how much space each topic consumes (also those topics that are not selected). This will ask for your administrator's password for scanning the directories that require root. If you do not provide the password, Clean Me will just skip those files for which it requires root.
- Click 'Clean' to delete all topics that are selected. If a certain topic requires root, it will ask for the password. Again, if you do not provide the password, it will skip those files.
- Click the little folder icon to open the specific folder which will be cleaned.

# Contributors
The following user(s) contributed with code or good idea's:
- [bsharper](https://github.com/bsharper) - see [#1](https://github.com/Kevin-De-Koninck/Clean-Me/issues/1)
- [SMillerDev](https://github.com/SMillerDev) - see [#25](https://github.com/Kevin-De-Koninck/Clean-Me/pull/25)
- [fabianschwarzfritz](https://github.com/fabianschwarzfritz) - see [#30](https://github.com/Kevin-De-Koninck/Clean-Me/pull/30)
