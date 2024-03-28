const int LM35 = A0; // Define o pino que ira ler a saída do LM35
float temperatura; // Variável que armazenará a temperatura medida
int pinoSensor = 7; 
int maximo;
int minimo;
//Função que será executada uma vez quando ligar ou resetar o Arduino
void setup() {
Serial.begin(9600); // inicializa a comunicação serial
pinMode(pinoSensor, INPUT);
}
 
//Função que será executada continuamente
void loop() {
maximo = 35;
minimo = 0;
temperatura = (float(analogRead(LM35))*5/(1023))/0.01;
Serial.print (maximo);
Serial.print (", ");
Serial.print(temperatura);
Serial.print (", ");
Serial.print (minimo);
Serial.print (", ");

Serial.println(digitalRead(pinoSensor));

delay(700);
}
