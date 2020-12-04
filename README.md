# Trabajo Práctico Final

## Filtro FIR

### ADC

En primer lugar se genera un clk MMCM para el ADC a 78MHz (se busca que sea multiplo de 26), esto para que el divisor del ADC pueda encontrar un divisor con el cual llegar al Msaple/seg. Luego con ayuda también del wizard se genera el ADC. Las características del mismo es que trabaja con un canal simple, continuos sampling, genera 1Msample/seg. Teniendo en cuenta el teorema de Nyquist entonces la máxima frecuencia que se podria tomar sería la que correspoende a 500[KHz].