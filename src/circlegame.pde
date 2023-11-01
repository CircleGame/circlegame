import processing.sound.*;
import java.awt.Robot;
import java.awt.*;

String thisVersion = "v1.2.0";
String[] newestVersion;
boolean newUpdateAvailable = false;
int gridshotCircles = 5;
ArrayList<Circle> circles;
ArrayList<Circle> multitrackCircles = new ArrayList<Circle>();
ArrayList<Circle> endGameCircles = new ArrayList<Circle>();
Circle quickshotCircle = new Circle("quickshot");
Circle circletrackCircle = new Circle("circletrack");
Circle circletrackPrecisionCircle = new Circle("circletrackPrecision");
int frames = 0;
int timer = 0;
int countdown = 3;
int waveCountdown = 3;
int hit = 0;
int missed = 0;
int misClicks = 0;
int numCircles = 0;
int lives = 3;
int marathonWave = 1;
int gridshotWaveClicks = 0;
int framesTracked = 0;
int gridshotScore = 0;
int quickshotScore = 0;
int circletrackScore = 0;
int tempNumCircleClicks = 0;
int tempNumMisses = 0; 
int tempNumTotalClicks = 0;
int tempNumCirclefallPlayed = 0;
int tempNumGridshotPlayed = 0;
int tempNumQuickshotPlayed = 0;
int tempNumCircletrackPlayed = 0;
int waveString_x = 400;
int waveString_y = 50;
double accuracy;
boolean pause = false;
boolean endGame = false;
boolean hunFallMenu = false;
boolean normHunFall = false;
boolean hardHunFall = false;
boolean imposHunFall = false;
boolean marathonHunFall = false;
boolean gridshotMenu = false;
boolean gridshotEnd = false;
double accuracyR;
boolean mainMenu = true;
boolean thirtySec = false;
String lastGame;
boolean gridshot = false;
boolean normalGridshot = false;
boolean miniGridshot = false;
boolean speedGridshot = false;
boolean waveGridshot = false;
boolean hunFall = false;
boolean settingsMenu = false;
boolean statsMenu = false;
int statsMenuPage = 1;
boolean statsMenuPage2 = false;
boolean quickshotMenu = false;
boolean quickshot = false;
boolean miniQuickshot = false;
boolean normalQuickshot = false; 
boolean reactQuickshot = false;
boolean quickshotEnd = false;
boolean circletrackMenu = false;
boolean circletrack = false;
boolean circletrack2D = false;
boolean circletrackHorizontal = false;
boolean circletrackMulti = false;
boolean circletrackEnd = false;
boolean circletrackPrecision = false;
boolean creditsScreen = false;
boolean endless = false; 
boolean oneMisclick = false; 
boolean oneMissed = false; 
boolean autoReset = false; 
boolean endGameHelperVariable = true;
int totalClicks = 0;
int[] numCirclesInWave = {0, 45 , 60, 120, 180, 150, 225, 300, 270, 360, 100000};
int[][] gridshotCoords = {{200, 300, 400, 500, 600} , {100, 200, 300, 400, 500}};
int[][] miniGridshotCoords = {{200, 250, 300, 350, 400, 450, 500, 550, 600}, {100, 150, 200, 250, 300, 350, 400, 450, 500}};
boolean[][] gridshotOccupied = new boolean[5][5];
boolean[][] miniGridshotOccupied = new boolean[9][9];
PFont font;
float fgX, mgX, bgX, fgY, mgY, bgY;
Button resetButton = new Button(250, 475, 175, 75, 7);
Button hunFallButton = new Button(250, 245, 270, 100, 7);
Button mainMenuButton = new Button(550, 475, 175, 75, 7);
Button exitButton = new Button(400, 525, 150, 75, 7);
Button gridshotButton = new Button(550, 245, 270, 100, 7);
Button quickshotButton = new Button(250, 365, 270, 100, 7);
Button quickshotClassicButton = new Button(250, 250, 185, 75, 7);
Button quickshotMiniButton = new Button(550, 250, 185, 75, 7);
Button quickshotReactButton = new Button(250, 400, 185, 75, 7);
Button pauseMenuButton = new Button(400, 550, 200, 75, 7);
Button normalHunFallButton = new Button(250, 250, 185, 75, 7);
Button hardHunFallButton = new Button(475, 250, 185, 75, 7); 
Button imposHunFallButton = new Button(250, 400, 185, 75, 7);
Button marathonHunFallButton = new Button(475, 400, 185, 75, 7);
Button mainMenuHunFallButton = new Button(400, 525, 150, 75, 7);
Button normalGridshotButton = new Button(250, 250, 185, 75, 7);
Button miniGridshotButton = new Button(550, 250, 185, 75, 7);
Button speedGridshotButton = new Button(250, 400, 185, 75, 7);
Button waveGridshotButton = new Button(550, 400, 185, 75, 7);
Button settingsButton = new Button(200, 525, 150, 75, 7);
Button statsButton = new Button(600, 525, 150, 75, 7);
Button statsMainMenuButton = new Button(200, 525, 150, 75, 7);
Button statsNextPageButton = new Button(600, 525, 150, 75, 7);
Button statsPrevPageButton = new Button(400, 525, 150, 75, 7);
Button circletrackButton = new Button(550, 365, 270, 100, 7);
Button track2DButton = new Button(250, 400, 185, 75, 7);
Button horizontalTrackButton = new Button(250, 250, 185, 75, 7);
Button multiTrackButton = new Button(550, 250, 185, 75, 7);
Button precisionTrackButton = new Button(550, 400, 185, 75, 7);
SettingsTab audioTab = new SettingsTab(150,100,"Audio");
SettingsTab crosshairTab = new SettingsTab(150, 150, "Crosshair");
SettingsTab gameTab = new SettingsTab(150, 200, "Game");
SettingsTab keybindsTab = new SettingsTab(150,250, "Keybinds");
Slider masterVolumeSlider;
Slider menuMusicSlider;
Slider hitSoundSlider;
Slider circleColorRSlider;
Slider circleColorGSlider;
Slider circleColorBSlider;
Slider backgroundColorRSlider;
Slider backgroundColorGSlider;
Slider backgroundColorBSlider;
color circleColor;
color backgroundColor;
boolean useDefaultColors;
boolean useDefaultBackground;
String[] playerStats;
String[] normalGridshotLast100;
String[] miniGridshotLast100;
String[] speedGridshotLast100;
String[] waveGridshotLast100;
String[] normalQuickshotLast100;
String[] miniQuickshotLast100;
String[] horizontalTrackLast100;
String[] circletrack2DLast100;
String[] multiTrackLast100;
String[] precisionTrackLast100;
String[] marathonModeLast100;
String[] audioSettings;
String[] gameSettings;
String[] splashArray;
String splashText;
float splashTextSize = 30;
boolean splashTextSizeInc = true;
SoundFile hitSound;
SoundFile menuMusic;

HitSound bahHitSound = new HitSound("Bah", "data/hitSounds/bah.wav", 300, 320);
HitSound beowHitSound = new HitSound("Beow", "data/hitSounds/beow.wav", 400, 320);
HitSound bonkHitSound = new HitSound("Bonk", "data/hitSounds/bonk.wav", 500, 320);
HitSound clackHitSound = new HitSound("Clack", "data/hitSounds/clack.wav", 600, 320);

HitSound clingHitSound = new HitSound("Cling", "data/hitSounds/cling.wav", 300, 360);
HitSound codHitSound = new HitSound("COD", "data/hitSounds/cod.wav", 400, 360);
HitSound fingHitSound = new HitSound("Fing", "data/hitSounds/fing.wav", 500, 360);
HitSound pewHitSound = new HitSound("Pew", "data/hitSounds/pew.wav", 600, 360);

HitSound pingHitSound = new HitSound("Ping", "data/hitSounds/ping.wav", 300, 400);
HitSound plopHitSound = new HitSound("Plop", "data/hitSounds/plop.wav", 400, 400);
HitSound swichHitSound = new HitSound("Swich", "data/hitSounds/swich.wav", 500, 400);
HitSound ticHitSound = new HitSound("Tic", "data/hitSounds/tic.wav", 600, 400);

HitSound pop1HitSound = new HitSound("pop1", "data/hitSounds/pop1.wav", 300, 440);
HitSound pop2HitSound = new HitSound("pop2", "data/hitSounds/pop2.wav", 400, 440);
HitSound pop3HitSound = new HitSound("pop3", "data/hitSounds/pop3.wav", 500, 440);
HitSound pop4HitSound = new HitSound("pop4", "data/hitSounds/pop4.wav", 600, 440);


HitSound[] hitSoundArray = {bahHitSound, beowHitSound, bonkHitSound, clackHitSound, clingHitSound, codHitSound, fingHitSound, pewHitSound, pingHitSound, plopHitSound, swichHitSound, ticHitSound, pop1HitSound, pop2HitSound, pop3HitSound, pop4HitSound};

//For controlling mouse movement
Robot robot;
int prePauseMouseX;
int prePauseMouseY;

PImage icon;
PImage scoreboardGradient;

Button continueOnCurrentVersionButton = new Button(250, 465, 220, 100, 10);
Button redirectToDownloadPageButton = new Button(550, 465, 220, 100, 10);

//SETUP***
public void setup(){
  icon = loadImage("data/circlegamesketch.png");
  surface.setIcon(icon);
  scoreboardGradient = loadImage("data/blueGradient.png");
  scoreboardGradient.resize(800, 40);
  ellipseMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER);
  font = createFont("inconsolatamedium.ttf", 256);
  textFont(font);
  size(800, 600);
  circles = new ArrayList<Circle>();
  playerStats = loadStrings("data/user/stats.txt");
  normalGridshotLast100 = loadStrings("data/user/scoresNormalGridshot.txt");
  miniGridshotLast100 = loadStrings("data/user/scoresMiniGridshot.txt");
  speedGridshotLast100 = loadStrings("data/user/scoresSpeedGridshot.txt");
  waveGridshotLast100 = loadStrings("data/user/scoresWaveGridshot.txt");
  normalQuickshotLast100 = loadStrings("data/user/scoresNormalQuickshot.txt");
  miniQuickshotLast100 = loadStrings("data/user/scoresMiniQuickshot.txt");
  horizontalTrackLast100 = loadStrings("data/user/scoresHorizontalTrack.txt");
  circletrack2DLast100 = loadStrings("data/user/scores2DTrack.txt");
  multiTrackLast100 = loadStrings("data/user/scoresMultiTrack.txt");
  precisionTrackLast100 = loadStrings("data/user/scoresPrecisionTrack.txt");
  marathonModeLast100 = loadStrings("data/user/scoresMarathonMode.txt");
  audioSettings = loadStrings("data/user/settings/audio.txt");
  gameSettings = loadStrings("data/user/settings/game.txt");
  splashArray = loadStrings("data/splashText.txt");
  initializeSettings();
  setSplashText();
  
  try{
    newestVersion = loadStrings("https://circlegame-txt-bucket.s3.amazonaws.com/circlegameCurrentVersion.txt");
    if(!newestVersion[0].equals(thisVersion)){
      newUpdateAvailable = true;
    }
  }catch(NullPointerException e){}
  
  try{
    robot = new Robot();
  }
  catch(Throwable e){}
}

//DRAW***
public void draw(){
  background(209, 218, 227);
  mainMenu();
  hunFallMenu();
  gridshotMenu();
  endGame();
  gridshot();
  hunFall();
  settingsMenu();
  statsMenu();
  quickshotMenu();
  quickshot();
  circletrackMenu();
  circletrack();
  updateTimePlayed();
  creditsScreen();
  newUpdateScreen();
  if((hunFall || gridshot || quickshot || circletrack) && pause == false){
    cursor(CROSS);
  }else{
    cursor(ARROW);
  }
}

//MAINMENU***
public void mainMenu(){
  if(mainMenu == true){
    background(85, 92, 99);
    menuParallax();
    textAlign(CENTER);
    if(isHoveringArea(250, 546, 75, 114)){
      fill(127,255,0);
    }else{
      fill(0);
    }
    textSize(60);
    text("circlegame", 400, 115);
    hunFallButton.drawButton();
    exitButton.drawButton();
    gridshotButton.drawButton();
    settingsButton.drawButton();
    statsButton.drawButton();
    quickshotButton.drawButton();
    circletrackButton.drawButton();
    fill(0, 174, 255);
    textSize(20);
    text("Circlefall", hunFallButton.center_x, hunFallButton.center_y + 7);
    fill(0);
    text("Settings", settingsButton.center_x, settingsButton.center_y + 5);
    text("Exit", exitButton.center_x, exitButton.center_y + 5);
    text("Stats", statsButton.center_x, statsButton.center_y +5);
    fill(255, 33, 33);
    text("Gridshot", gridshotButton.center_x, gridshotButton.center_y + 7);
    fill(34, 139, 34);
    text("Quickshot", quickshotButton.center_x, quickshotButton.center_y + 7);
    fill(255, 0, 255);
    text("Circletrack", circletrackButton.center_x, circletrackButton.center_y + 7);
    fill(0);
    textAlign(LEFT);
    textSize(20);
    text(thisVersion, 10, 590);
    printSplashText();
  }
}

