Fish[] fishes = new Fish[5];
Fly[] flies = new Fly[15];
void setup(){
  size(1024,1024);
  background(255);
  for(int i = 0; i<fishes.length;i++){
    fishes[i] = new Fish();
  }
  for(int i = 0; i<flies.length;i++){
    flies[i] = new Fly();
    flies[i].setTarget(fishes[i%5]);
  }
  

}

void draw(){
  background(255);
  for(int i = 0; i<fishes.length;i++){
    fishes[i].run();
    for(int j =0 ;j< flies.length / fishes.length;j++){
      flies[i+j].run();
    }
    
  }
  //for(int i = 0; i<flies.length;i++){
  //  flies[i].update();
  //  flies[i].edges();
  //  flies[i].display();
  //}
  
}
