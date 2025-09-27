## Brainstorming Ideas

### Overview
Below is an ordered list of game ideas I want to build. I'll consider building a game based on how feasible I think it will be for me to build it throughout the quarter.
1. Reverse Tower Defense (Tower Offense)
2. 2D Platform Fighter
3. 2D Platform CTF
4. Doodle Jump PvP

### Reverse Tower Defense (Tower Offense)
As the title suggests, the player controls minions to attack the enemy towers, the opposite of what a tower defense game has the player do. Below, a short summary of the game and plot is provided.

> You're the protagonist of an average isekai (a genre in anime). The locals of an impoverished town within the country you spawned in are dissatisfied with the monarch ruling the kingdom. It is up to you, the ***MAIN CHARACTER***, to usurp the throne and free the people from tyranny!
>
> As their only hope for rebellion, you lead the people in a war against the kingdom's soldiers! In battle, you are limited to how many troops you can spawn based on a morale bar. This morale bar regenerates over time; however, it will cap at a maximum limit. 

The main mechanic of the game is to spawn troops to attack towers and enemy troops on each level. To add variety, I'm thinking about having three different classes of troops: offense, defense, and support. In this course, I want to make at least one ally troop for each class, and as a stretch goal, implement a second type for each class. I also want to encourage a variety of playstyles by having players configure loadouts or teams before entering a level. These specific playstyles will gain certain buffs based on their playstyle.

Some platystyles I can think of at the moment are:
- Balanced: when each number of offense, defense, and support classes spawned is close in number, ally troops receive buffs to attack, defense, and health.
- Offensive: when the number of offense units spawned is greater than the number of defense and support troops combined, offense units gain increased movement speed, attack speed, and attack damage.
- Defensive: when the number of defense units spawned is greater than the number to the number of defense and support troops combined, defense units partially reflect damage taken and taunt enemy units around them.
- Supportive: when the number of support units spawned is greater than the number to the number of offense and defense troops combined, support unit attack spells decrease the defense of enemy troops, and support unit crowd-controlling spells have a longer lasting effect.
- Lone Wolf: the less troops on the field there are and the more the morale gauge is filled, the protagonist gains stronger abilities, increased attack, and increased defense.

I'd like to try an isometric view for this game - I think this makes the most sense for spawning and managing troops. (For my own reference, here is a tutorial on [isometric games in Godot](https://youtu.be/f1j1pPEFaUo?feature=shared)).

Just like in games such as Bloons Tower Defense 6, enemy mechanics are built around countering certain strategies, and players must learn how to adapt to certain scenarios. Over the quarter, I'll think of ways to counter certain strategies. For now, I think this amount of information is sufficient for this game.

Since the reverse tower defense game is the one I'd like to do the most right now, I provided in-depth analysis on some of its game mechanics. For the rest of the games, I'll provide a brief summary.

### 2D Platform Fighter
This one is simple - a Smash clone. Damage increases percentage on a character; knockback scales with percentage; the objective is to knock the other player off of the screen. I have character ideas I want to implement, but I feel that this one is also the most technical in terms of coding as it will involve fine-tuning a state machine for a fighting game along with tweaking small things such as knockback angles and damage for specific moves.

### 2D Platform CTF
In this game, the goal is to reach a target within a 2D map before the other player. When I was imagining this game, I thought about the vast world of Hollow Knight: what if we spawned two players in random locations in Hallownest and have them race to a midpoint between them? This one was a fun one I thought of, but it might be better suited as a mod, or for when I can imagine how to procedurally generate fair maps for players.

### Doodle Jump PvP
Now imagine you're playing doodle jump - but instead of trying to reach the highest you can, you're up against another player, trying to shoot them down from afar. This game is more casual, but it could have some potential if I really fleshed out the competitive aspect of it.