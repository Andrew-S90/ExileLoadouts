# ExileLoadouts
Loadout System for Exile

Save loadouts, modify and tweak everything in existing loadouts such as weapon attachments or items in your uniform/vest/bag without saving a whole new loadout!
Server owners can change the number of provided loadouts the player can save.

If a loadout is somehow corrupted it will attempt to repair a portion of the loadout so everything is not lost

Showcase video: https://www.youtube.com/watch?v=VJcyWqQDPqY

This was developed on a test server with EXTDB2, no infistar and no battleye.


# Install Instructions:

### Client

**config.cpp**

Paste the contents into the top of your config file. Modify existing network message section if needed.

Add the second portion inside class CfgInteractionMenus so you can see the action

**description.ext**

Paste the contents anywhere after `#include "RscDefines.hpp"` appears in your description.ext file

**initplayerlocal.sqf**

After `if (!hasInterface || isServer) exitWith {};` paste the upper contents of initplayerlocal.sqf found in the Client folder

**initServer.sqf**

Paste the contents on the top of this file. The server needs these client files to be able to check for valid loadouts.

If you are having trouble please view the example mission included.

**stringtable.xml**

Copy and paste this straight into the main directory for the mission file. (Next to the config.cpp etc.)

### Server

**Code**

No overrides needed, simply pbo the server folder and place inside your servermod folder (such as @ExileServer)


For support feel free to post in Exile Discord #support channel: https://discord.gg/cmMMHyJ

Unless something is broken or missing in this initial release I will not provide support or installation help, you are free to use this release as you wish.

Thank you!
