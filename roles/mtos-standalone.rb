name "mtos-standalone"
default_attributes(
    "movabletype-opensource" => {
        "psgi_port" => "8080"
    },
    "mysql"=> {
        "server_root_password"=> "secret",
        "server_repl_password"=> "secret",
        "server_debian_password"=> "secret",
        "tunable"=> {
            "remove_anonymous_users"=> true,
            "remove_test_database"=> true,
            "key_buffer_size"=> "32M",
            "max_connections"=> "128",
            "server_id"=> "1",
            "log_bin"=> "/var/lib/mysql/mysql-bin",
            "sync_bin_log"=> "1",
            "log_error"=> "/var/log/mysql/mysql-error.log"
        }
    },
    "simple_iptables"=> {
        "rules"=> {
            "filter" => [
                "-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT",
                "-A INPUT -p icmp -j ACCEPT",
                "-A INPUT -i lo -j ACCEPT",
                "-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT",
                "-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT",
                "-A INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT",
                "-A INPUT -j REJECT --reject-with icmp-host-prohibited",
                "-A FORWARD -j REJECT --reject-with icmp-host-prohibited"
            ]
        }
    }
)
run_list(
    "yum::epel",
    "nginx",
    "simple_iptables",
    "mysql::server",
    "mysql::client",
    "movabletype-opensource"
)
