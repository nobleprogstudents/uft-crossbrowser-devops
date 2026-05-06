pipeline {
    agent { label 'windows' }

    parameters {
        choice(
            name: 'BROWSER',
            choices: ['chrome', 'edge', 'firefox'],
            description: 'Navegador objetivo para la ejecucion UFT'
        )
    }

    stages {
        stage('Inicio') {
            steps {
                echo 'Iniciando pipeline en agente Windows para UFT'
                echo "Navegador seleccionado: ${params.BROWSER}"
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

        stage('Validar Selenium Grid desde Windows') {
            steps {
                bat 'scripts\\check_grid_windows.bat'
            }
        }

        stage('Ejecutar UFT') {
            steps {
                bat "scripts\\run_uft_test.bat ${params.BROWSER}"
            }
        }

        stage('Finalizar') {
            steps {
                echo 'Pipeline ejecutado correctamente en Windows'
            }
        }
    }
}