public void menuParallax(){
    fgX = map(mouseX, 0, width, 450, 350);
    mgX = map(mouseX, 0, width, 425, 375);
    bgX = map(mouseX, 0, width, 410, 390);
    fgY = map(mouseY, 0, height, 350, 250);
    mgY = map(mouseY, 0, height, 325, 275);
    bgY = map(mouseY, 0, height, 310, 290);
    noStroke();
    fill(107, 116, 125);
    ellipse(bgX, bgY, 1000, 1000);
    fill(139, 146, 153);
    ellipse(mgX, mgY, 800, 800);
    fill(209, 218, 227);
    ellipse(fgX, fgY, 600, 600);  
    stroke(0);
}

//HUNFALLMENU***
public void hunFallMenu(){
  if(mainMenu == false && endGame == false){
    if(hunFallMenu == true){
      background(85, 92, 99);
      menuParallax();
      textAlign(CENTER);
      fill(0);
      textSize(40);
      text("Circlefall", 400, 115);
      imposHunFallButton.drawButton();
      normalHunFallButton.drawButton();
      hardHunFallButton.drawButton();
      marathonHunFallButton.drawButton();
      mainMenuHunFallButton.drawButton();
      //Options box
      fill(255);
      rect(690, 320, 150, 200, 5);
      if(oneMissed){
        fill(0, 255, 0);
      }else{
        fill(169);
      }
      rect(744, 265, 20, 20);
      if(oneMisclick){
        fill(0, 255, 0);
      }else{
        fill(169);
      }
      rect(744, 305, 20, 20);
      if(endless){
        fill(0, 255, 0);
      }else{
        fill(169);
      }
      rect(744, 345, 20, 20);
      if(autoReset){
        fill(0, 255, 0);
      }else{
        fill(169);
      }
      rect(744, 385, 20, 20);
      fill(0);
      textAlign(LEFT);
      textSize(16);
      text("No Misses", 625, 270);
      text("No Misclicks", 625, 310);
      if(oneMissed == false && oneMisclick == false){
        fill(150);
      }
      text("Endless", 625, 350);
      text("Auto Reset", 625, 390);
      fill(0);
      textAlign(CENTER);
      textSize(20);
      text("OPTIONS", 690, 242);
      line(655, 244, 724, 244);
      //Mode buttons
      text("Back", mainMenuHunFallButton.center_x, mainMenuHunFallButton.center_y + 5);
      fill(0, 174, 255);
      text("Normal Mode", normalHunFallButton.center_x, normalHunFallButton.center_y + 7);
      text("Hard Mode", hardHunFallButton.center_x, hardHunFallButton.center_y + 7);
      text("Impossible Mode", imposHunFallButton.center_x, imposHunFallButton.center_y + 7);
      text("Marathon Mode", marathonHunFallButton.center_x, marathonHunFallButton.center_y + 7);
      //if one missed and one misclick are disabled, endless is disabled
      if(oneMissed == false && oneMisclick == false){
        endless = false;
        autoReset = false;
      }
      if(oneMisclick == true && endless == true){
         oneMissed = true;
      }
    }
  }
}

//GRIDSHOT MENU***
public void gridshotMenu(){
  if(mainMenu == false && endGame == false){
    if(gridshotMenu == true)
    {
      background(85, 92, 99);
      menuParallax();
      textAlign(CENTER);
      fill(0);
      textSize(40);
      text("Gridshot", 400, 115);
      normalGridshotButton.drawButton();
      miniGridshotButton.drawButton();
      mainMenuHunFallButton.drawButton();
      speedGridshotButton.drawButton();
      waveGridshotButton.drawButton();
      fill(0);
      textSize(20);
      text("Back", mainMenuHunFallButton.center_x, mainMenuHunFallButton.center_y + 5);
      fill(255, 33, 33);
      text("Gridshot Classic",normalGridshotButton.center_x, normalGridshotButton.center_y + 7);
      text("Gridshot Mini", miniGridshotButton.center_x, miniGridshotButton.center_y + 7);
      text("Gridshot Speed", speedGridshotButton.center_x, speedGridshotButton.center_y + 7);
      text("Gridshot Wave", waveGridshotButton.center_x, waveGridshotButton.center_y + 7);
    }
  }
}

public void quickshotMenu(){
  if(quickshotMenu == true){
      background(85, 92, 99);
      menuParallax();
      textAlign(CENTER);
      fill(0);
      textSize(40);
      text("Quickshot", 400, 115);
      quickshotClassicButton.drawButton();
      quickshotMiniButton.drawButton();
      //quickshotReactButton.drawButton();
      mainMenuHunFallButton.drawButton();
      fill(0);
      textSize(20);
      text("Back", mainMenuHunFallButton.center_x, mainMenuHunFallButton.center_y + 5);
      fill(34,139,34);
      text("Quickshot Classic", quickshotClassicButton.center_x, quickshotClassicButton.center_y +7);
      text("Quickshot Mini", quickshotMiniButton.center_x, quickshotMiniButton.center_y +7);
      //text("Quickshot React", quickshotReactButton.center_x, quickshotReactButton.center_y +7);
  }
}

public void circletrackMenu(){
  if(circletrackMenu == true){
      background(85, 92, 99);
      menuParallax();
      textAlign(CENTER);
      fill(0);
      textSize(40);
      text("Circletrack", 400, 115);
      track2DButton.drawButton();
      horizontalTrackButton.drawButton();
      multiTrackButton.drawButton();
      mainMenuHunFallButton.drawButton();
      precisionTrackButton.drawButton();
      fill(0);
      textSize(20);
      text("Back", mainMenuHunFallButton.center_x, mainMenuHunFallButton.center_y + 5);
      fill(255, 0, 255);
      text("2D Track", track2DButton.center_x, track2DButton.center_y + 7);
      text("Horizontal Track", horizontalTrackButton.center_x, horizontalTrackButton.center_y + 7);
      text("Multi Track", multiTrackButton.center_x, multiTrackButton.center_y + 7);
      text("Precision Track",  precisionTrackButton.center_x,  precisionTrackButton.center_y + 7);
  }
}

//SETTINGSMENU***
public void settingsMenu(){
  if(mainMenu == false){
    if(settingsMenu == true)
    {
      background(209, 218, 227);
      fill(139, 146, 153);
      rect(400,275, 600, 400);
      textAlign(CENTER);
      fill(0);
      textSize(40);
      text("Settings", 400, 50);
      mainMenuHunFallButton.drawButton();
      audioTab.drawTab();
      crosshairTab.drawTab();
      gameTab.drawTab();
      keybindsTab.drawTab();
      fill(0);
      textSize(20);
      text("Main Menu", mainMenuHunFallButton.center_x, mainMenuHunFallButton.center_y + 5);
      
      if(audioTab.isActive){
        masterVolumeSlider.drawSlider();
        audioSettings[0] = String.valueOf((int)masterVolumeSlider.getPercentage());
        menuMusicSlider.drawSlider();
        menuMusic.amp((menuMusicSlider.getPercentage()/100) * (masterVolumeSlider.getPercentage()/100));
        audioSettings[1] = String.valueOf((int)menuMusicSlider.getPercentage());
        hitSoundSlider.drawSlider();
        hitSound.amp((hitSoundSlider.getPercentage()/100) * (masterVolumeSlider.getPercentage()/100));
        audioSettings[2] = String.valueOf((int)hitSoundSlider.getPercentage());
        textSize(15);
        textAlign(CENTER);
        fill(0);
        text("Test\nHit Sound", 640, 200);
        textSize(18);
        text("Hit Sound Library", 450, 290);
        fill(0,174,255);
        circle(640, 250, 50);
        bahHitSound.drawTab();
        beowHitSound.drawTab();
        bonkHitSound.drawTab();
        clackHitSound.drawTab();
        clingHitSound.drawTab();
        codHitSound.drawTab();
        fingHitSound.drawTab();
        pewHitSound.drawTab();
        pingHitSound.drawTab();
        plopHitSound.drawTab();
        swichHitSound.drawTab();
        ticHitSound.drawTab();
        pop1HitSound.drawTab();
        pop2HitSound.drawTab();
        pop3HitSound.drawTab();
        pop4HitSound.drawTab();
      }
      else if(crosshairTab.isActive){
        fill(0);
        textAlign(CENTER);
        textSize(35);
        text("Coming Soon", 440, 200);
      }
      else if(gameTab.isActive){
        fill(255);
        textAlign(LEFT);
        textSize(18);
        text("Default Circle Colors", 250, 95);
        text("Default Background Color", 250, 125);
        textSize(15);
        
        
        if(useDefaultColors){
          text("On", 508, 97);
          fill(0,255,0);
        }else{
          text("Off", 508, 97);
          fill(169, 169, 169);
        }
        rect(490, 90, 20, 20);
        fill(255);
        
        if(useDefaultBackground){
          text("On", 508, 127);
          fill(0,255,0);
        }else{
          text("Off", 508, 127);
          fill(169, 169, 169);
        }
        rect(490, 120, 20, 20);
        
        circleColorRSlider.drawSlider();
        gameSettings[1] = String.valueOf(circleColorRSlider.getValue());
        circleColorGSlider.drawSlider();
        gameSettings[2] = String.valueOf(circleColorGSlider.getValue());
        circleColorBSlider.drawSlider();
        gameSettings[3] = String.valueOf(circleColorBSlider.getValue());
        circleColor = color(circleColorRSlider.getValue(), circleColorGSlider.getValue(), circleColorBSlider.getValue());
        backgroundColorRSlider.drawSlider();
        gameSettings[4] = String.valueOf(backgroundColorRSlider.getValue());
        backgroundColorGSlider.drawSlider();
        gameSettings[5] = String.valueOf(backgroundColorGSlider.getValue());
        backgroundColorBSlider.drawSlider();
        gameSettings[6] = String.valueOf(backgroundColorBSlider.getValue());
        backgroundColor = color(backgroundColorRSlider.getValue(), backgroundColorGSlider.getValue(), backgroundColorBSlider.getValue());
        //Preview Backgrounds
        fill(backgroundColor);
        rect(617, 275, 145, 100);
        rect(617, 412, 145, 100);
        //Preview Circles
        fill(circleColor);
        circle(617, 150, 50);
        circle(617, 275, 50);
        //line framing
        fill(0);
        line(534, 75, 534, 475);
        line(200, 75, 200, 475);
        line(200, 300, 534, 300);
        line(200, 135, 534, 135);
        //text
        fill(255);
        textAlign(CENTER);
        textSize(25);
        text("Background Color", 375, 330);
        text("Circle Color", 375, 165);
      }
      else if(keybindsTab.isActive){
        fill(0);
        textAlign(CENTER);
        textSize(35);
        text("Coming Soon", 440, 200);
      }
    }
  }
}

