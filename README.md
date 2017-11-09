# InfoMe-Backend

# Tutorial Deploying App into Heroku:
1. Sincronizar os repositórios:
> git push heroku master
2. Abrir o App no Browser:
> heroku open
3. Reiniciar o DB:
> heroku pg:reset DATABASE
4. Rodar as migrações no DB:
> heroku run python manage.py migrate
5. Rodando o script inicial para povoar o banco:
> heroku run python manage.py shell < test_db.py
6. Criando um novo superuser:
> heroku run python manage.py createsuperuser
7. SuperUsuário de acesso:
    - **User:** infome_user
    - **Password:** infome_password
8. URL no Heroku:
    - **Admin:** https://shielded-brook-58758.herokuapp.com/admin/
9. URLs de APIs no HEROKU:
    - **Calls:** https://shielded-brook-58758.herokuapp.com/api/v1/calls
    - **Hands:** https://shielded-brook-58758.herokuapp.com/api/v1/hands
