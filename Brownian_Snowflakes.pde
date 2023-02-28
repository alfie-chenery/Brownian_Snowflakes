int randomFactor = 5; //larger number makes a wider snowflake
int size = 3;
boolean limitAngle = true;

Particle current;
ArrayList<Particle> snowflake;

void setup(){
  //size(800,800);
  fullScreen();
  current = new Particle(width/2-50,0);
  snowflake = new ArrayList<Particle>();
}

void draw(){
  translate(width/2,height/2);
  rotate(PI/6);
  background(0);


  
  while(!current.collide(snowflake)){
    current.update();
  }
  snowflake.add(current);
  current = new Particle(height/2-50,0);

  
  for(int i=0; i<6; i++){//rotate 6 points
    rotate(TWO_PI/6);
    for(Particle p : snowflake){
      p.show(); 
    }
    //reflect along x axis
    pushMatrix();
    scale(1,-1);
    for(Particle p : snowflake){
      p.show(); 
    }
    popMatrix();
  }
  
  //check end
  if(snowflake.get(snowflake.size()-1).pos.mag()==height/2-50){
    //if a particle is stopped at the start position
    noLoop();
  }
}
