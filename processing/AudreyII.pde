import processing.sound.*;
boolean trigger=false;

SoundFile music;

int x, y, animation,speed,c,s;
int a;

void setup(){
  size(1000,1000);
  music=new SoundFile(this, "mahna_mahna.mp3");
  music.play();
  background(179,250,255);
  x=width/2;
  y=height/2;
  animation=0;
  speed=1;
  s=speed;
  c=1;
  a=18;
  avatar(x,y,1,a);
  if (animation==2){
    s=speed;
  }
}


void draw(){
  background(179,250,255);
  avatar(x,y,1,a);
  if(trigger==false){
    animate();
  }
  if(!music.isPlaying()){
    trigger=true;
  }

}


void animate(){
  c++;
  if(c%speed==0){
    if (s<0){
      a--;
    }
    else{
      a++;
    }
    if(a==0 || a==19){
      s*=-1;
    }
  }
}

void Mouse(){
  x=mouseX;
  y=mouseY;
}

void Random(){
  c++;
  if (c%speed==0){
    //x=(int)random(width-180)+105;
    //y=(int)random(height-(88+67))+88;
    x=(int)random(width);
    y=(int)random(height);

  }
}

void Bounce(){
  x+=speed;
  y+=s;
  int left=x-105;
  int right=x+75;
  int up=y-88;
  int down=y+67;
  if (left<=0 ||right>=width){
    speed*=-1;
  }
  if(up<=0||down>=height){
    s*=-1;
  }
  
}


void Reset(){
  x+=speed;
  int left=x-105;
  int right=x+75;
  int up=y-88;
  int down=y+67;
  if (left<=0 ||right>=width||up<=0||down>=height){
    x=width/2;
    y=height/2;
  }
}



void mouseClicked(){
  int a=x-mouseX;
  int b=y-mouseY;
  print("["+"x-"+a+","+"y-"+b+"]");
}

