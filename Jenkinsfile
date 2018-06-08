node('master') {
    try {
        stage('docker') {
            checkout scm
            sh "docker-compose down"
            sh "docker-compose up -d"
            sh "docker-compose exec -T php cp .env.example .env"
            sh "docker-compose exec -T php composer install"
            sh "docker-compose exec -T php php artisan key:generate"
        }

        stage('test') {
            sh "docker-compose exec php ./vendor/bin/phpunit"
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