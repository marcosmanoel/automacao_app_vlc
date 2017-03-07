
Dado(/^que estou na tela inicial$/) do
  @page= page(HomeScreen).await(timeout:5)
  @page.tela_inicial_carregou?
end

Quando(/^toco no menu hamburger$/) do
  @page.tocar_botao_menu
  @page.menu_principal_carregou?
end

Então(/^visualizo os itens do menu ordenados$/) do
  itens= ITENS[:itens_menu]
  @page.validar_ordenacao_dos_itens_menu itens[:itens_ordenados]
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

Então(/^visualizo as abas de Artistas, Álbuns, Músicas, Gêneros e Listas de Reprodução$/) do
  @page.validar_abas_tela_audio ITENS[:guias_tela_audio]
end

Quando(/^toco no botão de opções$/) do
  @page.tocar_botao_mais_opcoes
end

Quando(/^toco em ordenar por$/) do
  @page.tocar_em_ordenar_por
end

Quando(/^toco na opção "([^"]*)"$/) do |arg1|
  @page.tocar_opcao_ordenacao
end

Então(/^visualizo os itens na ordenação desejada$/) do
  @page.tela_inicial_carregou?
end
