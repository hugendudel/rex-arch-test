use Rex -feature => ['disable_strict_host_key_checking'];
user "vagrant";
password "vagrant";
sudo TRUE;

group myservers => "192.168.56.22";

desc "Get the uptime of all servers";
task "uptime", group => "myservers", sub {
   my $output = run "uptime";
   say $output;
};

desc 'test rex';
task 'test_rex', group => 'myservers', sub {
  pkg 'perl-rex',
    ensure => 'installed';

  pkg 'nginx',
    ensure => 'installed';

  service 'nginx',
    ensure => 'started';

  say run "systemctl status nginx";
};
