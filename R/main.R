main <- function() {
  cli::cli_alert_info("Hello from r-development-container!")
  cli::cli_alert_success(
    glue::glue(
      "
      \n
      Look I'm in a container here: '{fs::path_wd()}' 
      and I'm running on {sessionInfo()$running}
      "
    )
  )
}

main()
