void setup(){
  size (800,800);
 
}
void draw(){
  background(0);
//ellipseSquareDiagonal(i,i);
drawGrid(45);
}

void ellipseSquareMouse(float radius){
  rect(mouseX-radius/2, mouseY-radius/2, radius, radius);
  ellipse(mouseX, mouseY, radius, radius);
};

void ellipseSquareDiagonal(float loc, float radius){
  rect(loc-radius/2, loc-radius/2, radius, radius);
  ellipse(loc, loc, radius, radius);
};

void drawGrid(int squareSize){
int loc =  squareSize + 10;   
for (int i = 0; i < width-loc; i = i + loc){
  stroke(255);
  rect(loc, i, squareSize, squareSize);
  rect(i, loc, squareSize, squareSize);
  for (int j = 0; j <width-loc; j = j + loc){
  rect(j, loc, squareSize, squareSize);
  rect(loc, j + squareSize, squareSize, squareSize);
  
  }
}

}