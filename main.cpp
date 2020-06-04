#include <iostream>
#include <stdlib.h>

int test() {
  std::cout << "TZ=" << getenv("TZ") << std::endl;

  time_t rawtime;
  struct tm * timeinfo;

  time ( &rawtime );
  timeinfo = localtime ( &rawtime );
  printf ( "Current local time and date: %s", asctime (timeinfo) );
  return 0;
}

int main() {
  test();
  setenv("TZ", "America/New_York", 1);
  tzset();
  test();
}
