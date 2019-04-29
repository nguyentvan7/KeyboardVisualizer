int size = 1500;

void settings() {
  size(size, size);  
}

void setup() {
  background(0);
  noStroke();
}

void draw() {
  
}

void keyPressed() {
  if (key != CODED) {
    println(key);
    int x = int(random(size));
    int y = int(random(size));
    println(x + " " + y);
    int val = int(key);
    println(val);
    fill(createColor(val));
    circle(x, y, 25);
  }
}

color createColor(int k) {
  color c;
  float r, g, b;
  r = k % 255.0;
  g = k * k % 255.0;
  b = k * k * k % 255.0;
  c = color(r, g, b, 200.0);
  return c;
}
