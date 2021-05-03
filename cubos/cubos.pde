//import gifAnimation.*;

//int framesGif = 0;
//GifMaker gifExport;

PShader sh;
int modo = 0;
int pos = 0, frames = 0, spaceInc = 2;
boolean up = true, one = true;

int boxSize = 60;
int space = 40;
void setup() {
  size(600, 600, P3D) ;

  //noStroke();
   sh = loadShader("CodeFrag.glsl", "CodeVert.glsl");  
  //gifExport = new GifMaker(this, "export.gif");
  //gifExport.setRepeat(0);
}


void draw() {
  sh.set("u_time", float(millis())/float(1000));
  sh.set("color", modo);
  shader(sh);
  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  background(0);
  directionalLight(204, 204, 204, -dirX, -dirY, -1);
  translate(width/2, height/2);
  if(frames % 5 == 0) {
    pos ++;
    if(up){
      if(space > 80){
        up = !up;
      } else {
        space+=spaceInc;
      }
    } else {
      if(space < 0){
        up = !up;
      } else {
        space-=spaceInc;
      }
    }
  }
  rotateX(radians(pos));
  rotateZ(radians(pos));
  
  noStroke();
  
  translate(-boxSize-space,-boxSize-space,-boxSize-space);

  for(int i = 0; i < 3; i++){
    for(int j = 0; j < 3; j++){
      for(int k = 0; k < 3; k++){
        pushMatrix();
          translate((boxSize+space)*i, (boxSize+space)*j, (boxSize+space)*k);
          box(boxSize);
        popMatrix();
      }
    }
  }

  
  /*
  if(framesGif > 3){
    gifExport.addFrame();
    framesGif = 0;
  }
  framesGif++;
  */
  
  frames++;
}

void keyPressed(){
  /*if(key == 'b'){
    gifExport.finish();
  }*/
}

void mousePressed() {
  resetShader();
  if(modo >= 2) modo = -1;
  modo++;
}
