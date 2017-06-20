import drawing.library.*;
import processing.pdf.*;

DrawingManager drawingManager;
ArrayList<DShape> myShapes;

void setup() {
  size(1056,816,P3D);
  background(255);
  smooth();
  drawingManager = new DrawingManager(this);
  myShapes = new ArrayList<DShape>();
  for(int i = 0; i < 10; i++){
    DShape s = drawingManager.addShape();
    myShapes.add(s);
  }
  
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
}


void mouseDragged(){
     drawingManager.stroke(0,0,0);
   for(int i = 0; i < 10; i++){
      DShape s = myShapes.get(i);
      float yPos = mouseY + 100*i;
      s.addVertex(mouseX, yPos);
  }  
}