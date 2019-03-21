class Thief extends Vehicle{
    color c = #343434;
    boolean isDead = false;

    Thief(float x, float y){
        super(x, y);
        maxforce = 0.2;
        visibility = 200;
    }

    void update(){
        velocity.add(acceleration);
        velocity.limit(maxspeed);
        location.add(velocity);
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

        // randomWalkする
        PVector randomVector = PVector.random2D();
        float r = 3;
        randomVector.limit(r);

        PVector target = predictLocation.add(randomVector);

        // thief->policeのベクトル
        PVector diff = PVector.sub(vehicle.location, location);
        // policeとの距離
        float d = diff.mag();

        // 検死
        Autopsy(d);
        
        if(d < visibility){
            // 近づくほどspeedを増やす
            float m = map(d,0,visibility,maxspeed,0);
            target.add(diff.mult(-1));
        }
        
        return target;
    }

    void Autopsy(float d){
        float deadLine = 10;
        if(d < deadLine){
            isDead = true;
        }
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

    void IsDead(){
        isDead = true;
    }
}