void avatar(int x, int y, int scale,int a){
  //stem
  noFill();
  strokeWeight(16*scale);
  stroke(95,176,44);
  curve(x-(500*scale),y-(100*scale), x+(60*scale),y-(80*scale), x,y+(50*scale), x+(100*scale),y+(200*scale));
  
  //leaves
  pushMatrix();
  translate(x+(140-2*a)*scale,y-(30*scale));
  rotate(radians(72-a));
  strokeWeight(4*scale);
  stroke(22,92,22);
  fill(22,92,22);
  curve(-(100*scale),0, 0,-(100*scale), 0,(100*scale), -(300*scale),0);
  curve((100*scale),0, 0,-(100*scale), 0,(100*scale), (300*scale),0);
  popMatrix();
  
  pushMatrix();
  translate(x-(100-a)*scale,y+(10*scale));
  rotate(radians(-72+a));
  curve(-(100*scale),0, 0,-(100*scale), 0,(100*scale),-(300*scale),0);
  curve((100*scale),0, 0,-(100*scale), 0,(100*scale),(300*scale),0);
  popMatrix();
  
  //pot
  fill(130,91,33);
  stroke(130,91,33);
  quad(x+(70*scale),y+(200*scale), x+(80*scale),y+(100*scale), x-(80*scale),y+(100*scale), x-(70*scale),y+(200*scale));
  quad(x+90*scale,y+100*scale, x+90*scale,y+50*scale, x-90*scale,y+50*scale, x-90*scale,y+(100*scale));
  
  //head
  fill(95,176,44);
  stroke(95,176,44);
  arc(x-40*scale,y-100*scale,250*scale,180*scale,radians(225-2*a),radians(495+2*a));
  fill(0);
  stroke(0);
  quad(x-3*scale,y-110*scale, x-(97+3*a)*scale,y-(170-3*a)*scale, x-(112+3*a)*scale,y-(155-3*a)*scale, x-30*scale,y-(95+a)*scale);
  quad(x-(106+2*a)*scale,y-(28+4*a)*scale, x+(6-2*a)*scale,y-(117-a)*scale, x-(15)*scale,y-(120)*scale, x-(120+a)*scale,y-(54+3*a)*scale);
  triangle(x-26*scale,y-122*scale,x-40*scale, y-(70+2*a)*scale, x+(51-a)*scale,y-105*scale);
  
  //teeth
  fill(252);
  stroke(252);
  triangle(x+(10-2*a)*scale,y-(118)*scale, x+(29-2*a)*scale,y-(118)*scale, x+(20-2*a)*scale,y-(95)*scale);
  triangle(x-(10+2*a)*scale,y-(135-a)*scale, x+(10-2*a)*scale,y-(132-a)*scale, (x-2*a),y-(97)*scale);
  triangle(x-(18+2*a)*scale,y-(123-a)*scale, x-(5+2*a)*scale,y-(125-a)*scale, x-(15+2*a)*scale,y-(100)*scale);
  triangle(x-(32+2*a)*scale,y-(123-a)*scale, x-(24+2*a)*scale,y-(123-a)*scale, x-(30+2*a)*scale,y-(110)*scale);
  triangle(x-(50+2*a)*scale,y-(121-a)*scale, x-(37+2*a)*scale,y-(121-a)*scale, x-(45+2*a)*scale,y-(100)*scale);
  triangle(x-(70+2*a)*scale,y-(130-a)*scale, x-(54+2*a)*scale,y-(130-a)*scale, x-(60+2*a)*scale,y-(110)*scale);
  triangle(x-(85+2*a)*scale,y-(160-2*a)*scale, x-(68+2*a)*scale,y-(142-2*a)*scale, x-(75+2*a)*scale,y-(122-a)*scale);
  triangle(x-(100+2*a)*scale,y-(160-2*a)*scale, x-(80+2*a)*scale,y-(160-2*a)*scale, x-(90+2*a)*scale,y-(124-2*a)*scale);
  triangle(x-(120+2*a)*scale,y-(170-2*a)*scale, x-(100+2*a)*scale,y-(170-2*a)*scale,x-(110+2*a)*scale,y-(130-2*a)*scale);
  triangle(x-(140+a)*scale,y-(170-2*a)*scale, x-(120+2*a)*scale,y-(170-2*a)*scale,x-(130+2*a)*scale,y-(130-2*a)*scale);
  
  triangle(x+(36-2*a)*scale,y-(79+a)*scale, x+(28-2*a)*scale,y-(78+a)*scale, x+(30-2*a)*scale,y-(95+a)*scale);
  triangle(x+(3-2*a),y-(69+2*a)*scale, x+(17-2*a)*scale,y-(70+2*a)*scale, x+(10-2*a)*scale,y-(95+a)*scale);
  triangle(x-(11+2*a)*scale,y-(70+2*a)*scale, x-2*a,y-(71+2*a)*scale, x-(5+2*a)*scale,y-(90+a)*scale);
  triangle(x-(26+2*a)*scale,y-(70+2*a)*scale, x-(13+2*a)*scale,y-(70+2*a)*scale, x-(20+2*a)*scale,y-(92+a)*scale);
  triangle(x-(37+2*a)*scale,y-(70+2*a)*scale, x-(30+2*a)*scale,y-(70+2*a)*scale, x-(35+2*a)*scale,y-(93+a)*scale);
  triangle(x-(60+2*a)*scale,y-(67+2*a)*scale, x-(43+2*a)*scale,y-(67+2*a)*scale, x-(50+2*a)*scale,y-(90+a)*scale);
  triangle(x-(73+2*a)*scale,y-(57+2*a)*scale, x-(59+2*a)*scale,y-(60+2*a)*scale, x-(65+2*a)*scale,y-(80+2*a)*scale);
  triangle(x-(88+2*a)*scale,y-(39+3*a)*scale, x-(70+2*a)*scale,y-(42+3*a)*scale, x-(80+2*a)*scale,y-(78+2*a)*scale);
  triangle(x-(110+2*a)*scale,y-(35+3*a)*scale, x-(90+2*a)*scale,y-(35+3*a)*scale,x-(100+2*a)*scale,y-(75+3*a)*scale);
  triangle(x-(130+2*a)*scale,y-(35+3*a)*scale, x-(110+2*a)*scale,y-(35+3*a)*scale, x-(120+2*a)*scale,y-(71+3*a)*scale);
  
  //lips
  fill(196,33,58);
  stroke(196,33,58);
  strokeWeight(16*scale);
  if(a>19){
    circle(x-127*scale,y-107*scale,30*scale);
  }
  pushMatrix();
  translate(x-(40+a)*scale,y-(120-a)*scale);
  rotate(radians(18-a));
  curve(150*scale,150*scale, -50*scale,-30*scale ,-110*scale,0, 0,50*scale);
  curve(100*scale,100*scale, -60*scale,-20*scale ,-110*scale,0, -250*scale,-40*scale);
  curve(-200*scale,-250*scale, -60*scale,-20*scale ,100*scale,-10*scale, 350*scale,100*scale);
  noFill();
  curve(-200*scale,-300*scale, -50*scale,-30*scale ,100*scale,-10*scale, 400*scale,200*scale);
  popMatrix();
  
  fill(196,33,58);
  stroke(196,33,58);
  pushMatrix();
  translate(x-(40+a)*scale,y-(80+2*a)*scale);
  rotate(radians(-18+a));
  curve(150*scale,-150*scale, -50*scale,30*scale ,-110*scale,0, 0,-50*scale);
  curve(+100*scale,-100*scale, -60*scale,20*scale ,-110*scale,0, -250*scale,40*scale);
  curve(-200*scale,250*scale, -60*scale,20*scale ,100*scale,10*scale, 350*scale,-100*scale);
  noFill();
  curve(-200*scale,300*scale, -50*scale,30*scale ,100*scale,10*scale, 400*scale,-200*scale);
  popMatrix();

  
}
