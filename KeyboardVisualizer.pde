//TODO: Add animation.
//TODO: Create animations simiar to piano visualizers.

final int RANDOM = 0;
final int FIXED = 1;
int size = 1500;
int mode = FIXED;

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
  
}

void keyPressed()
{
  if (key != CODED)
  {
    if (mode == RANDOM)
    {
      int x = int(random(size));
      int y = int(random(size));
      int val = int(key);
      fill(createColor(val));
      circle(x, y, 25);
    }
    if (mode == FIXED)
    {
      int val = int(key);
      int x = xLoc(val);
      int y = yLoc(val);
      fill(createColor(val));
      circle(x, y, 150);
    }
  }
}

color createColor(int k)
{
  color c;
  float r, g, b;
  r = k * 2 % 255.0;
  g = k * k % 255.0;
  b = k * k * k % 255.0;
  c = color(r, g, b, 40.0);
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
