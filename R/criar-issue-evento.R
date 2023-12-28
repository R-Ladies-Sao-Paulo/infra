criar_issue_evento <- function(
    palestrantes = "A definir",
    ano = 2024,
    mes = "X",
    data = "A definir",
    tema = "A definir",
    formato = "A definir",
    local = "A definir"
    ){

  # Criando uma milestone para o evento
  titulo_milestone <- paste0(ano, "-", janitor::make_clean_names(mes), "-", janitor::make_clean_names(palestrantes),  "-", janitor::make_clean_names(tema))

  # Criando a milestone
  numero_milestone <- criar_milestone(titulo_milestone)

  # Criando issue com a definição do evento
  numero_issue <- criar_issue(titulo = paste0("Evento com ", palestrantes, " - definição de tema, formato, data, etc"),
                              milestone = numero_milestone,
                              labels = c("eventos", "palestrantes"),
                             # assignees = "beatrizmilz", # Problema, precisa enviar um array
              texto = glue::glue("
              [🤖  Issue criada automaticamente! 🤖 ]

              Olá!

              Estamos organizando um evento com **{palestrantes}** e é necessário definir alguns pontos importantes:

              - [ ] Formato: {formato}
              - [ ] Data: {data}
              - [ ] Tema: {tema}
              - [ ] Local: {local}"))

  numero_issue


  # Adicionando a issue no projeto - CONTINUAR AQUI!
  # adicionar_issue_no_projeto(numero_issue)


}
