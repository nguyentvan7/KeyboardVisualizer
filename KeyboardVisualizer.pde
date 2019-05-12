//TODO: Store keypress animations in a data structure so they can all be redrawn.
//TODO: Create animations simiar to piano visualizers.

final int size = 1500;

ArrayList<VisualizePoint> vps = new ArrayList<VisualizePoint>();

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
  
  background(0);
  // Iterate backwards to ensure indexing stays the same.
  for (int i = vps.size() - 1; i >= 0; i--)
  {
    // Update returns false, indicating element must be removed.
    if (!vps.get(i).update())
    {
      vps.remove(i);
    }
  }
}

void keyPressed()
{
  if (key != CODED)
  {
    int val = int(key);
    VisualizePoint vp = new VisualizePoint(val);
    vps.add(vp);
    int amount = int(random(6)) + 3
    ;
    for (int i = 0; i < amount; i++) 
    {
      VisualizePoint smallVp = new VisualizePoint(val);
      int x = int(random(100)) - 50;
      int y = int(random(50)) - 90;
      smallVp.x = x + vp.x;
      smallVp.y = y + vp.y;
      smallVp.rad = int(random(30)) + 30;
      vps.add(smallVp);
    }
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
