Desktop Fascinator: File Synch
##############################
:date: 2009-03-17 20:31
:author: Anonymous
:tags: fascinator DTeRrev
:slug: desktop-fascinator-file-synch
:status: published

| We've started work on the `Desktop Fascinator <http://fascinator.usq.edu.au/>`__ and it's coming together well. Oliver has managed to grab a snapshot of the filesystem, put it into FEDORA and index it with SOLR. Hopefully we'll have something up soon for people to check out and comment.
| For now, though, I've turned my attention to the part of the system reading the filesystem. The Fascinator uses harvesters to grab data from various places via various means and put the object/metadata into Fedora. For example, we have ORE and PMH harvesters to schlurp (technical term) up repository data. The current filesystem harvester basically takes a snapshot of the filesystem and load metadata into Fedora. We don't make a copy of the file in Fedora as we're expecting the files to get quite large and don't want to replicate that within the desktop.
| The main goal is to pick up what the user has in their directories and give them a more expansive (metadata/tags/etc) view of it. This means that the user can continue to use the filesystem and their preferred apps. It also means that we have to keep up with the filesystem state.
| The first thought was to poll the filesystem but that is rather intensive. Luckily, one our team members, Linda, has done a thesis that covers the alternatives and, with some quick research, I located some python options for Windows/Linux. I'm not certain how this works in OS X so I'll have to get one of the developers to test it. So for each platform:

-  Linux: use inotify via `pyinotify <http://pyinotify.sourceforge.net/>`__
-  Windows: use `FileSystemWatcher <http://msdn.microsoft.com/en-us/library/system.io.filesystemwatcher.aspx>`__ via IronPython
-  Mac: use `File System Events <http://developer.apple.com/documentation/Darwin/Conceptual/FSEvents_ProgGuide/Introduction/Introduction.html>`__ via Python (?)

| This gives us a common code base and we can wrap the code up as a service that logs filesystem going-ons - the FS Watcher Service. Thinking further, The Fascinator may not be running whilst the FS Watcher is doing its thing so we can push each event into a queue to be consumed once The Fascinator is running.
| The team laughs at my diagrams so I like to make sure I include one:

.. raw:: html

   <div style="text-align: center;">

|Diagram to match filesystem watcher description|

.. raw:: html

   </div>

| 
| There may still be an issue with staying current with the filesystem state. Something may be lost (if the service dies for some reason) so we might still need the scanning system in case a disconnect occurs between the filesystem and the repository. This would potentially be something that the user can run when they're not finding their file in The Fascinator.

.. raw:: html

   </p>

.. |Diagram to match filesystem watcher description| image:: http://1.bp.blogspot.com/_jslpfifycq4/ScAoOnt0-FI/AAAAAAAAAAU/n9doEjf9MCo/s320/fswatcher.png
   :name: BLOGGER_PHOTO_ID_5314291791941662802
   :target: http://1.bp.blogspot.com/_jslpfifycq4/ScAoOnt0-FI/AAAAAAAAAAU/n9doEjf9MCo/s1600-h/fswatcher.png
