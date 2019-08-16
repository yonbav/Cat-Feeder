#include <Servo.h>

class device {
  public:
    int servoPin;
    int pos;
    
    device();
    device(int pin);

    void feedFromDevice();
};
