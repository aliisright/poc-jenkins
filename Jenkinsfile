node('master') {
    try {
        stage('docker') {
            checkout scm
            sh "docker-compose down"
            sh "docker-compose up -d"
            sh "php -r 'copy('https://getcomposer.org/installer', 'composer-setup.php');'"
            sh "php -r 'if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;'"
            sh "php composer-setup.php"
            sh "php -r 'unlink('composer-setup.php');'"
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