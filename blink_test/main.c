#include <stdint.h>

#define RCC_AHB2ENR (*(volatile unsigned int*)0x4002104C)
#define GPIOA_MODER (*(volatile unsigned int*)0x48000000)
#define GPIOA_ODR   (*(volatile unsigned int*)0x48000014)

int main(void) {
  RCC_AHB2ENR |= (1 << 0);
  GPIOA_MODER &= ~(0x3 << (5*2));
  GPIOA_MODER |= (0x1 << (5*2));

  while (1) {
    GPIOA_ODR |= (1 << 5);
    for (volatile int i = 0; i < 100000; ++i);
    GPIOA_ODR &= ~(1 << 5);
    for (volatile int i = 0; i < 100000; ++i);
  }

  return 0;
}
