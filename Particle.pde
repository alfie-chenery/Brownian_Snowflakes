class Particle{
  
  PVector pos;
  float r;
  
  Particle(float x, float y){
    pos = new PVector(x,y);
    r=size;
  }
  
  void update(){
    pos.x -= 1;
    pos.y += random(-randomFactor,randomFactor);
    
    if(limitAngle){
      float angle = pos.heading();
      angle = constrain(angle,0,PI/6);
      float mag = pos.mag();
      pos = PVector.fromAngle(angle);
      pos.setMag(mag);
    }
  }
  
  void show(){
    fill(255);
    stroke(255);
    circle(pos.x,pos.y,r*2);
  }
  
  boolean collide(ArrayList<Particle> snowflake){
    boolean outcome = (pos.x<1); //if at center set to true
    
    for(Particle s : snowflake){ //check for collisions
      float d = dist(pos.x, pos.y, s.pos.x, s.pos.y);
      if (d < r*2){
        outcome = true;
        break;
      }
      
    }
    return outcome;
  }
  
}