// To see what stats are in what array index, see "data/statsDesc.txt"
//STATSMENU***
public void statsMenu(){
  if(mainMenu == false){
    if(statsMenu == true){
      background(209, 218, 227);
      textSize(15);
      textAlign(CENTER);
      fill(0);
      text("page " + statsMenuPage, 775, 595);
      statsMainMenuButton.drawButton();
      fill(0);
      textSize(20);
      text("Main Menu", statsMainMenuButton.center_x, statsMainMenuButton.center_y + 5);
      if(statsMenuPage != 1){
        statsPrevPageButton.drawButton();
        fill(0);
        textSize(20);
        textAlign(CENTER);
        text("Previous Page", statsPrevPageButton.center_x, statsPrevPageButton.center_y + 5);
      }
      if(statsMenuPage != 5){
        statsNextPageButton.drawButton();
        fill(0);
        textSize(20);
        textAlign(CENTER);
        text("Next Page", statsNextPageButton.center_x, statsNextPageButton.center_y + 5);
      }
      if(statsMenuPage == 1){
        textAlign(CENTER);
        fill(0);
        textSize(60);
        text("General Stats", 400, 75);
        textSize(20);
        textAlign(LEFT);
        fill(0);
        text("Time Played: " + ((Integer.valueOf(playerStats[0])) / 60) + " hours, " + ((Integer.valueOf(playerStats[0])) % 60) + " minutes", 200, 150);
        text("Games Played: " + playerStats[1], 200, 200); 
        text("Circles Clicked: " + playerStats[2], 200, 250);
        text("Circles Missed: " + playerStats[3], 200, 300);
        text("Accuracy: " + (((Float.valueOf(playerStats[2])) / (Float.valueOf(playerStats[3]) + Float.valueOf(playerStats[2]))) * 100) + "%", 200, 350);
      }else if(statsMenuPage == 2){
        textAlign(CENTER);
        fill(0);
        textSize(60);
        text("Circlefall Stats", 400, 75);
        textSize(20);
        textAlign(LEFT);
        fill(0);
        text("Circlefall Played: " + playerStats[4], 200, 125);
        text("Normal Endless Record: " + playerStats[30], 200, 195);
        text("Hard Endless Record: " + playerStats[31], 200, 230);
        text("Impossible Endless Record: " + playerStats[32], 200, 265);
        
        text("Marathon Mode High Score: " + playerStats[33], 200, 335);
        text("Marathon Mode Average Score: " + playerStats[34], 200, 370);
        text("Marathon Mode Highest Wave: " + playerStats[35], 200, 405);
      }else if (statsMenuPage == 3){
        textAlign(CENTER);
        fill(0);
        textSize(60);
        text("Gridshot Stats", 400, 75);
        textSize(20);
        textAlign(LEFT);
        fill(0);
        text("Gridshot Played: " + playerStats[5], 200, 125);
        text("Normal Gridshot High Score: " + playerStats[8], 200, 175);
        text("Normal Gridshot Average Score: " + playerStats[12], 200, 205);
        text("Mini Gridshot High Score: " + playerStats[9], 200, 255);
        text("Mini Gridshot Average Score: " + playerStats[13], 200, 285);
        text("Speed Gridshot High Score: " + playerStats[10], 200, 335);
        text("Speed Gridshot Average Score: " + playerStats[14], 200, 365);
        text("Wave Gridshot High Score:  " + playerStats[11], 200, 415);
        text("Wave Gridshot Average Score: " + playerStats[15], 200, 445);
        
      }else if (statsMenuPage == 4){
        textAlign(CENTER);
        fill(0);
        textSize(60);
        text("Quickshot Stats", 400, 75);
        textSize(20);
        textAlign(LEFT);
        fill(0);
        text("Quickshot Played: " + playerStats[6], 200, 125);
        text("Normal Quickshot High Score: " + playerStats[16], 200, 175);
        text("Normal Quickshot Average Score: " + playerStats[19], 200, 205);
        text("Mini Quickshot High Score: " + playerStats[17], 200, 255);
        text("Mini Quickshot Average Score: " + playerStats[20], 200, 285);
        text("React Quickshot High Score: " + playerStats[18], 200, 335);
        text("React Quickshot Average Score: " + playerStats[21], 200, 365);
      }else if (statsMenuPage == 5){
        textAlign(CENTER);
        fill(0);
        textSize(60);
        text("Circletrack Stats", 400, 75);
        textSize(20);
        textAlign(LEFT);
        fill(0);
        text("Circletrack Played: " + playerStats[7], 200, 125);
        text("Horizontal Track High Score: " + playerStats[22], 200, 175);
        text("Horizontal Track Average Score: " + playerStats[26], 200, 205);
        text("Multi Track High Score: " + playerStats[23], 200, 255);
        text("Multi Track Average Score: " + playerStats[27], 200, 285);
        text("2D Track High Score: " + playerStats[24], 200, 335);
        text("2D Track Average Score: " + playerStats[28], 200, 365);
        text("Precision Track High Score:  " + playerStats[25], 200, 415);
        text("Precision Track Average Score: " + playerStats[29], 200, 445);
      }
    }
  }
}

public void creditsScreen(){
  if(creditsScreen){
    background(209, 218, 227);
    fill(0);
    textSize(60);
    textAlign(CENTER);
    text("Credits", 400, 105);
    mainMenuHunFallButton.drawButton();
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("Main Menu", mainMenuHunFallButton.center_x, mainMenuHunFallButton.center_y + 5);
  }
}

//MOUSEPRESSED***
public void mousePressed(){ 
  if(pause == false && endGame == false && mainMenu == false && hunFallMenu == false && gridshotMenu == false && settingsMenu == false && statsMenu == false){
    //int oldTotClicks = totalClicks;
    if((gridshot == true && countdown == 0) || hunFall == true || (quickshot == true && countdown == 0))
    {
      tempNumTotalClicks++;
      totalClicks++;
    }
    if(hunFall == true || gridshot == true){
        for(int i = circles.size() - 1; i >= 0; i--){
          if(hunFall == true){
            if(Math.sqrt(Math.pow(circles.get(i).center_x - mouseX, 2) + Math.pow(circles.get(i).center_y - mouseY, 2)) < (circles.get(i).size / 2) + 5){
              circles.get(i).hitCircle();
              hit++;
              //totalClicks++;e
              tempNumCircleClicks++;
              hitSound.play();
              break;
            }
          }else if(gridshot == true && countdown == 0){
            if(Math.sqrt(Math.pow(circles.get(i).center_x - mouseX, 2) + Math.pow(circles.get(i).center_y - mouseY, 2)) < (circles.get(i).size / 2) + 1){
              hit++;
              gridshotScore = gridshotScore + 1000;
              tempNumCircleClicks++;
              hitSound.play();
              if(normalGridshot == true){
                circles.get(i).gridshotHit("normalGridshot"); 
              } else if(miniGridshot == true){
                circles.get(i).gridshotHit("miniGridshot");
              }else if(speedGridshot == true){
                circles.get(i).gridshotHit("speedGridshot");
              }else if(waveGridshot == true){
                circles.get(i).gridshotHit("waveGridshot");
                break;
              }
              
          }
        }
      }
    }
    if(quickshot == true && countdown == 0){
      if(Math.sqrt(Math.pow(quickshotCircle.center_x - mouseX, 2) + Math.pow(quickshotCircle.center_y - mouseY, 2)) < (quickshotCircle.size / 2) + 1){
        quickshotCircle.quickshotHit();
        hitSound.play();
        hit++;
        quickshotScore += 1000;
        tempNumCircleClicks++;
      }
    }
    //if(oldTotClicks == totalClicks && gridshot == false){
    //  totalClicks++;
    //}else if(oldTotClicks == totalClicks && countdown == 0){
    //  totalClicks++;
    //}
  }
  if(endGame == true){
    if(Math.sqrt(Math.pow(resetButton.center_x - mouseX, 2)) < (resetButton.h / 2) && Math.sqrt(Math.pow(resetButton.center_y - mouseY, 2)) < (resetButton.w / 2)){
      reset(lastGame);
      endGame = false;
    }else if(Math.sqrt(Math.pow(mainMenuButton.center_x - mouseX, 2)) < (mainMenuButton.h / 2) && Math.sqrt(Math.pow(mainMenuButton.center_y - mouseY, 2)) < (mainMenuButton.w / 2)){
      gridshot = false;
      normalGridshot = false;
      miniGridshot = false;
      speedGridshot = false;
      waveGridshot = false;
      thirtySec = false;
      hunFall = false;
      normHunFall = false;
      hardHunFall = false;
      imposHunFall = false;
      marathonHunFall = false;
      quickshot = false;
      miniQuickshot = false;
      normalQuickshot = false;
      circletrack = false;
      circletrack2D = false;
      circletrackHorizontal = false;
      circletrackMulti = false;
      reset();
      mainMenu = true;
      endGame = false;
      
    }
  }
  else if(mainMenu == true && !newUpdateAvailable){
    if(Math.sqrt(Math.pow(hunFallButton.center_x - mouseX, 2)) < (hunFallButton.h / 2) && Math.sqrt(Math.pow(hunFallButton.center_y - mouseY, 2)) < (hunFallButton.w / 2)){
      mainMenu = false;
      hunFallMenu = true;
    }else if(Math.sqrt(Math.pow(exitButton.center_x - mouseX, 2)) < (exitButton.h / 2) && Math.sqrt(Math.pow(exitButton.center_y - mouseY, 2)) < (exitButton.w / 2)){
      exit();
    }else if(Math.sqrt(Math.pow(gridshotButton.center_x - mouseX, 2)) < (gridshotButton.h / 2) && Math.sqrt(Math.pow(gridshotButton.center_y - mouseY, 2)) < (gridshotButton.w / 2)){
      mainMenu = false;
      gridshotMenu = true;
    }else if(Math.sqrt(Math.pow(settingsButton.center_x - mouseX, 2)) < (settingsButton.h / 2) && Math.sqrt(Math.pow(settingsButton.center_y - mouseY, 2)) < (settingsButton.w / 2)){
      mainMenu = false;
      settingsMenu = true;
      audioTab.isActive = true;
    }else if(Math.sqrt(Math.pow(statsButton.center_x - mouseX, 2)) < (statsButton.h / 2) && Math.sqrt(Math.pow(statsButton.center_y - mouseY, 2)) < (statsButton.w / 2)){
      mainMenu = false;
      statsMenu = true;
    }else if(Math.sqrt(Math.pow(quickshotButton.center_x - mouseX, 2)) < (quickshotButton.h / 2) && Math.sqrt(Math.pow(quickshotButton.center_y - mouseY, 2)) < (quickshotButton.w / 2)){
      mainMenu = false;
      quickshotMenu = true;
    }else if(Math.sqrt(Math.pow(circletrackButton.center_x - mouseX, 2)) < (circletrackButton.h / 2) && Math.sqrt(Math.pow(circletrackButton.center_y - mouseY, 2)) < (circletrackButton.w / 2)){
      mainMenu = false;
      circletrackMenu = true;
    }else if(isHoveringArea(250, 546, 75, 114)){
      //mainMenu = false;
      //creditsScreen = true;
    }
  }
  else if(pause == true){
    if(Math.sqrt(Math.pow(pauseMenuButton.center_x - mouseX, 2)) < (pauseMenuButton.h / 2) && Math.sqrt(Math.pow(pauseMenuButton.center_y - mouseY, 2)) < (pauseMenuButton.w / 2)){
      gridshot = false;
      normalGridshot = false;
      miniGridshot = false;
      speedGridshot = false;
      waveGridshot = false;
      thirtySec = false;
      hunFall = false;
      normHunFall = false;
      hardHunFall = false;
      imposHunFall = false;
      marathonHunFall = false;
      quickshot = false;
      miniQuickshot = false;
      normalQuickshot = false;
      circletrack = false;
      circletrack2D = false;
      circletrackHorizontal = false;
      circletrackMulti = false;
      reset();
      mainMenu = true;
      pause = false;
    }
  }
  else if(hunFallMenu == true){
    if(Math.sqrt(Math.pow(mainMenuHunFallButton.center_x - mouseX, 2)) < (mainMenuHunFallButton.h / 2) && Math.sqrt(Math.pow(mainMenuHunFallButton.center_y - mouseY, 2)) < (mainMenuHunFallButton.w / 2)){
      hunFallMenu = false;
      mainMenu = true;
    }else if(Math.sqrt(Math.pow(normalHunFallButton.center_x - mouseX, 2)) < (normalHunFallButton.h / 2) && Math.sqrt(Math.pow(normalHunFallButton.center_y - mouseY, 2)) < (normalHunFallButton.w / 2)){
      hunFallMenu = false;
      hunFall = true;
      normHunFall = true;
    }else if(Math.sqrt(Math.pow(hardHunFallButton.center_x - mouseX, 2)) < (hardHunFallButton.h / 2) && Math.sqrt(Math.pow(hardHunFallButton.center_y - mouseY, 2)) < (hardHunFallButton.w / 2)){
      hunFallMenu = false;
      hunFall = true;
      hardHunFall = true;
    }else if(Math.sqrt(Math.pow(imposHunFallButton.center_x - mouseX, 2)) < (imposHunFallButton.h / 2) && Math.sqrt(Math.pow(imposHunFallButton.center_y - mouseY, 2)) < (imposHunFallButton.w / 2)){
      hunFallMenu = false;
      hunFall = true;
      imposHunFall = true;
    }else if(Math.sqrt(Math.pow(marathonHunFallButton.center_x - mouseX, 2)) < (marathonHunFallButton.h / 2) && Math.sqrt(Math.pow(marathonHunFallButton.center_y - mouseY, 2)) < (marathonHunFallButton.w / 2)){
      hunFallMenu = false;
      hunFall = true;
      marathonHunFall = true;
      //Challenge mode buttons
    }else if(isHoveringArea(734, 754, 255, 275)){
      oneMissed = !oneMissed;
    }else if(isHoveringArea(734, 754, 295, 315)){
      oneMisclick = !oneMisclick;
    }else if(isHoveringArea(734, 754, 335, 355) && (oneMissed || oneMisclick)){
      endless = !endless;
    }else if(isHoveringArea(734, 754, 375, 395) && (oneMissed || oneMisclick)){
      autoReset = !autoReset;
    }
      //
  }
  else if(gridshotMenu == true){
    if(Math.sqrt(Math.pow(mainMenuHunFallButton.center_x - mouseX, 2)) < (mainMenuHunFallButton.h / 2) && Math.sqrt(Math.pow(mainMenuHunFallButton.center_y - mouseY, 2)) < (mainMenuHunFallButton.w / 2)){
      gridshotMenu = false;
      mainMenu = true;
    }else if(Math.sqrt(Math.pow(normalGridshotButton.center_x - mouseX, 2)) < (normalGridshotButton.h / 2) && Math.sqrt(Math.pow(normalGridshotButton.center_y - mouseY, 2)) < (normalGridshotButton.w / 2)){
      gridshotMenu = false;
      gridshot = true;
      normalGridshot = true;
      for(int r = 0; r < gridshotOccupied.length; r++){
        for(int c = 0; c < gridshotOccupied[0].length; c++){
          gridshotOccupied[r][c] = false;
        }
      }
      for(int i = 0; i < gridshotCircles; i++){
        circles.add(new Circle("gridshot"));
      }
    }else if(Math.sqrt(Math.pow(miniGridshotButton.center_x - mouseX, 2)) < (miniGridshotButton.h / 2) && Math.sqrt(Math.pow(miniGridshotButton.center_y - mouseY, 2)) < (miniGridshotButton.w / 2)){
      gridshotMenu = false;
      gridshot = true;
      miniGridshot = true;
      for(int row = 0; row < miniGridshotOccupied.length; row++){
        for(int col = 0; col < miniGridshotOccupied[0].length; col++){
          miniGridshotOccupied[row][col] = false;
        }
      }
      for(int i = 0; i < gridshotCircles; i++){
        circles.add(new Circle("miniGridshot"));
      }
    }else if(Math.sqrt(Math.pow(speedGridshotButton.center_x - mouseX, 2)) < (speedGridshotButton.h / 2) && Math.sqrt(Math.pow(speedGridshotButton.center_y - mouseY, 2)) < (speedGridshotButton.w / 2)){
      gridshotMenu = false;
      gridshot = true;
      speedGridshot = true;
      for(int r = 0; r < gridshotCircles; r++){
        for(int c = 0; c < gridshotCircles; c++){
          gridshotOccupied[r][c] = false;
        }
      }
      for(int i = 0; i < gridshotCircles; i++){
        circles.add(new Circle("speedGridshot"));
      }
    }else if(Math.sqrt(Math.pow(waveGridshotButton.center_x - mouseX, 2)) < (waveGridshotButton.h / 2) && Math.sqrt(Math.pow(waveGridshotButton.center_y - mouseY, 2)) < (waveGridshotButton.w / 2)){
      gridshotMenu = false;
      gridshot = true;
      waveGridshot = true;
      for(int i = 0; i < 50; i++){
        circles.add(new Circle("waveGridshot"));
      }
    }
  }
  else if(settingsMenu == true){
     if(audioTab.isActive){
       if((Math.sqrt(Math.pow(640 - mouseX, 2) + Math.pow(250 - mouseY, 2)) < (50 / 2))){
         hitSound.play();
       }
     }
     else if(gameTab.isActive){
      if(isHoveringArea(480, 500, 80, 100)){
        useDefaultColors = !useDefaultColors;
        gameSettings[0] = String.valueOf(useDefaultColors);
      }
      if(isHoveringArea(480, 500, 110, 130)){
        useDefaultBackground = !useDefaultBackground;
        gameSettings[7] = String.valueOf(useDefaultBackground);
      }
    }
     if(Math.sqrt(Math.pow(mainMenuHunFallButton.center_x - mouseX, 2)) < (mainMenuHunFallButton.h / 2) && Math.sqrt(Math.pow(mainMenuHunFallButton.center_y - mouseY, 2)) < (mainMenuHunFallButton.w / 2)){
      settingsMenu = false;
      mainMenu = true;
      audioTab.isActive = true;
      gameTab.isActive = false;
      crosshairTab.isActive = false;
      keybindsTab.isActive = false;
      saveStrings("data/user/settings/audio.txt", audioSettings);
      saveStrings("data/user/settings/game.txt", gameSettings);
    }
    else if(audioTab.hoveringTab()){
      audioTab.isActive = true;
      gameTab.isActive = false;
      crosshairTab.isActive = false;
      keybindsTab.isActive = false;
    }
    else if(gameTab.hoveringTab()){
      audioTab.isActive = false;
      gameTab.isActive = true;
      crosshairTab.isActive = false;
      keybindsTab.isActive = false;
    }
    else if(crosshairTab.hoveringTab()){
      audioTab.isActive = false;
      gameTab.isActive = false;
      crosshairTab.isActive = true;
      keybindsTab.isActive = false;
    }
    else if(keybindsTab.hoveringTab()){
      audioTab.isActive = false;
      gameTab.isActive = false;
      crosshairTab.isActive = false;
      keybindsTab.isActive = true;
    }
  }
  else if(statsMenu == true){
     if(Math.sqrt(Math.pow(statsMainMenuButton.center_x - mouseX, 2)) < (statsMainMenuButton.h / 2) && Math.sqrt(Math.pow(statsMainMenuButton.center_y - mouseY, 2)) < (statsMainMenuButton.w / 2)){
      statsMenu = false;
      mainMenu = true;
      statsMenuPage = 1;
    } else if(Math.sqrt(Math.pow(statsNextPageButton.center_x - mouseX, 2)) < (statsNextPageButton.h / 2) && Math.sqrt(Math.pow(statsNextPageButton.center_y - mouseY, 2)) < (statsNextPageButton.w / 2) && statsMenuPage != 5){
      statsMenuPage++;
    }  else if(Math.sqrt(Math.pow(statsPrevPageButton.center_x - mouseX, 2)) < (statsPrevPageButton.h / 2) && Math.sqrt(Math.pow(statsPrevPageButton.center_y - mouseY, 2)) < (statsPrevPageButton.w / 2) && statsMenuPage != 1){
        statsMenuPage--;
      } 
  }
  else if(quickshotMenu){
    if(Math.sqrt(Math.pow(mainMenuHunFallButton.center_x - mouseX, 2)) < (mainMenuHunFallButton.h / 2) && Math.sqrt(Math.pow(mainMenuHunFallButton.center_y - mouseY, 2)) < (mainMenuHunFallButton.w / 2)){
      quickshotMenu = false;
      mainMenu = true;
    } else if(Math.sqrt(Math.pow(quickshotClassicButton.center_x - mouseX, 2)) < (quickshotClassicButton.h / 2) && Math.sqrt(Math.pow(quickshotClassicButton.center_y - mouseY, 2)) < (quickshotClassicButton.w / 2)){
      quickshotMenu = false;
      quickshot = true;
      normalQuickshot = true;
    } else if(Math.sqrt(Math.pow(quickshotMiniButton.center_x - mouseX, 2)) < (quickshotMiniButton.h / 2) && Math.sqrt(Math.pow(quickshotMiniButton.center_y - mouseY, 2)) < (quickshotMiniButton.w / 2)){
      quickshotMenu = false;
      quickshot = true;
      miniQuickshot = true;
    } else if(Math.sqrt(Math.pow(quickshotReactButton.center_x - mouseX, 2)) < (quickshotReactButton.h / 2) && Math.sqrt(Math.pow(quickshotReactButton.center_y - mouseY, 2)) < (quickshotReactButton.w / 2)){
      quickshotMenu = false;
      quickshot = true;
      reactQuickshot = true;
    }
  }
  else if(circletrackMenu){
    if(Math.sqrt(Math.pow(mainMenuHunFallButton.center_x - mouseX, 2)) < (mainMenuHunFallButton.h / 2) && Math.sqrt(Math.pow(mainMenuHunFallButton.center_y - mouseY, 2)) < (mainMenuHunFallButton.w / 2)){
      circletrackMenu = false;
      mainMenu = true;
    } else if(Math.sqrt(Math.pow(horizontalTrackButton.center_x - mouseX, 2)) < (horizontalTrackButton.h / 2) && Math.sqrt(Math.pow(horizontalTrackButton.center_y - mouseY, 2)) < (horizontalTrackButton.w / 2)){
      circletrackMenu = false;
      circletrackHorizontal = true;
      circletrack = true;
    } else if(Math.sqrt(Math.pow(track2DButton.center_x - mouseX, 2)) < (track2DButton.h / 2) && Math.sqrt(Math.pow(track2DButton.center_y - mouseY, 2)) < (track2DButton.w / 2)){
      circletrackMenu = false;
      circletrack2D = true;
      circletrack = true;
    } else if(Math.sqrt(Math.pow(multiTrackButton.center_x - mouseX, 2)) < (multiTrackButton.h / 2) && Math.sqrt(Math.pow(multiTrackButton.center_y - mouseY, 2)) < (multiTrackButton.w / 2)){
      circletrackMenu = false;
      circletrackMulti = true;
      circletrack = true;
      for(int i = 0; i < 3; i++){
        multitrackCircles.add(new Circle("multitrack"));
      }
    } else if(Math.sqrt(Math.pow(precisionTrackButton.center_x - mouseX, 2)) < (precisionTrackButton.h / 2) && Math.sqrt(Math.pow(precisionTrackButton.center_y - mouseY, 2)) < (precisionTrackButton.w / 2)){
      circletrackMenu = false;
      circletrackPrecision = true;
      circletrack = true;
    }
  }
  else if(newUpdateAvailable){
    if(isHoveringArea(continueOnCurrentVersionButton)){
      newUpdateAvailable = false;
    }
    else if(isHoveringArea(redirectToDownloadPageButton)){
      link("http://circlegame.net/");
    }
    
    
  }
}


