class Fish extends Mover{ 
  
  Fish(){
    position = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    topSpeed = 2.5;
  }
  @Override
  void display(){
    stroke(0);
    strokeWeight(2);
    fill(255,0,0);
    ellipse(position.x, position.y, 48, 48);
  }
  
}
