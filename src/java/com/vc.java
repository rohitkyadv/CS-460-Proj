
package com;
import java.io.*;
import java.net.*;
import java.awt.*;
import java.applet.*;
import java.awt.event.*;
import java.awt.image.*;

public class vc extends Applet implements MouseListener, MouseMotionListener{

int pixelSize  = 1;
int ueberstand = 0;
int offsetRand = 20;

Label xpmLabel = new Label("Wg. Schreib-Restriktionen fuer applets: Die Bilder im .xpm-Format (mit cut+paste in eine Datei schreiben): Original Bild (links) und die verschluesselten Bilder 1 und 2");

int zweiteLinie = 200;
String dummy[];
int xSize;
int ySize;
boolean original[][];
boolean randomFolie[][];
boolean zweiteFolie[][];

boolean normalPattern[][][] = {{{false,false},
                                  {false,false}},
                                 {{true ,true},
                                  {true ,true}}};
boolean codePattern[][][] = {{{true, false},
                                {false,true}}, 
                               {{false,true},
                                {true, false}}};


Graphics bufferGraphics;
Image offscreen;
Dimension dim;
int curX, curY;



int lastX = 600;
int lastY = 200;
int xStretch = 0;
int yStretch = 0;

int downX = 0;
int downY = 0;
int beforeX = 0;
int beforeY = 0;
boolean hitArea = false;
boolean hitCorner = false;






