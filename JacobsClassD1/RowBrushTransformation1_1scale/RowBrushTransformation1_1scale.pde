/**
 * RowBrush
 * 
 * simple example of a repeating brush. Lines drawn by dragging the mouse or stylus are repeated along the y-axis
 * pressing space bar saves out a copy of the drawing.
 */


import drawing.library.*;
import processing.pdf.*;

//instance of DrawingManager library
DrawingManager drawingManager;

//total number of lines to be drawn
int linecount = 4;
//total distance between each ine
float gapDistance = 20;
float thetaRange;

//list of shapes
ArrayList<DShape> shapes = new ArrayList<DShape>();
void setup() {
  size(792,612,P3D);
  background(255);
  smooth();
  //initialize DrawingManager
  drawingManager = new DrawingManager(this);
  
 }

void draw() {
  //linecount = 4;
  //gapDistance = 10;
  //thetaRange = 360;
}

//save and clear functions
void keyPressed() {
  if(key == ' '){
    drawingManager.savePDF();
  }
  if(key == 'c'){
  	drawingManager.clear();
  }
}



void mouseReleased(){
}

void mouseDragged(){
  //set the stroke to black
   drawingManager.stroke(0,0,0);
   //loop through each shape and add a vertex
   for(int i = 0; i<linecount;i++){
     DShape shape = shapes.get(i);
     //float yPos = mouseY+gapDistance*i;
     shape.addVertex(mouseX,mouseY);
   }
 
 }
 
 
 void mousePressed(){
  //clear all existin g shapes
  shapes.clear();
  //use a loop to create a new set of shapes
  for(int i = 0; i<linecount;i++){
     //initialize a new DShape object
    drawingManager.stroke(i*10,i*10,i*10);
    DShape s = drawingManager.addShape(); 
    if(i % 2 == 0){
      s.translate(width, 0);
      s.scale(-1, 1);
      s.translate(i*10, 0);  
  }else{
       s.translate(-i*10, 0);
  }
        
    s.translate(-mouseX, -mouseY);
    //add it to the list of shapes
    shapes.add(s);
  }
}
   
 