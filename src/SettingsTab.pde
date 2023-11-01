public class SettingsTab{
  String menuName;
  int center_x;
  int center_y;
  boolean isActive = false;
  
  public SettingsTab(int center_x, int center_y, String menuName){
    this.center_x = center_x;
    this.center_y = center_y;
    this.menuName = menuName;
  }
  
  public void drawTab(){
    if(isActive){
     fill(169,169,169);
    }else{
     fill(255);
    }
    rect(center_x, center_y, 100, 50);
    if(hoveringTab() && !isActive){
      fill(169,169,169);
    }else{
      fill(0);
    }
    textAlign(CENTER);
    textSize(20);
    text(menuName, center_x, center_y + 5);
  }
  
  public boolean hoveringTab(){
   if(mouseX >= (center_x - (100/2)) && mouseX <= (center_x + (100/2)) && mouseY >= (center_y - (50/2)) && mouseY <= (center_y + (50/2))){
     return true;
   }
   return false;
  }
  
}
