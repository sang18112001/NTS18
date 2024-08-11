#include <iostream>
 
using namespace std;

// Base class
class Shape {
   public:
      // Constructor
      Shape(int initWidth = 0, int initHeight = 0) {
        width = initWidth;
        height = initHeight;
      }
      
      void setWidth(int w) {
         width = w;
      }
      
      void setHeight(int h) {
         height = h;
      }

      virtual void area () { 
         cout << "Parent class area: " << (width * height) << endl;
      }
      
   protected:
      int width;
      int height;
};

// Derived class (Inheritance)
class Rectangle: public Shape {
   public:
      // Using the base class constructor
      Rectangle(int initWidth = 0, int initHeight = 0) : Shape(initWidth, initHeight) {}

      // Overriding (Polymorphism)
      void area() {
         cout << "Rectangle class area: " << width * height << endl;
      }  
};

int main(void) {
   Shape *shape;    
   Rectangle rec(10,7);

   // store the address of Rectangle
   shape = &rec;
   
   // call rectangle area.
   shape->area();

   return 0;
}
