/*    Grupo composto por :
Vinícius Assumpção de Araújo - 200028472 ; João Pedro de Camargo Vaz - 200020650;
Gabriel Roger Amorim da Cruz - 200018248 ; Caio Vitor Carneiro de Oliveira - 200057227 
*/

%option noyywrap

%{ 
int contador = 0; /* Declaração de um contador que será usado para contar as datas válidas. */
%}

/* Declaração de expressões regulares para diferentes tipos de dias e meses. 
DIA31, DIA30, DIA28 e DIA29 são usados para representar dias válidos em meses com 31, 30, 28 e 29 dias, respectivamente. 
MES30 e MES31 são usados para representar meses com 30 e 31 dias, respectivamente.
FEB é usado para representar Fevereiro.
ANO é usado para representar um intervalo de anos de 1900 a 2033.
ANOBI é usado para representar anos bissextos dentro do intervalo de 1900 a 2032.
*/

DIA31   (0[1-9]|1[0-9]|2[0-9]|3[01])
DIA30   (0[1-9]|1[0-9]|2[0-9]|30)
DIA28   (0[1-9]|1[0-9]|2[0-8])
DIA29   (0[1-9]|1[0-9]|2[0-9])
MES30   (0[469]|11)
MES31   (0[13578]|1[02])
FEB     02
ANO     (19[0-9][0-9]|20[0-1][0-9]|202[0-3])
ANOBI   (19(04|08|12|16|20|24|28|32|36|40|44|48|52|56|60|64|68|72|76|80|84|88|92|96)|20(00|04|08|12|16|20))

%% /* Marca o início das regras do analisador léxico. */

[0-9]{3,}
{DIA28}"/"{FEB}"/"{ANO}         { ++contador; }
{DIA29}"/"{FEB}"/"{ANOBI}         { ++contador; }
{DIA30}"/"{MES30}"/"{ANO}     { ++contador; }
{DIA31}"/"{MES31}"/"{ANO}     { ++contador; }



[ \t\n]+                     {/* ignora espaços em branco, quebras de linha e tabulações */}
.                            {/* ignore outros caracteres que não correspondam às regras anteriores. */}

%% /* Marca o início do código de usuário. Este código é copiado diretamente para o arquivo de saída. */

/* A função main chama yylex(), que é o scanner gerado pelo Flex, e então imprime o valor do contador. */
int main() {
    yylex();
    printf("%d\n", contador);
    return 0;
}