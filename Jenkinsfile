node('master') {
    try {
        stage('docker') {
            checkout scm
            sh "docker-compose down"
            sh "docker-compose -t up -d"
            sh "docker-compose -t exec php cp .env.example .env"
            sh "docker-compose -t exec php composer install"
            sh "docker-compose -t exec php php artisan key:generate"
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