//KEYPRESSED***
public void keyPressed(){
  if(key == ESC){
    key = 0;
  }
  boolean inMenu = mainMenu || hunFallMenu || gridshotMenu || quickshotMenu || circletrackMenu || statsMenu || settingsMenu;
  boolean inEndScreen = endGame || gridshotEnd || quickshotEnd || circletrackEnd;
  if(key == 0 && !inMenu && !inEndScreen){
    pause = !pause;
    //setting pause to false sets your mouse position back to where it was when you paused the game
    if(pause == false){
      Point currentMousePos = MouseInfo.getPointerInfo().getLocation();
      robot.mouseMove((int)currentMousePos.getX() - mouseX + prePauseMouseX, (int)currentMousePos.getY() - mouseY + prePauseMouseY);
    }
    //setting pause to true saves the mouse position before pausing the game
    if(pause == true){
      prePauseMouseX = mouseX;
      prePauseMouseY = mouseY;
    }
  }//else if(key == 0 && endGame == false && mainMenu == false && inMenu == false){
    //pause = false;
  //}
  if((key == 'r' || key == 'R') && !inMenu && !inEndScreen){
    reset(lastGame);
  }
}

//TIMER***
public void timer(){ 
  if(pause == false){
      frames++;
   }
  if(gridshot == true || quickshot == true || circletrack == true){
    if(countdown <= 4 && countdown >= 1){
      if(frames%60 == 0){
        countdown--;
      }
      textAlign(CENTER);
      fill(0);
      textSize(100);
      text(countdown, 400, 300);
    }else{
      if(pause == false){
        if(frames%60 == 0){
          timer++;
        }
      }
/*  moved to drawScoreboard method    
      if(gridshotEnd == false && gridshot == true){
        textAlign(LEFT);
        fill(0);
        textSize(25);
        text("Timer: " + timer, 10, 25);
      }
      if(quickshotEnd == false && quickshot == true){
        textAlign(LEFT);
        fill(0);
        textSize(25);
        text("Timer: " + timer, 10, 25);
      }
      if(circletrackEnd == false && circletrack == true){
        textAlign(LEFT);
        fill(0);
        textSize(25);
        text("Timer: " + timer, 10, 25);
      }
*/
    }
  }
  if(marathonHunFall == true){
    if(waveCountdown <= 6 && waveCountdown >= 1){
      if(frames % 60 == 0){
        waveCountdown--;
      }
    }
  }
  if(endGame){
    if(timer < 10){
      timer++;
    }
  }
}


//MISSEDCIRCLE***
public void missedCircle(){
  for(Circle c: circles){
    if(hunFall == true){  
      if(c.center_y >= 700){
        c.missedCircle();
        missed++;
        tempNumMisses++;
        if(marathonHunFall == true){
          lives--;
        }
      }
    }else if(gridshot == true || quickshot == true){
      missed = totalClicks - hit;
    }
  }
/* moved to drawScoreboard method
  textAlign(LEFT);
  fill(0);
  textSize(25);
  if(normHunFall || hardHunFall || imposHunFall){
    text("Missed: " + missed, 290, 25);
  }else if(marathonHunFall){
    text("Lives: " + lives, 290, 25);
  }
*/
}

//MISCLICKS***
public void misClicks(){
  if(gridshot == true || hunFall == true || quickshot == true){
    int oldMisClicks = misClicks;
    misClicks = totalClicks - hit;
    if(oldMisClicks < misClicks && countdown == 0){
      gridshotScore -= 400;
      quickshotScore -= 400;
    }
  }
  
/* moved to drawScoreboard method
  textAlign(LEFT);
  fill(0);
  textSize(25);
  if(gridshot == true){
    //text("Misclicks: " + misClicks, 290, 25);
  }else if(hunFall == true){
    text("Misclicks: " + misClicks, 10, 25);
  }
*/  
}

//CIRCLETRACKED***
public void circleTracked(){
  if(countdown == 0 && pause == false){
    if(circletrackHorizontal || circletrack2D){
      if(Math.sqrt(Math.pow(circletrackCircle.center_x - mouseX, 2) + Math.pow(circletrackCircle.center_y - mouseY, 2)) < (circletrackCircle.size / 2) + 5){
        framesTracked++;
        circletrackScore += 61;
        if(frameCount % 3 == 0){
          hitSound.play();
        }
        
      }else{
        circletrackScore -= 7;
      }
    }
    else if(circletrackMulti){
      boolean isTracked = false;
      for(int i = 0; i < multitrackCircles.size(); i++){
        if(Math.sqrt(Math.pow(multitrackCircles.get(i).center_x - mouseX, 2) + Math.pow(multitrackCircles.get(i).center_y - mouseY, 2)) < (multitrackCircles.get(i).size / 2) + 5){
          framesTracked++;
          circletrackScore += 61;
          isTracked = true;
          multitrackCircles.get(i).health--;
          if(frameCount % 3 == 0){
          hitSound.play();
          }
          break;
        }
      }
      if(!isTracked){
        circletrackScore -= 7;
      }
    }
    else if(circletrackPrecision){
      if(Math.sqrt(Math.pow(circletrackPrecisionCircle.center_x - mouseX, 2) + Math.pow(circletrackPrecisionCircle.center_y - mouseY, 2)) < (circletrackPrecisionCircle.size / 2) + 5){
        framesTracked++;
        circletrackScore += 61;
        if(frameCount % 3 == 0){
          hitSound.play();
        }
      }else{
        circletrackScore -= 7;
      }
    }
  }
}  

