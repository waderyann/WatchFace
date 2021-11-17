int Hour, Second, Minute, myHour;
float sdeg, mdeg, hdeg, sx, sy, mx, my, hx, hy;
long current_time;

void setup(){
 size(600,600);
 background(0);
 make_face();
 
 current_time = millis();
 Second = second();
 Minute = minute();
 myHour = hour();
 
 if (myHour > 12){
   Hour = myHour - 12;
 }else{
   Hour = myHour;
   if(Hour == 0){
     Hour = 12;
   }
 
 }
}

void draw(){
  
  //print(Hour, Minute, Second);
  if (current_time + 1000 < millis()){
    current_time = millis();
    
    //refresh
    fill(255);
    noStroke();
    fill(0);
    ellipse(width/2, height/2, 250, 250);
    
    Second++;
    if(Second > 59){
     Second = 0;
     Minute++;
     if(Minute > 59){
       Minute = 0;
       Hour ++;
       if (Hour > 12){
         Hour = 1;
       }
     }
    }
    sdeg = Second * 6;
    mdeg = Minute * 6 + (sdeg * 0.016666667);
    hdeg = Hour * 30 + (mdeg * 0.0833333);
    
    //print(" SEP:" + sdeg,mdeg,hdeg);
    
    sx = width/2 + 110 *cos(sdeg*(PI/180) - HALF_PI);
    sy = height/2 + 110*sin(sdeg*(PI/180) - HALF_PI);
    mx = width/2 + 90*cos(mdeg*(PI/180) - HALF_PI);
    my = height/2 + 90*sin(mdeg*(PI/180) - HALF_PI);
    hx = width/2 + 70*cos(hdeg*(PI/180) - HALF_PI);
    hy = height/2 + 70*sin(hdeg*(PI/180) - HALF_PI);
    
    stroke(255);
    strokeWeight(4);
    line(width/2, height/2, sx, sy);
    line(width/2, height/2, mx, my);
    line(width/2, height/2, hx, hy);
    
  }
}

void make_face(){
 fill(255);
 noStroke();
 //ellipse(width/2, height/2, 300, 300);
 
 for(int i = 0; i < 360; i+=6){
  stroke(255);
  strokeWeight(2.5);
  line(width/2 + 150*cos(i*(PI/180)), height/2 + 150*sin(i*(PI/180)), width/2 + 145*cos(i*(PI/180)), height/2 + 145*sin(i*(PI/180)));
 }
}
