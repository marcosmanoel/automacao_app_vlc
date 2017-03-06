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

  def validar_ordenacao_dos_itens_menu(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    ordenacao_correta= [arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8]
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
    #elemento= query "android.support.v7.widget.LinearLayoutCompat"
    #indice_elemento= ["Vídeo", "Áudio", "Pastas", "Rede Local", "Abrir MRL", "Histórico", "Preferências", "Sobre"]

    #indice= 0
    #contador= 0
    #indice_elemento.each do |i|
    #  indice= contador if i == item
    #  contador +=1
    #end


    #touch elemento[indice]

    #elemento= query("android.widget.CheckedTextView {text LIKE '#{item}'}").first
    #binding.pry
    #x= elemento['rect']['x'].to_i
    #y= elemento['rect']['y'].to_i
    #touch nil, :offset => {:x => x, :y => y}
    #binding.pry

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
end
