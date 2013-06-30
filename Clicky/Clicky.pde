//My app is called "Clicky".
//Its an interactive based single player game, to be played on touched based smartphones or device connecting to mouse.
//The user has to click mouse button as many as time as he/she can.
//The time limit is 10 seconds.
//An image of your score is saved.
//The user with highest number of clicks wins.

//Variables for timer
int time;
int wait = 1000;
int counter=0;       //counter is the Timer

//Audio environment
Maxim maxim;
AudioPlayer player;

int score=0;   //Keeps track of number of clicks
PFont f;       //Font to display

PImage i1,i2;

int currentPosition=1;

void setup(){
      size(400,400);
      
      f = loadFont( "AgencyFB-Reg-25.vlw" ); //loads font 
      
      i1=loadImage("button_0.jpg");
      i2=loadImage("button_1.jpg");
      
      maxim = new Maxim(this);// creates new audio environment
      player = maxim.loadFile("music.wav");//creates audio player
      player.setLooping(true);
      player.volume(0.25);
      player.cue(0);
      player.play();
}


void draw(){

    
    if(currentPosition==1)
       image(i1, 0, 0);
    if(currentPosition==2)
       image(i2, 0, 0);

    textFont(f,16); 
    fill(0);        
    text ( "Time :",width*1/32,15); 
    text (counter,(width*1/32)+60,15);
    text ( "Score :",width*3/4,15); 
    text (score,width*3/4+60,15);
    text ( "CLICK ME!!!",(width/2)-20,height/2); 

    clock();     //Clock function counts one second
    if(counter>10){
       text ("You Scored :",(width/2)-20,height/2+40); 
       text(score,(width/2)+60,height/2+40);
       saveFrame("User-######.png"); 
       delay(2000);
       exit();
    }
}


void clock(){
      if(millis() - time >= wait)
      {
          counter++;
          time = millis();
      }
}

void mousePressed(){
     currentPosition=2;
}

void mouseReleased(){
     currentPosition=1;
}

int x,y;
void mouseClicked(){
     x=mouseX;y=mouseY;
     if(dist(x,y,width/2,height/2)<(width/2-10)){
         score++;
     }
}
