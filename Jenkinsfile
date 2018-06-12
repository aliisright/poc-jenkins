node('master') {
    try {
        stage('build') {
            checkout scm
            sh "docker -v"
            sh "docker-compose up -d"
            sh "docker-compose exec -T app cp .env.example .env"
            sh "docker-compose exec -T app composer install"
            sh "docker-compose exec -T app php artisan key:generate"
        }

        stage('test') {
            sh "docker-compose exec -T app ./vendor/bin/phpunit"
        }

        /*stage('deploy') {
            // ansible-playbook -i ./ansible/hosts ./ansible/deploy.yml
            sh "echo 'WE ARE DEPLOYING'"
        }*/
    } catch(error) {
        throw error
    } finally {

    }
}