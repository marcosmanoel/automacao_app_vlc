require 'calabash-android/abase'
require 'pry'

class HomeScreen < Calabash::ABase

  def trait
    "* id:'coordinator'"
  end

  def tela_inicial_carregou?
    wait_for_element_exists "*id:'fragment_placeholder'", timeout:20
  end

  def tocar_botao_menu
    tap_when_element_exists "android.widget.ImageButton"
  end

  def menu_principal_carregou?
    wait_for_element_exists "* id:'navigation'", timeout:10
  end

  def validar_ordenacao_dos_itens_menu(ordenacao_correta)
    itens_tela= query "android.widget.CheckedTextView"

    indice= 0
    ordenacao_correta.each do |item|
      fail "A Ordenação dos itens do menu está incorreta" unless itens_tela[indice]['text'].include?(item)
      indice +=1
    end
    sleep 3
  end

  def tocar_item_menu(item)

    begin
      menu_principal_carregou?
    rescue
      tocar_botao_menu
      menu_principal_carregou?
    end
    sleep 3

    begin
      tap_when_element_exists "android.widget.CheckedTextView {text LIKE '#{item}'}", timeout:5
    rescue
      tocar_botao_menu
      tap_when_element_exists "android.widget.CheckedTextView {text LIKE '#{item}'}", timeout:5
    end
  end

  def tela_desejada_carregou?(tela)
    wait_for_element_exists "* id:'swipeLayout'", timeout:20
    wait_for_element_exists "android.widget.TextView {text LIKE[c] '#{tela}'}", timeout:30
    sleep 3
  end

  def tocar_botao_voltar_smartphone
    press_back_button
    sleep 3
  end

  def abrir_aplicativo
    start_test_server_in_background
  end

  def validar_abas_tela_audio(lista)
    lista.each do |item|
      fail "Não foi encontrada a aba de #{item}" if query("android.widget.TextView {text LIKE[c] '#{item}'}").empty?
      pan "android.widget.LinearLayout", :left
    end
  end

  def tocar_botao_mais_opcoes
    tap_when_element_exists "android.widget.ImageView {contentDescription LIKE[c] 'Mais opções'}", timeout:15
  end

  def tocar_em_ordenar_por
    tap_when_element_exists "* id:'title' {text CONTAINS[c] 'ordenar'}", timeout:10
  end

  def tocar_opcao_ordenacao(tipo_ordenacao)
    tap_when_element_exists "* id:'title' {text LIKE[c] '#{tipo_ordenacao}'}", timeout:10
  end
end