//PAUSE***
public void pause(){
  if(pause == true){
    textAlign(CENTER);
    fill(255);
    rect(400, 300, 400, 200, 7);
    pauseMenuButton.drawButton();
    fill(0);
    textSize(25);
    text("Main Menu", pauseMenuButton.center_x, pauseMenuButton.center_y + 8);
    fill(200, 0, 0);
    textSize(50);
    text("PAUSED", 400, 310);
    fill(0);
    textSize(25);
    text("Press ESC to resume", 400, 370);
  }
}

//ENDGAME***
public void endGame(){ 
  if(endGame == true){
      accuracy = ((double)(((double)hit / (double)(totalClicks + missed))*100.0));
      double scale = Math.pow(10, 2);
      accuracyR = Math.round(accuracy*scale)/scale;
    if(endGameHelperVariable){
      endGameCircles = new ArrayList<Circle>();
      int numEndGameCircles = (int)Math.random()*6 + 10;
      for(int i = 0; i <= numEndGameCircles; i++){
        endGameCircles.add(new Circle(lastGame, true));
      }
      //Update Stats for Marathon Mode
      if(marathonHunFall){
        updateHighScore((hit - (totalClicks - hit)), "marathonHunFallScore");
        updateHighScore(marathonWave, "marathonHunFallWave");
        updateAverageScore((hit - (totalClicks - hit)), "marathonHunFall");
      }
      else if(normHunFall && endless){
        updateHighScore(hit, "endlessNormal");
      }
      else if(hardHunFall && endless){
        updateHighScore(hit, "endlessHard");
      }
      else if(imposHunFall && endless){
        updateHighScore(hit, "endlessImpossible");
      }
      
      endGameHelperVariable = false;
    }
    
    for(Circle c: endGameCircles){
        c.drawCircle();
        c.updateEndGameCircle();
    }
    textAlign(CENTER);
    fill(123, 130, 135, 128);  //119, 156, 191   115, 126, 145   123, 130, 135
    rect(400, 300, 700, 500, 100);
    fill(255);
    textSize(45);
    text("END GAME STATS", 400, 105);
    noStroke();
    line(50, 175, 750, 175);
    resetButton.drawButton();
    mainMenuButton.drawButton();
    textAlign(CENTER);
    fill(0);
    textSize(25);
    text("Restart", resetButton.center_x, resetButton.center_y + 8);
    text("Main Menu", mainMenuButton.center_x, mainMenuButton.center_y + 8);
    if(lastGame == "thirtySec"){  
      fill(230);
      textSize(30);
      text("Hit: " + hit, 95, 200);
      text("Missed: " + missed, 95, 240);
      text("Accuracy: " + accuracyR + "%", 95, 290);
    }else if(lastGame == "normalGridshot" || lastGame == "miniGridshot" || lastGame == "speedGridshot" || lastGame == "waveGridshot"){
      textAlign(CENTER);
      fill(255, 33, 33);
      textSize(35);
      if(lastGame == "normalGridshot"){
        text("Gridshot - Classic", 400, 150);
        textAlign(LEFT);
        fill(250);
        textSize(30);
        text("Score: " + gridshotScore, 95, 230);
        text("Accuracy: " + accuracyR + "%", 95, 290);
        text("Hit: " + hit, 460, 230);
        text("Misclicks: " + misClicks, 460, 290);
        text("Highscore: " + playerStats[8], 95, 400);
        text("Avg Score: " + playerStats[12], 460, 400);
      }
      else if(lastGame == "miniGridshot"){
        text("Gridshot - Mini", 400, 150);
        textAlign(LEFT);
        fill(250);
        textSize(30);
        text("Score: " + gridshotScore, 95, 230);
        text("Accuracy: " + accuracyR + "%", 95, 290);
        text("Hit: " + hit, 460, 230);
        text("Misclicks: " + misClicks, 460, 290);
        text("Highscore: " + playerStats[9], 95, 400);
        text("Avg Score: " + playerStats[13], 460, 400);
      }
      else if(lastGame == "speedGridshot"){
        text("Gridshot - Speed", 400, 150);
        textAlign(LEFT);
        fill(250);
        textSize(30);
        text("Score: " + gridshotScore, 95, 230);
        text("Accuracy: " + accuracyR + "%", 95, 290);
        text("Hit: " + hit, 460, 230);
        text("Misclicks: " + misClicks, 460, 260);
        text("Missed: " + missed, 460, 290);
        text("Highscore: " + playerStats[10], 95, 400);
        text("Avg Score: " + playerStats[14], 460, 400);
      }
      else if(lastGame == "waveGridshot"){
        text("Gridshot - Wave", 400, 150);
        textAlign(LEFT);
        fill(250);
        textSize(30);
        text("Score: " + gridshotScore, 95, 230);
        text("Accuracy: " + accuracyR + "%", 95, 290);
        text("Time: " + timer + "s", 460, 230);
        text("Misclicks: " + misClicks, 460, 290);
        text("Highscore: " + playerStats[11], 95, 400);
        text("Avg Score: " + playerStats[15], 460, 400);
      }

    }else if(lastGame == "hunFall"){ 
      //double avgSpeed = 0.0;
      if(normHunFall == true){
        //for(Circle c: circles){
        //  int s = c.oldSpeed;
        //  avgSpeed = avgSpeed + s;
        //}
        //avgSpeed = avgSpeed / 100;
        //double scale = Math.pow(10, 2);
        //avgSpeed = Math.round(avgSpeed*scale)/scale;
        textAlign(CENTER);
        fill(0, 174, 255);
        textSize(35);
        text("100 Circle Fall - Normal", 400, 150);
        //Showing extra mode on end screen
        if(oneMissed || oneMisclick || endless){
          textAlign(CENTER);
          textSize(17);
          fill(240);
        }
        if(oneMissed && oneMisclick == false && endless == false){
          text("No Misses", 400, 169);
        }else if(oneMisclick && oneMissed == false && endless == false){
          text("No Misclicks", 400, 169);
        }else if(oneMisclick && oneMissed && endless == false){
          text("No Misses, No Mislicks", 400, 169);
        }else if(oneMissed && endless && oneMisclick == false){
          text("No Misses - Endless", 400, 169);
        }else if(oneMisclick && endless && oneMissed == false){
          text("No Misclicks - Endless", 400, 169);
        }else if(oneMissed && oneMisclick && endless){
          text("No Misses, No Misclicks - Endless", 400, 169);
        }
        //text("Average Speed: " + avgSpeed, 95, 340);
      }else if(hardHunFall == true){
        //for(Circle c: circles){
        //  int s = c.oldSpeed;
        //  avgSpeed = avgSpeed + s;
        //}
        //avgSpeed = avgSpeed / 100;
        //double scale = Math.pow(10, 2);
        //avgSpeed = Math.round(avgSpeed*scale)/scale;
        textAlign(CENTER);
        fill(0, 174, 255);
        textSize(35);
        text("100 Circle Fall - Hard", 400, 150);
        if(oneMissed || oneMisclick || endless){
          textAlign(CENTER);
          textSize(17);
          fill(240);
        }
        if(oneMissed && oneMisclick == false && endless == false){
          text("No Misses", 400, 169);
        }else if(oneMisclick && oneMissed == false && endless == false){
          text("No Misclicks", 400, 169);
        }else if(oneMisclick && oneMissed && endless == false){
          text("No Misses, No Mislicks", 400, 169);
        }else if(oneMissed && endless && oneMisclick == false){
          text("No Misses - Endless", 400, 169);
        }else if(oneMisclick && endless && oneMissed == false){
          text("No Misclicks - Endless", 400, 169);
        }else if(oneMissed && oneMisclick && endless){
          text("No Misses, No Misclicks - Endless", 400, 169);
        }
        //text("Average Speed: " + avgSpeed, 95, 340);
      }else if(imposHunFall == true){
        //for(Circle c: circles){
        //  int s = c.oldSpeed;
        //  avgSpeed = avgSpeed + s;
        //}
        //avgSpeed = avgSpeed / 100;
        //double scale = Math.pow(10, 2);
        //avgSpeed = Math.round(avgSpeed*scale)/scale;
        textAlign(CENTER);
        fill(0, 174, 255);
        textSize(35);
        text("100 Circle Fall - Impossible", 400, 150);
        if(oneMissed || oneMisclick || endless){
          textAlign(CENTER);
          textSize(17);
          fill(240);
        }
        if(oneMissed && oneMisclick == false && endless == false){
          text("No Misses", 400, 169);
        }else if(oneMisclick && oneMissed == false && endless == false){
          text("No Misclicks", 400, 169);
        }else if(oneMisclick && oneMissed && endless == false){
          text("No Misses, No Mislicks", 400, 169);
        }else if(oneMissed && endless && oneMisclick == false){
          text("No Misses - Endless", 400, 169);
        }else if(oneMisclick && endless && oneMissed == false){
          text("No Misclicks - Endless", 400, 169);
        }else if(oneMissed && oneMisclick && endless){
          text("No Misses, No Misclicks - Endless", 400, 169);
        }
        //text("Average Speed: " + avgSpeed, 95, 340); 
      }
      else if(marathonHunFall){
        textAlign(CENTER);
        fill(0, 174, 255);
        textSize(35);
        text("Marathon Circlefall", 400, 150);
        textAlign(LEFT);
        textSize(30);
        fill(230);
        text("Score: " + (hit - (totalClicks - hit)), 95, 200);
        text("Wave Reached: " + marathonWave, 95, 240);
        text("Hit: " + hit, 405, 200);
        text("Misclicks: " + (totalClicks - hit), 405, 240);
      }
      textAlign(LEFT);
      fill(230);
      textSize(30);
      if(!marathonHunFall){
        text("Hit: " + hit, 95, 210);
        text("Missed: " + missed, 300, 210);
        text("Accuracy: " + accuracyR + "%", 95, 300); 
        text("Misclicks: " + (totalClicks - hit), 95, 250);
      } 
    }else if(lastGame == "miniQuickshot" || lastGame == "normalQuickshot"){
      textAlign(CENTER);
      fill(34, 139, 34);
      textSize(35);
      if(lastGame == "miniQuickshot"){
        text("Quickshot - Mini", 400, 150);
        textAlign(LEFT);
        fill(250);
        textSize(30);
        text("Highscore: " + playerStats[17], 95, 400);
        text("Avg Score: " + playerStats[20], 460, 400);
      }
      if(lastGame == "normalQuickshot"){
        text("Quickshot - Classic", 400, 150);
        textAlign(LEFT);
        fill(250);
        textSize(30);
        text("Highscore: " + playerStats[16], 95, 400);
        text("Avg Score: " + playerStats[19], 460, 400);
      }
      textAlign(LEFT);
      fill(250);
      textSize(30);
      text("Score: " + quickshotScore, 95, 230);
      text("Accuracy: " + accuracyR + "%", 95, 290);
      text("Hit: " + hit, 460, 230);
      text("Misclicks: " + misClicks, 460, 290);
    }else if(lastGame == "2DCircletrack" || lastGame == "horizontalCircletrack" || lastGame == "multiCircletrack" || lastGame == "precisionCircletrack"){
      textAlign(CENTER);
      fill(255, 0, 255);
      textSize(35);
      if(lastGame == "2DCircletrack"){
        text("Circletrack - 2D", 400, 150);
        textAlign(LEFT);
        fill(250);
        textSize(30);
        text("Highscore: " + playerStats[24], 95, 400);
        text("Avg Score: " + playerStats[28], 460, 400);        
      } else if(lastGame == "horizontalCircletrack"){
        text("Circletrack - Horizontal", 400, 150);
        textAlign(LEFT);
        fill(250);
        textSize(30);
        text("Highscore: " + playerStats[22], 95, 400);
        text("Avg Score: " + playerStats[26], 460, 400);        
      } else if(lastGame == "multiCircletrack"){
        text("Circletrack - MultiTrack", 400, 150);
        textAlign(LEFT);
        fill(250);
        textSize(30);
        text("Highscore: " + playerStats[23], 95, 400);
        text("Avg Score: " + playerStats[27], 460, 400);
      } else if(lastGame == "precisionCircletrack"){
        text("Circletrack - Precision", 400, 150);
        textAlign(LEFT);
        fill(250);
        textSize(30);
        text("Highscore: " + playerStats[25], 95, 400);
        text("Avg Score: " + playerStats[29], 460, 400);
      }
      text("Score: " + circletrackScore, 95, 230);
      text("Accuracy: " + Math.round((framesTracked/1800.0*100) * 100) / 100.0 + "%", 95, 270);
      
    }
  }
}

