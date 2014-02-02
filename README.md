arls
====



Usage examples
--------------


### Recursive directory listing ordered by size sorted ascending


This one is useful for finding large files.

~~~~ bash
arls /home/user size
~~~~


is exactly the same as:


~~~~ bash
arls /home/user s
~~~~


or:

~~~~ bash
arls /home/user bytes
~~~~


or:

~~~~ bash
arls /home/user b
~~~~




### Recursive directory listing ordered by modification time sorted ascending


This one is useful for identifying last modified files of an infected website.

~~~~ bash
arls /home/user mtime
~~~~


is exactly the same as:

~~~~ bash
arls /home/user m
~~~~




### Recursive directory listing ordered by access-rights sorted ascending


This one is useful for identifying files and directories, with strange
or insecure access rights (permissions).

~~~~ bash
arls /home/user access-rights
~~~~


is exactly the same as:

~~~~ bash
arls /home/user rights
~~~~


or:

~~~~ bash
arls /home/user r
~~~~
