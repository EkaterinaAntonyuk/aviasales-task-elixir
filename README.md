# Aviasales task: Elixir
## Локальный запуск
Для запуска Phoenix-сервера:

  * Установить зависимости `mix deps.get`
  * Запустить приложение `mix phx.server`

Для получения информации о перелете нужно сделать запрос вида GET `https://localhost:4000/flights/:id`

Например, https://localhost:4000/flights/3 

## Решение
Данное приложение реализовано с целью попробовать Elixir и Phoenix Framework 
и решает задачу "в лоб". Информация о перелете читается из файла на каждый
запрос пользователя.

Более оптимальное решение написано на Java и описано здесь 
https://github.com/EkaterinaAntonyuk/aviasales-task-java