//**
public void reset(){
  numCircles = 0;
  timer = 0;
  countdown = 3;
  waveCountdown = 3;
  lives = 3;
  marathonWave = 1;
  gridshotWaveClicks = 0;
  hit = 0;
  missed = 0;
  misClicks = 0;
  totalClicks = 0;
  accuracy = 0.0;
  accuracy = 0.0;
  gridshotScore = 0;
  quickshotScore = 0;
  circletrackScore = 0;
  waveString_x = 400;
  waveString_y = 50;
  framesTracked = 0;
  frames = 0;
  circles = new ArrayList<Circle>();
  multitrackCircles = new ArrayList<Circle>();
  endGameCircles = new ArrayList<Circle>();
  quickshotCircle = new Circle("quickshot");
  circletrackCircle = new Circle("circletrack");
  circletrackPrecisionCircle = new Circle("circletrackPrecision");
  endGame = false;
  gridshotEnd = false;
  quickshotEnd = false;
  circletrackEnd = false;
  endGameHelperVariable = true;
}

//RESETGAME***
public void reset(String game){
  reset();
  lastGame = game;
  if(lastGame == "thirtySec"){
    thirtySec = true;
  }else if(lastGame == "normalGridshot"){
    gridshot = true;
    normalGridshot = true;
    for(int r = 0; r < gridshotCircles; r++){
        for(int c = 0; c < gridshotCircles; c++){
          gridshotOccupied[r][c] = false;
        }
    }
    for(int i = 0; i < gridshotCircles; i++){
        circles.add(new Circle("gridshot"));
    }
  }else if(lastGame == "miniGridshot"){
    gridshot = true;
    miniGridshot = true;
    for(int r = 0; r < gridshotCircles; r++){
        for(int c = 0; c < gridshotCircles; c++){
          miniGridshotOccupied[r][c] = false;
        }
    }
    for(int i = 0; i < gridshotCircles; i++){
        circles.add(new Circle("miniGridshot"));
    }
  }else if(lastGame == "speedGridshot"){
    gridshot = true;
    speedGridshot = true;
    for(int r = 0; r < gridshotCircles; r++){
        for(int c = 0; c < gridshotCircles; c++){
          gridshotOccupied[r][c] = false;
        }
    }
    for(int i = 0; i < gridshotCircles; i++){
        circles.add(new Circle("speedGridshot"));
    }
  }else if(lastGame == "waveGridshot"){
    gridshot = true;
    waveGridshot = true;
    for(int i = 0; i < 50; i++){
        circles.add(new Circle("waveGridshot"));
      }
  }
  else if(lastGame == "hunFall"){
    hunFall = true;
  }else if(lastGame == "miniQuickshot"){
    miniQuickshot = true;
    quickshot = true;
  }else if(lastGame == "normalQuickshot"){
    normalQuickshot = true;
    quickshot = true;
  }else if(lastGame == "2DCircletrack"){
    circletrack = true;
    circletrack2D = true;
  }else if(lastGame == "horizontalCircletrack"){
    circletrack = true;
    circletrackHorizontal = true;
  }else if(lastGame == "multiCircletrack"){
    circletrack = true;
    circletrackMulti = true;
    for(int i = 0; i < 3; i++){
      multitrackCircles.add(new Circle("multitrack"));
    }
  }else if(lastGame == "precisionCircletrack"){
    circletrack = true;
    circletrackPrecision = true;
  }
}

//HUNFALL***
public void hunFall(){ 
  if(endGame == false && mainMenu == false){
    if(hunFall == true){
      if(useDefaultBackground){
        background(209, 218, 227);
      }else{
        background(backgroundColor);        
      }


      for(Circle c: circles){
        c.drawCircle();
        c.updateCircle();
      }
      lastGame = "hunFall";
      drawScoreboard();
      missedCircle();
      misClicks();
      pause();
      timer();
      int delCounter = 0;
      
      for(Circle c: circles){
        if(c.deleted == true){
          delCounter++;
        }
      }
      if(normHunFall || hardHunFall || imposHunFall){
        if(delCounter >= 100 && endless == false){
        hunFall = false;
        endGame = true;
        tempNumCirclefallPlayed++;
        updateStats();
        }
        if(oneMissed && missed > 0){
          if(autoReset){
            reset(lastGame);
          }else{
            hunFall = false;
            endGame = true;
            tempNumCirclefallPlayed++;
            updateStats();
          }
        }
        if(oneMisclick && misClicks > 0){
          if(autoReset){
            reset(lastGame);
          }else{
            hunFall = false;
            endGame = true;
            tempNumCirclefallPlayed++;
            updateStats();
          }
        }
      }else if(marathonHunFall){
        if(delCounter >= numCirclesInWave[marathonWave]){
          waveCountdown = 3;
          marathonWave++;
          circles = new ArrayList<Circle>();
          waveString_y = 50;
          waveString_x = 400;
        }
      }
      if(lives == 0){
        hunFall = false;
        endGame = true;
        tempNumCirclefallPlayed++;
        updateStats();
      }
      
      if(!pause && marathonHunFall && waveCountdown != 0){
        textAlign(CENTER);
        textSize(40);
        text("Wave " + marathonWave, waveString_x, waveString_y);
        waveString_y += 5;
      }
      if(marathonHunFall == true && waveCountdown == 0 && pause == false){
        if(marathonWave == 1){
          if(frames % 20 == 0 && circles.size() < numCirclesInWave[marathonWave]){
            circles.add(new Circle(marathonWave));
          }
        }else if(marathonWave > 1 && marathonWave < 5){
          if(frames % 15 == 0 && circles.size() < numCirclesInWave[marathonWave]){
            circles.add(new Circle(marathonWave));
          }
        }else if(marathonWave > 4 && marathonWave < 8){
          if(frames % 12 == 0 && circles.size() < numCirclesInWave[marathonWave]){
            circles.add(new Circle(marathonWave));
          }
        }else if(marathonWave > 7){
          if(frames % 10 == 0 && circles.size() < numCirclesInWave[marathonWave]){
            circles.add(new Circle(marathonWave));
          }
        }
      }else if(normHunFall == true && pause == false){
        if(endless == false){
          if(frames%15 == 0 && circles.size() < 100){
            circles.add(new Circle("hunFall"));
          }
        }else{
            if(frames%15 == 0){
              circles.add(new Circle("hunFall"));
          }
        }
      }else if(hardHunFall == true && pause == false){
        if(endless == false){
          if(frames%12 == 0 && circles.size() < 100){
            circles.add(new Circle("hunFall"));
          }
        }else{
          if(frames%12 == 0){
            circles.add(new Circle("hunFall"));
          }
        }
      }else if(imposHunFall == true && pause == false){
        if(endless == false){
          if(frames%10 == 0 && circles.size() < 100){
            circles.add(new Circle("hunFall"));
          }
        }else{
          if(frames%10 == 0){
            circles.add(new Circle("hunFall"));
          }
        }
      }
    }
    else if(hunFall == false){
      normHunFall = false;
      hardHunFall = false;
      imposHunFall = false;
    }
  }
}

//GRIDSHOT***
public void gridshot(){
  if(gridshot == true){
    if(useDefaultBackground){
      background(209, 218, 227);
    }else{
      background(backgroundColor);        
    }
    
    if(endGame == false && mainMenu == false && gridshotEnd == false){
      for(Circle c: circles){
        c.drawCircle();
        }
      }
      int helperCountVariable = 1;
      timer();
      if(miniGridshot == true){
         lastGame = "miniGridshot";
       }else if(normalGridshot == true){
         lastGame = "normalGridshot";
       }else if(speedGridshot == true){
         lastGame = "speedGridshot";
       }else if(waveGridshot == true){
         lastGame = "waveGridshot";
         if(!pause && countdown == 0){
           gridshotScore -= 17;
         }
       }
      if(gridshotEnd == false){
        misClicks();
        pause();
        drawScoreboard();
      }
      
      if(timer >= 30 && waveGridshot == false){
        gridshotEnd = true;
      }
      if(gridshotEnd == true){
        textAlign(CENTER);
        textSize(100);
        fill(0, 220, 0);
        text("DONE", 400, 300);
        if(timer >= 31){
          if(helperCountVariable == 1){
            tempNumGridshotPlayed++;
            if(normalGridshot == true){
              updateAverageScore(gridshotScore, "normalGridshot");
              updateHighScore(gridshotScore, "normalGridshot");
            }
            else if(miniGridshot == true){
              updateAverageScore(gridshotScore, "miniGridshot");
              updateHighScore(gridshotScore, "miniGridshot");
            }
            else if(speedGridshot == true){
              updateAverageScore(gridshotScore, "speedGridshot");
              updateHighScore(gridshotScore, "speedGridshot");
            }
            else if(waveGridshot == true){
              updateAverageScore(gridshotScore, "waveGridshot");
              updateHighScore(gridshotScore, "waveGridshot");
            }
            //average score for speed gridshot
            helperCountVariable++;
            updateStats();
          }
          gridshot = false;
          miniGridshot = false;
          normalGridshot = false;
          endGame = true;
          gridshotEnd = false;
        }
      }
  }
}

//QUICKSHOT***
public void quickshot(){
  if(quickshot == true){
      if(useDefaultBackground){
        background(209, 218, 227);
      }else{
        background(backgroundColor);        
      }
      
      if(quickshotEnd == false && endGame == false){
          quickshotCircle.drawCircle();
      }
      if(normalQuickshot){
        lastGame = "normalQuickshot";
      }else if(miniQuickshot){
        lastGame = "miniQuickshot";
      }
      timer();
      int helperCountVariable = 1;
      if(quickshotEnd == false){
        misClicks();
        pause();
        drawScoreboard();
      }
      
      if(timer >= 30){
        quickshotEnd = true;
      }
      if(quickshotEnd == true){
        textAlign(CENTER);
        textSize(100);
        fill(0, 220, 0);
        text("DONE", 400, 300);
        if(timer >= 31){
          if(helperCountVariable == 1){
            tempNumQuickshotPlayed++;
            if(normalQuickshot == true){
              updateAverageScore(quickshotScore, "normalQuickshot");
              updateHighScore(quickshotScore, "normalQuickshot");
            }
            else if(miniQuickshot == true){
              updateAverageScore(quickshotScore, "miniQuickshot");
              updateHighScore(quickshotScore, "miniQuickshot");
            }
            
            helperCountVariable++;
            updateStats();
          }
          quickshot = false;
          endGame = true;
          quickshotEnd = false;
          normalQuickshot = false;
          miniQuickshot = false;
          }
       }
     }
}

//CIRCLETRACK***
public void circletrack(){
  if(circletrack == true){
    if(useDefaultBackground){
      background(209, 218, 227);
    }else{
      background(backgroundColor);        
    }
    if(circletrack2D){
      lastGame = "2DCircletrack";
    }else if(circletrackHorizontal){
      lastGame = "horizontalCircletrack";
    }else if(circletrackMulti){
      lastGame = "multiCircletrack";
    }else if(circletrackPrecision){
      lastGame = "precisionCircletrack";
    }
    if(endGame == false && circletrackEnd == false){
      if(circletrackHorizontal || circletrack2D){
        circletrackCircle.drawCircle();
        circletrackCircle.updateCircle();
        circletrackCircle.updateCircleSpeed();
        if(countdown == 0 && timer == 0){
          circletrackCircle.setInitialSpeed();
        }
      } else if(circletrackMulti){
        boolean allDeleted = true;
        for(int i = 0; i < multitrackCircles.size(); i++){
          multitrackCircles.get(i).drawCircle();
          multitrackCircles.get(i).updateCircle();
          multitrackCircles.get(i).updateCircleSpeed();
          if(countdown == 0 && timer == 0){
          multitrackCircles.get(i).setInitialSpeed();
          }
          if(multitrackCircles.get(i).deleted == false){
            allDeleted = false;
          }
        }
        if(allDeleted){
          multitrackCircles = new ArrayList<Circle>();
          for(int i = 0; i < 3; i++){
            multitrackCircles.add(new Circle("multitrack"));
            multitrackCircles.get(i).setInitialSpeed();
          }
        }
      } else if(circletrackPrecision){
        circletrackPrecisionCircle.drawCircle();
        circletrackPrecisionCircle.updateCircle();
        circletrackPrecisionCircle.updateCircleSpeed();
        if(countdown == 0 && timer == 0){
          circletrackPrecisionCircle.setInitialSpeed();
        }
      }
    }
    timer();
    int helperCountVariable = 1;
    if(circletrackEnd == false){
      pause();
      circleTracked();
      drawScoreboard();
    }
    if(timer >= 30){
      circletrackEnd = true;
    }
    if(circletrackEnd == true){
      textAlign(CENTER);
      textSize(100);
      fill(0, 220, 0);
      text("DONE", 400, 300);
      if(timer >= 31){
        if(helperCountVariable == 1){
          tempNumCircletrackPlayed++;
          if(circletrack2D == true){
            updateAverageScore(circletrackScore, "2DTrack");
            updateHighScore(circletrackScore, "2DTrack");
          }
          else if(circletrackHorizontal == true){
            updateAverageScore(circletrackScore, "horizontalTrack");
            updateHighScore(circletrackScore, "horizontalTrack");
          }
          else if(circletrackMulti == true){
            updateAverageScore(circletrackScore, "multiTrack");
            updateHighScore(circletrackScore, "multiTrack");
          }
          else if(circletrackPrecision == true){
            updateAverageScore(circletrackScore, "precisionTrack");
            updateHighScore(circletrackScore, "precisionTrack");
          }
          helperCountVariable++;
          updateStats();
        }
        circletrack = false;
        endGame = true;
        circletrackEnd = false;
        circletrackHorizontal = false;
        circletrack2D = false;
        circletrackMulti = false;
        }
     }
  } 
}

