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
                bat 'dir'
            }
        }

        stage('Ejecutar script base') {
            steps {
                bat 'scripts\\run_test.bat'
            }
        }

        stage('Finalizar') {
            steps {
                echo 'Pipeline finalizado correctamente'
            }
        }
    }
}