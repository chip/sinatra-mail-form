Sinatra MailForm

This is a tiny project that uses `Sinatra` to accept 
form data via an HTTP `POST` method and then email it
via SMTP using the `pony` gem.

An example Apache configuration has been provided and 
assumes that the application is mounted under `/app`.

To install:

1.  Clone the repo: `git clone https://github.com/chip/sinatra-mail-form.git`
2.  Change to the directory: `cd sinatra-mail-form`
3.  Run bundler with `bundle` or `bundle install`
4.  Copy the example configuration file: `cp mail_form.yml.example mail_form.yml`
5.  Edit mail_form.yml to suit your needs
6.  Copy apache-vhost.conf.example to an appropriate location on your server:
    `sudo cat apache-vhost.conf.example >> /etc/apache2/sites-enabled/000-default`
7.  Edit the apache configuration to suit your needs
8.  Restart apache: `sudo /etc/init.d/apache2 restart`
9.  Make the public directory: `mkdir public`
10. See if it's wired up: http://example.com/test

Enjoy!