//Updates Stats Every Time a Game Ends
//UPDATESTATS***
public void updateStats(){
  int[] tempStats = new int[playerStats.length];
  for(int i = 0; i < tempStats.length; i++){
    tempStats[i] = Integer.valueOf(playerStats[i]);
  }
  tempStats[1] += tempNumCirclefallPlayed + tempNumGridshotPlayed + tempNumQuickshotPlayed + tempNumCircletrackPlayed;
  tempStats[4] += tempNumCirclefallPlayed;
  tempStats[5] += tempNumGridshotPlayed; 
  tempStats[6] += tempNumQuickshotPlayed;
  tempStats[7] += tempNumCircletrackPlayed;
  tempNumCirclefallPlayed = 0;
  tempNumGridshotPlayed = 0;
  tempNumQuickshotPlayed = 0;
  tempNumCircletrackPlayed = 0;
  tempStats[2] += tempNumCircleClicks;
  tempStats[3] += tempNumMisses + tempNumTotalClicks - tempNumCircleClicks;
  tempNumCircleClicks = 0;
  tempNumMisses = 0;
  tempNumTotalClicks = 0;
  for(int i = 0; i < tempStats.length; i++){
    playerStats[i] = String.valueOf(tempStats[i]);
  }
  saveStrings("data/user/stats.txt", playerStats);
}

//Updates average score after each game (for last 100 games only)
//UPDATEAVERAGESCORE***
public void updateAverageScore(int score, String game){
  if(game.equals("normalGridshot"))
  {
    boolean has100Scores = !(Integer.valueOf(normalGridshotLast100[99]) == 0);
    int scoreCycle = Integer.valueOf(normalGridshotLast100[100]);
    float normalGridshotLast100Avg;
    normalGridshotLast100[scoreCycle] = String.valueOf(score);
    scoreCycle++;
    if(has100Scores){
      int sum = 0;
      for(int i = 0; i < 100; i++){
        sum += Integer.valueOf(normalGridshotLast100[i]);
      }
      normalGridshotLast100Avg = (float)(sum)/(100);
      } else {  
      int sum = 0;
      for(int i = 0; i < scoreCycle; i++){
        sum += Integer.valueOf(normalGridshotLast100[i]);
      }
      normalGridshotLast100Avg = (float)(sum)/(scoreCycle);
    }
    if(scoreCycle == 100){
      scoreCycle = 0;
    }
    normalGridshotLast100[100] = String.valueOf(scoreCycle);
    saveStrings("data/user/scoresNormalGridshot.txt", normalGridshotLast100);
    playerStats[12] = String.valueOf((int)normalGridshotLast100Avg);
  }
  else if(game.equals("miniGridshot")){
    boolean has100Scores = !(Integer.valueOf(miniGridshotLast100[99]) == 0);
    int scoreCycle = Integer.valueOf(miniGridshotLast100[100]);
    float miniGridshotLast100Avg;
    miniGridshotLast100[scoreCycle] = String.valueOf(score);
    scoreCycle++;
    if(has100Scores){
      int sum = 0;
      for(int i = 0; i < 100; i++){
        sum += Integer.valueOf(miniGridshotLast100[i]);
      }
      miniGridshotLast100Avg = (float)(sum)/(100);
      } else{  
      int sum = 0;
      for(int i = 0; i < scoreCycle; i++){
        sum += Integer.valueOf(miniGridshotLast100[i]);
      }
      miniGridshotLast100Avg = (float)(sum)/(scoreCycle);
    }
    if(scoreCycle == 100){
      scoreCycle = 0;
    }
    miniGridshotLast100[100] = String.valueOf(scoreCycle);
    saveStrings("data/user/scoresMiniGridshot.txt", miniGridshotLast100);
    playerStats[13] = String.valueOf((int)miniGridshotLast100Avg);
  }
  else if(game.equals("speedGridshot")){
    boolean has100Scores = !(Integer.valueOf(speedGridshotLast100[99]) == 0);
    int scoreCycle = Integer.valueOf(speedGridshotLast100[100]);
    float speedGridshotLast100Avg = 0;
    speedGridshotLast100[scoreCycle] = String.valueOf(score);
    scoreCycle++;
    if(has100Scores){
      int sum = 0;
      for(int i = 0; i < 100; i++){
        sum += Integer.valueOf(speedGridshotLast100[i]);
      }
      speedGridshotLast100Avg = (float)(sum)/(100);
      } else{  
      int sum = 0;
      for(int i = 0; i < scoreCycle; i++){
        sum += Integer.valueOf(speedGridshotLast100[i]);
      }
      speedGridshotLast100Avg = (float)(sum)/(scoreCycle);
    }
    if(scoreCycle == 100){
      scoreCycle = 0;
    }
    speedGridshotLast100[100] = String.valueOf(scoreCycle);
    saveStrings("data/user/scoresSpeedGridshot.txt", speedGridshotLast100);
    playerStats[14] = String.valueOf((int)speedGridshotLast100Avg);    
  }
  else if(game.equals("waveGridshot")){
    boolean has100Scores = !(Integer.valueOf(waveGridshotLast100[99]) == 0);
    int scoreCycle = Integer.valueOf(waveGridshotLast100[100]);
    float waveGridshotLast100Avg = 0;
    waveGridshotLast100[scoreCycle] = String.valueOf(score);
    scoreCycle++;
    if(has100Scores){
      int sum = 0;
      for(int i = 0; i < 100; i++){
        sum += Integer.valueOf(waveGridshotLast100[i]);
      }
      waveGridshotLast100Avg = (float)(sum)/(100);
      } else{  
      int sum = 0;
      for(int i = 0; i < scoreCycle; i++){
        sum += Integer.valueOf(waveGridshotLast100[i]);
      }
      waveGridshotLast100Avg = (float)(sum)/(scoreCycle);
    }
    if(scoreCycle == 100){
      scoreCycle = 0;
    }
    waveGridshotLast100[100] = String.valueOf(scoreCycle);
    saveStrings("data/user/scoresWaveGridshot.txt", waveGridshotLast100);
    playerStats[15] = String.valueOf((int)waveGridshotLast100Avg);      
  }
  else if(game.equals("normalQuickshot")){
    boolean has100Scores = !(Integer.valueOf(normalQuickshotLast100[99]) == 0);
    int scoreCycle = Integer.valueOf(normalQuickshotLast100[100]);
    float normalQuickshotLast100Avg = 0;
    normalQuickshotLast100[scoreCycle] = String.valueOf(score);
    scoreCycle++;
    if(has100Scores){
      int sum = 0;
      for(int i = 0; i < 100; i++){
        sum += Integer.valueOf(normalQuickshotLast100[i]);
      }
      normalQuickshotLast100Avg = (float)(sum)/(100);
      } else{  
      int sum = 0;
      for(int i = 0; i < scoreCycle; i++){
        sum += Integer.valueOf(normalQuickshotLast100[i]);
      }
      normalQuickshotLast100Avg = (float)(sum)/(scoreCycle);
    }
    if(scoreCycle == 100){
      scoreCycle = 0;
    }
    normalQuickshotLast100[100] = String.valueOf(scoreCycle);
    saveStrings("data/user/scoresNormalQuickshot.txt", normalQuickshotLast100);
    playerStats[19] = String.valueOf((int)normalQuickshotLast100Avg);       
  }
  else if(game.equals("miniQuickshot")){
    boolean has100Scores = !(Integer.valueOf(miniQuickshotLast100[99]) == 0);
    int scoreCycle = Integer.valueOf(miniQuickshotLast100[100]);
    float miniQuickshotLast100Avg = 0;
    miniQuickshotLast100[scoreCycle] = String.valueOf(score);
    scoreCycle++;
    if(has100Scores){
      int sum = 0;
      for(int i = 0; i < 100; i++){
        sum += Integer.valueOf(miniQuickshotLast100[i]);
      }
      miniQuickshotLast100Avg = (float)(sum)/(100);
      } else{  
      int sum = 0;
      for(int i = 0; i < scoreCycle; i++){
        sum += Integer.valueOf(miniQuickshotLast100[i]);
      }
      miniQuickshotLast100Avg = (float)(sum)/(scoreCycle);
    }
    if(scoreCycle == 100){
      scoreCycle = 0;
    }
    miniQuickshotLast100[100] = String.valueOf(scoreCycle);
    saveStrings("data/user/scoresMiniQuickshot.txt", miniQuickshotLast100);
    playerStats[20] = String.valueOf((int)miniQuickshotLast100Avg);    
  }
  else if(game.equals("2DTrack")){
    boolean has100Scores = !(Integer.valueOf(circletrack2DLast100[99]) == 0);
    int scoreCycle = Integer.valueOf(circletrack2DLast100[100]);
    float circletrack2DLast100Avg = 0;
    circletrack2DLast100[scoreCycle] = String.valueOf(score);
    scoreCycle++;
    if(has100Scores){
      int sum = 0;
      for(int i = 0; i < 100; i++){
        sum += Integer.valueOf(circletrack2DLast100[i]);
      }
       circletrack2DLast100Avg = (float)(sum)/(100);
      } else{  
      int sum = 0;
      for(int i = 0; i < scoreCycle; i++){
        sum += Integer.valueOf(circletrack2DLast100[i]);
      }
      circletrack2DLast100Avg = (float)(sum)/(scoreCycle);
    }
    if(scoreCycle == 100){
      scoreCycle = 0;
    }
    circletrack2DLast100[100] = String.valueOf(scoreCycle);
    saveStrings("data/user/scores2DTrack.txt", circletrack2DLast100);
    playerStats[28] = String.valueOf((int)circletrack2DLast100Avg);    
  }
  else if(game.equals("horizontalTrack")){
    boolean has100Scores = !(Integer.valueOf(horizontalTrackLast100[99]) == 0);
    int scoreCycle = Integer.valueOf(horizontalTrackLast100[100]);
    float horizontalTrackLast100Avg = 0;
    horizontalTrackLast100[scoreCycle] = String.valueOf(score);
    scoreCycle++;
    if(has100Scores){
      int sum = 0;
      for(int i = 0; i < 100; i++){
        sum += Integer.valueOf(horizontalTrackLast100[i]);
      }
       horizontalTrackLast100Avg = (float)(sum)/(100);
      } else{  
      int sum = 0;
      for(int i = 0; i < scoreCycle; i++){
        sum += Integer.valueOf(horizontalTrackLast100[i]);
      }
      horizontalTrackLast100Avg = (float)(sum)/(scoreCycle);
    }
    if(scoreCycle == 100){
      scoreCycle = 0;
    }
    horizontalTrackLast100[100] = String.valueOf(scoreCycle);
    saveStrings("data/user/scoresHorizontalTrack.txt", horizontalTrackLast100);
    playerStats[26] = String.valueOf((int)horizontalTrackLast100Avg);     
  }
  else if(game.equals("multiTrack")){
    boolean has100Scores = !(Integer.valueOf(multiTrackLast100[99]) == 0);
    int scoreCycle = Integer.valueOf(multiTrackLast100[100]);
    float multiTrackLast100Avg = 0;
    multiTrackLast100[scoreCycle] = String.valueOf(score);
    scoreCycle++;
    if(has100Scores){
      int sum = 0;
      for(int i = 0; i < 100; i++){
        sum += Integer.valueOf(multiTrackLast100[i]);
      }
       multiTrackLast100Avg = (float)(sum)/(100);
      } else{  
      int sum = 0;
      for(int i = 0; i < scoreCycle; i++){
        sum += Integer.valueOf(multiTrackLast100[i]);
      }
      multiTrackLast100Avg = (float)(sum)/(scoreCycle);
    }
    if(scoreCycle == 100){
      scoreCycle = 0;
    }
    multiTrackLast100[100] = String.valueOf(scoreCycle);
    saveStrings("data/user/scoresMultiTrack.txt", multiTrackLast100);
    playerStats[27] = String.valueOf((int)multiTrackLast100Avg); 
  }
  else if(game.equals("precisionTrack")){
    boolean has100Scores = !(Integer.valueOf(precisionTrackLast100[99]) == 0);
    int scoreCycle = Integer.valueOf(precisionTrackLast100[100]);
    float precisionTrackLast100Avg = 0;
    precisionTrackLast100[scoreCycle] = String.valueOf(score);
    scoreCycle++;
    if(has100Scores){
      int sum = 0;
      for(int i = 0; i < 100; i++){
        sum += Integer.valueOf(precisionTrackLast100[i]);
      }
       precisionTrackLast100Avg = (float)(sum)/(100);
      } else{  
      int sum = 0;
      for(int i = 0; i < scoreCycle; i++){
        sum += Integer.valueOf(precisionTrackLast100[i]);
      }
      precisionTrackLast100Avg = (float)(sum)/(scoreCycle);
    }
    if(scoreCycle == 100){
      scoreCycle = 0;
    }
    precisionTrackLast100[100] = String.valueOf(scoreCycle);
    saveStrings("data/user/scoresPrecisionTrack.txt", precisionTrackLast100);
    playerStats[29] = String.valueOf((int)precisionTrackLast100Avg);
  }
  else if(game.equals("marathonHunFall")){
    boolean has100Scores = !(Integer.valueOf(marathonModeLast100[99]) == 0);
    int scoreCycle = Integer.valueOf(marathonModeLast100[100]);
    float marathonModeLast100Avg = 0;
    marathonModeLast100[scoreCycle] = String.valueOf(score);
    scoreCycle++;
    if(has100Scores){
      int sum = 0;
      for(int i = 0; i < 100; i++){
        sum += Integer.valueOf(marathonModeLast100[i]);
      }
       marathonModeLast100Avg = (float)(sum)/(100);
      } else{  
      int sum = 0;
      for(int i = 0; i < scoreCycle; i++){
        sum += Integer.valueOf(marathonModeLast100[i]);
      }
      marathonModeLast100Avg = (float)(sum)/(scoreCycle);
    }
    if(scoreCycle == 100){
      scoreCycle = 0;
    }
    marathonModeLast100[100] = String.valueOf(scoreCycle);
    saveStrings("data/user/scoresMarathonMode.txt", marathonModeLast100);
    playerStats[34] = String.valueOf((int)marathonModeLast100Avg);    
  }
}

