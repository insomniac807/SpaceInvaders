# SpaceInvaders
Space Invaders Style Game made in Processing as part of DT228s OOP module 
[![Video](http://4.bp.blogspot.com/_Odu7eqW6gAY/TFfUsRpZvYI/AAAAAAAAh5A/H2XXzGKA_3c/s1600/Space+Invader+Couch+by+Igor+Chak+01.jpg)](https://www.youtube.com/watch?v=KMusvw-UfcI&t=18s)

Features

  Main Menu
  
  The main menu is launched on startup and the user is given 4 options to chose from. From top to botto, start game, set difficulty, view control system, or quit application. Arrow keys are used to navigate the menus and the return key is used to select an option. As the player navigates, the menu options are highlighted in turn.
  
  
  Difficulty
  
  From the difficulty menu the player has 4 settings to chose from. The harder the diffculty selected, the less ammo available and the faster the enemies move down the screen. Options highlighted in green are currently being hovered on by the select function, while the selected option is highlighted in red. By default the game is set to run in normal difficulty mode.
  
  Controls
  
  When selected, this screen simply the user the control system for the game in a simple and stylish manner.
  
  
  Quit
  
  This option brings the user to the quit screen, which promts the player to verify they want to close the app. The player has the option of chosing no and returning to the main menu.
  
  New Game
  
  If a game has already been played, chosing this option will reset all parameters and start a new game from scratch. Once this option is selected the game begins and the player battles their way to 3 levels of varying challenge. Features multiple enemy types with varying difficulties and more enemies to kill as the levels progress.
  
  
  
Functionality

  I have done my best to seperate as much as possible, display code from control code. I found by doing this I could more easily organise my LevelManager class, making it more readable and also more functional. I have made the LevelManager class a sub-class of the Level class. By doing this I could keep all the level set-up and menu display code in methods of the level class, and in turn, have them inherited by the LevelManager. The LevelManager then 'manages' or controls which methods to call depending on key presses which control switches from the main class. 
The LevelManager also contains the game play code, which defines which level is currently playing, as well as some other game logic rules.

There are 2 main switches which control what screen is loaded and what code to run. mode is used to select game screens, and menuSelect is used to navigate around the various menu options. Both of these variable are passed through switch cases and mode also gets passed through the LevelManager letting it know where the player is in the game. 


Highlights

  For me personally I feel the soundtrack and sound effects add a layer of intensity to the action on screen. This is the first time I have worked with sound in code and although my implimentation is basic, I enjoyed in greatly. Being able to soundtrack your own game is very cool. 
  
I am also proud of the Explosion class, which animates a series on image files when an object is created.

All in all this was a good project to practice OOP concepts. I intend to build on it and re-up in the future.
