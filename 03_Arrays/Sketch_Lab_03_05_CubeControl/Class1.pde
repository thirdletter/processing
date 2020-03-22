//initialize class and variables
class Class1 {
  private int var1,var2;
  
  //Constructor
  Class1(int dataMember1, int dataMember2){
  this.var1 = dataMember1;
  this.var2 = dataMember2;
  }
}

//example void method
void method1(){

}

//example of method that returns something
int method2(){
 var1+=var2;
 return var1;
}

//getter
int getVar1(){
  return var1;
}

//setter
void setVar1(int set1){
var1=set1;
}
