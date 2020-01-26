dashboardPage(skin = "black",
                     dashboardHeader(title = "IA - S2", titleWidth = 400),
                     dashboardSidebar(
                 #      menuItem("Liberal Quotient (LQ) Scores", tabName = "frontpage"),
                       width = 400,
                       sidebarMenu(
                         menuItem("Insira os dados abaixo:", tabName = "frontpage"),
                         fluidRow(
                           column(6,
                                  dateInput("dataDeNascimento", "Data de nascimento (DD/MM/AAAA):",value = "1960-04-21",format = "dd/mm/yyyy"),
                                  selectInput("sexo", "Sexo:", choices = c("Masculino", "Feminino")),
                                  numericInput("altura", "Altura (em cm):", value = 172),
                                  numericInput("peso", "Peso (em kg)", value = 70),
                                  numericInput("apHI", "Pressão High:", value = 120),
                                  numericInput("apLO", "Pressão Low:", value = 80)
                           ),
                           column(6,
                                  selectInput("colesterol", "Colesterol:", choices = c("Normal", "Acima do normal","Bem acima do normal")),
                                  switchInput(inputId = "glicose", 
                                              label = "Possui diabetes?",
                                              value = TRUE,
                                              onLabel = "SIM",
                                              offLabel = "NÃO"),
                                  switchInput(inputId = "ativo", 
                                              label = "Pratica alguma atividade física?",
                                              value = TRUE,
                                              onLabel = "SIM",
                                              offLabel = "NÃO"),
                                  actionButton("botao", "START")
                                  
                                  
                           )
                         )
                         
                       )
                     ),
                     dashboardBody(includeCSS("www/custom.css"),
                                   fluidPage(
                                     tabBox(width = 12,
                                            id = "frontpage",
                                            tabPanel("Resultado", ggiraphOutput("statebins",
                                                                                                  height = "640px")),
                                            
                                            tabPanel("Modelagem",
                                                     fluidPage(
                                                       column(7,
                                                              h3("Modelagem"),
                                                              
                                                              p("Para modelagem foram testados três algorítimos de machine learning. São eles: KNN, Random Forest e XGBoost. 
                                                              Dentre os modelos testados o modelo XGBoost foi o escolhido por obter uma curva ROC maior em relação aos demais
                                                              modelos. Os dados utilizados neste trabalho foram obtidos no Kaggle e podem ser encontrados", a("aqui.", href = 'https://www.kaggle.com/sulianova/cardiovascular-disease-dataset#cardio_train.csv'), 
                                                              "Mais detalhes sobre o modelo utilizado neste aplicativo podem ser encontrados", a("aqui.", href = 'https://www.kaggle.com/jordaoalves/cardio-disease-predition-bonus-shinyapp' ),
                                                              
                                                              
                                                              img(src="Rplot.png", height = 400, width = 650)
                                                                
                                                                                )))),
                                                              
                                           tabPanel("Sobre",
                                                     fluidPage(
                                                       column(7,
                                                              h4("Sobre o aplicativo:"),
                                                              p("Foi um trabalho para as disciplinas de Introdução à Modelagem de Big Data e TI na saúde no ano de 2019.2."),
                                                              p("O aplicativo utiliza Machine Learning para predizer o risco de uma pessoa ter algum problema cardiáco."),
                                                              p("O conjunto de dados utilizado para treinar e validar o modelo foi o 'Cardiovascular Disease dataset' disponível no", a("Kaggle.", href = 'https://www.kaggle.com/' )),
                                                              br(),
                                                              h4("Autor:"),
                                                              p("Jordão de Lima Alves - Graduando em Ciências Atuariais pela UFRN."),
                                                              p(a("www.jordaoalves.xyz", href = 'https://www.jordaoalves.xyz/' )),
                                                              br(),
                                                              h4("Github do aplicativo:"),
                                                              p(a("https://github.com/jordaoalves/IA---S2", href = 'https://github.com/jordaoalves/IA---S2' ))
                                                       )))
                                     ),
                                     useShinyjs(), tags$head({tags$style(HTML("
.material-switch > input[type='checkbox']:checked + label::before {
opacity: 1;
border: 1px solid #68ce5a;
}
.material-switch > label::before {
width: 36px;
}
.material-switch > label::after {
height: 16px;
width: 16px;
top: 0px;
}
.selectize-input.focus {
border-color: #23a784;
}
code {
color: #3d4989;
background-color: transparent;
padding: 0px 0px;
font-size: 80%;
}
a:hover {
color: #3d4989;
}
.irs-slider {
top: 19px;
width: 6px;
height: 20px;
background: white;
border: 1px solid #6389a6c2;
}
.irs-grid-pol {
opacity: 0.7;
background: #35b679;
}
.js-irs-1 .irs-single,
.js-irs-1 .irs-bar-edge,
.js-irs-1 .irs-bar, .irs-from, .irs-to
{
color: #000;
background: none;
border-top: none;
border-bottom: none;}
.irs-single, .irs-bar, .irs-bar-edge, .irs-min, .irs-max
{
background: none;
border-top: none;
border-bottom: none;
}
.skin-black .sidebar-menu>li>a {
border-left: none;
}
.skin-black .sidebar-menu>li.active>a, .skin-black .sidebar-menu>li:hover>a {
background: none;
border-left: none;
}
.skin-black .main-header .navbar>.sidebar-toggle {
border-right: none;
}
.skin-black .main-header>.logo {
border-right: none;
}
.nav-tabs-custom> .nav-tabs>li.active {
border-top-color: transparent;
}
label {
font-weight: 400;
}
.main-header .logo {
font-family: 'Roboto Condensed', sans-serif;
font-weight: normal;
font-size: 24px;
}
.main-sidebar, .left-side {
width: 400px;
}
@media (min-width: 768px) {
.content-wrapper,
.right-side,
.main-footer {
background-color: #232d33;
margin-left: 400px;
}
}
@media (max-width: 767px) {
.sidebar-open .content-wrapper,
.sidebar-open .right-side,
.sidebar-open .main-footer {
-webkit-transform: translate(400px, 0);
-ms-transform: translate(400px, 0);
-o-transform: translate(400px, 0);
transform: translate(400px, 0);
}
}
@media (max-width: 767px) {
.main-sidebar,
.left-side {
-webkit-transform: translate(-400px, 0);
-ms-transform: translate(-400px, 0);
-o-transform: translate(-400px, 0);
transform: translate(-400px, 0);
}
}
@media (min-width: 768px) {
.sidebar-collapse .main-sidebar,
.sidebar-collapse .left-side {
-webkit-transform: translate(-400px, 0);
-ms-transform: translate(-400px, 0);
-o-transform: translate(-400px, 0);
transform: translate(-400px, 0);
}
}"
                                     ))})))
)