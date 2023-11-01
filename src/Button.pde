public class Button{
  int center_x;
  int center_y;
  int h;
  int w;
  int curve;
  
  public Button(){
    center_x = 0;
    center_y = 0;
    h = 100;
    w = 50;
  }
  
  public Button(int x, int y, int hi, int wi){
    center_x = x;
    center_y = y;
    h = hi;
    w = wi;
  }
  
  public Button(int x, int y, int hi, int wi, int c){
    center_x = x;
    center_y = y;
    h = hi;
    w = wi;
    curve = c;
  }
  
  public void drawButton(){
    if(mouseX >= (center_x - (h/2)) && mouseX <= (center_x + (h/2)) && mouseY >= (center_y - (w/2)) && mouseY <= (center_y + (w/2))){
      fill(200);
    }else{
      fill(255);
    }
    rectMode(CENTER);
    stroke(230);
    rect(center_x, center_y, h, w, curve);
    stroke(0);
  }
}
