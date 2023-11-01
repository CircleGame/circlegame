public class Circle{
  float center_x;
  float center_y;
  int size;
  float speed_y;
  float speed_x;
  boolean deleted = false;
  int r;
  int c;
  int R, G, B;
  int oldSpeed;
  int health;
  
  public Circle(){
    center_x = -100;
    center_y = -100;
    size = 65;
    speed_y = 0;
    speed_x = 0;
    R = 255;
    G = 255;
    B = 255;
  }
  
  public Circle(String game){
    if(game == "gridshot" || game == "speedGridshot"){
      r = (int)(5 * Math.random());
      c = (int)(5 * Math.random());
      while(gridshotOccupied[r][c] == true){
        r = (int)(5 * Math.random());
        c = (int)(5 * Math.random());
      }
      center_x = gridshotCoords[0][r];
      center_y = gridshotCoords[1][c];
      gridshotOccupied[r][c] = true;
      size = 90;
      speed_y = 0;
      speed_x = 0;
      R = 255;
      G = 33;
      B = 33; 
    }
    if(game == "miniGridshot"){
      r = (int)(9 * Math.random());
      c = (int)(9 * Math.random());
      while(miniGridshotOccupied[r][c] == true){
        r = (int)(9 * Math.random());
        c = (int)(9 * Math.random());
      }
      center_x = miniGridshotCoords[0][r];
      center_y = miniGridshotCoords[1][c];
      miniGridshotOccupied[r][c] = true;
      size = 20;
      speed_y = 0;
      speed_x = 0;
      R = 255;
      G = 33;
      B = 33;
    }
    
    if(game == "waveGridshot"){
      center_x = (int)(Math.random()*750 + 25);
      center_y = (int)(Math.random()*450 + 75);
      speed_y = 0;
      speed_x = 0;
      if(gridshotWaveClicks < 50){
        size = 35;
      }else if(gridshotWaveClicks < 100){
        size = 50;
      }else{
        size = 20;
      }
      R = 255;
      G = 33;
      B = 33;
    }
    
    if(game == "hunFall"){
      center_x = (int)(760 * Math.random() + 20);
      center_y = 0;
      size = 65;
      speed_y = (float)Math.random()*1 + 3;
      speed_x = 0;
      R = 0;
      G = 174;
      B = 255;
    }
    if(game == "quickshot"){
      center_x = 400;
      center_y = 300;
      size = 75;
      speed_y = 0;
      speed_x = 0;
      R = 34;
      G = 139;
      B = 34;
    }
    if(game == "circletrack"){
      center_x = 400;
      center_y = 300;
      size = 75;
      speed_x = 0;
      speed_y = 0;
      R = 255;
      G = 0;
      B = 255; 
    }
    if(game == "circletrackPrecision"){
      center_x = 400;
      center_y = 300;
      size = 15;
      speed_x = 0;
      speed_y = 0;
      R = 255;
      G = 0;
      B = 255; 
    }
    if(game == "multitrack"){
      center_x = 400;
      center_y = (int)(Math.random()*400 + 100);
      size = (int)(Math.random()*20 + 45);
      speed_x = 0;
      speed_y = 0;
      R = 255;
      G = 0;
      B = 255; 
      health = 60;
    }
  }
  
  //For marathon mode
  public Circle(int wave){
    R = 0;
    G = 174;
    B = 255;
    //int randomNum = (int)(Math.random()*100 + 1);
    //if(randomNum >= 95){
    //  center_x = (int)(Math.random() * 108 + 672);
    //}else if(randomNum >= 50){
    //  center_x = (int)(Math.random() * 272 + 400);
    //}else if(randomNum >= 5){
    //  center_x = (int)(Math.random() * 272 + 128);
    //}else{
    //  center_x = (int) (Math.random() * 108 + 20);
    //}
    center_x = (int)(760 * Math.random() + 20); 
    center_y = (int)(50 * Math.random());
    speed_x = 0;
    if(wave == 1){
      size = 65;
      speed_y = 3;
    }else if(wave == 2){
      size = 65;
      speed_y = 3;
    }else if(wave == 3){
      size = 65;
      speed_y = (int)(Math.random()*2 + 3);
    }else if(wave == 4){
      size = 55;
      speed_y = (int)(Math.random()*2 + 3);
    }else if(wave == 5){
      size = 55;
      speed_y = (int)(Math.random()*2 + 3);
    }else if(wave == 6){
      size = 55;
      speed_y = 4;
    }else if(wave == 7){
      size = 45;
      speed_y = 4;
    }else if(wave == 8){
      size = 55;
      speed_y = 4;
    }else if(wave == 9){
      size = 55;
      speed_y = (int)(Math.random()*2 + 4);
    }else if(wave == 10){
      size = 45;
      speed_y = (int)(Math.random()*2 + 4);
    }
  }
  
  //for endgame circles, the boolean value does not matter and is used just to differentiate from the other constructors
  //game variable represents lastGame
  public Circle(String game, boolean endGameCircle){
    center_x = (int)(Math.random()*600+100);
    center_y = (int)(Math.random()*400+100);
    //randomizer to make speed of x positive or negative
    if(Math.random() * 2 > 1){
      speed_x = (float)Math.random() * 0.5 + 0.1;
    }else{
      speed_x = (float)Math.random() * -0.5 - 0.1;
    }
    //randomizer to make speed of y positive or negative    
    if(Math.random() * 2 > 1){
      speed_y = (float)Math.random() * 0.5 + 0.1;
    }else{
      speed_y = (float)Math.random() * -0.5 - 0.1;
    }
    
    if(game == "normalGridshot" || game == "speedGridshot"){
      size = 90;
      R = 255;
      G = 33;
      B = 33; 
    }
    if(game == "miniGridshot"){
      size = 20;
      R = 255;
      G = 33;
      B = 33;
    }
    
    if(game == "waveGridshot"){
      size = 35;
      R = 255;
      G = 33;
      B = 33;
    }
    
    if(game == "hunFall"){
      size = 65;
      R = 0;
      G = 174;
      B = 255;
    }
    if(game == "normalQuickshot"){
      size = 75;
      R = 34;
      G = 139;
      B = 34;
    }
    if(game == "miniQuickshot"){
      size = 25;
      R = 34;
      G = 139;
      B = 34;
    }
    if(game == "horizontalCircletrack" || game == "2DCircletrack"){
      size = 75;
      R = 255;
      G = 0;
      B = 255; 
    }
    if(game == "precisionCircletrack"){
      size = 15;
      R = 255;
      G = 0;
      B = 255; 
    }
    if(game == "multiCircletrack"){
      size = 55;
      R = 255;
      G = 0;
      B = 255; 
    }    
    
  }
  
  public void gridshotHit(String game){
    if(game.equals("normalGridshot")){
    int oldR = r;
    int oldC = c;
    r = (int)(5 * Math.random());
    c = (int)(5 * Math.random());
    while(gridshotOccupied[r][c] == true){
      r = (int)(5 * Math.random());
      c = (int)(5 * Math.random());
    }
    center_x = gridshotCoords[0][r];
    center_y = gridshotCoords[1][c];
    gridshotOccupied[oldR][oldC] = false;
    gridshotOccupied[r][c] = true;
    }else if(game.equals("miniGridshot"))
    {
      int oldR = r;
      int oldC = c;
      r = (int)(9 * Math.random());
      c = (int)(9 * Math.random());
      while(miniGridshotOccupied[r][c] == true){
        r = (int)(9 * Math.random());
        c = (int)(9 * Math.random());
      }
      center_x = miniGridshotCoords[0][r];
      center_y = miniGridshotCoords[1][c];
      miniGridshotOccupied[oldR][oldC] = false;
      miniGridshotOccupied[r][c] = true;
    }else if(game.equals("speedGridshot")){
      int oldR = r;
      int oldC = c;
      r = (int)(5 * Math.random());
      c = (int)(5 * Math.random());
      while(gridshotOccupied[r][c] == true){
        r = (int)(5 * Math.random());
        c = (int)(5 * Math.random());
      }
      center_x = gridshotCoords[0][r];
      center_y = gridshotCoords[1][c];
      size = 90;
      gridshotOccupied[oldR][oldC] = false;
      gridshotOccupied[r][c] = true;      
    }else if(game.equals("waveGridshot")){
      gridshotWaveClicks++;
      center_x = -100;
      center_y = -100;
      if(gridshotWaveClicks == 150){
        gridshotEnd = true;
      }else if(gridshotWaveClicks % 50 == 0){
        circles = new ArrayList<Circle>();
        for(int i = 0; i < 50; i++){
          circles.add(new Circle("waveGridshot"));
        }
      }
    }
  }
  
  public void quickshotHit(){
    center_x = (int)(600 * Math.random() + 100);
    center_y = (int)(400 * Math.random() + 100);
    if(normalQuickshot == true){
      size = 75;
    }
    if(miniQuickshot == true){
      size = 25;
    }
  }
  
  public void drawCircle(){
    if(useDefaultColors){
      fill(R, G, B);      
    }else{
      fill(circleColor);
    }
    if(speedGridshot == true && countdown == 0 && pause == false){
      if(frameCount % 3 == 0) {
        size--;
      }
      if(size == 0){
        gridshotHit("speedGridshot");
        if(!endGame){
          missed++;
          gridshotScore -= 1000;
        }
      }
    }
    ellipse(center_x, center_y, size, size);
  }
  
  public void setInitialSpeed(){
    if(circletrackHorizontal){
      speed_y = 0;
      speed_x = 6;
    }
    else if(circletrack2D){
      speed_y = 3;
      speed_x = 3;
    }
    else if(circletrackMulti){
      speed_y = 0;
      while(speed_x < 3 && speed_x > -3){
        speed_x = (int)(Math.random()*15) - 7;
      }
    }
    else if(circletrackPrecision){
      speed_x = 2;
      speed_y = 2;
    }
  }
  
  public void updateCircleSpeed(){
    if(countdown == 0){
      if(circletrackHorizontal){
        if((Math.random()*100) < 1.5){
          speed_x *= -1;
        }
      }
      else if(circletrack2D){
        if((Math.random()*100) < 1.0){
          speed_x *= -1;
        }
        if((Math.random()*100) < 1.0){
          speed_y *= -1;
        }
        if((Math.random()*100) < 1.0){
          speed_x--;
        }
        if((Math.random()*100) < 1.0){
          speed_x++;
        }
        if((Math.random()*100) < 1.0){
          speed_y--;
        }
        if((Math.random()*100) < 1.0){
          speed_y++;
        }
        if(speed_x < -7){
          speed_x = -7;
        }
        if(speed_x > -4 && speed_x < 0){
          speed_x = -4;
        }
        if(speed_x < 4 && speed_x > 0){
          speed_x = 4;
        }
        if(speed_x > 7){
          speed_x = 7;
        }
        
        if(speed_y < -7){
          speed_y = -7;
        }
        if(speed_y > -4 && speed_y < 0){
          speed_y = -4;
        }
        if(speed_y < 4 && speed_y > 0){
          speed_y = 4;
        }
        if(speed_y > 7){
          speed_y = 7;
        }
      }
      else if(circletrackMulti){
        if(health == 0){
          center_x = -100;
          deleted = true;
        }
      }
    }
    if(center_x > 700){
      speed_x *= -1;
      center_x = 700;
    }
    if(center_x < 100 && center_x != -100){
      speed_x *= -1;
      center_x = 100;
    }
    if(center_y > 500){
      speed_y *= -1;
      center_y = 500;
    }
    if(center_y < 100){
      speed_y *= -1;
      center_y = 100;
    }
  }
  
  public void updateCircle(){
    if(pause == false){
      center_y += speed_y;
      center_x += speed_x;
    }
    
  }
  
  public void updateEndGameCircle(){
      center_x += speed_x;
      center_y += speed_y;
    if(center_x >= 750 - size/2){
      speed_x *= -1;
      center_x = 750 - size/2 - 1;
    }
    if(center_x <= 50 + size/2){
      speed_x *= -1;
      center_x = 50 + size/2 + 1;
    }
    if(center_y >= 550 - size/2){
      speed_y *= -1;
      center_y = 550 - size/2 - 1;
    }
    if(center_y <= 50 + size/2){
      speed_y *= -1;
      center_y = 50 + size/2 +1;
    }
    
  }
  
  public void hitCircle(){
    //oldSpeed = speed_y;
    center_y = -100;
    center_x = 38;
    speed_y = 0;
    speed_x = 0;
    deleted = true;
  }
  
  public void missedCircle(){
    //oldSpeed = speed_y;
    center_y = -100;
    center_x = 38;
    speed_y = 0;
    speed_x = 0;
    deleted = true;
  }
}
