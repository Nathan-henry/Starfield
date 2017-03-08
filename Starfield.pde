Particle [] array;
void setup()
{
  size(500,500);
  background(0);
  array = new Particle[1000];
  for (int a = 0; a < 1000; a++)
  {
    if (a <= 930)
    array[a] = new NormalParticle();
   else if (a > 930 && a <= 940)
    array[a] = new JumboParticle();
   else
    array[a] = new OddballParticle();
  }
}
void draw()
{
  fill(0);
  rect(0,0, 1000,1000);
  for (int a = 0; a < 1000; a++)
  {
    array[a].move();
    array[a].show();
  }
  
}
class NormalParticle implements Particle
{
  int red, green, blue;
  double myX, myY, speed, angle;
  public NormalParticle()
  {
    red = (int) (Math.random() * 255);
    green = (int) (Math.random() * 255);
    blue = (int) (Math.random() * 255);
    angle = (Math.random() * 2 * Math.PI);
    speed = (Math.random()) + 0.5;
    myX = 250;
    myY = 250;
  }
  public void move()
  {
    if (myX > 500 || myY > 500 || myX < 0 || myY < 0)
    {
      myX = 250;
      myY = 250;
      angle = (Math.random() * 2 * Math.PI);
      speed = (Math.random()) + 0.5;
    }
    myX += Math.cos(angle) * speed;
    myY += Math.sin(angle) * speed;
  }
  public void show()
  {
    fill (red, green, blue);
    ellipse((float)myX, (float)myY, 5, 5);
  }
}
interface Particle
{
  public void move();
  public void show();
}
class OddballParticle implements Particle
{
  int red, green, blue;
  double myX, myY, speed, angle;
  public OddballParticle()
  {
    red = (int) (Math.random() * 255);
    green = (int) (Math.random() * 255);
    blue = (int) (Math.random() * 255);
    angle = (Math.random() * 2 * Math.PI);
    speed = (Math.random() * 20) + 0.5;
    myX = 250;
    myY = 250;
  }
  public void move()
  {
    myX = Math.cos(angle) * speed * 10 + 250;
    myY = Math.sin(angle) * speed * 10 + 250;
    angle += Math.random() * 0.05;
  }
  public void show()
  {
    fill (red, green, blue);
    rect((int)myX,(int)myY,10,10);
  }
}
class JumboParticle extends NormalParticle
{
  public void show()
  {
    fill (red, green, blue);
    ellipse((float)myX, (float)myY, 20, 20);
  }
}
