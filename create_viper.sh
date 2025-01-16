#!/bin/bash

# Função para criar uma nova case VIPER
create_viper_case() {
    # Solicita o nome da nova case
    read -p "Digite o nome da nova case (ex: home, login): " case_name

    # Caminho base para as cases
    base_path="lib/cases"

    # Caminho completo para a nova case
    case_path="$base_path/$case_name"

    # Criação da estrutura de pastas
    mkdir -p $case_path/{view,interactor,presenter,entity,router}

    # Normalização do nome da classe
    class_name="$(tr '[:lower:]' '[:upper:]' <<< ${case_name:0:1})${case_name:1}"

    # Criação de arquivos com nomenclatura padrão
    # Context
    cat <<EOL > $case_path/${case_name}_context.dart
import 'package:flutter/material.dart';
import 'view/${case_name}_view.dart';
import 'interactor/${case_name}_interactor_impl.dart';
import 'presenter/${case_name}_presenter_impl.dart';
import 'router/${case_name}_router.dart';

class ${class_name}Context {
  static Widget create(BuildContext context) {
    final interactor = ${class_name}InteractorImpl();
    final router = ${class_name}Router(context);
    final presenter = ${class_name}PresenterImpl(interactor, router);
    return ${class_name}View(presenter);
  }
}
EOL

    # View
    cat <<EOL > $case_path/view/${case_name}_view.dart
import 'package:flutter/material.dart';
import '../../../theme/theme_tokens.dart';
import '../presenter/${case_name}_presenter.dart';

class ${class_name}View extends StatelessWidget {
  final ${class_name}Presenter presenter;

  ${class_name}View(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$class_name'),
      ),
      body: Center(
        child: Text('Welcome to the $class_name Page!'),
      ),
    );
  }
}
EOL

    # Interactor
    cat <<EOL > $case_path/interactor/${case_name}_interactor.dart
abstract class ${class_name}Interactor {
  Future<void> fetchData();
}
EOL

    cat <<EOL > $case_path/interactor/${case_name}_interactor_impl.dart
import '${case_name}_interactor.dart';

class ${class_name}InteractorImpl implements ${class_name}Interactor {
  @override
  Future<void> fetchData() async {
    // Implement your data fetching logic here
  }
}
EOL

    # Presenter
    cat <<EOL > $case_path/presenter/${case_name}_presenter.dart
abstract class ${class_name}Presenter {
  void loadData();
}
EOL

    cat <<EOL > $case_path/presenter/${case_name}_presenter_impl.dart
import '${case_name}_presenter.dart';
import '../interactor/${case_name}_interactor.dart';
import '../router/${case_name}_router.dart';

class ${class_name}PresenterImpl implements ${class_name}Presenter {
  final ${class_name}Interactor interactor;
  final ${class_name}Router router;

  ${class_name}PresenterImpl(this.interactor, this.router);

  @override
  void loadData() async {
    await interactor.fetchData();
    // Update the view with data
  }
}
EOL

    # Entity
    cat <<EOL > $case_path/entity/${case_name}_data.dart
class ${class_name}Data {
  final String title;
  final String content;

  ${class_name}Data({required this.title, required this.content});
}
EOL

    # Router
    cat <<EOL > $case_path/router/${case_name}_router.dart
import 'package:flutter/material.dart';

class ${class_name}Router {
  final BuildContext context;

  ${class_name}Router(this.context);

  void navigateToAnotherPage() {
    Navigator.pushNamed(context, '/another_page');
  }
}
EOL

    # Mensagem de sucesso
    echo "Estrutura VIPER e arquivos padrão criados com sucesso para a case '$case_name' em $case_path."
}

# Função para criar a estrutura básica de um projeto VIPER
create_viper_project() {
    read -p "Digite o nome do projeto: " project_name
    read -p "Digite slug do projeto: " project_slug

    # Criação da estrutura de pastas do projeto
    mkdir -p $project_name/{lib/{core/{api,database,models,utils},cases},lib/{theme,widgets}}

    # Criando arquivos principais do projeto
    cat <<EOL > $project_name/lib/main.dart
import 'package:${project_slug}/cases/signup/signup_context.dart';
import 'package:${project_slug}/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ViperArch());
}

class ViperArch extends StatelessWidget {
  const ViperArch({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ViperArch App',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.theme,
      initialRoute: '/login',
      routes: {

      },
    );
  }
}
EOL

    echo "Projeto VIPER '$project_name' criado com sucesso!"
}

# Menu principal
echo "Escolha uma opção:"
echo "1) Criar nova case VIPER"
echo "2) Criar novo projeto VIPER"
read -p "Opção: " option

case $option in
    1)
        create_viper_case
        ;;
    2)
        create_viper_project
        ;;
    *)
        echo "Opção inválida."
        ;;
esac