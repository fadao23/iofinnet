# Ansible Project: Deploying App with Nginx

This Ansible project automates the deployment of a web application using Docker Compose. The project includes configurations for deploying the application to development and staging environments with specific settings.

This project has been developed in MAC OS env and deployed on EC2 unbuntu VM. Ansible Version core 2.16.1

## Project Structure

```
/project-directory
|-- ansible
|   | -- environments
|   |   | -- dev
|   |   |    | -- group_vars
|   |   |    |    | -- dev.yml
|   |   |    | -- hosts 
|   |   | -- staging
|   |   |    | -- group_vars
|   |   |    |    | -- staging.yml
|   |   |    | -- hosts 
|   |-- roles
|   |   |-- app
|   |   |   |-- templates
|   |   |   |   |-- docker-compose.yml.j2
|   |   |   |   |-- nginx.conf.j2
|   |   |   |-- tasks
|   |   |   |   |-- main.yml
|   |   |-- docker
|   |   |   |-- tasks
|   |   |   |   |-- main.yml
|-- playbook.yml
|-- README.MD
```

## Usage

1. **Define Variables:**
   - Define any necessary variables in each environments folder. You need to set the host file inside each env folder.

2. **Run the Ansible Playbook:**

For staging : 
   ```bash
   ansible-playbook -i environments/staging playbook.yml
   ```

For dev : 
   ```bash
   ansible-playbook -i environments/staging playbook.yml
   ```


## Variables

- `docker_image`: The image that will deployed
- `docker_port`: The port taht wil be exposed
- `docker_volume`: The persistent volume of the host
- `tuning` : Env var by default "true"
- `debug`: Debug env var, by default "true"
- `external_url`: External url where docker will be exposed, by default "https://dev/approve"
- `client`: Env var, by default "dev_client_external"
- `interaction_mode`: Env var by default "API"
- `device_id`: Env var by default 2346456
- `docker_volume`: The name of the Docker volume used in the Docker Compose file.

## Docker Compose Templates

- **docker-compose.yml.j2:** Docker Compose template for deploying the application and Nginx.
- **nginx.conf.j2:** Nginx configuration template.