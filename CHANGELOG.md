# Revision History for zpool

## 0.0.3

* Add the force and mountpoint resource options.
* Set up test-kitchen use and add serverspec tests
* Clean up rubocop offences
* Use zpool status instead of zpool list -v to find volumes in use. "-v" is not
  a valid solaris option.
* When the ashift option value is 0 don't add the option to the create command.
