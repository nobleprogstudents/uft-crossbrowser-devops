pipeline {
    agent any

    stages {
        stage('Inicio') {
            steps {
                echo 'Iniciando pipeline de UFT Cross-Browser DevOps'
            }
        }

        stage('Validar workspace') {
            steps {
                sh 'ls -la'
            }
        }

        stage('Validar configuracion cross-browser') {
            steps {
                sh 'cat config/browsers.json'
            }
        }

        stage('Validar Selenium Grid') {
            steps {
                sh 'sh scripts/check_grid.sh'
            }
        }

        stage('Finalizar') {
            steps {
                echo 'Pipeline finalizado correctamente'
            }
        }
    }
}