import processing.sound.*;

public class HitSound{
  String fileName;
  int tab_center_x;
  int tab_center_y;
  String tabText;
  int tabWidth = 100;
  int tabHeight = 40;
  boolean isActive;
  
  public HitSound(String tabText, String fileName, int tab_center_x, int tab_center_y){
    this.tabText = tabText;
    this.fileName = fileName;
    this.tab_center_x = tab_center_x;
    this.tab_center_y = tab_center_y;
  }
  
  public void drawTab(){
    if(isActive){
      fill(169,169,169);
    }else{
      fill(255);
    }
    rect(tab_center_x,tab_center_y, tabWidth, tabHeight);
    textAlign(CENTER);
    textSize(15);
    fill(0);
    text(tabText, tab_center_x, tab_center_y+5);
    hitTab();
  }
  
  public void hitTab(){
   if(mousePressed && (mouseX >= (tab_center_x - (tabWidth/2)) && mouseX <= (tab_center_x + (tabWidth/2)) && mouseY >= (tab_center_y - (tabHeight/2)) && mouseY <= (tab_center_y + (tabHeight/2)))){
     hitSound = new SoundFile(circlegame.this, fileName);
     audioSettings[3] = fileName;
     setAllToFalse();
     isActive = true;
   }  
  }
  
  public void setAllToFalse(){
    for(int i = 0; i < hitSoundArray.length; i++){
      hitSoundArray[i].isActive = false;
    }
  }
  
  
  
  
  
  
}
