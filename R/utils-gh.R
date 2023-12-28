criar_issue <- function(titulo = "Teste",
                        texto = "Teste",
                        owner = "R-Ladies-Sao-Paulo",
                        repo = "organizacao",
                        milestone = "",
                        labels = "",
                        assignees = ""){

  issue_criada <- gh::gh("POST /repos/{owner}/{repo}/issues",
         owner = owner,
         repo = repo,
         title = titulo,
         body = texto,
         milestone = milestone,
         labels = labels)

  numero_issue <- issue_criada$number

  return(numero_issue)
}

criar_milestone <- function(titulo_milestone,
                            owner = "R-Ladies-Sao-Paulo",
                            repo = "organizacao") {

  # Checando se a milestone já existe
  milestones_existentes_lista <- gh::gh(
    "GET /repos/{owner}/{repo}/milestones",
    owner = owner,
    repo = repo,
    title = titulo_milestone
  )

  milestones_existentes <-  milestones_existentes_lista |>
    purrr::map(purrr::pluck("title")) |>
    unlist()

  numero_milestones_existentes <-  milestones_existentes_lista |>
    purrr::map(purrr::pluck("number")) |>
    unlist()

  # Só criar se ela não existir
  if(!titulo_milestone %in% milestones_existentes){
    milestone_criada <- gh::gh(
      "POST /repos/{owner}/{repo}/milestones",
      owner = owner,
      repo = repo,
      title = titulo_milestone
    )

    return(milestone_criada$number)

  } else {
    return(numero_milestones_existentes[milestones_existentes == titulo_milestone])
  }
}

adicionar_issue_no_projeto <- function(numero_issue,
                                       projeto = 2,
                                       owner = "R-Ladies-Sao-Paulo",
                                       repo = "organizacao"
                                       ){
  browser()

  cli_command <- glue::glue("gh project item-add {projeto} --owner {owner} --url https://github.com/{owner}/{repo}/issues/{numero_issue}")

  # precisa autenticar antes!
  system(cli_command)
}
