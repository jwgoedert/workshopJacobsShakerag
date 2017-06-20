import drawing.library.*;
import processing.pdf.*;
DrawingManager drawingManager;
DShape shape;
int linecount = 1;
int offsetDist = 10;

void setup(){
size(1056, 816,P3D);
background(255);
smooth();
drawingManager = new DrawingManager(this);
print(this);
}

void draw() {
}

void keyPressed() {
  if(key == ' '){
    drawingManager.savePDF();
  }
   if(key == 'c'){
    drawingManager.clear();
  }
  if(key == 'x'){
  linecount++;
  }
}


void mouseDragged(){
   drawingManager.stroke(0,0,0);
   print(mouseX, mouseY);
   float x = mouseX-pmouseX+random(-10,10);
   float y = mouseY -pmouseY+random(-10,10); 
   shape.addDelta(x, y);
}

void mousePressed(){
  shape = drawingManager.addShape();
  shape.translate(mouseX,mouseY);
}