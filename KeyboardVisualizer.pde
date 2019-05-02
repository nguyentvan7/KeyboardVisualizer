//TODO: Add animation.
//TODO: Create animations simiar to piano visualizers.

final int RANDOM = 0;
final int FIXED = 1;
int size = 1500;
int mode = RANDOM;

int x = 0;
int y = 0;
int val = 0;
int rad = 0;

void settings()
{
  size(size, size);  
}

void setup()
{
  background(0);
  noStroke();
}

void draw()
{
  //if (keyPressed && key != CODED) {
  //  if (mode == RANDOM)
  //  {

  //    animateCircle(x, y, 50);
  //  }    
    
  //  if (mode == FIXED)
  //  {
  //    int val = int(key);
  //    int x = xLoc(val);
  //    int y = yLoc(val);
  //    fill(createColor(val));
  //    circle(x, y, 150);
  //  }
  //}
      
    
  if (rad > 0)
  {
    background(0);
    circle(x, y, rad);
    //println(x + " " + y + " " + rad + " " + createColor(val));
    //delay(100);
    rad -= 1;
    x = x + floor(cos((rad/25.0)*PI));
    y -= 5;
  }
}

void keyPressed()
{
  if (key != CODED)
  {
    x = int(random(size));
    y = int(random(size - 200)) + 200;
    val = int(key);
    fill(createColor(val));
    rad = 50;
  }
}

void animateCircle(int x, int y, int size)
{
  // Base case.
  if (size < 0)
  {
    return; 
  }
  // Recursive case.
  background(0);
  circle(x, y, size);
  println(x + " " + y + " " + size);
  delay(100);
  animateCircle(x+10, y+10, size - 5);
}

color createColor(int k)
{
  color c;
  float r, g, b;
  r = k * 2 % 255.0;
  g = k * k % 255.0;
  b = k * k * k % 255.0;
  c = color(r, g, b, 255.0);
  return c;
}

// ASCII range is from 33-126.
// (Essentially gonna be 0-93)
// 94 total values.
// Using 10x10 setup.
int xLoc(int k)
{
  int x;
  // Zero the ASCII value.
  k -= 33;
  x = size * (k % 10) / 10;
  x += size * 0.05;
  return x;
}

int yLoc(int k)
{
  int y;
  // Zero the ASCII value.
  k -= 33;
  y = size * (k / 10) / 10;
  y += size * 0.05;
  return y;
}
