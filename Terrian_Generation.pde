int w = 1400;
int h = 800;
int scl = 20;
int cols = floor( w / scl );
int rows = floor( h / scl );
int hue = 0;
float s = 0;  
float [][] zValues = new float[cols][rows];
void setup() {
  size(1400, 800, P3D);
   //colorMode(HSB, 100);
   //frameRate(10);
}

void draw() {
  
 
  
  
  
  float yoff = s;
  for ( int y = 0; y < rows; y++) {
    float xoff = 0;
    for ( int x = 0; x < cols; x++) {
       zValues[x][y] = map(noise(xoff, yoff), 0, 1, -100,100 );
       xoff += 0.2;
    }
    yoff += 0.2;
  }
  s -= 0.1;
  
  
  background(51);
  stroke(255, 255,255, 255);
  noFill();
  
  translate( w / 2, h / 2 + 50 );
  rotateX(PI / 3);
  translate( - w/2, -h / 2);
   //fill(35, 137,206, 200);
   //  if ( hue > 255 ) { hue = 0; }
   //   hue++;
   for ( int y = 0; y < rows - 1; y++) {
    
    beginShape(TRIANGLE_STRIP);
    for ( int x = 0; x < cols; x++) {
      vertex(x * scl, y * scl, zValues[x][y]);
      vertex(x * scl, y * scl + scl, zValues[x][y+1]); 
    }
    endShape();
  }
}