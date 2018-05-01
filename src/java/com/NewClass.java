package com;


import com.Crypting;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Manish
 */
public class NewClass {
  static  BufferedImage imgEnc=null;
    public  void key(String name,String path)
    {   System.out.println("nm "+name);
        File fSrcFile=new File(path);//"D:/input.png");

                     if (fSrcFile == null || !fSrcFile.exists()) {
			//	JOptionPane.showMessageDialog(this, "File not found", "ERROR", JOptionPane.ERROR_MESSAGE);
			//	return;
			}System.out.println("fr"+ fSrcFile.getName()+" fr"+fSrcFile.getAbsolutePath());
  BufferedImage imgSrc = Crypting.loadAndCheckSource(fSrcFile, 0, 0, false);
     if (imgSrc == null) {
System.out.println(  " is not fit for encryption");
				//return;
			}
//     vc v=new vc();
     System.out.println("gen1");
BufferedImage imgKey = Crypting.generateKey(imgSrc.getWidth(), imgSrc.getHeight());
System.out.println("gen2");
imgEnc = Crypting.encryptImage(imgKey, imgSrc);
    System.out.println("gen3");
    File f23=new File("C:\\capt");
    f23.mkdir();
    File f = new File(f23+"//"+name);
    f.mkdir();
    File f2=new File(f+"\\key");
    //+"\\key");//(""/+name);	
    if (!f2.toString().endsWith(".png")) {
        System.out.println("fg "+f2.toString());
		    		f2 = new File(f2.toString()+ ".png");
		    	}
    System.out.println(f2.getAbsolutePath());
		    	try {
					ImageIO.write(imgKey, "png", f2);
				} catch (IOException e1) {
					//JOptionPane.showMessageDialog(this, "Could not Save file because: " + e1.getLocalizedMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
				}
                        	File f1 = new File(f+"\\en");//fileChooser.getSelectedFile();
                                
		    	if (!f1.toString().endsWith(".png")) {
		    		f1 = new File(f1.toString()+ ".png");
		    	}
		    	try {
					ImageIO.write(imgEnc, "png", f1);
				} catch (IOException e1) {
					//JOptionPane.showMessageDialog(this, "Could not Save file because: " + e1.getLocalizedMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
				}
                        
    }
    public static void main(String a[])
    {
        NewClass nc=new NewClass();
        //nc.key("an");
    }
}
