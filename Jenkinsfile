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

        stage('Validar estructura') {
            steps {
                sh 'ls -la scripts'
                sh 'ls -la config'
                sh 'ls -la tests'
            }
        }

        stage('Ejecutar script base') {
            steps {
                sh 'echo "Ejecutando prueba base desde Jenkins en contenedor Linux"'
            }
        }

        stage('Finalizar') {
            steps {
                echo 'Pipeline finalizado correctamente'
            }
        }
    }
}