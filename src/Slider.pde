public class Slider{
  int center_x;
  int center_y;
  int barLength;
  int sliderPos; // x pos of slider
  String text;
  int startValue;
  String sliderType;

  //for audio slider
  //startPercent is int from 1-100 (inclusive) for the start value of the bar
  public Slider(int center_x, int center_y, int barLength, int startPercent, String text){
     this.center_x = center_x;
     this.center_y = center_y;
     this.barLength = barLength;
     this.sliderPos = (center_x - barLength/2) + (barLength * startPercent / 100);
     this.text = text;
     sliderType = "PercentSlider";
  }
  
  //for color sliders
  //length must be equal to max value
  public Slider(int center_x, int center_y, int barLength, int startValue){
    this.center_x = center_x;
     this.center_y = center_y;
     this.barLength = barLength;
     this.sliderPos = (center_x - barLength/2) + startValue;
     this.text = "";
     sliderType = "ColorSlider";
     
  }
  
  public void drawSlider(){
    fill(0);
    line(center_x - barLength/2, center_y, center_x + barLength/2, center_y);
    fill(255);
    circle(sliderPos, center_y, 15);
    if(mousePressed && (mouseX > center_x - barLength/2 - 10 && mouseX < center_x + barLength/2 + 10) && (mouseY > center_y - 5 && mouseY < center_y + 5)){
      sliderPos = mouseX;
      if(sliderPos > center_x + barLength/2){
        sliderPos = center_x + barLength/2 + 1;
      }
      if(sliderPos < center_x - barLength/2){
        sliderPos = center_x - barLength/2;
      }
    }
    fill(255);
    textAlign(CENTER);
    textSize(20);
    text(text, center_x, center_y - 10);
    fill(0);
    if(sliderType.equals("PercentSlider")){
      text((int)(((double) sliderPos - (center_x - barLength/2)) / barLength * 100), center_x-barLength/2 - 15, center_y + 5);
    }
    else if(sliderType.equals("ColorSlider")){
      text(getValue(), center_x-barLength/2 - 15, center_y + 5);
    }

  }
  
  public float getPercentage(){
    return (((float) sliderPos - (center_x - barLength/2)) / barLength * 100);
  }
  
  //for color sliders
  public int getValue(){
    return sliderPos - (center_x - barLength/2);
  }
}
