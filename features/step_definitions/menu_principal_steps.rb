#require 'calabash-android/calabash_steps'
#require_relative '../android/home_screen'

Dado(/^que estou na tela inicial$/) do
  @page= page(HomeScreen).await(timeout:5)
  @page.tela_inicial_carregou?
end

Quando(/^toco no menu hamburger$/) do
  @page.tocar_botao_menu
  @page.menu_principal_carregou?
end

Então(/^visualizo os itens do menu ordenados por "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/) do |arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8|
  @page.validar_ordenacao_dos_itens_menu(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
end

Dado(/^toco em "([^"]*)"$/) do |item|
  @page.tocar_item_menu item
end

Dado(/^visualizo a tela "([^"]*)"$/) do |tela|
  @page.tela_desejada_carregou?(tela)
end

Dado(/^toco no botão voltar do smartphone$/) do
  @page.tocar_botao_voltar_smartphone
end

Quando(/^abro o aplicativo novamente$/) do
  @page.abrir_aplicativo
end

Então(/^visualizo a tela de "([^"]*)" novamente$/) do |tela|
  @page.tela_desejada_carregou?(tela)
end

Então(/^visualizo as abas de "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)" e "([^"]*)"$/) do |arg1, arg2, arg3, arg4, arg5|
  @page.validar_abas_tela_audio(arg1, arg2, arg3, arg4, arg5)
end
