# Scripts

Store any useful scripts or templates in this directory, `scripts`.

#### Permissions

As a precaution, I'm *trying to* keep their permissions non-executable while
I'm not using them.

`chmod -x /path/to/script-file.sh`

Just flip the executable permissions when you're using them...

`chmod +x /path/to/script-file.sh`

### Backup

I'm opting not to store instructions for backing up in its own script file.
But here's how to back up:

`rsync -av ./* $HOME/Dropbox/scripts`
