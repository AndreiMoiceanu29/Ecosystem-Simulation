class Fly extends Mover{
  Fish target;
  Fly(){
    position = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    topSpeed = 2;
  }
  @Override
  void display(){
    stroke(0);
    strokeWeight(2);
    fill(0,255,0);
    ellipse(position.x, position.y, 16, 16);
  }
  
  @Override
  void update(){
    PVector r = PVector.sub(target.position, this.position);
    
    r.setMag(0.05);
    acceleration = r;
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    position.add(velocity);
  }
  
  void setTarget(Fish target){
    this.target = target;
  }
}
