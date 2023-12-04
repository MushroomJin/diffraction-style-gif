import controlP5.*;

PImage img;
PImage[] catimg;
int i=0;
int imheight = 880;
int imwidth = 880;
shade shade1;

int frame_number = 8;   //帧数
int each_pic = 880/frame_number;   //110
int small_wid = 2;     //需要能被each_pic整除，即each_pic整数分为几份
int wid_time = each_pic/small_wid;  //55

float speed = 1;

ControlP5 cp5;
Button but;
Slider sld;
boolean button_state=false;

void setup(){
  size(880,880);
  catimg = new PImage[8];
  img = loadImage("0001.tif");
  catimg[0] = loadImage("0001.tif");
  catimg[1] = loadImage("0002.tif");
  catimg[2] = loadImage("0003.tif");
  catimg[3] = loadImage("0004.tif");
  catimg[4] = loadImage("0005.tif");
  catimg[5] = loadImage("0006.tif");
  catimg[6] = loadImage("0007.tif");
  catimg[7] = loadImage("0008.tif");
  miximage();
  shade1 = new shade(height * 0.95);
  
  cp5 = new ControlP5(this);
  but = cp5.addButton("button_start");
  but.setPosition(20,20).setSize(100,40);
  but.setLabel("START");
  but.setColorBackground(#4399FF);
  but.setColorActive(#A5CEFF);
  but.setColorForeground(#A5CEFF);
  
  sld = cp5.addSlider("sld").setPosition(20,80).setSize(200,40);
  sld.setLabel("speed");
  sld.setRange(0.1,3);
  sld.setValue(1);
  sld.setColorBackground(#FF9843);
  sld.setColorActive(#FFC85A);
  sld.setColorForeground(#FFC85A);
}

void draw(){
  speed = sld.getValue();
  check_button();
  image(img,0,0,height,width);
  if(button_state){
  shade1.show();
  shade1.move();}
  //normal_cycle();
  //saveFrame("frames/####.tif");
}

void normal_cycle(){
  if(i<7){i++;}
  else{i=0;}
  image(catimg[i],0,0,width,height);
}

void check_button(){
  boolean new_state=but.getBooleanValue();
  if(new_state!=button_state){
    if(new_state){
      println("start");
      but.setColorBackground(#FF9843);
      but.setColorActive(#FFC85A);
      but.setColorForeground(#FFC85A);
      but.setLabel("PAUSE");}
    else{
      println("pause");
      but.setColorBackground(#4399FF);
      but.setColorActive(#A5CEFF);
      but.setColorForeground(#A5CEFF);
      but.setLabel("START");}
    button_state=new_state;
  }
}
