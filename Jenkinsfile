pipeline {
    agent { label 'windows' }

    stages {
        stage('Inicio') {
            steps {
                echo 'Iniciando pipeline en agente Windows para UFT'
            }
        }

        stage('Validar agente Windows') {
            steps {
                bat 'echo Ejecutando desde agente Windows'
                bat 'hostname'
                bat 'java -version'
            }
        }

        stage('Validar workspace') {
            steps {
                bat 'dir'
            }
        }

        stage('Validar estructura del proyecto') {
            steps {
                bat 'dir config'
                bat 'dir scripts'
                bat 'dir tests'
            }
        }

        stage('Finalizar') {
            steps {
                echo 'Pipeline ejecutado correctamente en Windows'
            }
        }
    }
}