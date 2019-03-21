class Police extends Vehicle{
    float boost = 1.2;
    color c = #006CEF;
    Police(float x, float y){
        super(x, y);
        maxforce = 0.13;
        visibility = 100;
    }

    void update(){
        velocity.add(acceleration);
        velocity.limit(maxspeed);
        location.add(velocity.mult(boost));
        acceleration.mult(0);
    }

    void applyForce(PVector force){
        super.applyForce(force);
    }

    void seek(PVector target){
        super.seek(target);
    }

    PVector randomWalk(){
        return super.randomWalk();
    }

    void display(){
        float theta = velocity.heading() + PI/2;
        fill(c);
        stroke(c);
        pushMatrix();
        translate(location.x,location.y);
        rotate(theta);
        beginShape();
        vertex(0, -r*2);
        vertex(-r, r*2);
        vertex(r, r*2);
        endShape(CLOSE);
        popMatrix();
    }

    void displayVisibility(float visibility){
        super.displayVisibility(visibility);
    }

    void gothroughwall(){
        super.gothroughwall();
    }

    void bounceOffwall(){
        super.bounceOffwall();
    }

    void keepAwayFromWall(float offset){
        super.keepAwayFromWall(offset);
    }
}