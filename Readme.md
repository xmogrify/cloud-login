Self-referencing Polymorphic bash script to use different browser profiles when logging in to different cloud acounts with different cloud CLIs.

Tested on macOS 10.14 (Mojave) - 13.2 (Ventura)
Tested with various versions of Google Chrome

Presently supports AWS and Azure CLIs

For AWS, the profile must match the name of a profile in ~/.aws/config, for Azure it is irrelevent.

Usage: ./cloud-login.sh &lt;aws|az> &lt;profile>