# kitchen_aide

## Description

This cookbook is a collection of helper recipes to make using test kitchen
easier.  This cookbook should never make it's way into a production deployment.
It's intended use is as recipes added to the .kitchen.yml runlists.

## Usage

Add the desired recipe to the end of the recipe list in a test kitchen 
suite.

## Recipes

### Solaris testing
'solaris_busser' will update the PATH used by sudo users and by the default login.
/etc/sudoers and /etc/default/login will both add /usr/xpg4/bin at the start of
the path.  Test kitchen requires a sh command with certain attributes.  Using
xpg4 directories provide the posix compliant version of the command.

### Converging without internet access
'http_proxy' will add environment variable settings to the root user.

## Attributes

The attributes defined by this recipe are organized under the
`node['kitchen_aide']` namespace.

default.kitchen_aid.proxy is set to the name of the http and https proxy to be
used.  

## Author

Nordstrom, Inc.

## License

Copyright (c) 2014 Nordstrom Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
