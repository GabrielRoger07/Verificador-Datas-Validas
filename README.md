# Verificador de Datas de Válidas
Este repositório é destinado ao desenvolvimento de um verificador de datas válidas em flex para a disciplina de Compiladores.

## Requisitos
Dado um arquivo que pode conter datas no formato DD/MM/YYYY, o programa deve identificar quantas destas datas são, de fato, datas válidas, atendendo aos seguintes requisitos:
* Deve ser escrito em um único arquivo Flex
* A validação das datas deve ser feita usando os recursos do Flex, e não por meio de funções customizadas
* Quaisquer espaços em branco (espaços em branco, quebra de linhas, tabulações) devem ser ignorados

## Instalação
Para execução do código, é necessário instalar o flex. Para isso, usa-se o comando sudo apt-get install flex

## Uso
1. ```flex lex.l && gcc -o prog lex.yy.c```
2. ```./prog < entrada.txt```, considerando que o arquivo com as datas seja entrada.txt

## Exemplo
Um arquivo que contenha as seguintes informações:
```
1 14/06/2023 31/06/2023
2 29/02/2000
3 29/02/2022
4
5 12/34/5678
6 abcd 12345 ? FIM
```

Deve retornar o valor 2, pois neste arquivo de exemplo contém apenas 2 datas válidas (14/06/2023 e 29/02/2000)
