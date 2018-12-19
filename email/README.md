# E-mail

E-mail related configurations and scripts.

## Stack

  - neomutt
  - notmuch
  - mbsync
  - Python 2 and 3

## Install

1. Create symbolic links:

```bash
ln -s $(pwd)/.mutt ~/.mutt
mkdir ~/.mutt/log/
ln -s $(pwd)/.muttrc ~/.muttrc
ln -s $(pwd)/.mbsyncrc ~/.mbsyncrc
```

2. Add encrypted secrets to `~/.mutt/secrets/`.

3. Add `*/5 * * * * ~/.mutt/scripts/sync-mailboxes` to the user's crontab.
