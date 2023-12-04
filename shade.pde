class shade{
  float location;
  float shade_height;
  
  shade(float input_height){
    location = 0 - 2 * width -1;
    shade_height = input_height;
  }
  
  void move(){
    location += speed;
    if(location >  0){
      location = 0 - 2 * width -1;
    }
  }
  
  void show(){
    for(int i=0;i<3 * wid_time;i++){
      float sx = location + i * frame_number * small_wid;
      float sy = height - shade_height;
      float slength = small_wid * (frame_number -1);
      noStroke();
      fill(0);
      rect(sx,sy,slength,shade_height);
    }
  }
}
