import drawing.library.*;
import processing.pdf.*;

DrawingManager drawingManager;
ArrayList<DShape> myShapes;
int lineCount = 10;
float offset;

void setup() {
  size(1056,816,P3D);
  background(255);
  smooth();
  drawingManager = new DrawingManager(this);
  myShapes = new ArrayList<DShape>();
  for(int i = 0; i < lineCount; i++){
    DShape s = drawingManager.addShape();
    myShapes.add(s);
  }
  
 }

void draw() {
offset = 20;
lineCount = 10;
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
   for(int i = 0; i < lineCount; i++){
      DShape s = myShapes.get(i);
      float yPos = mouseY + offset*i;
      s.addVertex(mouseX, yPos);
  }  
}