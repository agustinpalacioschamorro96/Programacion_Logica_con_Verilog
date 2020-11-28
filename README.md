# Trabajo Práctico Final

## Filtro FIR

### ADC

En primer lugar se genera un clk MMCM para el ADC a 78MHz (se busca que sea multiplo de 26), esto para que el divisor del ADC pueda encontrar un divisor con el cual llegar al megasaple. Luego con ayuda también del wizard se genera el ADC. Las características del mismo es que trabaja con un canal simple, continuos sampling, genera 1Msample.
En el registro de estados se podrá observar la muestra tomada por el canal ya convertida a digital.