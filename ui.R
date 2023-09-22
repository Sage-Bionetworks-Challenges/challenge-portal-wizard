## Customizations
COLOR = "purple"
SIDE_WIDTH = 260
TITLE = "Synapse Challenge Portal"


## Sidebar
sidebar <- dashboardSidebar(
  width = SIDE_WIDTH,
  sidebarMenu(
    id = "tabs",
    menuItem("Your Challenges", tabName = "home", icon = icon("dashboard")),
    menuItem("Add a Challenge", tabName = "add", 
      icon = icon("cloud-upload-alt")
    ),
    menuItem("FAQ", tabName = "getting-started",
      icon = icon("desktop")
    )
  ),
)


## Body
body <- dashboardBody(
  useShinyjs(),
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "styles.css"),
  ),

  tabItems(
    tabItem(
      tabName = "home",
      h2("Synapse Challenge Portal", align = "center"),
      h4("Add challenges to the Synapse Challenge Portal", 
        align = "center"),
      br(),
    ),

    tabItem(
      tabName = "add",
      sidebarLayout(

      ),

      mainPanel(

      )
    ),

    tabItem(
      tabName = "getting-started",
      h3("How to Use"),
    )
  ),
)


ui <- dashboardPage(
  skin = COLOR,
  
  dashboardHeader(
    titleWidth = SIDE_WIDTH,
    title = TITLE
  ),
  sidebar,
  body
)

# TODO: Synapse OAuth
# uiFunc <- function(req) {
#   if (dca_schematic_api == "offline") {
#     message("dca_schematic_api set to offline. Running in offline mode.")
#     return(ui)
#   }
#   if (!has_auth_code(parseQueryString(req$QUERY_STRING))) {
#     authorization_url <- oauth2.0_authorize_url(api, app, scope = scope)
#     redir <- tags$script(HTML(
#       sprintf("location.replace(\"%s\");", authorization_url)
#     ))
#     return(redir)
#   } else {
#     ui
#   }
# }