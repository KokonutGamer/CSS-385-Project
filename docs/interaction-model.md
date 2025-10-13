## Interaction Model
Currently, the top-down avatar-based interaction model is used for the test scene of this project. The player can control the avatar using the arrow keys. The implemented game mechanic so far is simply detecting collisions with the avatar - colliding with certain objects, such as a projectile or tower, will cause the player to lose health.

## Usage in Other Parts of the Game
Once other entities are introduced, such as allies, spawnable troops, and enemies, these will also need to detect collisions to calculate their health afterwards. In my current implementation, only a health stat is present on the character; in the future, attack, defense, movement speed, and other stats will be included as well.