//UPDATEHIGHSCORE***
public void updateHighScore(int score, String game){
  if(game.equals("normalGridshot")){
    if(score > Integer.valueOf(playerStats[8])){
      playerStats[8] = String.valueOf(score);
    }
  }
  else if(game.equals("miniGridshot")){
    if(score > Integer.valueOf(playerStats[9])){
      playerStats[9] = String.valueOf(score);
    }
  }
  else if(game.equals("speedGridshot")){
    if(score > Integer.valueOf(playerStats[10])){
      playerStats[10] = String.valueOf(score);
    }
  }
  else if(game.equals("waveGridshot")){
    if(score > Integer.valueOf(playerStats[11])){
      playerStats[11] = String.valueOf(score);
    }
  }
  else if(game.equals("normalQuickshot")){
    if(score > Integer.valueOf(playerStats[16])){
      playerStats[16] = String.valueOf(score);
    }
  }
  else if(game.equals("miniQuickshot")){
    if(score > Integer.valueOf(playerStats[17])){
      playerStats[17] = String.valueOf(score);
    }
  }
  else if(game.equals("2DTrack")){
    if(score > Integer.valueOf(playerStats[24])){
      playerStats[24] = String.valueOf(score);
    }
  }
  else if(game.equals("horizontalTrack")){
    if(score > Integer.valueOf(playerStats[22])){
      playerStats[22] = String.valueOf(score);
    }
  }
  else if(game.equals("multiTrack")){
    if(score > Integer.valueOf(playerStats[23])){
      playerStats[23] = String.valueOf(score);
    }
  }
  else if(game.equals("precisionTrack")){
    if(score > Integer.valueOf(playerStats[25])){
      playerStats[25] = String.valueOf(score);
    }
  }
  else if(game.equals("marathonHunFallScore")){
    if(score > Integer.valueOf(playerStats[33])){
      playerStats[33] = String.valueOf(score);
    }
  }
  else if(game.equals("marathonHunFallWave")){
    if(score > Integer.valueOf(playerStats[35])){
      playerStats[35] = String.valueOf(score);
    }
  }
  else if(game.equals("endlessNormal")){
    if(score > Integer.valueOf(playerStats[30])){
      playerStats[30] = String.valueOf(score);
    }
  }
  else if(game.equals("endlessHard")){
    if(score > Integer.valueOf(playerStats[31])){
      playerStats[31] = String.valueOf(score);
    }
  }
  else if(game.equals("endlessImpossible")){
    if(score > Integer.valueOf(playerStats[32])){
      playerStats[32] = String.valueOf(score);
    }
  }
}

//UPDATETIMEPLAYED***
public void updateTimePlayed(){
  if(frameCount % 3600 == 0 && frameCount != 0){
    playerStats[0] = String.valueOf(Integer.valueOf(playerStats[0]) + 1);
    saveStrings("data/user/stats.txt", playerStats);
  }
}

public void initializeSettings(){
  float masterVol = Float.valueOf(audioSettings[0]) / 100;
  masterVolumeSlider = new Slider(450, 150, 200, Integer.valueOf(audioSettings[0]), "Master Volume");
  
  menuMusic = new SoundFile(this, "data/music/menuMusic1.wav");
  menuMusic.play();
  menuMusic.loop();
  menuMusic.amp((Float.valueOf(audioSettings[1]) / 100) * masterVol);
  menuMusicSlider = new Slider(450, 200, 200, Integer.valueOf(audioSettings[1]), "Music Volume");
  
  hitSound = new SoundFile(this, audioSettings[3]);
  hitSound.amp((Float.valueOf(audioSettings[2]) / 100) * masterVol);
  hitSoundSlider = new Slider(450, 250, 200, Integer.valueOf(audioSettings[2]), "Hit Sound Volume");
  String currentFile = audioSettings[3];
  if(currentFile.equals("data/hitSounds/bah.wav")){
    bahHitSound.isActive = true;
  }else if(currentFile.equals("data/hitSounds/beow.wav")){
    beowHitSound.isActive = true;
  }else if(currentFile.equals("data/hitSounds/bonk.wav")){
    bonkHitSound.isActive = true;
  }else if(currentFile.equals("data/hitSounds/clack.wav")){
    clackHitSound.isActive = true;
  }else if(currentFile.equals("data/hitSounds/cling.wav")){
    clingHitSound.isActive = true;
  }else if(currentFile.equals("data/hitSounds/cod.wav")){
    codHitSound.isActive = true;
  }else if(currentFile.equals("data/hitSounds/fing.wav")){
    fingHitSound.isActive = true;
  }else if(currentFile.equals("data/hitSounds/pew.wav")){
    pewHitSound.isActive = true;
  }else if(currentFile.equals("data/hitSounds/ping.wav")){
    pingHitSound.isActive = true;
  }else if(currentFile.equals("data/hitSounds/plop.wav")){
    plopHitSound.isActive = true;
  }else if(currentFile.equals("data/hitSounds/swich.wav")){
    swichHitSound.isActive = true;
  }else if(currentFile.equals("data/hitSounds/tic.wav")){
    ticHitSound.isActive = true;
  }else if(currentFile.equals("data/hitSounds/pop1.wav")){
    pop1HitSound.isActive = true;
  }else if(currentFile.equals("data/hitSounds/pop2.wav")){
    pop2HitSound.isActive = true;
  }else if(currentFile.equals("data/hitSounds/pop3.wav")){
    pop3HitSound.isActive = true;
  }else if(currentFile.equals("data/hitSounds/pop4.wav")){
    pop4HitSound.isActive = true;
  }
  
  useDefaultColors = Boolean.valueOf(gameSettings[0]);
  useDefaultBackground = Boolean.valueOf(gameSettings[7]);
  circleColor = color(Integer.valueOf(gameSettings[1]), Integer.valueOf(gameSettings[2]), Integer.valueOf(gameSettings[3]));
  backgroundColor = color(Integer.valueOf(gameSettings[4]), Integer.valueOf(gameSettings[5]), Integer.valueOf(gameSettings[6]));
  
   circleColorRSlider = new Slider(375, 185, 255, Integer.valueOf(gameSettings[1]));
   circleColorGSlider = new Slider(375, 235, 255, Integer.valueOf(gameSettings[2]));
   circleColorBSlider = new Slider(375, 285, 255, Integer.valueOf(gameSettings[3]));
   backgroundColorRSlider = new Slider(375, 350, 255, Integer.valueOf(gameSettings[4]));
   backgroundColorGSlider = new Slider(375, 400, 255, Integer.valueOf(gameSettings[5]));
   backgroundColorBSlider = new Slider(375, 450, 255, Integer.valueOf(gameSettings[6]));

}

//SETSPLASHTEXT***
public void setSplashText(){
  splashText = splashArray[(int)(Math.random() * splashArray.length)];
}

//PRINTSPLASHTEXT***
public void printSplashText(){
  fill(255,255,0);
  if(splashTextSize > 30){
    splashTextSizeInc = false;
  }
  if(splashTextSize < 25){
    splashTextSizeInc = true;
  }
  textSize(splashTextSize);
  textAlign(CENTER);
  //translate(254, 130);
  //rotate(radians(5));
  text(splashText, 400, 162);
  //if(frameCount % 2 == 0){
    if(splashTextSizeInc){
       splashTextSize += .3;      
    }else{
       splashTextSize -= .3;   
    }

  //}

  //rotate(0);
}

//ISHOVERINGAREA***
//Rectangle
public boolean isHoveringArea(int minX, int maxX, int minY, int maxY){
  if(mouseX > minX && mouseX < maxX && mouseY > minY && mouseY < maxY){
    return true;
  }
  return false;
}

//Buttons
public boolean isHoveringArea(Button button){
  if(mouseX >= (button.center_x - (button.h/2)) && mouseX <= (button.center_x + (button.h/2)) && mouseY >= (button.center_y - (button.w/2)) && mouseY <= (button.center_y + (button.w/2))){
    return true;
  }
  return false;
}

//DRAWSCOREBOARD***
public void drawScoreboard(){
  image(scoreboardGradient, 0, 0);
  line(0, 40, 800, 40);
  if(hunFall){
    textAlign(LEFT);
    fill(0);
    textSize(25);
    text("Hit: " + hit, 180, 25);
    text("Misclicks: " + misClicks, 10, 25);
    if(normHunFall || hardHunFall || imposHunFall){
      text("Missed: " + missed, 290, 25);
    }else if(marathonHunFall){
      text("Lives: " + lives, 290, 25);
    }
  }
  else if(gridshot){
    textAlign(CENTER);
    fill(0);
    textSize(35);
    if(waveGridshot){
      text(timer, 400, 31);
    }else{
      text((30-timer), 400, 31);
    }
    line(340, 0, 370, 40);
    line(460, 0, 430, 40);
    
    textSize(25);
    text(gridshotScore, 300, 28);
    //long ass equation for accuracy
    text((int)((float)hit / (totalClicks + missed) * 100) + "%", 500, 28);
    textSize(10);
    text("Score", 300, 38);
    text("Accuracy", 500, 38);
  }
  else if(quickshot){
    textAlign(CENTER);
    fill(0);
    textSize(35);
    text((30-timer), 400, 31);
    line(340, 0, 370, 40);
    line(460, 0, 430, 40);
    
    textSize(25);
    text(quickshotScore, 300, 28);
    text((int)((float)hit / (totalClicks + missed) * 100) + "%", 500, 28);
    
    textSize(10);
    text("Score", 300, 38);
    text("Accuracy", 500, 38);
    
  }
  else if(circletrack){
    textAlign(CENTER);
    fill(0);
    textSize(35);
    text((30-timer), 400, 31);
    line(340, 0, 370, 40);
    line(460, 0, 430, 40);
    
    textSize(25);
    text(circletrackScore, 300, 28);
    if(frames != 180){ //to avoid Arithmetic Exception
      text((int)((float)framesTracked/(frames-180) * 100) + "%", 500, 28);      
    }

    textSize(10);
    text("Score", 300, 38);
    text("Accuracy", 500, 38);
  }
  
}

public void newUpdateScreen(){
  if(newUpdateAvailable){
    fill(176,196,222);
    rect(400, 319, 600, 488, 10);
    fill(70, 130, 180);
    rect(400, 125, 600, 100, 10);
    
    line(100, 169, 700, 169);
    noStroke();
    fill(176,196,222);
    rect(401, 175, 600, 10);
    stroke(0);
    line(700, 140, 700, 190);
    
    fill(0, 174, 255);
    circle(175, 122, 80);
    
    fill(0);
    textAlign(LEFT);
    textSize(70);
    text("circlegame", 240, 146);
    
    textSize(20);
    text("We hope you have enjoyed this version of circlegame!", 150, 230);
    text("Lucky for you, a new version of circlegame is now \navailable for download! (" + newestVersion[0] + ")", 150, 310);
    
    continueOnCurrentVersionButton.drawButton();
    redirectToDownloadPageButton.drawButton();
    
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("Continue playing\non this version", continueOnCurrentVersionButton.center_x, continueOnCurrentVersionButton.center_y - 5);
    text("Go to circlegame\ndownload page", redirectToDownloadPageButton.center_x, redirectToDownloadPageButton.center_y - 5);
    
  }
  
  
  
}
