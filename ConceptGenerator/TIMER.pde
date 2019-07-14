int timer = 25;
boolean trigger=false;
int tempTimer;
int frameSpeed=10;

//New concept timer
void timer () {
if(Pause==true){
  tempTimer++; 
  if (tempTimer==timer*frameSpeed || (cp5.getController("knob").isMousePressed())) {
    trigger=true;
    tempTimer=0;

  } else {
    trigger=false;    
  }
}
}