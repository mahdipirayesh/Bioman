
#include <Wire.h>

long accelX, accelY, accelZ;
float gForceX, gForceY, gForceZ;
const int Fs=200;
long gyroX, gyroY, gyroZ ;
float rotX, rotY, rotZ;

float initial_array[600];
float wating_array[1200];
double aVM ,maxpeak ;
int initial_boolean , initial_counter ;
int peak_passed,peak_detected , waiting_counter ;

unsigned long startMillis;  //some global variables available anywhere in the program
unsigned long currentMillis;
const unsigned long period = 5;  //the value is a number of milliseconds

void setup() {
  Serial.begin(9600);
  Wire.begin();
  setupMPU();
  initial_boolean=1;
  initial_counter=0;
  waiting_counter=0;
  peak_passed=0;
  peak_detected=0;
  maxpeak=0;
  wating_array[1200];
  initial_array[600]=12;
  
  startMillis = millis();  //initial start time
}


void loop() {
  currentMillis = millis();
   if (currentMillis - startMillis >= period)  //test whether the period has elapsed
  {
  recordAccelRegisters();
  recordGyroRegisters();
  aVMfunc();
  Serial.println(aVM);
  if(initial_boolean==1)
  {
    
    initial_array[initial_counter]=gForceX;
    initial_counter++;
    initial_array[initial_counter]=gForceY;
    initial_counter++;
    initial_array[initial_counter]=gForceZ;
    initial_counter++;
    if(initial_counter==600)
    {
      initial_boolean=0;
      initial_counter=0;
    }  
  }
  
  
  
    if(initial_boolean==0 && peak_passed==0 )
    {
      for(int i=0;i <= 596;i++)
      {
        initial_array[i]=initial_array[(i+3)];
      }
      
    initial_array[597]=gForceX;
    initial_array[598]=gForceY;
    initial_array[599]=gForceZ;
        }
             
      
    if( (aVM>1.8) && (initial_boolean==0) && (peak_passed==0) )
    {
     maxpeak=aVM;
     peak_passed=1;
    }
    
  if((aVM<=maxpeak) && (waiting_counter<1200) && (peak_passed==1) ) //Baraye Vahgeii khatarnak ast
  {
   wating_array[ waiting_counter]=gForceX;
   waiting_counter++;
   wating_array[ waiting_counter]=gForceY;
   waiting_counter++;
   wating_array[ waiting_counter]=gForceZ;
    waiting_counter++;
    if(waiting_counter==1200)
    {
    peak_detected=1;
   for(int s=0;s <= 599;s++)
   {
        Serial.println (initial_array[s]);
       delay(50);
      }
     for(int t=0;t <= 1199;t++)
      {
        Serial.println (initial_array[t]);
        delay(50);
      }
     initial_boolean=1;
     
    }
  
}



if(aVM>maxpeak && aVM>1.8 && waiting_counter<1200 && peak_passed==1 )
  {
  int k =waiting_counter;
  if(k<600){
    
 for(int j=0;j+k<= 599;j++)
      {
       initial_array[j]=initial_array[(j+k)];
     }
      
  for(int q=600-k;q<= 599;q++)
  {
    initial_array[q]=wating_array[(k-600+q)];
  }
  
     }
   if(k>=600)
{  
  for(int p=k-600;p<=599;p++)
  {
    initial_array[600-k+p]=wating_array[p];
  }
}  

maxpeak=aVM;
waiting_counter=0;
  }
  
  
 
  }
}

void setupMPU(){
  Wire.beginTransmission(0b1101000); //This is the I2C address of the MPU (b1101000/b1101001 for AC0 low/high datasheet sec. 9.2)
  Wire.write(0x6B); //Accessing the register 6B - Power Management (Sec. 4.28)
  Wire.write(0b00000000); //Setting SLEEP register to 0. (Required; see Note on p. 9)
  Wire.endTransmission();  
  Wire.beginTransmission(0b1101000); //I2C address of the MPU
  Wire.write(0x1B); //Accessing the register 1B - Gyroscope Configuration (Sec. 4.4) 
  Wire.write(0x00000000); //Setting the gyro to full scale +/- 250deg./s 
  Wire.endTransmission(); 
  Wire.beginTransmission(0b1101000); //I2C address of the MPU
  Wire.write(0x1C); //Accessing the register 1C - Acccelerometer Configuration (Sec. 4.5) 
  Wire.write(0b00000000); //Setting the accel to +/- 2g
  Wire.endTransmission(); 
}

void recordAccelRegisters() {
  Wire.beginTransmission(0b1101000); //I2C address of the MPU
  Wire.write(0x3B); //Starting register for Accel Readings
  Wire.endTransmission();
  Wire.requestFrom(0b1101000,6); //Request Accel Registers (3B - 40)
  while(Wire.available() < 6);
  accelX = Wire.read()<<8|Wire.read(); //Store first two bytes into accelX
  accelY = Wire.read()<<8|Wire.read(); //Store middle two bytes into accelY
  accelZ = Wire.read()<<8|Wire.read(); //Store last two bytes into accelZ
  processAccelData();
}

void processAccelData(){
  gForceX = accelX / 16384.0;
  gForceY = accelY / 16384.0; 
  gForceZ = accelZ / 16384.0;
}

void recordGyroRegisters() {
  Wire.beginTransmission(0b1101000); //I2C address of the MPU
  Wire.write(0x43); //Starting register for Gyro Readings
  Wire.endTransmission();
  Wire.requestFrom(0b1101000,6); //Request Gyro Registers (43 - 48)
  while(Wire.available() < 6);
  gyroX = Wire.read()<<8|Wire.read(); //Store first two bytes into accelX
  gyroY = Wire.read()<<8|Wire.read(); //Store middle two bytes into accelY
  gyroZ = Wire.read()<<8|Wire.read(); //Store last two bytes into accelZ
  processGyroData();
}

void processGyroData() {
  rotX = gyroX / 131.0;
  rotY = gyroY / 131.0; 
  rotZ = gyroZ / 131.0;
}
void aVMfunc() {
  aVM=sqrt((gForceX)*(gForceX)+(gForceY)*(gForceY)+(gForceZ)*(gForceZ));
}







void printData() {
  Serial.print("Gyro (deg)");
  Serial.print(" X=");
  Serial.print(rotX);
  Serial.print(" Y=");
  Serial.print(rotY);
  Serial.print(" Z=");
  Serial.print(rotZ);
  Serial.print(" Accel (g)");
  Serial.print(" X=");
  Serial.print(gForceX);
  Serial.print(" Y=");
  Serial.print(gForceY);
  Serial.print(" Z=");
  Serial.println(gForceZ);
}
