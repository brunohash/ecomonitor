### EcoMonitor

Este projeto consiste em um aplicativo mobile desenvolvido com Flutter e uma API backend construída com .NET. O objetivo do aplicativo é monitorar, controlar e otimizar o uso de energia em tempo real, com foco na redução do consumo e uso de fontes renováveis.

## Pré requisitos 
Dotnet 8, Flutter e MySQL

## Rodando a aplicação
Para rodar a api acessa a pasta /api e execute o comando `dotnet run`. <br/>
Para rodar o app acesse a pasta /app/ecomonitor.app e digite o comando `flutter run` (sugerimos utilizar o chrome para abrir o app.

## Descrição das funções
A classe HouseBusiness é responsável por gerenciar a criação e trazer dados a respeito de uma casa, uma vez a casa criada, é possível inserir aparelhos dentro dela para no final termos uma estimativa de consumo para assim compararmos com o uso original do usuário.

Preferimos utilizar micro serviços nessa aplicação para agilizar o desenvolvimento e também ganhar autonomia na hora de escalar algum dos projetos caso exista um grande número de usuários acessando. 

