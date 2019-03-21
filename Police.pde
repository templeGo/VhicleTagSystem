class Police extends Vehicle{
    float boost = 1.3;
    color c = #006CEF;
    Police(float x, float y){
        super(x, y);
        maxspeed = 10;
        visibility = 80;
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

    PVector predictTarget(Vehicle vehicle){
        PVector currentVelocity = velocity;

        currentVelocity.normalize();
        PVector predictLocation = PVector.add(location, currentVelocity.mult(2));

        // 大きさが等しくなるように極端に大きなベクトルを取得
        PVector randomVector = PVector.random2D().mult(100);
        float r = 3;
        randomVector.limit(r);

        PVector target = predictLocation.add(randomVector);
        return target;
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