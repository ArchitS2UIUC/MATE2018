import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;
import processing.serial.*;

ControlIO control; 
Configuration config; 
ControlDevice gpad; // object for gamepad
Serial myPort; // creates object for communicating between arduino and processing
int scale;
public void setup() {
  scale = 63; // scale the power of the motors
  size(200, 200); 
  // Initialise the ControlIO
  control = ControlIO.getInstance(this);
  // Find a device that matches the configuration file
  gpad = control.getMatchedDevice("robotdefault");
  String portName = Serial.list()[2]; // change the the value in squarebrackets to whatever port you're gonna use
  myPort = new Serial(this, portName, 9600);
  if (gpad == null) {
    println("No suitable device configured");
    System.exit(-1); // End the program NOW!
  }
}

public void draw() {
  byte xposleftstick = (byte) Math.round(scale*(gpad.getSlider("XL").getValue())+63);
  byte yposleftstick = (byte) Math.round(scale*(gpad.getSlider("YL").getValue())+63);
  byte xposrightstick = (byte) Math.round(scale*(gpad.getSlider("XR").getValue())+63);
  byte yposrightstick = (byte) Math.round(scale*(gpad.getSlider("YR").getValue())+63);
  byte righttrigger = (byte) Math.round(scale*(gpad.getSlider("RT").getValue())+63);
  byte lefttrigger = (byte) Math.round(scale*(gpad.getSlider("LT").getValue())+63);
  byte xButton = (byte) (gpad.getButton("XBUT").pressed() ? 1 : 0);
  byte yButton = (byte) (gpad.getButton("YBUT").pressed() ? 1 : 0);

  byte out[] = new byte[8]; //output array should be right
  out[0] = xposleftstick; 
  out[1] = yposleftstick;
  out[2] = xposrightstick;
  out[3] = yposrightstick;
  out[4] = righttrigger;
  out[5] = lefttrigger;
  out[6] = xButton;
  out[7] = yButton; 
  for (int i = 0; i < out.length; i++) {
    print(out[i] + ", ");
  }
  println("");
  myPort.write(out); //doesn't accept float arrays so I converted to byte array
  delay(1000); //restrict outflow of data to prevent overclocking arduino and computer
}
