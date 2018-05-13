# Clean-Me
A small macOS app that acts as a system cleaner (logs, cache, ...)

<img src="https://github.com/Kevin-De-Koninck/Clean-Me/blob/master/ReadMe%20Resources/Cleam-Me-image1.png?raw=true" width="400" /><img src="https://github.com/Kevin-De-Koninck/Clean-Me/blob/master/ReadMe%20Resources/Cleam-Me-image2.png?raw=true" width="400" />

# Read this first

I do NOT recommend you to delete ALL of your cache (or cache of some specific programs). Cache files is what makes your program load faster and preform tasks faster. If you delete it, your program will not only start slower, but will REGENERATE the cache files again. This will NOT save you some precious space on your disk.
But if you do have a problem and want to delete the cache of some programs, I suggest you to click on the folder icon and search for that program and delete it this way.

If you have large log files, then you can delete these but first check the log files. A large log file mostly indicates that a problem (or your system) really has some problems.

What I do recommend are also the options that I check when the app loads: emptying the trash, deleting Xcode derived data and mail attachements (once in a while).

I wrote this app just for fast analyzing purposes. (E.g. it's always fun to know how big your Document Revisions folder is)

PS: you can see which folders I check [here.](https://github.com/Kevin-De-Koninck/Clean-Me/blob/master/Clean%20Me/Paths.swift#L11)

# Security

I use the pod ['STPrivilegedTask'](https://github.com/sveinbjornt/STPrivilegedTask) to handle sensitive data like getting your root password. Clean Me does not save this password, nor it loads the password in a variable. If you do not trust Clean Me, then check it's code or block all internet access with Little Snitch or RadioSilence (normally it shouldn't request an internet connection).

# ToDo

See if I can reduce the iMessage size.

# Example of a use case
When someone was running appium for iOS (with the Xcode webdriveragent), he saw that his disk gets filled with some files (available disk space was shrinking over time). But a DaisyDisk search did not reveal his problem.

After running this app, we saw that Xcode Derived Data had a size of 60GB and system logs (/var/private/folders) had a size of 25GB.
It turned out that Xcode builds the WebDriverAgent every time he started a test (explaining the large Xcode derived data folder) and that the app (payload) and screenshots that appium generated were saved in this folder: /private/var/folders. He fixed this issue by running a small script that cleans these 2 folders every week (cron job).

# Example of another use case
TL;DR: A friend of mine is not very technical but sends and receives a lot of mails on his macbook. Then he told me that he wanted to clear out some space and asked me if I knew something to do. I asked him to run my program en delete his downloaded mail attachments. This saved him 23GB.

# How to install
Clean-Me can be installed like any other macOS app file:
1. Download it [here](https://github.com/Kevin-De-Koninck/Clean-Me/releases/download/v1.2.0/Clean.Me.app.zip)
2. Unzip the file
3. Copy the unzipped file (Clean me.app) to you `Applications` directory on your macbook
4. (Only the first time) In the `Applications` directory, right-click the file and chose 'open'
5. Now you can access Clean Me like any other macOS app on your system

# How to use
When you've opened the app, you have 4 options:
- Click the app logo to see some other apps that I recommend (with links) and some links to this github page (check for updates) and my webpage (but still need to write a page for it...).
- Click analyze to see how much space each topic consumes (also those topics that are not selected). This will ask for your administrator's password for scanning the directories that require root. If you do not provide the password, Clean Me will just skip those files for which it requires root.
- Click 'Clean' to delete all topics that are selected. If a certain topic requires root, it will ask for the password. Again, if you do not provide the password, it will skip those files.
- Click the little folder icon to open the specific folder which will be cleaned.

# Demo
[Click here for the GIF.](https://github.com/Kevin-De-Koninck/Clean-Me/blob/master/ReadMe%20Resources/demo.gif)

# Contributors
The following user(s) contributed with code or good idea's:
- [bsharper](https://github.com/bsharper) - see [#1](https://github.com/Kevin-De-Koninck/Clean-Me/issues/1)
