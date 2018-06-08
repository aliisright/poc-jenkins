node('master') {
    try {
        stage('build') {
            checkout scm
            sh "docker-compose down"
            sh "docker-compose up -d"
            sh "docker-compose exec -it php cp .env.example .env"
            sh "docker-compose exec -it php composer install"
            sh "docker-compose exec -it php php artisan key:generate"
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