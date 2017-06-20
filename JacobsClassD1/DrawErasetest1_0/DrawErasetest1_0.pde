import drawing.library.*;
import processing.pdf.*;

DrawingManager drawingManager;
DShape myShape;
DShape myShape2;

void setup() {
  size(1056,816,P3D);
  background(255);
  smooth();
  drawingManager = new DrawingManager(this);
  myShape = drawingManager.addShape();
  myShape2 = drawingManager.addShape();
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
     myShape.addVertex(mouseX, mouseY);
     myShape.addVertex(mouseX, mouseY + 50);
  // drawingManager.line(pmouseX,pmouseY,mouseX,mouseY); 
  
}