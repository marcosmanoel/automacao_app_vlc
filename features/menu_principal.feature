# language: pt
# encoding UTF-8

Funcionalidade: Tela Inicial

  Cenário: Validar ordenação do menu na primeira incialização
    Dado que estou na tela inicial
    Então visualizo os itens do menu ordenados
    #Ordenação dos itens: Vídeo, Áudio, Pastas, Rede Local, Abrir MRL, Histórico, Preferências, Sobre

  Esquema do Cenário: Validar se ao abrir o aplicativo está carregando a última tela visualizada
    Dado que estou na tela inicial
    E toco em "<Item>"
    E visualizo a tela "<Tela>"
    E toco no botão voltar do smartphone
    Quando abro o aplicativo novamente
    Então visualizo a tela de "<Tela>" novamente

    Exemplos:
      | Item         | Tela                 |
      | Vídeo        | Vídeo                |
      | Áudio        | Áudio                |
      | Pastas       | Pastas               |
      | Rede Local   | Rede Local           |
      | Abrir MRL    | Abrir fluxo de rede  |
      | Histórico    | Histórico            |


    Cenário: Validar se todas as abas da tela de áudio estão aparecendo
      Dado que estou na tela inicial
      E toco em "Áudio"
      E visualizo a tela "Áudio"
      Então visualizo as abas de Artistas, Álbuns, Músicas, Gêneros e Listas de Reprodução

    Esquema do Cenário: Alterar tipo de ordenação dos vídeos
      Dado que estou na tela inicial
      E toco em "Vídeo"
      E visualizo a tela "Vídeo"
      Quando toco no botão de opções
      E toco em ordenar por
      E toco na opção "<Ordenar por>"
      Então visualizo os itens na ordenação desejada

      Exemplos:
        |   Ordenar por   |
        |   Nome (desc)   |
        |   Tamanho       |
        |   Data          |
