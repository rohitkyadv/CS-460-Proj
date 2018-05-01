/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.File;

/**
 *
 * @author Manish
 */
public class NewClass1 {
public static void main(String ar[]){
    File f=new File("C:\\Users\\Manish\\Documents\\NetBeansProjects\\Cap\\build\\web\\images\\123\\key(3).png");
    f.delete();
    f.deleteOnExit();
    System.out.print("deleted");
}    
}
