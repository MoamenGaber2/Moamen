#line 1 "C:/Users/Moamen/Desktop/Trying/MikroC/Roads1.c"




int i;
char seg[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 32, 33, 34, 35};

void counter(int start, int bulb){
 portc = bulb;
 for(i = start; i >= 0; i--){
 if(portd.b0 == 0){
 return;
 }
 portb = seg[i];
 delay_ms( 1000 );
 if(i <= 4 && portc.b3 == 0){
 portc.b3 = 1;
 portc.b4 = 0;
 }
 else if(i <= 4 && portc.b0 == 0){
 portc.b0 = 1;
 portc.b1 = 0;
 }
 }
 portc.b1 = 1;
 portc.b4 = 1;
}
void main() {
 adcon1 = 7;
 trisb = 0; trisa.b0 = 0; trisa.b1 = 0; trisa.b2 = 0; trisa.b3 = 0; trisc = 0; trisd = 1;
 porta.b0 = 1; porta.b1 = 1; porta.b2 = 1; porta.b3 = 1; portc = 0; portd.b0 = 1; portd.b1 = 1;
 while(1){
 if(portd.b0 == 1){
 porta.b0 = 1; porta.b1 = 1; porta.b2 = 1; porta.b3 = 1;
 counter( 15 , 0b11110011);
 counter( 23 , 0b11011110);
 }
 else{
 porta.b0 = 0; porta.b1 = 0; porta.b2 = 0; porta.b3 = 0;
 portc = 0b11011110;
 portb = seg[0];
 while(1){
 porta.b0 = 1; porta.b1 = 1; porta.b2 = 1; porta.b3 = 1;
 if(portd.b0 == 1){
 if(portc == 0b11110011){
 counter( 15 , 0b11110011);
 }
 else{
 counter( 23 , 0b11011110);
 }
 }
 if(portd.b1 == 0 && portc == 0b11110011){
 for(i = 3; i >= 0; i--){
 portc = 0b11101011;
 portb = seg[i];
 delay_ms( 1000 );
 }
 portc = 0b11011110;
 }
 else if(portd.b1 == 1 && portc == 0b11011110){
 for(i = 3; i >= 0; i--){
 portc = 0b11011101;
 portb = seg[i];
 delay_ms( 1000 );
 }
 portc = 0b11110011;
 }
 }
 }
 }
}
