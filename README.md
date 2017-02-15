# Clean-Me
A small macOS app that acts as a system cleaner (logs, cache, ...)

<img src="https://github.com/Kevin-De-Koninck/Clean-Me/blob/master/ReadMe%20Resources/Cleam-Me-image1.png?raw=true" width="400" />
<img src="https://github.com/Kevin-De-Koninck/Clean-Me/blob/master/ReadMe%20Resources/Cleam-Me-image2.png?raw=true" width="400" />

# Read this first

I do NOT recommend you to delete ALL of your cache (or cache of some specific programs). Cache files is what makes your program load faster and preform tasks faster. If you delete it, your program will not only start slower, but will REGENERATE the cache files again. This will NOT save you some precious space on your disk.
But if you do have a problem and want to delete the cache of some programs, I suggest you to click on the folder icon and search for that program and delete it this way.

If you have large log files, then you can delete these but first check the log files. A large log file mostly indicates that a problem (or your system) really has some problems.

What I do recommend are also the options that I check when the app loads: emptying the trash, deleting Xcode derived data and mail attachements (once in a while).

I wrote this app just for fast analyzing purposes. (E.g. it's always fun to know how big your Document Revisions folder is)


# How to use
Download it [here](https://github.com/Kevin-De-Koninck/Clean-Me/releases/download/v1.1.1/Clean.Me.app.zip) and copy it to your application folder. Then open the app.
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
