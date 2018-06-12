node('master') {
    try {
        stage('build') {
            checkout scm
            sh "sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose"
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