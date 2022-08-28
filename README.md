# TITATO
A Single Player and Multiplayer Tic-tae-toe game.

<p align="center">

  <img width="100" src="https://user-images.githubusercontent.com/67695658/187071653-050e6454-8ba4-4089-b1f1-fe3250974928.png">

</p>

<p align="center">" Just a simple tic-tac-toe game "</p>

## 🎉Introduction
Tic-tac-toe (American English), noughts and crosses (Commonwealth English), or Xs and Os (Irish English) is a paper-and-pencil game for two players who take turns marking the spaces in a three-by-three grid with X or O. The player who succeeds in placing three of their marks in a horizontal, vertical, or diagonal row is the winner. It is a solved game, with a forced draw assuming best play from both players. [1]
## 💡Motivation
When I was studied in elementary , my childhood is stick with tic-tac-toe .A game that you can play everywhere just with a pen and a piece of paper,you can compete with your friends and have a great momemnt when winning.You don't have to teach the other because the game is very easy to play.So this time I make it on the phone with multiplayer mode so you can play with your friend even from very far distance or if you dont have friend you can also play with an AI with different mode to experience.
## 📖 Rules and Tips
The goal of the game is to connect number symbols indicated on the below figure.   
![threewin](https://user-images.githubusercontent.com/67695658/187071397-628c2671-ab2f-41b6-a499-4ad834f3b2bf.png)  
You can connect symbols in any direction row, column or diagonal. 
Some winning examples:  

<img width="251" alt="rightdiagonalwin" src="https://user-images.githubusercontent.com/67695658/187071436-8391d6e6-2e9a-4caa-9f3b-c641b00f328e.png">   
<img width="245" alt="leftdiagonalwin" src="https://user-images.githubusercontent.com/67695658/187071441-b3a03bba-4b46-4de4-a50b-fd9b5b4f1f41.png">   

### TIPS: 
- You should make a move in the middle.  
- For defence , you should make moves in every corner if the other make a move in middle.  
- You will win if other makes mistake and conversely.  
## 💎 Main Features
###	- Greeting View (Menu view):
From this view, users can navigate these below views: Game view,Leaderboard button. , How to play view and Leaderboard view:
###	- List of high scores (or past scores)
The view display that all users have played with their score and achievement badges they got.
###	- Game view:
The view where users can play with your game..There is the current score/status of the game. User can take some actions to progress the game.There is some animations with “xmark” and “omark”.The is a status of the turn of the player.
###	- How to play view:
Show user rules/how to play this game.
###	- Effect sounds:
There are background music for every view. There is a sound effect when tap when play game and achieve the badges. Also, there is sound effect when lose, win and drawn.
### - The game works well on iPhone 11 upper.

## ⚙️ Extra Features 
 ### 1. Resume match
 By implement auto save , when user make any move , the game will automatically save .When player open the app , the game will ask if he/she want to continue, if yes the game will load the last game and continue to play.
 ### 2. Changing name 
 Player can change name in greeting view or in setting view. The leaderboard will show different names for each score
 ### 3. Achievement badges 
 When player score is 1400 , 3000,4000,100000,10000000 ,they will get badge and message announce getting the badge.
 ### 4. Difficulty system
 There are 3 mode when player plays with AI : Gacha,Easy,Hard. 
 In the gacha mode, player and AI will make random moves.In Easy mode, AI will make random moves .And in the last mode, player will play with a smart AI .
 ### 5. AI game agent
  In Easy mode, AI will make random moves .And in the last mode, player will play with a smart AI . IN the hard mode, the AI will check a set of winning moves , if the player move is in a set of winning move ,the AI will move the next win moves so that players cannot complete their winning move.
 ### 6. Dark mode
 The application uses neutral colors so the program can works well in both light mode and dark mode.
 ### 7. Multiplayer
 In the multiplayer mode, the user create a room and wait for other player. When other player gets in ,they will start the game in real time playing .
 
 ## 📷 Screenshot

<img src="https://user-images.githubusercontent.com/67695658/187081626-d9666181-ebbb-403b-ac4c-7ff1f48f21e1.png" width="238" ><img src="https://user-images.githubusercontent.com/67695658/187081672-180d3330-0aa7-4716-a394-a0c4d31439fd.png" width="238" >  
<img src="https://user-images.githubusercontent.com/67695658/187082466-f6f258f4-5b15-469d-8136-7f9df5c8707e.png" width="238" ><img src="https://user-images.githubusercontent.com/67695658/187082470-e08c5253-499e-40d6-94a1-fbebeb72d6c6.png" width="238" >  
<img src="https://user-images.githubusercontent.com/67695658/187082474-24d329fd-a3ff-41ac-a95a-bee9b9765ab8.png" width="238" ><img src="https://user-images.githubusercontent.com/67695658/187082476-ecd3a92d-c0df-4bea-8b34-38c74941b5e6.png" width="238" >  
<img src="https://user-images.githubusercontent.com/67695658/187082479-4bad5d49-caeb-4a41-9f95-f60733a0538f.png" width="238" >


## 🔮 Live Demo (Animation GIF)

<table>
  <tr>
    <td>Full Version</td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/67695658/187083648-e71f4b38-b182-4942-8325-24c282c2a9c2.gif" width="280"></td>
   </tr>
  <tr>
    <td>Multiplayer</td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/67695658/187084248-004c0799-4365-4f08-a6ee-f41170b83d34.gif" width="280"></td>
    <td><img src="https://user-images.githubusercontent.com/67695658/187084249-b0758f82-079b-471a-b12b-3a37bdd94482.gif" width="280"></td>
   </tr>
 </table>

## 🔧 Build Information
- Xcode 13.4.1
- SwiftUI Framework
- Target Deployment iOS >=15.3
- Library: Firebase,AVFoundation,Combine
- Note for build : Just download,open the .xcodeproj , wait until it finish downloading firebase.Choose Iphone 11 for simulation.
## Futher Improvement
- Anti cheating system (players can use multiple finger to win)
- Avatar for users 
- Leaderboard works in multiplayer
## 👑 Author
- Nguyen Tuan Anh - s3864077@rmit.edu.vn

## Reference
[1] 	wikipedia, "Wikipedia," [Online]. Available: https://en.wikipedia.org/wiki/Tic-tac-toe. [Accessed 27 August 2022].![image](https://user-images.githubusercontent.com/67695658/187071108-18fa5b16-f813-4879-8c27-7064f931ffb7.png)
