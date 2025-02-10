# Shire Legends Server
# Nekiro's 7.92 Downgrade

This downgrade is not download and run distribution, monsters and spells are probably not 100% correct.
You are welcome to submit a pull request though.

This downgrade is up to Dec 21, 2021, commit: https://github.com/otland/forgottenserver/commit/17bf638815fa7c04d5b723baa8e0bfbdaad341f2

## Contributing

Pull requests are welcome.
Just make sure you are using english language.

## Bugs

If you find any bug and believe it should be fixed, submit an issue in issues section, just please follow the issue template.


## Instalar o Banco de dados

```
echo "deb http://security.ubuntu.com/ubuntu focal-security main" | sudo tee /etc/apt/sources.list.d/focal-security.list

sudo apt-get update
sudo apt install mariadb-server
sudo systemctl status mariadb
sudo mysql_secure_installation

sudo apt-get install libssl1.1
```

### Inserir Senha no banco

```
sudo mysql_secure_installation
```
