
import drawing.library.*;
import processing.pdf.*;

//instance of DrawingManager library
DrawingManager drawingManager;

//total number of lines to be drawn
int linecount = 1;
//total distance between each ine
float gapDistance = 5;
boolean vert = true;

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
}

//key functions(save,clear,increase/decrease lines, increase/decrease spacing)
void keyPressed() {
  if(key == ' '){
    drawingManager.savePDF();
  }
  if(key == 'c'){
    drawingManager.clear();
  }
  if(key == 'z'){
    linecount ++;
  }
  if(key == 'x'){
    linecount --;
  }
  if(key == 'a'){
    gapDistance = gapDistance + gapDistance/3;
  }
  if(key == 's'){
    gapDistance = gapDistance/1.3;
  }
  if(key == 'v'){
    if(vert == true){
    vert = false;
    }else if(vert == false){
    vert = true;
    }
  }
}

void mouseReleased(){
}

void mouseDragged(){
  //set the stroke to black
   drawingManager.stroke(0,0,0);
 
   //loop through each shape and add a vertex
     for(int i = 0; i < shapes.size();i++){
       DShape shape = shapes.get(i);
       float yPos = mouseY+gapDistance*i;
       float xPos = mouseX+gapDistance*i;
       if(vert == true){
         shape.addVertex(mouseX,yPos);
       }else if(vert == false){
         shape.addVertex(xPos,mouseY);
       }
     }
 }
 
 
 void mousePressed(){
  //clear all existing shapes
  shapes.clear();
  //use a loop to create a new set of shapes
  for(int i = 0; i < linecount; i++){
    //initialize a new DShape object
    DShape s1 = drawingManager.addShape(); 
    //add it to the list of shapes
    shapes.add(s1);
    //initialize a second DShape object
    DShape s2 = drawingManager.addShape(); 
    //add it to the list of shapes
    shapes.add(s2);
    //perform a matrix transformation to reflect the shape across the y axis
    s2.translate(width,0);
    s2.scale(-1,1);
    
    //lower left transformation
    DShape s3 = drawingManager.addShape();
    shapes.add(s3);
    s3.translate(0, height);
    s3.scale(1,-1);
    
    //lower left transformation
    DShape s4 = drawingManager.addShape();
    shapes.add(s4);
    s4.translate(width, height);
    s4.scale(-1, -1);
  }
}





   
 