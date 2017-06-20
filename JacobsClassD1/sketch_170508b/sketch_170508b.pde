void setup(){
size(800,800);
  background(255);
}
void draw(){
 
stroke(random(0,255),random(0,255),random(0,255));
  //fill(0);
ellipse(mouseX, mouseY, 25, 25);
}