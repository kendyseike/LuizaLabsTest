
# 2 - Design Pattern

Optei por utilizar o VIPER já que reparei nítidamente uma necessidade grande de testabilidade e organização, uma vez que para validar e retornar as informações solicitadas pelo teste, o SOLID cai como uma luva em casos como este.
Eu tinha começado o projeto em MVVM mas tive alguns insights durante o desenvolvimento e apostei no VIPER, acho que ficou bem interessante se olhar com a visão de um possível projeto com escalabilidade.

# 3 - Responsabilidades

Basicamente toda a regra de negócio ficou dividida em dois módulos, sendo que o primeiro, acoplado a uma tela de Loading componentizada, fica responsável pela validação e busca tanto de um usuário válido quanto dos tweets. O segundo módulo tem como objetivo fornecer os textos dos tweets para a API da Google Natural Languages e assim calcular o sentimento do texto enviado. Fiz de uma maneira que a tela de Tweets ficasse unicamente responsável por gerenciar o envio do necessário para mostrar os emojis, sem se preocupar com a integridade dos dados, uma vez que todos foram previamente testados.

# 4 - Cobertura de testes

Realizei os testes que achei pertinente ao que se diz respeito a integridade do core do aplicativo. Confesso que é um tópico que quero e vou melhorar, pois lidei por muito tempo com teste End 2 End com Appium e deixei um pouco de lado os testes unitários e integrados :/ espero que ainda assim tenha ao menos um pouco de relevância, aceito dicas inclusive!

# 5 - Linha de raciocínio

O motivo de eu ter criado apenas uma tela com interação foi justamente para tentar fazer a abstração do trabalho pesado para dentro de um componente coringa, tinha imaginado utilizar RxSwift para fazer bind com UI mas achei bem legível fazendo a conversação via delegate sem engessar muito o componente e a tela de Tweets. Meu intuito inicialmente foi mostrar ao máximo a minha forma de resolver problemas sem depender muito de pods, não que eu seja contra, muito pelo contrário.
Entendo que pode ser uma escolha arriscada já que demonstrar desenvoltura nas libs mais utilizadas do mercado pode ser um plus, mas estou confiante na implementação que fiz, cruzando os dedos aqui! rs
