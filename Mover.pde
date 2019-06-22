class Mover{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float topSpeed;
  float mass = 2;
  Mover(){
    position = new PVector(random(width),0);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    topSpeed = 4;
    mass = random(0.5,4);
  }
  
  
  
  void update(){
    //PVector mouse = new PVector(mouseX,mouseY);
    //mouse.sub(position);
    //mouse.setMag(0.5);
    //acceleration = PVector.random2D();
    //acceleration.mult(0.5);
    velocity.add(acceleration);
   // velocity.limit(topSpeed);
    position.add(velocity);
    acceleration.mult(0);
   
  }
  void edges(){
    if(position.x > width){
      position.x = width;
      velocity.x *= -1;
    }
    if(position.x < 0 ){
      position.x = 0;
      velocity.x *= -1;
    }
    if(position.y > height){
      position.y = height;
      velocity.y *= -1;
    }
    if(position.y < 0){
      position.y = 0;
      velocity.y *= -1;
    }
  }
  void display(){
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(position.x, position.y, mass * 20, mass * 20);
  }
  void applyForce(PVector force){
    PVector f = PVector.div(force,mass);
    
    acceleration.add(f);
  }
  
  void run(){
    update();
    edges();
    display();
  }
  
  void computeFf(){
    PVector friction = velocity.get();
    friction.normalize();
    friction.mult(-1);
    friction.mult(0.1);
    applyForce(friction);
  }
  
  boolean isInside(Liquid l){
    if(position.x > l.x && position.x < l.x + l.w && position.y>l.y && position.y < l.y + l.h){
      return true;
    } else {
      return false;
    }
    
  }
  
  void drag(Liquid l){
    float speedSquared = velocity.magSq();
    float dragMagnitude = l.Cd * speedSquared;
    
    PVector drag = velocity.get();
    drag.mult(-1);
    drag.normalize();
    drag.mult(dragMagnitude);
    applyForce(drag);
  }
}
}
