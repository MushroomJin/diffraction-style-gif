void miximage(){
  for(int y=0;y<height;y++){
    for(int i=0;i<wid_time;i++){
      for(int j=0;j<frame_number;j++){
        for(int k=0;k<small_wid;k++){
          int loc = k+j*small_wid+i*frame_number*small_wid+ y * width;
          img.pixels[loc] = catimg[j].pixels[loc];
          img.updatePixels();
        }
      }
    }
  }
}
