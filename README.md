# rovers

## O problema
Um esquadrão de robôs rovers deve ser pousado pela NASA em um planalto em Marte. Este planalto, que é curiosamente retangular, deve ser navegado
pelos rovers para que suas câmeras de bordo possam ter uma visão completa do terreno ao redor para enviar de volta à Terra.
A posição e a localização de um rover são representadas por uma combinação de coordenadas x e y e uma letra representando um dos quatro pontos cardeais
da bússola. O planalto é dividido em uma grade para simplificara navegação. Uma posição de exemplo pode ser 0, 0, N, o que significa que o
rover está no canto inferior esquerdo e voltado para o Norte. Para controlar um rover, a NASA envia uma sequência simples de letras.
As letras possíveis são 'L', 'R' e 'M'. 'L' e 'R' fazem o rover girar 90 graus para a esquerda ou direita, respectivamente, sem se mover
de seu ponto atual. 'M' significa avançar um ponto da grade e mantero mesmo rumo.
Suponha que o quadrado diretamente ao norte de (x, y) seja (x, y+1).

## Input
O sistema espera um arquivo .txt, seu nome deve ser `input_rover.txt`, ele deve estar na pasta do projeto antes da execução.

## Output
O sistema devolve as cordenadas onde o robô parou e qual direção ele está olhando..
