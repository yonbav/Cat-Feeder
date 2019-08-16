#include <Servo.h>

class device {
  public:
    int deviceId;
    Servo servo;
    int servoPin;
    
    device();
    device(int id, int pin);

    void feedFromDevice();
};