  public void init() {

   addMouseListener(this);
   addMouseMotionListener(this);
   setBackground(Color.white);

   dim = getSize();
   offscreen = createImage(dim.width,dim.height);
   bufferGraphics = offscreen.getGraphics();



 
   String dummy2 = "";
   try {
      String anItem = "";   
      URL source = null;
      try{source = new URL(getCodeBase(), "Originalbild.xpm");} catch (MalformedURLException e) {};
      BufferedReader in = new BufferedReader(new InputStreamReader(source.openStream()));
      do {        
          anItem = in.readLine();
         }
          while (anItem.charAt(0) != '"');
      String header = anItem.substring(1,anItem.indexOf("\"",1));
      xSize = Integer.parseInt(header.substring(0,header.indexOf(' ')));
      ySize = Integer.parseInt(header.substring(header.indexOf(' ')+1,header.indexOf(' ',header.indexOf(' ')+1)));
      original = new boolean[ySize][xSize];
      in.readLine();
      in.readLine();
      int y = 0;
      while(null != (anItem = in.readLine())) {
         String neuItem = anItem.substring(1,anItem.indexOf("\"",1));
         dummy2 += neuItem + "\n";
         for (int x=0;x<neuItem.length();x++){
            if (neuItem.charAt(x) == '#') original[y][x] = true;  
            else original[y][x] = false;
         }
         y++;
      }
      in.close();
   }
   catch(Exception e) {
      e.printStackTrace();
   } 
   
   zweiteLinie = 180+ySize*pixelSize*2;
   lastY = zweiteLinie;





   randomFolie = new boolean[ySize][xSize];

   for (int x=0;x<xSize;x++){
      for (int y=0;y<ySize;y++){
         int zufall = (int) (Math.random() * 2);
         if (zufall == 1) randomFolie[y][x] = true; 
      }
   }




   zweiteFolie = new boolean[ySize][xSize];

   for (int x=0;x<xSize;x++){
      for (int y=0;y<ySize;y++){
         if (original[y][x]) zweiteFolie[y][x] = !randomFolie[y][x]; else zweiteFolie[y][x] = randomFolie[y][x];
      }
   }


  lastX = xSize * pixelSize * 2 + 150;


  repaint();
 }


 
 public void paint(Graphics g) {

  bufferGraphics.clearRect(0,0,dim.width,dim.width);

  draw_picture(bufferGraphics,original,normalPattern,"Original Bild:"," ",50,50,xSize,ySize,pixelSize,offsetRand,0,false,0,0);

  draw_picture(bufferGraphics,randomFolie,codePattern,"Teilgeheimnis-Bild 1"," www.visual-crypto.de",50,zweiteLinie,xSize,ySize,pixelSize,offsetRand,ueberstand,false,0,0);
  draw_picture(bufferGraphics,zweiteFolie,codePattern,"Teilgeheimnis-Bild 2"," www.visual-crypto.de",lastX,lastY,xSize,ySize,pixelSize,offsetRand,ueberstand,true,xStretch,yStretch);
  
  g.drawImage(offscreen,0,0,this); 


 }



public void draw_picture(Graphics g, 
                         boolean[][] pic, 
                         boolean[][][] pattern, 
                         String s, 
                         String s2, 
                         int xCoordinate, 
                         int yCoordinate, 
                         int xSize, 
                         int ySize, 
                         int pixelSize, 
                         int offset, 
                         int ueberstand,
                         boolean stretchy,
                         int xStretch,                   
                         int yStretch) {

   g.drawString(s,xCoordinate,yCoordinate-5);
   g.drawString(s2,xCoordinate,yCoordinate+ pixelSize*ySize*2+offset-5);

   g.drawLine(xCoordinate,                             yCoordinate,                             xCoordinate+ pixelSize*xSize*2+xStretch, yCoordinate);
   g.drawLine(xCoordinate,                             yCoordinate+ pixelSize*ySize*2+yStretch, xCoordinate+ pixelSize*xSize*2+xStretch, yCoordinate+ pixelSize*ySize*2+yStretch);
   g.drawLine(xCoordinate,                             yCoordinate,                             xCoordinate,                             yCoordinate+ pixelSize*ySize*2+yStretch);
   g.drawLine(xCoordinate+ pixelSize*xSize*2+xStretch, yCoordinate,                             xCoordinate+ pixelSize*xSize*2+xStretch, yCoordinate+ pixelSize*ySize*2+yStretch);

   g.drawLine(xCoordinate-offset,                             yCoordinate - offset,                           xCoordinate+ pixelSize*xSize*2+offset+xStretch, yCoordinate-offset);
   g.drawLine(xCoordinate-offset,                             yCoordinate+ pixelSize*ySize*2+offset+yStretch, xCoordinate+ pixelSize*xSize*2+offset+xStretch, yCoordinate+ pixelSize*ySize*2+offset+yStretch);
   g.drawLine(xCoordinate-offset,                             yCoordinate-offset,                             xCoordinate-offset,                             yCoordinate+ pixelSize*ySize*2+offset+yStretch);
   g.drawLine(xCoordinate+ pixelSize*xSize*2+offset+xStretch, yCoordinate-offset,                             xCoordinate+ pixelSize*xSize*2+offset+xStretch, yCoordinate+ pixelSize*ySize*2+offset+yStretch);

   for (int x=0;x<xSize;x++){
      for (int y=0;y<ySize;y++){
         if (pic[y][x]) {
             if (pattern[1][0][0]) g.fillRect(x*pixelSize*2 + adjustStretch(x,xSize,xStretch)  + xCoordinate,           y*pixelSize*2+ adjustStretch(y,ySize,yStretch)  + yCoordinate,            pixelSize + ueberstand,pixelSize + ueberstand);
             if (pattern[1][0][1]) g.fillRect(x*pixelSize*2 + adjustStretch(x,xSize,xStretch)  + xCoordinate+pixelSize, y*pixelSize*2+ adjustStretch(y,ySize,yStretch)  + yCoordinate,            pixelSize + ueberstand,pixelSize + ueberstand);
             if (pattern[1][1][0]) g.fillRect(x*pixelSize*2 + adjustStretch(x,xSize,xStretch)  + xCoordinate,           y*pixelSize*2+ adjustStretch(y,ySize,yStretch)  + yCoordinate+pixelSize,  pixelSize + ueberstand,pixelSize + ueberstand);
             if (pattern[1][1][1]) g.fillRect(x*pixelSize*2 + adjustStretch(x,xSize,xStretch)  + xCoordinate+pixelSize, y*pixelSize*2+ adjustStretch(y,ySize,yStretch)  + yCoordinate+pixelSize,  pixelSize + ueberstand,pixelSize + ueberstand);
         }
         else {
             if (pattern[0][0][0]) g.fillRect(x*pixelSize*2 + adjustStretch(x,xSize,xStretch)  + xCoordinate,           y*pixelSize*2+ adjustStretch(y,ySize,yStretch)  + yCoordinate,            pixelSize + ueberstand,pixelSize + ueberstand);
             if (pattern[0][0][1]) g.fillRect(x*pixelSize*2 + adjustStretch(x,xSize,xStretch)  + xCoordinate+pixelSize, y*pixelSize*2+ adjustStretch(y,ySize,yStretch)  + yCoordinate,            pixelSize + ueberstand,pixelSize + ueberstand);
             if (pattern[0][1][0]) g.fillRect(x*pixelSize*2 + adjustStretch(x,xSize,xStretch)  + xCoordinate,           y*pixelSize*2+ adjustStretch(y,ySize,yStretch)  + yCoordinate+pixelSize,  pixelSize + ueberstand,pixelSize + ueberstand);
             if (pattern[0][1][1]) g.fillRect(x*pixelSize*2 + adjustStretch(x,xSize,xStretch)  + xCoordinate+pixelSize, y*pixelSize*2+ adjustStretch(y,ySize,yStretch)  + yCoordinate+pixelSize,  pixelSize + ueberstand,pixelSize + ueberstand);
         } 
      }
   }

 if (stretchy) {
       g.setColor(Color.white);
       g.fillRect(xSize*pixelSize*2 +xCoordinate+xStretch,ySize*pixelSize*2+ yCoordinate+yStretch,offset,offset);
       g.setColor(Color.black);
    }
 }


public int adjustStretch(int z, int Size, int Stretch) {
  return Stretch*z/Size;
}

 
public void mousePressed(MouseEvent e) {
   int x = e.getX();
   int y = e.getY();

      if ((lastX - offsetRand <= x) 
       && (x <= lastX+pixelSize*xSize*2 +xStretch+ offsetRand) 
       && (lastY - offsetRand <= y) 
       && (y <= lastY+pixelSize*ySize*2 +yStretch+ offsetRand)) {
         hitArea = true;
         hitCorner = false; 
         beforeX = lastX;
         beforeY = lastY;
         downX = x;
         downY = y;
         repaint();
        }
      else {
       hitArea = false;
       hitCorner = false;
      }
   	
}

public void mouseDragged(MouseEvent e)
{
   int x = e.getX();
   int y = e.getY();
   if (hitArea) { 
     lastX=x-downX+beforeX;
     lastY=y-downY+beforeY;
     repaint();
   }
  else { 
     if (hitCorner) { 
        int newX =x-downX+beforeX;
        int newY =y-downY+beforeY;
        if (newX <= xSize && newX >= 0 - xSize ) xStretch=newX;
        if (newY <= ySize && newY >= 0 - ySize ) yStretch=newY;
        repaint();
      }
   }	
}


public void mouseEntered(MouseEvent e)
{

}

public void mouseExited(MouseEvent e)
{

}

public void mouseClicked(MouseEvent e)
{

}

public void mouseReleased(MouseEvent e)
{

}

public void mouseMoved(MouseEvent e)
{

}

// ---------------------------------------------------------------------------------------------------------------

public void update(Graphics g)
     {
          paint(g);
     } 

}
