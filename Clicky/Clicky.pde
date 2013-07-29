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

PImage main,i1,i2;

int screen=1;
int currentPosition=1;
boolean save_score=true;

Button start,option,exit,back,instr,goto_main;
Slider vol;
float vol_set=0.25;
void setup(){
      size(400,400);
      
      f = loadFont( "AgencyFB-Reg-25.vlw" ); //loads font 
      
      main=loadImage("clicky_main.jpg");
      i1=loadImage("button_0.jpg");
      i2=loadImage("button_1.jpg");
      
      start=new Button("START",75,175,60,30);
      option=new Button("OPTIONS",75,210,60,30);
      exit=new Button("EXIT",75,245,60,30);
      back=new Button("back",75,280,60,30);
      goto_main=new Button("to main",180,245,60,30);
      vol=new Slider("Volume",0.25,0,1,15,210,120,20,HORIZONTAL);
      
      maxim = new Maxim(this);// creates new audio environment
      player = maxim.loadFile("music.wav");//creates audio player
      player.setLooping(true);
      player.volume(vol_set);
      player.cue(0);
      player.play();
}


void draw(){

    if(screen==1)
    {
            counter=0;score=0;
            save_score=true;
            image(main, 0, 0);
            start.display();
            option.display();
            exit.display();
            
            if(start.isClicked())
            {
             screen=2;
            }
            if(option.isClicked())
            {
              screen=3;
            }
            if(exit.isClicked())
            {
              screen=4;
            }
      
    }
    else if(screen==2)
    {
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
            if(counter>10)
            {
              if(save_score)
               {
                 saveFrame("User-######.png");
                 save_score=false;
               }
                text ("You Scored :",(width/2)-20,height/2+40); 
                 text(score,(width/2)+60,height/2+40);
               
            //   delay(2000);
                goto_main.display();
            if(goto_main.isClicked())
            {
              screen=1;
            }
            
            }
    }
    else if(screen==3)
    {
            image(main, 0, 0);
            vol.display();
            vol_set=vol.get();
            player.volume(vol_set);
            
            back.display();
            if(back.isClicked())
            {
              screen=1;
            }
    }
    else if(screen==4)
    {
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
  if(screen==2)
     currentPosition=2;
  if(screen==3)
     vol.mousePressed();
}

void mouseReleased(){
  if(screen==2)
     currentPosition=1;
  if(screen==3)
    vol.mouseReleased();
}

void mouseDragged()
{
  if(screen==3)
  vol.mouseDragged();
}

int x,y;
void mouseClicked(){
  if(screen==2 && counter<=10)
  {
     x=mouseX;y=mouseY;
     if(dist(x,y,width/2,height/2)<(width/2-10)){
         score++;
     }
  }
}
