#include <iostream>
#include <stdlib.h>
#include <stdio.h>

void test() {
  printf( "TZ=%s\n", getenv("TZ") );

  time_t rawtime;
  struct tm * timeinfo;

  time ( &rawtime );
  timeinfo = localtime ( &rawtime );
  printf ( "Current local time and date: %s\n", asctime (timeinfo) );
}

int main() {
  test();

  setenv("TZ", "America/New_York", 1);
  tzset();
  test();

  setenv("TZ", "Asia/Tokyo", 1);
  tzset();
  test();


  setenv("TZ", "Europe/London", 1);
  tzset();
  test();
}
